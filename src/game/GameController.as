/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:32 AM
 */
package game {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

import game.bonus.BonusController;

import game.environment.GroundController;

import game.player.DiggerHero;
import game.player.DiggerModel;
import game.playtime.PlayTimeController;
import game.world.WorldModel;

import scene.IScene;
import scene.SceneEvent;
import scene.SceneEvent;

public class GameController extends EventDispatcher implements IScene{
	private var _container:Sprite;

	private var _userCommandListener:UserCommandListener;
	private var _digger:DiggerHero;
	private var _worldModel:WorldModel;
	private var _ground:GroundController;
	private var _bonusController:BonusController;
	private var _playTimeController:PlayTimeController;

	private var _shiftingControllers:Vector.<IShifting>;

	private var _paused:Boolean;

	public function GameController(container:Sprite) {
		_container = container;
		_shiftingControllers = new Vector.<IShifting>();
		_userCommandListener = new UserCommandListener(_container);
	}

	public function open():void {
		createWorld();
		addListeners();
	}
	public function close():void {
		removeListeners();
		removeWorld();
	}

	/* Internal functions */

	private function createWorld():void {
		addBackground();
		_digger = new DiggerHero(new DiggerModel());
		_digger.setPosition(Main.WIDTH/2, Main.HEIGHT/2);
		_shiftingControllers.push(_digger);
		_playTimeController = new PlayTimeController(Main.WIDTH - 50, 10);
		_shiftingControllers.push(_playTimeController);
		_ground = new GroundController(_digger);
		_shiftingControllers.push(_ground);
		_bonusController = new BonusController(_digger, _ground);
		_bonusController.playTimeModel = _playTimeController.model;
		_shiftingControllers.push(_bonusController);
		_worldModel = new WorldModel(_digger.model);
		_shiftingControllers.push(_worldModel);
		_container.addChild(_ground.view);
		_container.addChild(_digger.view);
		_container.addChild(_playTimeController.view);
	}

	private function removeWorld():void {
		_container.removeChild(_ground.view);
		_container.removeChild(_digger.view);
		_container.removeChild(_playTimeController.view);
	}

	private function addBackground():void {
		_container.graphics.beginFill(0xffffff);
		_container.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
		_container.graphics.beginFill(0x5C4033);
		_container.graphics.drawRect(0, 0, Main.WIDTH, Main.HEIGHT);
		_container.graphics.endFill();
	}

	private function tick():void {
		for each (var shiftingController:IShifting in _shiftingControllers) {
			shiftingController.tick();
		}

		if (checkForEndGame()) {
			stopGame();
		}
	}

	private function checkForEndGame():Boolean {
		return _playTimeController.isEndGame();
	}

	private function stopGame():void {
		_paused = true;
		_container.addEventListener(MouseEvent.CLICK, onMouseClickForEnd);
	}

	private function onMouseClickForEnd(event:MouseEvent):void {
		_container.removeEventListener(MouseEvent.CLICK, onMouseClickForEnd);
		dispatchEvent(new SceneEvent(SceneEvent.WANT_CLOSE));
	}

	private function addUserCommandListener():void {
		_userCommandListener.addEventListener(UserCommandEvent.MOUSE_DOWN, onUserMouseDown);
	}
	private function removeUserCommandListener():void {
		_userCommandListener.removeEventListener(UserCommandEvent.MOUSE_DOWN, onUserMouseDown);
	}

	private function addListeners():void {
		_container.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		addUserCommandListener();
	}
	private function removeListeners():void {
		_container.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		removeUserCommandListener();
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
