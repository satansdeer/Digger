/**
 * User: dima
 * Date: 22/03/12
 * Time: 1:44 PM
 */
package game.player.extra {
import flash.events.Event;
import flash.events.EventDispatcher;

public class DiggerExtraItemModel extends EventDispatcher {
	private var _speed:Number;
	private var _durationSec:int;

	private var _finished:Boolean;

	public static const EVENT_FINISHED:String = "itemFinished";

	public function DiggerExtraItemModel(speed:Number, durationSec:int):void {
		super();
		_finished = false;
		_speed = speed;
		_durationSec = durationSec;
	}

	public function tick():void {
		if (_finished) { return; }
		if (_durationSec == 0) {
			_finished = true;
			dispatchEvent(new Event(EVENT_FINISHED));
		}
		_durationSec -= 1/Main.FRAME_RATE;
		if (_durationSec < 0) { _durationSec = 0; }
	}

	public function get speed():Number { return _speed; }

}
}
