package
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Nigel Ridderinkhof
	 */
	public class Hamster extends Sprite
	{
		private var color:uint = 0x00FF00;
		
		public function Hamster(posX:int, posY:int)
		{
			x = posX;
			y = posY;
			
			draw();
		
		}
		
		public function draw():void
		{
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, 25);
			graphics.endFill();
		}
	}
}