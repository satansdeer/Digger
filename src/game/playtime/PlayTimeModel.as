/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 3/10/12
 * Time: 12:51 PM
 * To change this template use File | Settings | File Templates.
 */
package game.playtime {
public class PlayTimeModel {
	private const PLAY_TIME:uint = 10;

	private var _currentTime:Number;

	public function PlayTimeModel() {
		_currentTime = 0;
	}

	public function tick():void {
		_currentTime += 1/Main.FRAME_RATE;
		if (_currentTime > PLAY_TIME) { _currentTime = PLAY_TIME; }
	}

	public function get currentTime():Number { return _currentTime; }
	public function resetCurrentTime():void { _currentTime = 0; }

	public function get totalPlayTime():uint { return PLAY_TIME; }

	public function isEndGame():Boolean { return _currentTime == PLAY_TIME; }
}
}
