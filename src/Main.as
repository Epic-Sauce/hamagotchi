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
		private var hamster:Hamster;
		private var background:HamsterCage = new HamsterCage();
		private var buttonRight:ButtonTest = new ButtonTest();
		private var buttonLeft:ButtonTest = new ButtonTest();
		private var thoughtBubble:ThoughtBubble = new ThoughtBubble();
		private var gameUI:GameUI = new GameUI();
		private var counterCheck:Boolean = false;
		private var counter:int = 0;
		private var counterMax:int = 210;
		
		public function Main():void
		{
			trace("Main started");
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			trace("Main init started");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(background);
			addChild(gameUI);
			hamster = new Hamster(100, stage.stageHeight - 300);
			addChild(hamster);
			addChild(buttonLeft);
			addChild(buttonRight);
			buttonLeft.y = stage.stageHeight - buttonLeft.height - 20;
			buttonLeft.addEventListener(MouseEvent.CLICK, onClickLeft);
			buttonRight.y = stage.stageHeight - buttonRight.height - 20;
			buttonRight.x = 200;
			buttonRight.addEventListener(MouseEvent.CLICK, onClickRight);
			
			addEventListener(Event.ENTER_FRAME, loop);
		
		}
		private function onClickLeft(e:MouseEvent):void
		{
			trace("Main onClickLeft started");
			hamster.setGoLeft();
		}
		
		private function onClickRight(e:MouseEvent):void
		{
			trace("Main onClickLeft started");
			hamster.setGoRight();
			counterCheck = true;
		}
		
		private function loop(e:Event):void {	
			if (counterCheck) {
				if (counter < counterMax) {
					counter++;
				}
				else {
					counterCheck = false;
					counter = 0;
					trace("CheckCounter");
					addChild(thoughtBubble);
					thoughtBubble.x = hamster.x - 200;
				}
			}
		}
	}
}