package scene {
import flash.display.Sprite;

import game.GameController;

import menu.MenuController;

public class SceneController {
	private var _gameScene:GameController;
	private var _menuScene:MenuController;

	public function SceneController(container:Sprite) {
		_gameScene = new GameController(container);
		_menuScene = new MenuController(container);

		_menuScene.open();

		addListeners();
	}

	private function addListeners():void {
		_gameScene.addEventListener(SceneEvent.WANT_CLOSE, onGameSceneWantRemove);
		_menuScene.addEventListener(SceneEvent.WANT_CLOSE, onMenuSceneWantRemove);
	}

	private function onGameSceneWantRemove(event:SceneEvent):void {
		_gameScene.close();
		_menuScene.open();
	}

	private function onMenuSceneWantRemove(event:SceneEvent):void {
		_menuScene.close();
		_gameScene.open();
	}
}
}
