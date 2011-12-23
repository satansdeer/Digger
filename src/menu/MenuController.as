/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:32 AM
 */
package menu {
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
		_container.addEventListener(MouseEvent.CLICK, onClick);
	}
	public function close():void {
		_container.removeEventListener(MouseEvent.CLICK, onClick);
	}

	public function onClick(event:MouseEvent):void {
		dispatchEvent(new SceneEvent(SceneEvent.WANT_CLOSE));
	}
}
}
