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

import game.bonus.Bonus;

import game.player.DiggerModel;

import game.world.WorldModel;

import org.osmf.layout.PaddingLayoutFacet;

public class GroundController extends ViewController {
	private const STONE_FREQUENCY:Number = 3;

	private var _diggerModel:DiggerModel;
	private var _objects:Vector.<Sprite>;
	private var _stones:Vector.<StoneView>;
	private var _diggerTail:Vector.<Sprite>;
	private var _bonusToCreate:Bonus;

	public function GroundController(diggerModel:DiggerModel) {
		super(new Sprite());
		_diggerModel = diggerModel;
	}

	public function tick():void {
		createObjects();
		moveObjects();

		removeObjectsIfOutOfScreen();
	}

	public function addBonus(bonus:Bonus):void {
		_bonusToCreate = bonus;
	}

	/* Internal functions */

	private function moveObjects():void {
		for each (var object:Sprite in _objects) {
			object.y -= _diggerModel.speed;
		}
	}

	private function createObjects():void {
		var stone:Sprite = createNewStoneByFrequency();
		if (stone) { addObject(stone); }
		addObject(createNewDiggerTailPart());
		if (_bonusToCreate) {
			setBottomPositionForObject(_bonusToCreate);
			addObject(_bonusToCreate);
			_bonusToCreate = null;
		}
	}

	private function createNewDiggerTailPart():Sprite {
		var part:Sprite = new Sprite();
		part.graphics.beginFill(0x000000, .4);
		part.graphics.drawRect(0, 0, 100, 1);
		part.graphics.endFill();
		part.x = _diggerModel.x - 50;
		part.y = _diggerModel.y + 80;
		return part;
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
		var result:Sprite = new EvilEyesVIew();
		setBottomPositionForObject(result);
		return result;
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

}
}
