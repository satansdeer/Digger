/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 3/8/12
 * Time: 6:29 PM
 * To change this template use File | Settings | File Templates.
 */
package game.environment {
import core.ViewController;

import flash.display.Sprite;

import game.player.DiggerModel;

import game.world.WorldModel;

public class GroundController extends ViewController {
	private const STONE_FREQUENCY:Number = 3;

	private var _diggerModel:DiggerModel;
	private var _stones:Vector.<StoneView>;

	public function GroundController(diggerModel:DiggerModel) {
		super(new Sprite());
		_diggerModel = diggerModel;
	}

	public function tick():void {
		createNewStoneByFrequency();
		moveStones();
		removeStoneIfOutOfScreen();
	}

	/* Internal functions */

	private function moveStones():void {
		for each (var stone:StoneView in _stones) {
			stone.y -= _diggerModel.speed;
		}
	}

	private function createNewStoneByFrequency():void {
		var needCreate:Boolean = Math.random() < STONE_FREQUENCY/100;
		if (needCreate) {
			var stone:StoneView = createStone();
			addStone(stone);
		}
	}

	private function removeStoneIfOutOfScreen():void {
		if (_stones && _stones.length > 0) {
			if (_stones[0].y + _stones[0].height < 0) { removeFirstStone(); }
		}
	}

	private function createStone():StoneView {
		var result:StoneView = new StoneView();
		result.y = Main.HEIGHT;
		result.x = Math.random() * Main.WIDTH;
		return result;
	}

	private function addStone(stone:StoneView):void {
		if (!_stones) { _stones = new Vector.<StoneView>(); }
		_stones.push(stone);
		view.addChild(stone);
	}

	private function removeFirstStone():void {
		var stone:StoneView = _stones[0];
		if (view.contains(stone)) { view.removeChild(stone);
		} else { trace("WARN! stone not on ground container! [GroundController.removeFirstStone]"); }
		_stones.shift();
	}
}
}
