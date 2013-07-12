package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.soma.ui.BaseUI;
	import flash.display.*;
	import flash.events.*;
	import site.core.TimelinePage;
	import site.layout.ElementUISprite;
	
	public class DefaultPage extends TimelinePage
	{	
		private var sprite:ElementUISprite;
		
		public function DefaultPage()
		{
			super();
			alpha = 0;
		}
		
		private function createLayoutUI():void 
		{
			sprite = new ElementUISprite();
			sprite.graphics.beginFill(0x495CAF, 0.7);
			sprite.graphics.drawRect(0, 0, 1, 1);
			sprite.graphics.endFill();
			sprite.element = baseUI.add(sprite);
			sprite.element.top = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@top;
			sprite.element.bottom = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@bottom;
			sprite.element.left = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@left;
			sprite.element.right = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@right;
			
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
