/**
 * User: dima
 * Date: 28/12/11
 * Time: 10:08 AM
 */
package game {
import flash.display.Sprite;

import game.player.DiggerModel;
import game.world.WorldModel;

public class MaksController {
	private var _container:Sprite;

	public function MaksController(container:Sprite) {
		super();
		_container = container;
	}

	public function tickDiverView(diverModel:DiggerModel):void {
	}
	public function tickWorldView(worldModel:WorldModel):void {

	}
}
}
