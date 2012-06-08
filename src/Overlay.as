package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Nigel
	 */
	public class Overlay extends Sprite
	{
		
		public function Overlay() 
		{
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(-100,0,100, 2000);
			graphics.endFill();
			
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(1024,0,100, 2000);
			graphics.endFill();
		}
		
	}

}