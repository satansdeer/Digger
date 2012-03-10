/**
 * Created by IntelliJ IDEA.
 * User: dima
 * Date: 3/10/12
 * Time: 12:33 PM
 * To change this template use File | Settings | File Templates.
 */
package game.environment {
import flash.display.Sprite;

import game.player.DiggerModel;

public class DiggerTailController {
	private var _diggerModel:DiggerModel;

	public function DiggerTailController(diggerModel:DiggerModel) {
		_diggerModel = diggerModel;
	}

	public function createNewTailPart():Sprite {
		var part:Sprite = new Sprite();
		part.graphics.beginFill(0x000000, .4);
		part.graphics.drawRect(0, 0, 100, 1);
		part.graphics.endFill();
		part.x = _diggerModel.x - 50;
		part.y = _diggerModel.y + 80;
		return part;
	}

}
}
