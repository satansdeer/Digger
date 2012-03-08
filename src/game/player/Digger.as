/**
 * Created by : Dmitry
 * Date: 3/8/12
 * Time: 10:31 AM
 */
package game.player {
import core.ViewController;

public class Digger extends ViewController {
	private var _model:DiggerModel;

	public function Digger(model:DiggerModel):void {
		super(new DuckHitD());
		_model = model;
	}

	public function get model():DiggerModel { return _model; }

	public function setPosition(x:Number, y:Number):void {
		_model.setPosition(x, y);
		view.x = x;
		view.y = y;
	}

	public function tick():void {
		_model.tick();
		view.x = _model.x;
		view.y = _model.y;
	}

	public function moveToX(x:Number):void {
		_model.setTargetX(x);
	}
}
}
