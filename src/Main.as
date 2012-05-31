package 
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Jeremy Granadillo
	 */
	public class Main extends Sprite 
	{
		
		[Embed(source = "../lib/hamsterCage.jpg")]
		private var backgroundClass:Class;
		private var background:Bitmap = new backgroundClass();
		private var imgPath:Array = ["../lib/gameUI.png","../lib/hamsterCage.jpg"];
		private var imgArray:Array = new Array();
		
		
		public function Main():void 
		{
			trace("Main started");
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			trace("Main init started");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			for (var i:int = 0;i<imgPath.length;i++ ) {
				var imgLoader:Loader = new Loader();
				imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
				imgLoader.load(new URLRequest(imgPath[i]));
			}
			
			//addChild(background);
			
			
		}
		
		private function loadComplete(e:Event):void {
			imgArray.push(e.target.content);
			if (imgPath.length == imgArray.length) {
				for (var i:int = 0; i < imgArray.length; i++ ) {
					addChild(imgArray[i]);
				}
			}
			
			var myButton:Button = new Button(200, stage.stageHeight - 150);
			addChild(myButton);
			addChild(new Hamster(100, stage.stageHeight - 300));
			addChild(new Button(500, stage.stageHeight - 150));
			myButton.addEventListener(MouseEvent.CLICK, onClickLeft);
		}
		
		function sleep(ms:int):void {
			var init:int = getTimer();
			while(true) {
				if(getTimer() - init >= ms) {
					break;
				}
			}
		}
		
		private function onClickLeft(e:MouseEvent):void 
		{
			trace("Main onClickLeft started");
			Hamster.setGoLeft();
		}
		
	}
	
}