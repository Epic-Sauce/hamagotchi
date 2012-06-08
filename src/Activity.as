package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jeremy Granadillo
	 */
	public class Activity extends Sprite
	{
		//the logic for it to be empty is that if we call
		// it on the stage, I would expect it to be needed
		// and thus not fulfilled. in the later levels you can call
		// needMet(true) before you addChild, or set it on new level
		private var isFullfilled:Boolean = false;
		
		public function Activity() 
		{
		}
		
		public function needMet(bool:Boolean):void
		{
			isFullfilled = bool;
		}
		
	}

}