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

import game.bonus.BonusController;

import game.environment.GroundController;

import game.player.Digger;
import game.player.DiggerModel;
import game.playtime.PlayTimeModel;
import game.world.WorldModel;

import scene.IScene;

public class GameController extends EventDispatcher implements IScene{
	private var _container:Sprite;

	private var _sceneMoveController:SceneMoveController;
	private var _userCommandListener:UserCommandListener;
	private var _debugPanel:DebugPanel;
	private var _maksController:MaksController;
	private var _digger:Digger;
	private var _worldModel:WorldModel;
	private var _ground:GroundController;
	private var _bonusController:BonusController;
	private var _playTimeModel:PlayTimeModel;

	private var _paused:Boolean;

	public function GameController(container:Sprite) {
		_container = container;
		_sceneMoveController = new SceneMoveController();
		_userCommandListener = new UserCommandListener(_container);
		_bonusController = new BonusController(_digger, _ground);
	}

	public function open():void {
		createWorld();
		addListeners();
	}
	public function close():void {
		removeListeners();
	}

	/* Internal functions */

	private function createWorld():void {
		addBackground();
		_digger = new Digger(new DiggerModel());
		_digger.setPosition(Main.WIDTH/2, Main.HEIGHT/2);
		_ground = new GroundController(_digger.model);
		_playTimeModel = new PlayTimeModel();
		_bonusController.playTimeModel =_playTimeModel;
		_digger.addPlayTimeModel(_playTimeModel);
		_container.addChild(_ground.view);
		_container.addChild(_digger.view);
		_worldModel = new WorldModel(_digger.model);
	}

	private function addBackground():void {
		_container.graphics.beginFill(0xffffff);
		_container.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
		_container.graphics.beginFill(0x5C4033);
		_container.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
		_container.graphics.endFill();
	}

	private function tick():void {
		_digger.tick();
		_bonusController.tick();
		_ground.tick();
		_playTimeModel.tick();
		_worldModel.tick();

		if (checkForEndGame()) {
			stopGame();
		}
	}

	private function checkForEndGame():Boolean {
		return _playTimeModel.isEndGame();
	}

	private function stopGame():void {
		_paused = true;
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
		_digger.moveToX(Main.WIDTH/2 + event.offset);
	}

	private function onEnterFrame(event:Event):void {
		if (_paused) { return; }
		tick();
	}

}
}
