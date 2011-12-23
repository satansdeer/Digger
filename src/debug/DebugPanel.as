/**
 * User: dima
 * Date: 22/12/11
 * Time: 4:22 PM
 */
package debug {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

import game.GameController;

public class DebugPanel extends Sprite{
	private const PANEL_WIDTH:Number = 200;
	private const PANEL_HEIGHT:Number = 400;

	private var _gameController:GameController;


	public function DebugPanel(gameController:GameController) {
		super();
		_gameController = gameController;
		drawBackground();
	}

	private function drawBackground():void {
		this.graphics.beginFill(0, .2);
		this.graphics.drawRect(0, 0, PANEL_WIDTH, PANEL_HEIGHT);
		this.graphics.endFill();
		var label:TextField = new TextField();
		label.text = "Debug panel";
		label.autoSize = TextFieldAutoSize.LEFT;
		label.selectable = false;
		label.x = -label.width/2 + this.width/2;
		label.y = 10;
		this.addChild(label);
	}
}
}
