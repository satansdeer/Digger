/**
 * User: dima
 * Date: 22/12/11
 * Time: 3:26 PM
 */
package game.player {
import game.GameController;

public class Diver{
	private var _x:Number;
	private var _y:Number;
	private var _targetX:Number;

	private var _sideSpeed:Number = 1;

	private var _speed:Number;
	private var _speedOffset:Number;

	private const SPEED_DOWN_COEF:Number = .4;
	private const SPEED_OFFSET_DOWN_COEF:Number = .4;

	public function Diver() {
		super();
		_speed = 1;
		_speedOffset = 0;
	}

	public function tick():void {
		updateX();

		// back all offsets
		updateSpeedOffset();
	}

	public function get x():Number { return _x; }
	public function get y():Number { return _y; }

	public function get speed():Number {
		return _speed + _speedOffset;
	}

	public function setTargetX(targetX:Number):void {
		_targetX = targetX;
		if (_targetX != _x) {
			speedDown();
		}
	}

	/* Internal functinos */

	private function updateX():void {
		if (_x == _targetX) { return; }
		if(_x < _targetX) {
			_x += _sideSpeed;
			if (_x > _targetX) { _x = _targetX; }
		} else {
			_x -= _sideSpeed;
			if (_x < _targetX) { _x = _targetX; }
		}
	}

	private function speedDown():void {
		_speedOffset += SPEED_DOWN_COEF;
	}

	private function updateSpeedOffset():void {
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
