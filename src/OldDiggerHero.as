package
{
	import effect.SmokeParticleEffect;
	
	import flash.display.Sprite;
	
	public class OldDiggerHero extends Sprite
	{
		private var _cabin:CabinView = new CabinView;
		private var _hero:HeroView = new HeroView;
		private var _drill:AllDrillsView = new AllDrillsView;
		
		private var _rightSmoke:SmokeParticleEffect;
		private var _leftSmoke:SmokeParticleEffect;
		
		private var _leftPrticles:ParticlesView;
		private var _rightPrticles:ParticlesView;
		
		public function OldDiggerHero()
		{
			super();
			init();
		}
		
		private function init():void{
			addChild(_drill);
			_cabin.stop();
			_cabin.x = 20;
			_cabin.y = 5;
			addChild(_hero);
			addChild(_cabin);
			_hero.x = 20;
			_hero.y = 7;
			_drill.stop();
			_drill.x = 23;
			_drill.y = 81;
			_leftSmoke = SmokeParticleEffect.createParticleEffect(0,-5,0);
			_leftSmoke.x = 66;
			_leftSmoke.y = 77;
			_rightSmoke = SmokeParticleEffect.createParticleEffect(0,-5,0);
			_rightSmoke.x = 25;
			_rightSmoke.y = 77;
			_rightSmoke.scaleX = -1;
			addChild(_leftSmoke);
			addChild(_rightSmoke);
			_rightPrticles = new ParticlesView();
			_leftPrticles = new ParticlesView();
			addChild(_rightPrticles);
			_rightPrticles.x = 68;
			_rightPrticles.y = 77;
			addChild(_leftPrticles);
			_leftPrticles.x = 23;
			_leftPrticles.y = 77;
			_leftPrticles.scaleX = -1;
		}
	}
}