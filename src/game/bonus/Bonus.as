/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 3/10/12
 * Time: 11:39 AM
 * To change this template use File | Settings | File Templates.
 */
package game.bonus {
import flash.display.Sprite;

public class Bonus extends Sprite {

	public static var MEDIC:uint = 0;
	public static var SPEED:uint = 1;
	public static var DEFENCE:uint = 2;

	private var _type:uint;

	public static function createRandomBonus():Bonus {
		var result:Bonus = new Bonus(Math.random() * 3);
		return result;
	}

	public function Bonus(type:uint) {
		_type = type;
		createSprite();
	}

	public function get type():uint { return _type; }

	private function createSprite():void {
		var sprite:Sprite = _type == MEDIC ? new MedKitBonusView() : _type == SPEED ? new GaussGunBonusView() : new TankBase2();
		this.addChild(sprite);
	}
}
}
