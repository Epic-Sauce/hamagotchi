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
		private var background:HamsterCage  = new HamsterCage();
		private var buttonRight:ButtonTest = new ButtonTest();
		private var buttonLeft:ButtonTest = new ButtonTest();
		private var gameUI:GameUI = new GameUI();
		
		public function Main():void 
		{
			trace("Main started");
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			trace("Main init started");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(background);
			addChild(gameUI);
			addChild(new Hamster(100, stage.stageHeight - 300));
			addChild(buttonLeft);
			addChild(buttonRight);
			buttonLeft.y = stage.stageHeight-buttonLeft.height - 20;
			buttonLeft.addEventListener(MouseEvent.CLICK, onClickLeft);
			buttonRight.y = stage.stageHeight - buttonRight.height - 20;
			buttonRight.x = 200;
			buttonRight.addEventListener(MouseEvent.CLICK, onClickRight);
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
		private function onClickRight(e:MouseEvent):void 
		{
			trace("Main onClickLeft started");
			Hamster.setGoRight();
		}
		
	}
	
}