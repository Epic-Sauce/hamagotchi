package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jeremy Granadillo
	 */
	public class Activity extends Sprite
	{
		//state so the object knows if it should switch to a "needy" state
		private var state:Boolean = false;
		
		public function Activity() 
		{
			
		}
		
		public function getState():Boolean
		{
			return state;
		}
		
		public function setState(s:Boolean):void
		{
			state = s;
		}
		
	}

}