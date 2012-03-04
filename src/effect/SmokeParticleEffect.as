package effect
{
	import flash.display.Sprite;
	import flash.utils.setTimeout;

	public class SmokeParticleEffect extends Sprite
	{
		
		public var particlesArray:Vector.<SmokeParticle> = new Vector.<SmokeParticle>;
		
		public var duration:Number;
		
		public var speedX:int;
		public var speedY:int;
		
		public const partsNum:int = 10;
		
		public function SmokeParticleEffect()
		{
		}
		
		public static function createParticleEffect(xSpeed:int, ySpeed:int, duration:Number):SmokeParticleEffect{
			var eff:SmokeParticleEffect  = new SmokeParticleEffect();
			eff.speedX = xSpeed;
			eff.speedY = ySpeed;
			eff.duration = duration;
			eff.init();
			eff.start();
			return eff;
		}
		
		public function start():void{
			for (var i:int; i<partsNum; i++){
				setTimeout(createParticle, Math.ceil(Math.random() * 3), particlesArray[i]); 
			}
		}
		
		private function createParticle(part:SmokeParticle):void{
			addChild(part);
		}
		
		public function init():void{
			for (var i:int; i<partsNum; i++){
				particlesArray[i] = new SmokeParticle;

			}
		}
	}
}