package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Antonie Hogewoning
	 */
	public class MainMenu extends Sprite
	{
		
		public var playButton:StartSpel_BTN = new StartSpel_BTN;
		public var levelButton:MovieClip = new MovieClip;
		public var playButton_tf:TextField = new TextField;
		
		public var menuFormat:TextFormat = new TextFormat;
		
		
		
		
		public function MainMenu() 
		{
			addChild(playButton);
			addChild (playButton_tf);
			
			playButton.x = 300;
			playButton.y = 300;		
			
			
		}
		

	}

}