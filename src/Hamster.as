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
		private var checkWait:Boolean = true;

		public function Hamster(posX:int, posY:int)
		{
			trace("Hamster started");
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
			
			if (checkWait) {
				wait();
				checkWait = false;
			}
		}
		static public function setGoRight():void {
			trace("Setting Hamster goRight to true");
			goRight = true;
		}
		
		static public function setGoLeft():void {
			trace("Setting Hamster goLeft to true");
			goLeft = true;
		}
		private function wait():void {
				trace("before");
				//Main.wait(10000);
				trace("after");
		}
		
		
	}
}