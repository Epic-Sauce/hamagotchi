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
		
		public var startGame:StartGame_BTN = new StartGame_BTN;
		public var selectLevel:SelectLevel_BTN = new SelectLevel_BTN;
		public var options:Options_BTN = new Options_BTN;
		

		
		
		public function MainMenu() 
		{
			addChild(startGame);
			addChild(selectLevel);
			addChild(options);
			
			var midAlign:int = (512 - (startGame.width / 2));
			
			startGame.x = midAlign;
			startGame.y = 400;
			
			selectLevel.x = midAlign;
			selectLevel.y = 525;
			
			options.x = midAlign;
			options.y = 650;
			
			
			
			
			
			
			playButton.addEventListener(MouseEvent.MOUSE_DOWN, initGame)
		}
		
		private function initGame():void
		{
			
		}
	}

}