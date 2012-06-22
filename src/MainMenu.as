package
{
	import flash.display.DisplayObject;
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
		
		// level buttons
		//  what follows is ugly but it's simple and it works
		private var lvl1:Lvl1 = new Lvl1;
		private var lvl2:Lvl2 = new Lvl2;
		private var lvl3:Lvl3 = new Lvl3;
		private var lvl4:Lvl4 = new Lvl4;
		private var lvl5:Lvl5 = new Lvl5;
		private var lvl6:Lvl6 = new Lvl6;
		private var lvl7:Lvl7 = new Lvl7;
		private var lvl8:Lvl8 = new Lvl8;
		private var lvl9:Lvl9 = new Lvl9;
		private var lvl10:Lvl10 = new Lvl10;
		private var lvl11:Lvl11 = new Lvl11;
		private var lvl12:Lvl12 = new Lvl12;
		private var levels:Array = new Array(lvl1, lvl2, lvl3, lvl4, lvl5, lvl6, lvl7, lvl8, lvl9, lvl10, lvl11, lvl12);
		private var selectedLevel:DisplayObject;
		private var levelSelect_start:StartLevel_btn = new StartLevel_btn;
		
		
		private var menuB:Boolean = true;
		private var maxLevel:int = Levels.getMaxLevel() - 1;
		
		private var blurredBG:BackgroundBlurred = new BackgroundBlurred();
		
		public function MainMenu()
		{
			addChild(blurredBG);
			
			buildMenu();
		}
		
		private function buildMenuOP(e:MouseEvent):void
		{
			
			if (menuB == true)
			{
				removeChild(options_button);
				removeChild(music);
				removeChild(soundEffects);
				removeChild(music_on);
				removeChild(music_off);
				removeChild(soundEffects_on);
				removeChild(soundEffects_off);
				back.removeEventListener(MouseEvent.MOUSE_DOWN, buildMenuOP);
			}
			
			if (menuB == false)
			{
				removeChild(selectLevel);
				
				if (selectedLevel != null)
				{
					removeChild(selectedLevel);
					selectedLevel = null;
				}
				
				var i:int = 0;
				
				while (i < maxLevel)
				{
					removeChild(levels[i]);
					levels[i].removeEventListener(MouseEvent.MOUSE_DOWN, lvlSelect);
					i++;
				}
				
				back.removeEventListener(MouseEvent.MOUSE_DOWN, buildMenuOP);
			}
			
			buildMenuME();
		}
		
		private function buildMenuME():void
		{
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
			
			menuB = true;
			
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
			back.addEventListener(MouseEvent.MOUSE_DOWN, buildMenuOP);
			
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
			selectLevel.removeEventListener(MouseEvent.MOUSE_DOWN, levelSelector);
			
			menuB = false;
			
			selectLevel.y = 200;
			
			removeChild(logo);
			removeChild(startGame);
			removeChild(options_button);
			
			back.x = 12;
			back.y = 670;
			
			addChild(back);
			back.addEventListener(MouseEvent.MOUSE_DOWN, buildMenuOP);
			
			addChild(levelSelect_start);
			levelSelect_start.x = 760;
			levelSelect_start.y = 670;
			levelSelect_start.addEventListener(MouseEvent.MOUSE_DOWN, startSelectedLvl);
			
			var i:int = 0;
			var j:int = 0;
			var k:int = 0;
			
			while (i < maxLevel)
			{
				levels[i].x = (j * 130) + 200;
				j++;
				
				levels[i].y = (k * 115) + 320;
				if (j > 4)
				{
					j = 0;
					k++;
				}
				addChild(levels[i]);
				levels[i].label = (i + 1);
				levels[i].scaleX = 0.75;
				levels[i].scaleY = 0.75;
				levels[i].addEventListener(MouseEvent.MOUSE_DOWN, lvlSelect);
				i++;
			}
		}
		
		private function startSelectedLvl(e:MouseEvent):void 
		{
			dispatchEvent(new Event("startNewGame"));
		}
		
		private function lvlSelect(event:MouseEvent):void
		{
			var theLevel:int = event.target.label;
			Levels.setLevel(theLevel);
			/* var currentLevel:DisplayObject;
			 * levels[Levels.getLevel() + 1];
			 *
			 * The solution came from this site:
				 * http://www.dannyburbol.com/2009/01/movieclip-clone-flash-as3/
			 * 
			*/
			
			var levelClass:Class = Object(levels[Levels.getLevel()-1]).constructor;
			var currentLevel:DisplayObject = new levelClass();
			
			if (selectedLevel == null)
			{
				selectedLevel = currentLevel;
				selectedLevel.x = 435;
				selectedLevel.y = 560;

				addChild(currentLevel);				
			}
			else
			{
				removeChild(selectedLevel);
				selectedLevel = currentLevel;
				selectedLevel.x = 435;
				selectedLevel.y = 560;
				
				addChild(currentLevel);		
			}
		}
	
	}

}