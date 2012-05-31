package  
{
	/**
	 * ...
	 * @author Jeremy Granadillo
	 */
	public class GiveWater extends Activity 
	{
		private var isEmpty:Boolean = false;
		//this should hold the art asset of the activity. 
		// should be asset:WaterBottle_asset
		// would prefer for this to be in Activity but 
		// each one is a different class.
		private var waterBottle:WaterBottle = new WaterBottle();;
		
		public function GiveWater() 
		{
			addChild(waterBottle);
			waterBottle.x = (stage.stageWidth * 0.7);
			waterBottle.y = (stage.stageHeight * 0.1);
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