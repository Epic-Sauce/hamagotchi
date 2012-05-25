package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nigel Ridderinkhof
	 */
	public class Hamster extends Sprite
	{
		private var color:uint = 0x00FF00;
		private var goRight:Boolean = true;
		private var goLeft:Boolean = false;
		
		public function Hamster(posX:int, posY:int)
		{
			x = posX;
			y = posY;
			
			draw();
			addEventListener(Event.ENTER_FRAME, move);
		}
		
		public function draw():void
		{
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, 25);
			graphics.endFill();
		}
		
		//Laat de "hamster" heen en weer bewegen tussen bepaalde grensen (aanpassen naar positie van de objecten en knop input)
		private function move(e:Event):void {	
			if (goRight) {
				x += 5;
				if (x > stage.stageWidth - width) {
					goLeft = true;
					goRight = false;
				}
			}
			if(goLeft){
				x -= 5;
				if (x < (0 + width)) {
					goLeft = false;
					goRight = true;
				}
			}
			
		}
	}
}