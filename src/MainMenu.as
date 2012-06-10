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
		
		/*options buttons*/
		private var music:Music_BTN = new Music_BTN;
		private var soundEffects:SoundEffects_BTN = new SoundEffects_BTN;
		private var music_on:On_BTN = new On_BTN;
		private var music_off:Off_BTN = new Off_BTN;
		private var soundEffects_on:On_BTN = new On_BTN;
		private var soundEffects_off:Off_BTN = new Off_BTN;
		
		/*Tweens*/
		
				
		
		
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
			removeChild(logo);
			removeChild(startGame);
			removeChild(selectLevel);
			
			options.y = 200;
			
			addChild(music);
			addChild(soundEffects);
			addChild(music_on);
			music_on.addEventListener(MouseEvent.MOUSE_DOWN, setMusicOn);
			addChild(music_off);
			music_off.addEventListener(MouseEvent.MOUSE_DOWN, setMusicOff);
			addChild(soundEffects_on);
			addChild(soundEffects_off);
			
			var midAlign:int = (512 - (music.width / 2));
			
			music.x = midAlign;
			music.y = 360;
			
			music_on.x = 625;
			music_on.y = 400;
			
			music_off.x = 740;
			music_off.y = 394;
			music_off.alpha = 0.2;
			
			soundEffects.x = midAlign;
			soundEffects.y = 485;
			
			soundEffects_on.x = 625;
			soundEffects_on.y = 525;
			
			soundEffects_off.x = 740;
			soundEffects_off.y = 519;
			soundEffects_off.alpha = 0.2;
		}
		
		private function setMusicOff(e:MouseEvent):void 
		{
			music_off.alpha = 1;
			music_on.alpha = 0.2;
		}
		
		private function setMusicOn(e:MouseEvent):void 
		{
			music_off.alpha = 0.2;
			music_on.alpha = 1;
		}
		
		private function levelSelector(e:MouseEvent):void 
		{
			
		}
		

	}

}