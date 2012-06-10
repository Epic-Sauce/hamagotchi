package  
{
	import flash.display.Sprite;
	import flash.events.*;
	/**
	 * ...
	 * @author Nigel/Jeremy
	 */
	public class Button extends Sprite
	{
		private var button:ButtonTest = new ButtonTest();
		
		public function Button() 
		{	
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			addChild(button);
		}
		
		private function init(e:Event):void {
			addEventListener(MouseEvent.CLICK, onClick);
			
		}
		
		private function onClick(e:MouseEvent):void {
			trace(this.name + " onClick received");
		}
		
	}

}