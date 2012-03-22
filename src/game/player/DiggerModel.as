/**
 * User: dima
 * Date: 22/12/11
 * Time: 3:26 PM
 */
package game.player {
import game.player.extra.DiggerExtraItemModel;
import game.player.extra.DiggerExtraModel;

public class DiggerModel {
	private var _x:Number;
	private var _y:Number;
	private var _targetX:Number;

	private var _extraModel:DiggerExtraModel

	private var _sideSpeed:Number;

	private var _speed:Number;
	private var _speedOffset:Number;

	private const BASE_SIDE_SPEED:Number = 0.00001;
	private const MAX_SIDE_SPEED:int = 1;

	private const SPEED_DOWN_COEF:Number = .4;
	private const SPEED_OFFSET_DOWN_COEF:Number = .4;

	public function DiggerModel() {
		super();
		_speed = 1;
		_sideSpeed = BASE_SIDE_SPEED;
		_speedOffset = 0;
		_extraModel = new DiggerExtraModel();
	}

	public function tick():void {
		updateX();
		_extraModel.tick();
	}

	public function addExtraItemModel(item:DiggerExtraItemModel):void {
		if (!item) { return; }
		_extraModel.addItem(item);
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
		return _speed + _speedOffset + _extraModel.speed;
	}

	public function setTargetX(targetX:Number):void {
		_targetX = targetX;
		_sideSpeed = BASE_SIDE_SPEED;
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
		if (_sideSpeed != MAX_SIDE_SPEED) {
			_sideSpeed += _sideSpeed;
			if (_sideSpeed > MAX_SIDE_SPEED) { _sideSpeed = MAX_SIDE_SPEED; }
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
