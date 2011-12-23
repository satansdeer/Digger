/**
 * User: dima
 * Date: 22/12/11
 * Time: 11:38 AM
 */
package scene {
import flash.events.Event;

public class SceneEvent extends Event{
	public static const WANT_CLOSE:String = "wantClose";


	public function SceneEvent(type:String) {
		super(type);
	}
}
}
