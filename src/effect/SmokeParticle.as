package effect
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class SmokeParticle extends SmokePartView
	{
		
		public var duration:Number;
		
		public var speedX:int = 0;
		public var speedY:int = 5;
		private var maxX:Number = 100;
		private var maxY:Number = -50;
		
		public function SmokeParticle()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(event:Event):void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			y -= 2 + Math.ceil(Math.random() * speedY);
			scaleX = scaleY += 0.1;
			if(y < maxY){
				y = 0;
				scaleX = scaleY = 1;
				x = 2+Math.ceil(Math.random() * 3)
			}
		}
	}
}