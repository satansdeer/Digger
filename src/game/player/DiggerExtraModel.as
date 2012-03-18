/**
 * Created by : Dmitry
 * Date: 3/17/12
 * Time: 9:20 PM
 */
package game.player {
public class DiggerExtraModel {
	private var _speed:Number;
	private var _durationSec:Number;

	public function DiggerExtraModel(speed:Number, durationSec:Number) {
		_speed = speed;
		_durationSec = durationSec;
	}

	public function tick():void {
		if (_durationSec == 0) { return; }
		_durationSec -= 1/Main.FRAME_RATE;
		if (_durationSec < 0) { _durationSec = 0; }
	}

	public function isEnd():Boolean { return _durationSec == 0; }

	public function clear():void { _speed = 0; }

	public function get speed():Number { return _speed; }
}
}
