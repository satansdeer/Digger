/**
 * Created by : Dmitry
 * Date: 3/18/12
 * Time: 3:33 PM
 */
package game.playtime {
import core.ViewController;

import fl.motion.motion_internal;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

public class PlayTimeComponent extends ViewController {
	private var _model:PlayTimeModel;
	private var _currentTimeSec:int;
	private var _label:TextField;

	public function PlayTimeComponent(model:PlayTimeModel, x:Number, y:Number) {
		super(new Sprite());
		view.x = x;
		view.y = y;
		_model = model;
		_label = createLabel();
		view.addChild(_label);
		currentTimeSec = model.totalPlayTime;
	}

	public function tick() {
		if (_currentTimeSec != int(_model.totalPlayTime - _model.currentTime)) {
			trace("update current time sec [PlayTimeController.tick]");
			currentTimeSec = _model.totalPlayTime - _model.currentTime;
		}
	}

	private function createLabel():TextField {
		var result:TextField = new TextField();
		result.selectable = false;
		result.autoSize = TextFieldAutoSize.LEFT;
		result.mouseEnabled = false;
		return result;
	}

	private function set currentTimeSec(value:int):void {
		_currentTimeSec = value;
		updateView();
	}

	private function updateView():void {
		_label.text = _currentTimeSec.toString();
	}
}
}
