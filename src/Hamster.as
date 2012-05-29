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
		static private var goRight:Boolean = false;
		static private var goLeft:Boolean = false;

		public function Hamster(posX:int, posY:int)
		{
			x = posX;
			y = posY;
			
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, 25);
			graphics.endFill();
			
			addEventListener(Event.ENTER_FRAME, move);
		}
		
		//Laat de "hamster" heen en weer bewegen tussen bepaalde grensen (aanpassen naar positie van de objecten en knop input)
		private function move(e:Event):void {	
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
		static public function setGoRight():void {
			goRight = true;
		}
		
		static public function setGoLeft():void {
			goLeft = true;
		}
		
		
	}
}