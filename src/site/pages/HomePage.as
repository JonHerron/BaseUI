package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import flash.display.*;
	import flash.events.*;
	import site.core.TimelinePage;
	import site.layout.ElementUISprite;
	
	public class HomePage extends TimelinePage
	{	
		private var sprite:ElementUISprite;
		
		public function HomePage()
		{
			super();
			alpha = 0;
		}
		
		private function createLayoutUI():void 
		{
			sprite = Site.getElementUISprite(Site.middleCentre, 0xAAAAAA, 0.7);
			sprite.element = baseUI.add(sprite);
			sprite.setElementPropertiesFromXML(Site.middleCentre);
			
			addChild(sprite);
			
			sprite.element.refresh(new Event(Event.RESIZE));
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
