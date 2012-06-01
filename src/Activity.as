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
		// and thus empty. in the later levels you can call
		// setFull before you addChild, or set it on new level
		private var isEmpty:Boolean = true;
		
		public function Activity() 
		{
			
		}
		
		public function setEmpty():void
		{
			isEmpty = true;
		}
		
		public function setFull():void
		{
			isEmpty = false;
		}
		
	}

}