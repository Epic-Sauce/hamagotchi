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
		
		public var playButton:MovieClip = new MovieClip;
		
		
		public function MainMenu() 
		{
			addChild(playButton);
			playButton.x = 400;
			playButton.y = 400;
			playButton.addEventListener(MouseEvent.MOUSE_DOWN, initGame)
		}
		
		private function initGame():void
		{
			
		}
	}

}