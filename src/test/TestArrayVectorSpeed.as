/**
 * User: dima
 * Date: 22/03/12
 * Time: 2:08 PM
 */
package test {
import game.player.DiggerHero;
import game.player.DiggerModel;

public class TestArrayVectorSpeed {
	private var _diggers:Vector.<DiggerHero>;
	private var _diggersSmall:Vector.<DiggerHero>;

	public function TestArrayVectorSpeed() {
		super();
		createDiggers();
	}

	public function testVectorForEach():void {
		var time:Number = new Date().getMilliseconds();
		trace("test for each");
		trace("small diggers 10000 iterations");
		var result:Number;
		for (var i:int = 0; i < 10000; ++i) {
			for each (var digger:DiggerHero in _diggersSmall) {
				result += digger.model.speed;
			}
		}
		trace("time : " + (new Date().getMilliseconds() - time));
		trace("result : " + result);
	}

	private function createDiggers():void {
		_diggers = new Vector.<DiggerHero>();
		for (var i:int = 0; i < 1000; ++i) { _diggers.push(new DiggerHero(new DiggerModel())); }
		_diggersSmall = new Vector.<DiggerHero>();
		for (var i:int = 0; i < 5; ++i) { _diggersSmall.push(new DiggerHero(new DiggerModel())); }
	}

}
}
