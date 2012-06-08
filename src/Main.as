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
	 * 
	 * Images constant houden (vb water bottle niet transparant)
	 * Difficulty, begin met stage click en 1 handeling
	 * Touchscreen test (maybe)
	 * 
	 * TODO
	 * 
	 * Menu
	 * Quit
	 * Pause
	 * Random needs
	 * More Needs
	 * Levels
	 * Error check (onclick button)
	 * Animate
	 * 
	 * 
	 */
	public class Main extends Sprite
	{
		private var hamster:Hamster;
		private var background:HamsterCage = new HamsterCage();
		private var buttonRight:ButtonTest = new ButtonTest();
		private var buttonLeft:ButtonTest = new ButtonTest();
		private var thoughtBubble:ThoughtBubble = new ThoughtBubble();
		private var gameUI:GameUI = new GameUI();
		private var giveWater:GiveWater = new GiveWater();
		private var counterCheck:Boolean = false;
		private var counter:int = 0;
		private var counterMax:int = 210;
		
		private var mainMenu:MainMenu = new MainMenu;
		
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
			addChild(mainMenu);
			

		
		}
		
		private function gameInit():void
		{
			addChild(gameUI);
			hamster = new Hamster(100, 340);
			addChild(hamster);
			addChild(giveWater);
			addChild(buttonLeft);
			addChild(buttonRight);
			buttonLeft.y = stage.stageHeight - buttonLeft.height - 20;
			buttonLeft.addEventListener(MouseEvent.CLICK, onClickLeft);
			buttonRight.y = stage.stageHeight - buttonRight.height - 20;
			buttonRight.x = 200;
			buttonRight.addEventListener(MouseEvent.CLICK, onClickRight);
			thoughtBubble.scaleX = 0.5;
			thoughtBubble.scaleY = 0.5;
			addEventListener(Event.ENTER_FRAME, loop);
			
		}
		
		private function onClickLeft(e:MouseEvent):void
		{
			trace("Main onClickLeft started");
			hamster.setGoLeft();
			addChild(thoughtBubble);
			removeChild(thoughtBubble);
			counterCheck = true;
		}
		
		private function onClickRight(e:MouseEvent):void
		{
			trace("Main onClickLeft started");
			hamster.setGoRight();
			addChild(thoughtBubble);
			removeChild(thoughtBubble);
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
					thoughtBubble.x = hamster.x + 120;
					thoughtBubble.y = hamster.y - 180;
				}
			}
		}
	}
}