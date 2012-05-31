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
		private var background:HamsterCage;
		
		[Embed(source = "../lib/hamsterCage.jpg")]
		private var backgroundClass:Class;
		private var background:Bitmap = new backgroundClass();
		//[Embed(source = "../lib/hamsterCage.jpg")]
		//private var backgroundClass:Class;
		//private var background:Bitmap = new backgroundClass();


		

		public function Main():void 
		{
			trace("Main started");
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			trace("Main init started");
			background = new HamsterCage();
			addChild(background);
			removeEventListener(Event.ADDED_TO_STAGE, init);






















			addChild(new Hamster(100, stage.stageHeight - 300));
			addChild(new Button(500, stage.stageHeight - 150));
			var myButton:Button = new Button(200, stage.stageHeight - 150);
			addChild(myButton);
			myButton.addEventListener(MouseEvent.CLICK, onClickLeft);
			addChild(background);
			//addChild(background);
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
			trace("Main onClickLeft started");
			Hamster.setGoLeft();
		}
		
	}
	
}