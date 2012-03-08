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
		super(new DiggerHero());
		_model = model;
	}

	public function get model():DiggerModel { return _model; }

	public function tick():void {
		_model.tick();
	}
}
}
