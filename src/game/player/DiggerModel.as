/**
 * User: dima
 * Date: 22/12/11
 * Time: 3:26 PM
 */
package game.player {
import game.GameController;

public class DiggerModel {
	private var _x:Number;
	private var _y:Number;
	private var _targetX:Number;

	private var _extraModel:DiggerExtraModel

	private var _sideSpeed:Number = 1;

	private var _speed:Number;
	private var _speedOffset:Number;


	private const SPEED_DOWN_COEF:Number = .4;
	private const SPEED_OFFSET_DOWN_COEF:Number = .4;

	public function DiggerModel() {
		super();
		_speed = 1;
		_speedOffset = 0;
	}

	public function tick():void {
		updateX();
	}

	public function set extraModel(value:DiggerExtraModel):void {
		_extraModel = value;
	}

	public function setPosition(x:Number,  y:Number):void {
		_x = x;
		_y = y;
		_targetX = x;
	}

	public function get x():Number { return _x; }
	public function get y():Number { return _y; }

	public function get targetX():Number { return _targetX; }

	public function get speed():Number {
		var extraSpeed:Number = (_extraModel) ? _extraModel.speed : 0;
		return _speed + _speedOffset + extraSpeed;
		trace("get speed");
	}

	public function setTargetX(targetX:Number):void {
		_targetX = targetX;
	}

	/* Internal functinos */

	private function updateX():void {
		updateSpeedOffset();
		// back all offsets
		if (_x == _targetX) {
			return;
		}
		if(_x < _targetX) {
			_x += _sideSpeed;
			if (_x > _targetX) { _x = _targetX; }
		} else {
			_x -= _sideSpeed;
			if (_x < _targetX) { _x = _targetX; }
		}
		speedDown();
	}

	private function speedDown():void {
		_speedOffset -= SPEED_DOWN_COEF;
	}

	private function updateSpeedOffset():void {
		if (_speedOffset == 0) { return; }
		if (_speedOffset < 0) {
			_speedOffset += SPEED_OFFSET_DOWN_COEF;
			if (_speedOffset > 0) { _speedOffset = 0; }
		} else if (_speedOffset > 0) {
			_speedOffset -= SPEED_OFFSET_DOWN_COEF;
			if (_speedOffset < 0) { _speedOffset = 0; }
		}
	}

}
}
