/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:20 AM
 */
package {
	import flash.display.Sprite;

import game.window.WindowCollector;

import scene.SceneController;

[SWF(width=500, height=500, frameRate=40)]
public class Main extends Sprite {
	public static const WIDTH:int = 500;
	public static const HEIGHT:int = 500;
	public static const FRAME_RATE = 40;

	public function Main() {
		super();
		var container:Sprite = new Sprite();
		WindowCollector.instance.init(container);
		this.addChild(container);
		var sceneController:SceneController = new SceneController(container);
		sceneController.openMenu();
	}
}
}
