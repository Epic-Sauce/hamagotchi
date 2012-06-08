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
		

		
		
		public function MainMenu() 
		{
			
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
			
			startGame.addEventListener(MouseEvent.MOUSE_DOWN, initGame)
		}
		
		private function initGame():void
		{
			
		}
	}

}