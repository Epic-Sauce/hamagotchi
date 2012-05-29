package  
{
	import flash.display.Sprite;
	import flash.events.*;
	/**
	 * ...
	 * @author Nigel
	 */
	public class Button extends Sprite
	{
		
		public function Button(posX:int, posY:int) 
		{	
			x = posX;
			y = posY;
			
			graphics.beginFill(0xFF0000);
			graphics.drawRect(0,0,50,50)
			graphics.endFill();
			this.addEventListener(Event.ADDED_TO_STAGE, events);
			
		}
		
		private function events(e:Event):void {
			addEventListener(MouseEvent.CLICK, onClick);
			
		}
		
		private function onClick(e:MouseEvent):void {
			Hamster.setGoRight();
		}
		
	}

}