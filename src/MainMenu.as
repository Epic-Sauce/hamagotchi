package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Antonie Hogewoning
	 */
	public class MainMenu extends Sprite
	{
		public var logo:HamagotchiLogo = new HamagotchiLogo;
		public var startGame:StartGame_BTN = new StartGame_BTN;
		public var selectLevel:SelectLevel_BTN = new SelectLevel_BTN;
		public var options_button:Options_BTN = new Options_BTN;
		public var back:BackButton_BTN = new BackButton_BTN;
		
		private var firstBuild:Boolean = true;
		
		/*options buttons*/
		private var music:Music_BTN = new Music_BTN;
		private var soundEffects:SoundEffects_BTN = new SoundEffects_BTN;
		private var music_on:On_BTN = new On_BTN;
		private var music_off:Off_BTN = new Off_BTN;
		private var soundEffects_on:On_BTN = new On_BTN;
		private var soundEffects_off:Off_BTN = new Off_BTN;
		
		//button state
		private var musicState:Boolean = true;
		private var effectState:Boolean = true;
		
		/*music*/
		[Embed(source="../lib/mainMenu.mp3")]
		private var mySound:Class;
		private var menuMusic:Sound;
		
		private var menuMusicSound:SoundChannel;
		
		/*Tweens*/

		
		private var blurredBG:BackgroundBlurred = new BackgroundBlurred();
		
		public function MainMenu()
		{
			addChild(blurredBG);
			
			buildMenu();

			
			
		
		}
		
		private function buildMenuME(e:MouseEvent):void
		{
			removeChild(options_button);
			removeChild(music);
			removeChild(soundEffects);
			removeChild(music_on);
			removeChild(music_off);
			removeChild(soundEffects_on);
			removeChild(soundEffects_off);
			removeChild(back);
			
			buildMenu();
		
		}
		
		public function buildMenu():void
		{
			addChild(logo);
			addChild(startGame);
			addChild(selectLevel);
			addChild(options_button);
			
			logo.x = 512 - logo.width / 2;
			logo.y = 25;
			
			var midAlign:int = (512 - (startGame.width / 2));
			
			startGame.x = midAlign;
			startGame.y = 400;
			
			selectLevel.x = midAlign;
			selectLevel.y = 525;
			
			options_button.x = midAlign;
			options_button.y = 650;
			
			startGame.addEventListener(MouseEvent.MOUSE_DOWN, initGame);
			selectLevel.addEventListener(MouseEvent.MOUSE_DOWN, levelSelector);
			options_button.addEventListener(MouseEvent.MOUSE_DOWN, optionsScreen);
			
			if (musicState == true)
			{
				menuMusic = new mySound as Sound;
				menuMusicSound = menuMusic.play();

			}
			if (musicState == false)
			{
				menuMusicSound.stop();
			}
		
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
			removeChild(options_button);
			options_button.removeEventListener(MouseEvent.MOUSE_DOWN, optionsScreen);
		
		}
		
		private function optionsScreen(e:MouseEvent):void
		{
			options_button.removeEventListener(MouseEvent.MOUSE_DOWN, optionsScreen);
			
			removeChild(logo);
			removeChild(startGame);
			removeChild(selectLevel);
			
			options_button.y = 200;
			
			addChild(music);
			addChild(soundEffects);
			addChild(music_on);
			music_on.addEventListener(MouseEvent.MOUSE_DOWN, setMusicOn);
			addChild(music_off);
			music_off.addEventListener(MouseEvent.MOUSE_DOWN, setMusicOff);
			addChild(soundEffects_on);
			soundEffects_on.addEventListener(MouseEvent.MOUSE_DOWN, setSoundEffectOn);
			addChild(soundEffects_off);
			soundEffects_off.addEventListener(MouseEvent.MOUSE_DOWN, setSoundEffectOff);
			addChild(back);
			back.addEventListener(MouseEvent.MOUSE_DOWN, buildMenuME);
			
			var midAlign:int = (512 - (music.width / 2));
			
			music.x = midAlign;
			music.y = 360;
			
			music_on.x = 625;
			music_on.y = 400;
			
			music_off.x = 740;
			music_off.y = 394;
			
			soundEffects.x = midAlign;
			soundEffects.y = 485;
			
			soundEffects_on.x = 625;
			soundEffects_on.y = 525;
			
			soundEffects_off.x = 740;
			soundEffects_off.y = 519;
			soundEffects_off.alpha = 0.2;
			
			back.x = 12;
			back.y = 670;
			
			if (musicState == true)
			{
				music_off.alpha = 0.2;
				music_on.alpha = 1;
			}
			
			else if (musicState == false)
			{
				music_off.alpha = 1;
				music_on.alpha = 0.2;
			}
			
			if (effectState == true)
			{
				soundEffects_off.alpha = 0.2;
				soundEffects_on.alpha = 1;
				
			}
			
			else if (effectState == false)
			{
				soundEffects_off.alpha = 1;
				soundEffects_on.alpha = 0.2;
				
			}
		
		}
		
		private function setMusicOn(e:MouseEvent):void
		{
			music_off.alpha = 0.2;
			music_on.alpha = 1;
			musicState = true;
		}
		
		private function setMusicOff(e:MouseEvent):void
		{
			music_off.alpha = 1;
			music_on.alpha = 0.2;
			musicState = false;
		}
		
		private function setSoundEffectOn(e:MouseEvent):void
		{
			soundEffects_off.alpha = 0.2;
			soundEffects_on.alpha = 1;
			effectState = true;
		}
		
		private function setSoundEffectOff(e:MouseEvent):void
		{
			soundEffects_off.alpha = 1;
			soundEffects_on.alpha = 0.2;
			effectState = false;
		}
		
		private function levelSelector(e:MouseEvent):void
		{
		
		}
	
	}

}