/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 3/10/12
 * Time: 10:57 AM
 * To change this template use File | Settings | File Templates.
 */
package game.bonus {
import game.environment.GroundController;
import game.player.DiggerModel;

public class BonusController {
	private var _diggerModel:DiggerModel;
	private var _groundController:GroundController;

	private const BONUS_FREQUENCY:Number = .3;

	public function BonusController(diggerModel:DiggerModel, groundController:GroundController) {
		_diggerModel = diggerModel;
		_groundController = groundController;
	}

	public function tick():void {
		createBonusByFrequency();
	}

	private function createBonusByFrequency():void {
		var needCreate:Boolean = Math.random() < BONUS_FREQUENCY/100;
		if (needCreate) {
			var aBonus:Bonus = Bonus.createRandomBonus();
			_groundController.addBonus(aBonus);
		}
	}
}
}
