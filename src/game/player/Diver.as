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
	private var _speed:Number;
	private var _speedOffset:Number;

	private const SIDE_SPEED:Number = 1;
	private const SPEED_DOWN_COEF:Number = .4;
	private const SPEED_OFFSET_DOWN_COEF:Number = .4;

	public function Diver() {
		super();
	}

	public function tick():void {
		updateSpeedOffset();
	}

	public function get x():Number { return _x; }
	public function get y():Number { return _y; }

	public function get speed():Number {
		return _speed + _speedOffset;
	}

	public function updatePosition(xOffset:Number):void {
		_x += SIDE_SPEED * xOffset/(GameController.GAME_WIDTH/2);
		speedDown();
	}

	/* Internal functinos */

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
