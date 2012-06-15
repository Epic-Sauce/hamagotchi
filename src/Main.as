package
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.livepreview.LivePreviewParent;
	import flash.media.Sound;
	
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
		private var hamsterFood:HamsterFood = new HamsterFood();
		private var counterCheck:Boolean = true;
		private var overlay:Overlay = new Overlay();
		private var counter:int = 0;
		private var counterMax:int = 30;
		private var need:int;
		
		private var mainMenu:MainMenu = new MainMenu();
		
		//****Icons
		private var giveWaterButton:GiveWater = new GiveWater();
		private var giveWaterBubble:GiveWater = new GiveWater();
		private var hamsterFoodBubble:HamsterFood = new HamsterFood();
		private var hamsterFoodButton:HamsterFood = new HamsterFood();
		//*********
		

		

		
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

		
		}
		
		private function gameInit(e:Event):void
		{
			mainMenu.removeEventListener("startNewGame", gameInit);
			addChild(background);
			hamster = new Hamster(200, 450);
			addChild(hamster);
			addChild(hamsterFood);
			addChild(giveWater);
			addChild(gameUI);
			addChild(overlay);
			addButtons(Levels.getButtons(Levels.getLevel()));
			//Sizes and position
			hamsterFood.x = 750;
			hamsterFood.y = 420;
			hamsterFood.scaleX = 0.8;
			hamsterFood.scaleY = 0.8;
			thoughtBubble.scaleX = 0.7;
			thoughtBubble.scaleY = 0.7;
			//***********************************
			//should be addded in different class
			giveWaterBubble.scaleX = 0.275;
			giveWaterBubble.scaleY = 0.275;
			giveWaterButton.scaleX = 0.2;
			giveWaterButton.scaleY = 0.2;
			hamsterFoodBubble.scaleX = 0.45;
			hamsterFoodBubble.scaleY = 0.45;
			hamsterFoodButton.scaleX = 0.4;
			hamsterFoodButton.scaleY = 0.4;
			//***********************************
			addEventListener(Event.ENTER_FRAME, loop);
		
		}
		
		private function addButtons(amount:int):void
		{
			var i:int = 0;
			while (i < amount)
			{
				//i multiplied by 200, for proper spacing
				var button:Button = new Button(this);
				button.x = i * 200;
				button.y = stage.stageHeight - button.height - 20;
				button.name = "button" + i;
				addChild(button);
				buttonArray.push(button);
				
				switch (i){
					case 0:
						addChild(giveWaterButton);
						giveWaterButton.mouseEnabled = false;
						giveWaterButton.mouseChildren = false;
						giveWaterButton.x = button.x + 85;
						giveWaterButton.y = button.y + 35;
					break;
					case 1:
						addChild(hamsterFoodButton);
						hamsterFoodButton.mouseEnabled = false;
						hamsterFoodButton.mouseChildren = false;
						hamsterFoodButton.x = button.x + 30;
						hamsterFoodButton.y = button.y + 35;
					break;
					case 2:
						//addChild(giveWaterBubble);
					break;
					case 3:
						//addChild(giveWaterBubble);
					break;
					case 4:
						//addChild(giveWaterBubble);
					break;
				}
				
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
					thoughtBubble.x = hamster.x + 70;
					thoughtBubble.y = hamster.y - 350;
					buttonArray[need].giveNeed(need);
					
					//***************************************************
					//NOT PROPER SOLUTION, NEED TO ADD TO DIFFERENT CLASS
					//TESTING PURPOSES ONLY
					//***************************************************
					switch (need){
						case 0:
							addChild(giveWaterBubble);
							giveWaterBubble.x = thoughtBubble.x + 133;
							giveWaterBubble.y = thoughtBubble.y + 45;
							trace("added water");
						break;
						case 1:
							addChild(hamsterFoodBubble);
							hamsterFoodBubble.x = thoughtBubble.x + 70;
							hamsterFoodBubble.y = thoughtBubble.y + 50;
							trace("added food");
						break;
						case 2:
							addChild(giveWaterBubble);
							giveWaterBubble.x = thoughtBubble.x + 90;
							giveWaterBubble.y = thoughtBubble.y + 30;
							trace("added wheel");
						break;
						case 3:
							addChild(giveWaterBubble);
							giveWaterBubble.x = thoughtBubble.x + 90;
							giveWaterBubble.y = thoughtBubble.y + 30;
							trace("added clean");
						break;
						case 4:
							addChild(giveWaterBubble);
							giveWaterBubble.x = thoughtBubble.x + 90;
							giveWaterBubble.y = thoughtBubble.y + 30;
							trace("added tubes");
						break;
					}
					//***************************************************
				}
			}
		}
	}
}