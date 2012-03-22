/**
 * Created by : Dmitry
 * Date: 3/8/12
 * Time: 10:32 AM
 */
package core {
import flash.display.Sprite;
import flash.events.EventDispatcher;

public class ViewController extends EventDispatcher {
	private var _view:Sprite;

	public function ViewController(view:Sprite):void {
		_view = view;
	}

	public function get view():Sprite { return _view; }
}
}
