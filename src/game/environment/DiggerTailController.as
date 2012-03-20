/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 3/10/12
 * Time: 12:33 PM
 * To change this template use File | Settings | File Templates.
 */
package game.environment {
import flash.display.Sprite;

import game.player.DiggerHero;

public class DiggerTailController {
	private var _digger:DiggerHero;

	public function DiggerTailController(digger:DiggerHero) {
		_digger = digger;
	}

	public function createNewTailPart():Sprite {
		var part:Sprite = new Sprite();
		part.graphics.beginFill(0x000000, .4);
		part.graphics.drawRect(-27, 82, 50, 1);
		part.graphics.endFill();

		//var waySprite:WayView = new WayView();
		//waySprite.x = -27;
		//waySprite.y = 82;
		part.x = _digger.model.x;
		part.y = _digger.model.y;
		//part.addChild(waySprite);
		part.rotation = _digger.view.rotation;

		return part;
	}

}
}
