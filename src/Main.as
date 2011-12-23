/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:20 AM
 */
package {

import flash.display.Sprite;

import scene.SceneController;

public class Main extends Sprite {
	public function Main() {
		super();
		var container:Sprite = new Sprite();
		this.addChild(container);
		var sceneController:SceneController = new SceneController(container);
	}
}
}
