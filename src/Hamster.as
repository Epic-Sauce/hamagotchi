package
{
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
		private var hamster:HamsterTest = new HamsterTest();

		public function Hamster(posX:int, posY:int)
		{
			trace("Hamster started");
			x = posX;
			y = posY;
			
			addChild(hamster);
			hamster.scaleX = 0.3;
			hamster.scaleY = 0.3;
			addEventListener(Event.ENTER_FRAME, loop);
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
			
		}
	}
}