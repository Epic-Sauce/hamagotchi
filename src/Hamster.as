package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Nigel Ridderinkhof
	 */
	public class Hamster extends Sprite
	{
		private var color:uint = 0x00FF00;
		
		[Embed(source="../lib/hamsterAnimations.swf", symbol="hamsterAnimations")]
		private var HamsterIdle:Class;
		private var hamster_Idle:MovieClip = new HamsterIdle() as MovieClip;
		
		private var hamster:HamsterTest = new HamsterTest();
		
		private var noFrame:int = 145;
		private var idleFrame:int = 103;
		private var drinkFrame:int = 245;
		private var eatFrame:int = 325;

		public function Hamster(posX:int, posY:int)
		{
			trace("Hamster started");
			x = posX;
			y = posY;
			
			addChild(hamster_Idle);
			hamster_Idle.scaleX = 0.85;
			hamster_Idle.scaleY = 0.85;
			hamster_Idle.play();
			addEventListener(Event.ENTER_FRAME, loop);
			addEventListener("animateNo", animateNo);
		}
		
		public function chooseNeed(range:int):int
		{
			//choose the need(s) based on range, so number of different items.
			var need:int = Math.floor((Math.random() * (range + 1)));
			trace(need);
			return need;
		}
		
		//Laat de "hamster" heen en weer bewegen tussen bepaalde grensen (aanpassen naar positie van de objecten en knop input)
		private function loop(e:Event):void {	
			if (hamster_Idle.currentFrame == noFrame) {
				hamster_Idle.gotoAndPlay(0);
			}
			if (hamster_Idle.currentFrame == idleFrame) {
				hamster_Idle.gotoAndPlay(0);
			}
			if (hamster_Idle.currentFrame == drinkFrame) {
				hamster_Idle.gotoAndPlay(0);
			}
			if (hamster_Idle.currentFrame == eatFrame) {
				hamster_Idle.gotoAndPlay(0);
			}
		}
		
		public function animateNo():void {
			hamster_Idle.gotoAndPlay(104);
		}
		
		public function animateDrink():void {
			hamster_Idle.gotoAndPlay(146);
		}
		
		public function animateEat():void 
		{
			hamster_Idle.gotoAndPlay(249);
		}
	}
}