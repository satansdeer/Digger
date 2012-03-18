/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 3/10/12
 * Time: 10:57 AM
 * To change this template use File | Settings | File Templates.
 */
package game.bonus {
import flash.display.Sprite;

import game.environment.GroundController;
import game.player.Digger;
import game.player.DiggerExtraModel;
import game.player.DiggerModel;
import game.playtime.PlayTimeModel;

public class BonusController {
	private var _digger:Digger;
	private var _groundController:GroundController;
	private var _playTimeModel:PlayTimeModel;
	private var _bonusList:Vector.<Bonus>;

	private const BONUS_FREQUENCY:Number = .3;

	public function BonusController(digger:Digger, groundController:GroundController) {
		_digger = digger;
		_groundController = groundController;
	}

	public function set playTimeModel(value:PlayTimeModel):void {
		_playTimeModel = value;
	}

	public function tick():void {
		createBonusByFrequency();
		checkHitTestDigger();
	}

	private function createBonusByFrequency():void {
		var needCreate:Boolean = Math.random() < BONUS_FREQUENCY/100;
		if (needCreate) {
			var aBonus:Bonus = Bonus.createRandomBonus();
			addBonus(aBonus);
			_groundController.addBonus(aBonus);
		}
	}

	private function addBonus(aBonus:Bonus) {
		if (!_bonusList) { _bonusList = new Vector.<Bonus>(); }
		_bonusList.push(aBonus);
	}

	private function checkHitTestDigger():void {
		if (!_bonusList) { return; }
		for (var i:int = 0; i < _bonusList.length; ++i) {
			if (_bonusList[i].hitTestObject(_digger.view)) {
				if (_bonusList[i].type == Bonus.SPEED) {
					_digger.model.extraModel = new DiggerExtraModel(2, 5);
				} else {
					_playTimeModel.resetCurrentTime();
				}
				removeBonusByIndex(i);
				break;
			}
		}
	}

	private function removeBonusByIndex(index:int):void {
		_groundController.removeBonus(_bonusList[index]);
		_bonusList.splice(index, 1);
	}

}
}
