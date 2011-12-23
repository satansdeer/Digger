/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:32 AM
 */
package game {
import debug.DebugPanel;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

import scene.IScene;

public class GameController extends EventDispatcher implements IScene{
	private var _container:Sprite;

	private var _sceneMoveController:SceneMoveController;

	private var _debugPanel:DebugPanel;

	private var _paused:Boolean;

	public function GameController(container:Sprite) {
		_container = container;
		_sceneMoveController = new SceneMoveController();
		_debugPanel = new DebugPanel(this);
	}

	public function open():void {
		_paused = true;
		addListeners();
	}
	public function close():void {
		removeListeners();
	}

	private function addListeners():void {
		_container.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		_container.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}
	private function removeListeners():void {
		_container.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		_container.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}

	private function onEnterFrame(event:Event):void {
		if (_paused) { return; }
	}

	private function onMouseDown(event:MouseEvent):void {
		if (event.ctrlKey) {

		}
	}

}
}
