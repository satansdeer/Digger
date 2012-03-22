/**
 * User: dima
 * Date: 22/03/12
 * Time: 5:12 PM
 */
package game.window {
import core.ViewController;

import flash.events.Event;

public class WindowEvent extends Event {
	public var window:ViewController;

	public static const CLOSE:String = "windowClose";

	public function WindowEvent(type:String, window:ViewController):void {
		super(type);
		this.window = window;
	}
}
}
