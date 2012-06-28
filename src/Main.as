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
	 * Quit
	 * Pause
	 * Animate
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
		private var counterMax:int = 180;
		private var need:int;
		private var correctCount:int = 0;
		
		private var mainMenu:MainMenu = new MainMenu();
		
		// For level indication
		private var lvl1:Lvl1 = new Lvl1;
		private var lvl2:Lvl2 = new Lvl2;
		private var lvl3:Lvl3 = new Lvl3;
		private var lvl4:Lvl4 = new Lvl4;
		private var lvl5:Lvl5 = new Lvl5;
		private var lvl6:Lvl6 = new Lvl6;
		private var lvl7:Lvl7 = new Lvl7;
		private var lvl8:Lvl8 = new Lvl8;
		private var levels:Array = new Array(lvl1, lvl2, lvl3, lvl4, lvl5, lvl6, lvl7, lvl8);
		private var currentLevel:DisplayObject;
		
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
			counterCheck = true;
			addChild(background);
			hamster = new Hamster(480, 430);
			
			addChild(gameUI);
			addButtons(Levels.getButtons(Levels.getLevel()));
			addChild(hamster);
			addChild(overlay);
			
			currentLevel = levels[Levels.getLevel()-1];
			addChild(currentLevel);
			
			currentLevel.x = 900;
			currentLevel.y = 640;
			currentLevel.scaleX = 0.8;
			currentLevel.scaleY = 0.8;
			
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
			var j:int = 0;
			if(buttonArray[j] != null) {
				while (buttonArray[j]) {
					buttonArray[j].killme();
					j++;
				}
				buttonArray = [];
			}
			while (i < amount)
			{
				//i multiplied by 200, for proper spacing
				var button:Button = new Button(this);
				button.x = i * 200;
				button.y = stage.stageHeight - button.height - 20;
				button.name = "button" + i;
				addChild(button);
				buttonArray.push(button);
				
				switch (i)
				{
					case 0: 
						addChild(giveWaterButton);
						addChild(giveWater);
						giveWaterButton.mouseEnabled = false;
						giveWaterButton.mouseChildren = false;
						giveWaterButton.x = button.x + 85;
						giveWaterButton.y = button.y + 35;
						break;
					case 1: 
						addChild(hamsterFoodButton);
						addChild(hamsterFood);
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
					if (correctCount == 7) {
						counter = 0;
						correctCount = 0;
						counterCheck = false;
						var lvlGet:int = Levels.getLevel();
						Levels.setLevel(lvlGet + 1);
						mainMenu.startNextLevel();
					}
					else {
						counterCheck = false;
						counter = 0;
						var lvl:int = Levels.getLevel();
						var numberOfButtons:int = Levels.getButtons(lvl);
						//Calculated from 0 to 4, but number of buttons is 1-5 so thats why I added -1
						need = hamster.chooseNeed(numberOfButtons - 1);
						//done with choseNeed, add icon on top of thoughtBubble
						addChild(thoughtBubble);
						thoughtBubble.x = hamster.x + 70;
						thoughtBubble.y = hamster.y - 350;
						for (var i:int = 0; i < numberOfButtons; i++)
						{
							buttonArray[i].giveNeed(need);
						}
						//***************************************************
						//NOT PROPER SOLUTION, NEED TO ADD TO DIFFERENT CLASS
						//TESTING PURPOSES ONLY
						//***************************************************
						switch (need)
						{
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
		
		private function removeBubble():void
		{
			addChild(thoughtBubble);
			removeChild(thoughtBubble);
			addChild(hamsterFoodBubble);
			removeChild(hamsterFoodBubble);
			addChild(giveWaterBubble);
			removeChild(giveWaterBubble);
		}
		
		public function setcounterCheck(value:Boolean):void
		{
			counterCheck = value;
			removeBubble();
			correctCount++;
			
		}
		
		public function getcounterCheck():Boolean 
		{
			return counterCheck;
		}
		
		public function noAnimate():void {
			hamster.animateNo();
		}
		
		public function drinkAnimate():void {
			hamster.animateDrink();
		}
		
		public function eatAnimate():void {
			hamster.animateEat();
		}
	}
}