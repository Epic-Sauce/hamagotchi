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
		public var levelButton:SelecteerLevel_BTN = new SelecteerLevel_BTN;
		public var optiesButton:Opties_BTN = new Opties_BTN;
		public var playButton_tf:TextField = new TextField;
		public var logo:HamagotchiLogo = new HamagotchiLogo;
		
		public var menuFormat:TextFormat = new TextFormat;
		
		
		
		
		public function MainMenu() 
		{
			addChild(playButton);
			addChild(levelButton);
			addChild(optiesButton);
			addChild(logo);
			addChild (playButton_tf);
			
			var midAlign:Number = 512 - (playButton.width/2);
			
			playButton.x = midAlign;
			playButton.y = 300;		
			
			levelButton.x = midAlign;
			levelButton.y = 425;
			
			optiesButton.x = midAlign;
			optiesButton.y = 550;
			
		}
		

	}

}