/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:20 AM
 */
package {
	import flash.display.Sprite;
	
	import scene.SceneController;

[SWF(width=500, height=500, frameRate=40)]
	public class Main extends Sprite {
		public static const WIDTH:int = 500;
		public static const HEIGHT:int = 500;

		public function Main() {
			super();
			var container:Sprite = new Sprite();
			this.addChild(container);
			var sceneController:SceneController = new SceneController(container);
			sceneController.openMenu();
		}
	}
}
