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

import game.IShifting;

import game.bonus.Bonus;
import game.player.DiggerHero;

import game.player.DiggerModel;

public class GroundController extends ViewController implements IShifting {
	private const STONE_FREQUENCY:Number = 10;

	private var _digger:DiggerHero;
	private var _objects:Vector.<Sprite>;
	private var _bonusToCreate:Bonus;
	private var _bonusListToRemove:Vector.<Bonus>;

	private var _tailController:DiggerTailController;

	public function GroundController(digger:DiggerHero) {
		super(new Sprite());
		_digger = digger;
		_tailController = new DiggerTailController(digger);
	}

	public function tick():void {
		createNewObjects();
		moveObjects();

		removeObjectsIfOutOfScreen();
		removeBonusIfNeed();
	}

	public function addBonus(aBonus:Bonus):void {
		_bonusToCreate = aBonus;
	}

	public function removeBonus(aBonus:Bonus):void {
	 	addBonusForRemove(aBonus);
	}

	/* Internal functions */

	private function moveObjects():void {
		for each (var object:Sprite in _objects) {
			object.y -= _digger.model.speed;
		}
	}

	private function createNewObjects():void {
		var stone:Sprite = createNewStoneByFrequency();
		if (stone) { addObject(stone); }
		addObject(_tailController.createNewTailPart());
		if (_bonusToCreate) {
			setBottomPositionForObject(_bonusToCreate);
			addObject(_bonusToCreate);
			_bonusToCreate = null;
		}
	}

	private function createNewStoneByFrequency():Sprite {
		var needCreate:Boolean = Math.random() < STONE_FREQUENCY/100;
		if (needCreate) {
			return createStone();
		}
		return null;
	}

	private function removeObjectsIfOutOfScreen():void {
		if (!_objects || _objects.length == 0) { return; }
			var allRemoved:Boolean = false;
			while (!allRemoved) {
				allRemoved = true;
				for each (var object:Sprite in _objects) {
					if (object.y + object.height < 100) {
						removeObjectFromScreen(object);
						allRemoved = false;
						break;
					}
				}
			}
	}

	private function removeObjectFromScreen(object:Sprite):void {
		if (view.contains(object)) { view.removeChild(object);
		} else { trace("WARN! object not on ground container! [GroundController.removeObjectFromScreen]"); }
		var index:int = _objects.indexOf(object);
		if (index != -1) { _objects.splice(index, 1);
		} else { trace("WARN! object not in list [GroundController.removeObjectFromScreen]")}
	}

	private function createStone():Sprite {
		var result:Sprite = Math.random() < .8 ? new StonesView() : new GoldView();
		setBottomPositionForObject(result);
		return result;
	}

	private function removeBonusIfNeed():void {
		if (!_bonusListToRemove) { return; }
		for each (var aBonus:Bonus in _bonusListToRemove) {
			removeObjectFromScreen(aBonus);
		}
		_bonusListToRemove.splice(0, _bonusListToRemove.length);
	}

	private function setBottomPositionForObject(object:Sprite):void {
		object.y = Main.HEIGHT;
		object.x = Math.random() * Main.WIDTH;
	}

	private function addObject(object:Sprite):void {
		if (!_objects) { _objects = new Vector.<Sprite>(); }
		_objects.push(object);
		view.addChild(object);
	}

	private function addBonusForRemove(aBonus:Bonus):void {
		if (!_bonusListToRemove) { _bonusListToRemove = new Vector.<Bonus>(); }
		_bonusListToRemove.push(aBonus);
	}

}
}
