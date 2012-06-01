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
		// each activity needs a different class.
		private var waterBottle:WaterBottle = new WaterBottle();;
		
		public function GiveWater() 
		{
			waterBottle.scaleX = -1;
			waterBottle.x = 1030;
			waterBottle.y = -100;
			addChild(waterBottle);
		}
		
	}

}