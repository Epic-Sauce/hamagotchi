package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class GiveFood extends Activity 
	{
		//this should hold the art asset of the activity. 
		// should be asset:WaterBottle_asset
		// would prefer for this to be in Activity but 
		// each activity needs a different class.
		private var foodBowl:FoodBowl = new FoodBowl();;
		
		public function GiveFood() 
		{
			addChild(foodBowl);
		}
		
	}

}