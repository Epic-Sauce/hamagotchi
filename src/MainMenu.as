package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Antonie Hogewoning
	 */
	public class MainMenu extends Sprite
	{
		private var logo:HamagotchiLogo = new HamagotchiLogo;
		private var startGame:StartGame_BTN = new StartGame_BTN;
		private var selectLevel:SelectLevel_BTN = new SelectLevel_BTN;
		private var options:Options_BTN = new Options_BTN;
		
		private var blurredBG:BackgroundBlurred = new BackgroundBlurred();
				
		public function MainMenu() 
		{
			addChild(blurredBG);
			addChild(logo);
			addChild(startGame);
			addChild(selectLevel);
			addChild(options);
			
			logo.x = 512 - logo.width / 2;
			logo.y = 25;
			
			var midAlign:int = (512 - (startGame.width / 2));
			
			startGame.x = midAlign;
			startGame.y = 400;
			
			selectLevel.x = midAlign;
			selectLevel.y = 525;
			
			options.x = midAlign;
			options.y = 650;
			
			startGame.addEventListener(MouseEvent.MOUSE_DOWN, initGame);
			selectLevel.addEventListener(MouseEvent.MOUSE_DOWN, levelSelector);
			options.addEventListener(MouseEvent.MOUSE_DOWN, optionsScreen);
		}
		
		private function initGame(e:MouseEvent):void 
		{
			dispatchEvent(new Event("startNewGame"));
			
			removeChild(blurredBG);
			removeChild(logo);
			removeChild(startGame);
			startGame.removeEventListener(MouseEvent.MOUSE_DOWN, initGame);
			removeChild(selectLevel);
			selectLevel.removeEventListener(MouseEvent.MOUSE_DOWN, levelSelector);
			removeChild(options);
			options.removeEventListener(MouseEvent.MOUSE_DOWN, optionsScreen);
			
			
		}
		
		private function optionsScreen(e:MouseEvent):void 
		{
			
		}
		
		private function levelSelector(e:MouseEvent):void 
		{
			
		}
		

	}

}