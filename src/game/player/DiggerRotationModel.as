/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 3/8/12
 * Time: 2:54 PM
 * To change this template use File | Settings | File Templates.
 */
package game.player {
public class DiggerRotationModel {
	private const MAX_ANGLE_OFFSET = 30;
	//private const MAX_ANGLE_RIGHT_OFFSET = -30;
	private const ANGLE_MOVE_SPEED = 2;

	private var _currentAngle:Number;

	private var _diggerModel:DiggerModel;
	private var _rotation:Number;

	public function DiggerRotationModel(diggerModel:DiggerModel):void {
		_diggerModel = diggerModel;
		_currentAngle = 0;
		_rotation = 0;
	}

	public function get rotation():Number { return _rotation; }

	public function tick():void {
		if (_diggerModel.targetX != _diggerModel.x) { rotate(); }
	}

	/* Internal functions */

	private function rotate():void {
		var coef:int = (_diggerModel.targetX < _diggerModel.x) ? 1 : -1;
		if (_rotation != MAX_ANGLE_OFFSET * coef) {
			_rotation += ANGLE_MOVE_SPEED * coef;
		}
		if (MAX_ANGLE_OFFSET < Math.abs(_rotation)) { _rotation = coef * MAX_ANGLE_OFFSET; }
	}
}
}
