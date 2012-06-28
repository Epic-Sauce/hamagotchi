package  
{
	/**
	 * ...
	 * @author Jeremy Granadillo
	 */
	public class Levels 
	{
		//Array pos 0 = 0 so that if lvl = 1 we get 1st pos from array (1 button)
		private static var arrayButtons:Array = new Array (0, 1, 1, 2, 2, 3, 3, 4, 4);
		//0 = water, 1 = food, 2 = wheel, 3 = clean
		private static var arrayNeeds:Array = new Array(0, 1, 2, 3, 4);
		private static var currentLvl:int = 1;
		
		public function Levels() 
		{
			
		}
		
		public static function getButtons(lvl:int):int
		{
			setLevel(lvl);
			return arrayButtons[lvl];
		}
		
		public static function getNeeds(lvl:int):int
		{
			setLevel(lvl);
			return arrayNeeds[lvl];
		}
		
		public static function getMaxLevel():int
		{
			return arrayButtons.length;
		}
		
		public static function getLevel():int
		{
			return currentLvl;
		}
		
		public static function setLevel(lvl:int):void
		{
			trace("Setting level " + lvl);
			currentLvl = lvl;
		}
	}

}