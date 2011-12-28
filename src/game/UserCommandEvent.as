/**
 * User: dima
 * Date: 28/12/11
 * Time: 10:00 AM
 */
package game {
import flash.events.Event;

public class UserCommandEvent extends Event{
	public var offset:Number;

	public static const MOUSE_DOWN:String = "mouseKeyDown";

	public function UserCommandEvent(type:String, offset:Number) {
		super(type);
		this.offset = offset;
	}
}
}
