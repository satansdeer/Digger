/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:32 AM
 */
package menu {
import effect.SmokeParticle;
import effect.SmokeParticleEffect;

import flash.display.Sprite;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

import scene.IScene;
import scene.SceneEvent;

public class MenuController extends EventDispatcher implements IScene{
	private var _container:Sprite;

	public function MenuController(container:Sprite) {
		_container = container;
	}

	public function open():void {
		addBackground();
		_container.addEventListener(MouseEvent.CLICK, onClick);
	}
	public function close():void {
		_container.removeEventListener(MouseEvent.CLICK, onClick);
	}

	public function onClick(event:MouseEvent):void {
		dispatchEvent(new SceneEvent(SceneEvent.WANT_CLOSE));
	}

	private function addBackground():void {
		_container.graphics.beginFill(0xffffff);
		_container.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
		_container.graphics.beginFill(0x000000, .3);
		_container.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
		_container.graphics.endFill();
	}
}
}
