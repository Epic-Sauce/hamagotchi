package  
{
	/**
	 * ...
	 * @author Jeremy Granadillo
	 */
	public class Levels 
	{
		private static var arrayButtons:Array = new Array ();
		private static var arrayNeeds:Array = new Array();
		private static var currentLvl:int;
		
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
		
		public static function getLevel():int
		{
			return currentLvl;
		}
		
		private static function setLevel(lvl:int):void
		{
			currentLvl = lvl;
		}
	}

}