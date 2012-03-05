/**
 * User: dima
 * Date: 28/12/11
 * Time: 3:47 PM
 */
package game.world {
import game.player.Diver;

public class WorldModel {
	private var _diver:Diver;
	private var _depth:Number;
	private var _diveSpeed:Number;

	private const MAX_DEPTH:Number = 5000;

	public function WorldModel(diver:Diver) {
		super();
		_depth = 0;
		_diver = diver;
	}

	public function tick():void {
		_depth += _diver.speed;
	}

	public function get depth():Number { return _depth; }
}
}
