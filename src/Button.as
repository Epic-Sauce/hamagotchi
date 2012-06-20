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
		private var need:int;
		private var m:Main;
		
		public function Button(m:Main)
		{
			this.m = m;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			addChild(button);
		}
		
		private function init(e:Event):void
		{
			addEventListener(MouseEvent.CLICK, onClick);
		
		}
		
		public function giveNeed(n:int):void {
			need = n;
			trace("giveNeed = "+need)
		}
		
		private function onClick(e:MouseEvent):void
		{
			trace(this.name + " onClick received");
			if (this.name == ("button" + need)) {
				m.setcounterCheck(true);
				trace("SUCCES FOR NEED: "+need);
			}
			else{
				trace("NO.");
			}
		}
	
	}

}