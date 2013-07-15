package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.soma.ui.ElementUI;
	import com.soma.ui.events.EventUI;
	import com.soma.ui.layouts.TileUI;
	import com.soma.ui.vo.GapUI;
	import com.soma.ui.vo.PaddingUI;
	import flash.display.*;
	import flash.events.*;
	import site.core.TimelinePage;
	import site.layout.ElementUISprite;
	import site.utils.ColourUtil;
	
	public class HomePage extends TimelinePage
	{	
		public var tile:TileUI;
		private var tileReference:ElementUISprite;
		
		public function HomePage()
		{
			super();
			alpha = 0;
		}
		
		private function createLayoutUI():void 
		{
			tileReference = Site.getElementUISprite(Site.middleCentre, 0xAAAAAA, 0.7);
			tileReference.element = baseUI.add(tileReference);
			
			//tileReference.element.addEventListener(EventUI.WILL_CALCULATE, willCalculateHandler);
			//tileReference.element.addEventListener(EventUI.WILL_UPDATE, willUpdateHandler);
			//tileReference.element.addEventListener(EventUI.UPDATED, updatedHandler);
			
			tileReference.setElementPropertiesFromXML(Site.middleCentre);
			
			addChild(tileReference);
			
			tileReference.element.refresh(new Event(Event.RESIZE));
			
			
			tile = new TileUI(tileReference, 1, 1);
			tile.ratio = ElementUI.RATIO_OUT;
			tile.alignX = ElementUI.ALIGN_LEFT;
			tile.alignY = ElementUI.ALIGN_TOP;
			tile.childrenGap = new GapUI(0, 0);
			tile.childrenPadding = new PaddingUI(0, 0, 0, 0);
			tile.childrenAlign = TileUI.ALIGN_TOP_LEFT;
			addChild(tile);
			
			for (var i:int = 0; i < 100; ++i) 
			{
				var button:Sprite = new Sprite();
				button.addEventListener(MouseEvent.CLICK, onMouseClickHandler, false, 0, true);
				button.addEventListener(MouseEvent.ROLL_OVER, onMouseRollOverHandler, false, 0, true);
				button.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOutHandler, false, 0, true);
				//button.graphics.lineStyle(1, 0xFFFFFF);
				button.graphics.beginFill(ColourUtil.randomColourRange( 0x005BB2, 100 ), .7);
				button.graphics.drawRect(0, 0, 50, 25);
				button.buttonMode = true;
				tile.addChild(button);
			}
			
			tile.refresh();
		}
		
		
		
		private function onMouseClickHandler(e:MouseEvent):void 
		{
			if (Gaia.api.getCurrentBranch() == Pages.HOME)
			{
				Gaia.api.goto(Pages.DEFAULT);
			}
			else if (Gaia.api.getCurrentBranch() == Pages.DEFAULT)
			{
				Gaia.api.goto(Pages.HOME);
			}
			else
			{
				trace("Button clicked, but nowhere to go");
			}
			
			//if (hbox.contains(e.target as DisplayObject))
			//{
				//if (e.target.width < 100)
				//{
					//TweenMax.to(e.target, 0.3, { width: 100, onUpdate:hbox.refresh, ease:Expo.easeInOut } );
				//}
				//else
				//{
					//TweenMax.to(e.target, 0.3, { width: 90, onUpdate:hbox.refresh, ease:Expo.easeInOut } );
				//}
			//}
			//else if (vbox.contains(e.target as DisplayObject))
			//{
				//if (e.target.height < 40)
				//{
					//TweenMax.to(e.target, 0.3, { height: 40, onUpdate:vbox.refresh, ease:Expo.easeInOut } );
				//}
				//else
				//{
					//TweenMax.to(e.target, 0.3, { height: 30, onUpdate:vbox.refresh, ease:Expo.easeInOut } );
				//}
			//}
			
		}
		
		private function onMouseRollOverHandler(e:MouseEvent):void 
		{
			
		}
		
		private function onMouseRollOutHandler(e:MouseEvent):void 
		{
			//TweenMax.to(e.target, 0, { height: 30, onUpdate:vbox.refresh } );
		}		
		
		
		
		
		private function willCalculateHandler(event:EventUI):void {
			   //event.preventDefault(); // stop the process before the calculation
			trace(this, "event.element = " + event.element); // trace the ElementUI instance
			trace(this, "event.element = " + event.element.object); // trace the DisplayObject instance
			trace(this, "event.element = " + event.element.baseUI); // trace the BaseUI instance
		}
		
		private function willUpdateHandler(event:EventUI):void {
			   //event.preventDefault(); // stop the process before new properties are applied to the DisplayObject
			   trace(this, "event.element = " + event.element); // trace the ElementUI instance
			   trace(this, "event.element = " + event.element.object); // trace the DisplayObject instance
			   trace(this, "event.element = " + event.element.baseUI); // trace the BaseUI instance
			   trace(this, "event.properties = " + event.properties); // trace the properties that will be applied to the DisplayObject
		}
		
		private function updatedHandler(event:EventUI):void {
			   trace(this, "event.element = " + event.element); // trace the ElementUI instance
			   trace(this, "event.element = " + event.element.object); // trace the DisplayObject instance
			   trace(this, "event.element = " + event.element.baseUI); // trace the BaseUI instance
			   trace(this, "event.properties = " + event.properties); // trace the properties that will be applied to the DisplayObject
		}
		
		
		
		
		
		
		
		
		
		override public function createPage():void 
		{
			createLayoutUI();
		}
		
		override public function pageTransitionIn():void 
		{
			
		}
		
		
		
		override public function pageTransitionOut():void 
		{
			
		}
		
		override public function destroyPage():void
		{
			
		}
		
		
		
		override public function pageResizeHandler(e:Event):void
		{
			
		}
		
		override public function deepLinkHandler(deeplink:String):void
		{
			
		}
		
		
		
		
		
	}
}
