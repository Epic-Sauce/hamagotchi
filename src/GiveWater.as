package  
{
	/**
	 * ...
	 * @author Jeremy Granadillo
	 */
	public class GiveWater extends Activity 
	{
		//this should hold the art asset of the activity. 
		// should be asset:WaterBottle_asset
		// would prefer for this to be in Activity but 
		// each one is a different class.
		private var asset:int;
		
		public function GiveWater() 
		{
			/**
			 * Example:
			 *	package 
			 *	{
			 *	  import flash.display.Sprite;
			 *	  
			 *	  public class MySymbol extends Sprite
			 *	  {
			 *		private var design:MySymbol_design;
			 *		
			 *		public function MySymbol()
			 *		{
			 *		  trace("I'm a MySymbol instance called", name);
			 *		  design = new MySymbol_design();
			 *		  addChild(design);
			 *		}
			 *	  }
			 *	}
			 * 
			 */
			
			//each object has a set place in the cage 
			// so it should hold its own position
			this.x = 100;
			this.y = 100;
			
			
		}
		
	}

}