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
		private var giveWaterIcon:GiveWater = new GiveWater();
		private var counterCheck:Boolean = true;
		private var overlay:Overlay = new Overlay();
		private var counter:int = 0;
		private var counterMax:int = 30;
		private var need:int;
		
		private var mainMenu:MainMenu = new MainMenu();
		
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
			
			addChild(mainMenu);
			mainMenu.addEventListener("startNewGame", gameInit);
			//gameInit();
		
		}
		
		private function gameInit(e:Event):void
		{
			mainMenu.removeEventListener("startNewGame", gameInit);
			addChild(background);
			addChild(gameUI);
			hamster = new Hamster(100, 340);
			addChild(hamster);
			addChild(giveWater);
			addChild(overlay);
			addButtons(Levels.getButtons(Levels.getLevel()));
			thoughtBubble.scaleX = 0.5;
			thoughtBubble.scaleY = 0.5;
			giveWaterIcon.scaleX = 0.2;
			giveWaterIcon.scaleY = 0.2;
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
		
		private function loop(e:Event):void
		{
			if (counterCheck)
			{
				if (counter < counterMax)
				{
					counter++;
				}
				else
				{
					counterCheck = false;
					counter = 0;
					var lvl:int = Levels.getLevel();
					trace("Level = " + lvl);
					var numberOfButtons:int = Levels.getButtons(lvl);
					//Calculated from 0 to 4, but number of buttons is 1-5 so thats why I added -1
					need = hamster.chooseNeed(numberOfButtons - 1);
					//done with choseNeed, add icon on top of thoughtBubble
					addChild(thoughtBubble);
					thoughtBubble.x = hamster.x + 120;
					thoughtBubble.y = hamster.y - 180;
					buttonArray[need].giveNeed(need);
					
					//***************************************************
					//NOT PROPER SOLUTION, NEED TO ADD TO DIFFERENT CLASS
					//TESTING PURPOSES ONLY
					//***************************************************
					if (need == 0)
					{
						addChild(giveWaterIcon);
						giveWaterIcon.x = thoughtBubble.x + 90;
						giveWaterIcon.y = thoughtBubble.y + 30;
						trace("added water");
					}
					if (need == 1)
					{
						addChild(giveWaterIcon);
						giveWaterIcon.x = thoughtBubble.x + 90;
						giveWaterIcon.y = thoughtBubble.y + 30;
						trace("added food");
					}
					if (need == 2)
					{
						addChild(giveWaterIcon);
						giveWaterIcon.x = thoughtBubble.x + 90;
						giveWaterIcon.y = thoughtBubble.y + 30;
						trace("added wheel");
					}
					if (need == 3)
					{
						addChild(giveWaterIcon);
						giveWaterIcon.x = thoughtBubble.x + 90;
						giveWaterIcon.y = thoughtBubble.y + 30;
						trace("added clean");
					}
					if (need == 4)
					{
						addChild(giveWaterIcon);
						giveWaterIcon.x = thoughtBubble.x + 90;
						giveWaterIcon.y = thoughtBubble.y + 30;
						trace("added tubes");
					}
					//***************************************************
				}
			}
		}
	}
}