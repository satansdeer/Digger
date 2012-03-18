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

import game.IShifting;

public class PlayTimeController extends ViewController implements IShifting {
	private var _model:PlayTimeModel;
	private var _currentTimeSec:int;
	private var _label:TextField;

	public function PlayTimeController(x:Number, y:Number) {
		super(new Sprite());
		view.x = x;
		view.y = y;
		_model = new PlayTimeModel();
		_label = createLabel();
		view.addChild(_label);
		currentTimeSec = model.totalPlayTime;
	}

	public function get model():PlayTimeModel { return _model; }

	public function isEndGame():Boolean { return _model.isEndGame(); }

	public function tick():void {
		_model.tick();
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
