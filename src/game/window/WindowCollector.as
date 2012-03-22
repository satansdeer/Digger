/**
 * User: dima
 * Date: 22/03/12
 * Time: 5:08 PM
 */
package game.window {
import com.bit101.components.Window;

import core.ViewController;

import flash.display.Sprite;

import flash.utils.Dictionary;

public class WindowCollector {
	private static var _instance:WindowCollector;

	private var _windows:Dictionary;
	private var _container:Sprite;

	private var _openedWindow:ViewController;
	private var _callbackOnClose:Function;

	public static const END_WINDOW:String = "endWindow";

	public static function get instance():WindowCollector {
		if (!_instance) { _instance = new WindowCollector(); }
		return _instance;
	}

	public function WindowCollector() {
		addWindow(new EndWindow(), END_WINDOW);
	}

	public function init(container:Sprite):void {
		_container = container;
	}

	public function addWindow(window:ViewController, windowName:String):void {
		_windows[windowName] = window;
		window.addEventListener(WindowEvent.CLOSE, onWindowClose);
	}

	public function showWindow(windowName:String):void {
		var window:ViewController = _windows[windowName];
		if (window) {
			if (_openedWindow) {
				closeWindow(_openedWindow);
			}
			_container.addChild(window.view);
			_openedWindow = window;
		}
	}

	public function showWindowAndCallbackOnClose(windowName:String, callback:Function):void {
		showWindow(windowName);
		_callbackOnClose = callback;
	}

	/* Internal functions */

	private function onWindowClose(event:WindowEvent):void {
		closeWindow(event.window);
	}

	private function closeWindow(window:ViewController):void {
		if (_container.contains(window.view)) { _container.removeChild(window.view); }
		if (_callbackOnClose) {
			_callbackOnClose();
			_callbackOnClose = null;
		}
		if (_openedWindow == window) {
			_openedWindow = null;
		}
	}

}
}
