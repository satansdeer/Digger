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
	private var _startButton:Sprite;

	public function MenuController(container:Sprite) {
		_container = container;
		createButton();
	}

	public function open():void {
		addBackground();
		addButton();
	}
	public function close():void {
		removeButton();
	}

	private function createButton():void {
		_startButton = new Sprite();
		_startButton.graphics.beginFill(0x0f0f0f, .8);
		_startButton.graphics.drawRect(-20, -10, 40, 20);
		_startButton.graphics.endFill();
		_startButton.addEventListener(MouseEvent.CLICK, onStartButtonClick);
	}
	private function addButton():void {
		_container.addChild(_startButton);
	}
	private function removeButton():void {
		if (_container.contains(_startButton)) { _container.removeChild(_startButton); }
	}

	private function onStartButtonClick(event:MouseEvent):void {
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
