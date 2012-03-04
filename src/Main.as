/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:20 AM
 */
package {
	
	import effect.SmokeParticle;
	import effect.SmokeParticleEffect;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import scene.SceneController;
	
	public class Main extends Sprite {
		public function Main() {
			super();
			var container:Sprite = new Sprite();
			this.addChild(container);
			var sceneController:SceneController = new SceneController(container);
			var hero:DiggerHero = new DiggerHero();
			hero.x = 130;
			hero.y = 100;
			addChild(hero);
			hero.rotation = 25;
		}
	}
}
