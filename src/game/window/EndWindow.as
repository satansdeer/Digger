/**
 * User: dima
 * Date: 22/03/12
 * Time: 5:04 PM
 */
package game.window {
import core.ViewController;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

public class EndWindow extends ViewController {
	private var _textField:TextField;

	public function EndWindow() {
		super(new Sprite());
		addRect();
		addTextField();
		view.addEventListener(MouseEvent.CLICK, onWindowClick);
	}

	public function setScore(score:int):void {
		_textField.text = "your score : " + score;
	}

	private function addRect():void {
		view.graphics.beginFill(0x000000, .5);
		view.graphics.drawRect(-50, -50, 100, 100);
		view.graphics.endFill();
	}

	private function addTextField():void {
		_textField = new TextField();
		_textField.selectable = false;
		_textField.autoSize = TextFieldAutoSize.LEFT;
		_textField.mouseEnabled = false;
	}

	private function onWindowClick(event:MouseEvent):void {
		dispatchEvent(new WindowEvent(WindowEvent.CLOSE, this));
	}
}
}
