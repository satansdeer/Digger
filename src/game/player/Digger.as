/**
 * Created by : Dmitry
 * Date: 3/8/12
 * Time: 10:31 AM
 */
package game.player {
import core.ViewController;

import game.playtime.PlayTimeModel;

public class Digger extends ViewController {
	private var _model:DiggerModel;
	private var _rotationModel:DiggerRotationModel;

	private var _playTimeModel:PlayTimeModel;

	public function Digger(model:DiggerModel):void {
		super(new DuckHitD());
		_model = model;
		_rotationModel = new DiggerRotationModel(_model);
	}

	public function get model():DiggerModel { return _model; }

	public function addPlayTimeModel(playTimeModel:PlayTimeModel):void {
		_playTimeModel = playTimeModel;
	}

	public function setPosition(x:Number, y:Number):void {
		_model.setPosition(x, y);
		view.x = x;
		view.y = y;
	}

	public function tick():void {
		_model.tick();
		_rotationModel.tick();
		view.x = _model.x;
		view.y = _model.y;
		view.rotation = _rotationModel.rotation;
		if (_playTimeModel && _playTimeModel.totalPlayTime - _playTimeModel.currentTime < _playTimeModel.totalPlayTime/10) {
			view.alpha = _playTimeModel.totalPlayTime/20;
		}
	}

	public function moveToX(x:Number):void {
		_model.setTargetX(x);
	}
}
}
