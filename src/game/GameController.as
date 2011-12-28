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

import game.player.Diver;
import game.world.WorldModel;

import scene.IScene;

public class GameController extends EventDispatcher implements IScene{
	public static const GAME_WIDTH:Number = 600;
	public static const GAME_HEIGHT:Number = 600;

	private var _container:Sprite;

	private var _sceneMoveController:SceneMoveController;
	private var _userCommandListener:UserCommandListener;
	private var _debugPanel:DebugPanel;
	private var _maksController:MaksController;
	private var _diver:Diver;
	private var _worldModel:WorldModel;

	private var _paused:Boolean;

	public function GameController(container:Sprite) {
		_container = container;
		_sceneMoveController = new SceneMoveController();
		_userCommandListener = new UserCommandListener(_container);
		_maksController = new MaksController(_container);
		_debugPanel = new DebugPanel(this);
		addListeners();
	}

	public function open():void {
		_paused = true;
		addListeners();
	}
	public function close():void {
		removeListeners();
	}

	/* Internal functions */

	private function tick():void {
		_diver.tick();
		_worldModel.tick();

		_maksController.tickDiverView(_diver);
		_maksController.tickWorldView(_worldModel);
	}

	private function addUserCommandListener():void {
		_userCommandListener.addEventListener(UserCommandEvent.MOUSE_DOWN, onUserMouseDown);
	}
	private function removeUserCommandListener():void {
		_userCommandListener.removeEventListener(UserCommandEvent.MOUSE_DOWN, onUserMouseDown);
	}

	private function addListeners():void {
		_container.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		addUserCommandListener()
	}
	private function removeListeners():void {
		_container.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		removeListeners();
	}

	private function onUserMouseDown(event:UserCommandEvent):void {
		_diver.setTargetX(GAME_WIDTH/2 + event.offset);
	}

	private function onEnterFrame(event:Event):void {
		if (_paused) { return; }
		tick();
	}

}
}
