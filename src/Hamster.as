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
		private var goRight:Boolean = false;
		private var goLeft:Boolean = false;
		

		public function Hamster(posX:int, posY:int)
		{
			trace("Hamster started");
			x = posX;
			y = posY;
			
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, 25);
			graphics.endFill();
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		
		//Laat de "hamster" heen en weer bewegen tussen bepaalde grensen (aanpassen naar positie van de objecten en knop input)
		private function loop(e:Event):void {	
			if (goRight) {
				x += 5;
				if (x > stage.stageWidth - width) {
					goRight = false;	
				}
			}
			
			if(goLeft){
				x -= 5;
				if (x < (0 + width)) {
					goLeft = false;
				}
			}
		}
		
		public function setGoRight():void {
			trace("Setting Hamster goRight to true");
			goRight = true;
		}
		
		public function setGoLeft():void {
			trace("Setting Hamster goLeft to true");
			goLeft = true;
			
		}
		
		
	}
}