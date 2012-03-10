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
	private var _diggerTail:Vector.<Sprite>;

	public function GroundController(diggerModel:DiggerModel) {
		super(new Sprite());
		_diggerModel = diggerModel;
	}

	public function tick():void {
		createObjects();
		moveObjects();

		removeObjectsIfOutOfScreen();
	}

	/* Internal functions */

	private function moveObjects():void {
		moveDiggerTail();
		moveStones();
	}

	private function moveDiggerTail():void {
		for each (var part:Sprite in _diggerTail) {
			part.y -= _diggerModel.speed;
		}
	}

	private function moveStones():void {
		for each (var stone:StoneView in _stones) {
			stone.y -= _diggerModel.speed;
		}
	}

	private function createObjects():void {
		createNewStoneByFrequency();
		createNewDiggerTailPart();
	}

	private function createNewDiggerTailPart():void {
		var part:Sprite = new Sprite();
		part.graphics.beginFill(0x000000, .4);
		part.graphics.drawRect(0, 0, 100, 1);
		part.graphics.endFill();
		part.x = _diggerModel.x - 50;
		part.y = _diggerModel.y + 80;
		if (!_diggerTail) { _diggerTail = new Vector.<Sprite>(); }
		_diggerTail.push(part);
		view.addChild(part);
	}

	private function createNewStoneByFrequency():void {
		var needCreate:Boolean = Math.random() < STONE_FREQUENCY/100;
		if (needCreate) {
			var stone:StoneView = createStone();
			addStone(stone);
		}
	}

	private function removeObjectsIfOutOfScreen():void {
		removeDiggerPathPartIfOutOfScreen();
		removeStoneIfOutOfScreen();
	}

	private function removeDiggerPathPartIfOutOfScreen():void {
		if (_diggerTail&& _diggerTail.length > 0) {
			if (_diggerTail[0].y + _diggerTail[0].height < 100) { removeFirstDiggerPathPart(); }
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

	private function removeFirstDiggerPathPart():void {
		var part:Sprite = _diggerTail[0];
		if (view.contains(part)) { view.removeChild(part);
		} else { trace("WARN! stone not on ground container! [GroundController.removeFirstStone]"); }
		_diggerTail.shift();
	}
}
}
