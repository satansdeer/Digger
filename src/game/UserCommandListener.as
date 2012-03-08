/**
 * User: dima
 * Date: 28/12/11
 * Time: 9:58 AM
 */
package game {
import flash.display.Sprite;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

public class UserCommandListener extends EventDispatcher {
	private var _container:Sprite;

	public function UserCommandListener(container:Sprite) {
		super();
		_container = container;
		addListeners();
	}

	/* Internal functions */

	private function addListeners():void {
		_container.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}

	private function onMouseDown(event:MouseEvent):void {
		dispatchEvent(new UserCommandEvent(UserCommandEvent.MOUSE_DOWN, event.stageX - Main.WIDTH/2));
	}
}
}
