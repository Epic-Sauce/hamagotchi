package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Antonie Hogewoning
	 */
	public class MainMenu extends Sprite
	{
		
		public var playButton:MovieClip = new MovieClip;
		public var levelButton:MovieClip = new MovieClip;
		public var playButton_tf:TextField = new TextField;
		
		
		public function MainMenu() 
		{
			addChild(playButton);
			addChild (playButton_tf)
			playButton.graphics.beginFill(0xff0000);
			playButton.graphics.drawRoundRect(325, 200, 400, 75, 20);
			playButton.graphics.endFill();
			
			playButton_tf.x = 325;
			playButton_tf.y = 200;
			playButton_tf.text = "Start Spel";
			
			
			addChild(levelButton);
			levelButton.graphics.beginFill(0x00ff00);
			levelButton.graphics.drawRoundRect(325, 300, 400, 75, 20);
			levelButton.graphics.endFill();
			
			

		}
		

	}

}