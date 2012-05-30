package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Jeremy Granadillo
	 */
	public class Main extends Sprite 
	{
		
		[Embed(source = "../lib/hamsterCage.jpg")]
		private var backgroundClass:Class;
		private var background:Bitmap = new backgroundClass();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new Hamster(100, stage.stageHeight - 300));
			addChild(new Button(500, stage.stageHeight - 150));
			var myButton:Button = new Button(200, stage.stageHeight - 150);
			addChild(myButton);
			myButton.addEventListener(MouseEvent.CLICK, onClickLeft);
			addChild(background);
		}
		
		function sleep(ms:int):void {
			var init:int = getTimer();
			while(true) {
				if(getTimer() - init >= ms) {
					break;
				}
			}
		}
		
		private function onClickLeft(e:MouseEvent):void 
		{
			Hamster.setGoLeft();
		}
		
	}
	
}