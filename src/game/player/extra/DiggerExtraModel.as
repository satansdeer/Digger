/**
 * Created by : Dmitry
 * Date: 3/17/12
 * Time: 9:20 PM
 */
package game.player.extra {
import flash.events.Event;

public class DiggerExtraModel {
	private var _items:Vector.<DiggerExtraItemModel>;

	public function DiggerExtraModel() {
	}

	public function tick():void {
		for (var i:int = 0; i < _items.length; ++i) { _items[i].tick(); }
	}

	public function addItem(item:DiggerExtraItemModel):void {
		if (!_items) { _items = new Vector.<DiggerExtraItemModel>(); }
		_items.push(item);
		item.addEventListener(DiggerExtraItemModel.EVENT_FINISHED, onItemFinished);
	}

	public function get speed():Number {
		var result:Number = 0;
		for (var i:int = 0; i < _items.length; ++i) {
			result += _items[i].speed;
		}
		return result;
	}

	/* Internal functions */

	private function onItemFinished(event:Event):void {
		var index:int = _items.indexOf(event.target);
		if (index != -1) {
			_items.slice(index, 1);
		} else { trace("thmng wrong [DiggerExtraModel.onItemFinished]"); }
	}
}
}
