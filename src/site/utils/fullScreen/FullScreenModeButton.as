package site.utils.fullScreen
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import site.layout.ElementUISprite;
	
	
	/**
	 * ...
	 * @author ...
	 */
	public class FullScreenModeButton extends ElementUISprite
	{
		public var currentStage:Stage;
		
		public function FullScreenModeButton(stage:Stage)
		{
			currentStage = stage;
			init();
		}
		
		private function init():void 
		{
			this.addEventListener(MouseEvent.CLICK, onFullScreenModeButtonClickHandler, false, 0, true);
			this.addEventListener(FullScreenEvent.FULL_SCREEN, onFullScreenHandler, false, 0, true);
			this.buttonMode = true;
			
			drawEnterFullScreenModeGraphics();
		}
		
		private function onFullScreenHandler(e:FullScreenEvent):void 
		{
			if (currentStage.displayState == StageDisplayState.NORMAL) 
			{
				drawExitFullScreenModeGraphics();
			}
			else
			{
				drawEnterFullScreenModeGraphics();
			}
		}
		
		private function onFullScreenModeButtonClickHandler(e:MouseEvent):void 
		{
			if (currentStage.displayState == StageDisplayState.NORMAL) 
			{
                try
				{
					drawExitFullScreenModeGraphics();
                    currentStage.displayState = StageDisplayState.FULL_SCREEN;
					currentStage.dispatchEvent(new Event(Event.RESIZE));

                }
                catch (e:SecurityError)
				{
                    trace("an error has occured. please modify the html file to allow fullscreen mode");
					//  html example
					/*	var params = { allowFullScreen: "true" };
					*	swfobject.embedSWF("main.swf", "flashcontent", "100%", "100%", "11.2.0", "expressInstall.swf", flashvars);
					*/
                }
            }
			else
			{
				drawEnterFullScreenModeGraphics();
                currentStage.displayState = StageDisplayState.NORMAL;
				currentStage.dispatchEvent(new Event(Event.RESIZE));
			}
		}
		
		public function drawEnterFullScreenModeGraphics():void 
		{
			this.graphics.clear();
			this.graphics.lineStyle(1, 0xFFFFFF);
			this.graphics.beginFill(0x0000FF, 0.7);
			this.graphics.drawRect(0, 0, 20, 20);
			this.graphics.endFill();
			
		}
		
		public function drawExitFullScreenModeGraphics():void 
		{
			this.graphics.clear();
			this.graphics.lineStyle(1, 0xFFFFFF);
			this.graphics.beginFill(0xFF0000, 0.7);
			this.graphics.drawRect(0, 0, 20, 20);
			this.graphics.endFill();
			
		}
		
	}
	
}