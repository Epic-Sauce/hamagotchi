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
		private var buttonArray:Array = new Array();
		private var thoughtBubble:ThoughtBubble = new ThoughtBubble();
		private var gameUI:GameUI = new GameUI();
		private var giveWater:GiveWater = new GiveWater();
		private var counterCheck:Boolean = false;
		private var overlay:Overlay = new Overlay();
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
			hamster = new Hamster(100, 340);
			addChild(hamster);
			addChild(giveWater);
			addChild(overlay);
			addButtons(2);
			thoughtBubble.scaleX = 0.5;
			thoughtBubble.scaleY = 0.5;			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function addButtons(amount:int):void
		{
			var i:int = 0;
			while (i < amount)
			{
				//i multiplied by 200, for proper spacing
				var button:Button = new Button();
				button.x = i * 200;
				button.y = stage.stageHeight - button.height - 20;
				button.name = "button" + i;
				addChild(button);
				buttonArray.push(button);
				i++;
			}
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