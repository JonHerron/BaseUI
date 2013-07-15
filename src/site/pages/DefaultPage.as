package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.soma.ui.BaseUI;
	import com.soma.ui.ElementUI;
	import com.soma.ui.layouts.CanvasUI;
	import flash.display.*;
	import flash.events.*;
	import site.core.TimelinePage;
	import site.layout.ElementUISprite;
	import site.text.classic.GaiaTextFormat;
	import site.text.classic.GaiaTextSprite;
	import site.text.classic.sprite.splitTextSprite.SplitTextSprite;
	import site.utils.ColourUtil;
	
	public class DefaultPage extends TimelinePage
	{	
		private var pageUI:CanvasUI;
		private var pageUIReference:ElementUISprite;
		
		public function DefaultPage()
		{
			super();
			alpha = 0;
		}
		
		private function createPageUI():void 
		{
			pageUIReference = Site.getElementUISprite(Site.middleCentre, 0x3D3D3D, 0.7);
			pageUIReference.element = baseUI.add(pageUIReference);
			pageUIReference.setElementPropertiesFromXML(Site.middleCentre);
			
			addChild(pageUIReference);
			
			pageUIReference.element.refresh(new Event(Event.RESIZE));
			
			
			pageUI = new CanvasUI(pageUIReference, 1, 1);
			//pageUI.ratio = ElementUI.RATIO_OUT;
			pageUI.alignX = ElementUI.ALIGN_LEFT;
			pageUI.alignY = ElementUI.ALIGN_TOP;
			//pageUI.childrenGap = new GapUI(5, 5);
			//pageUI.childrenPadding = new PaddingUI(5, 5, 0, 0);
			//pageUI.childrenAlign = VBoxUI.ALIGN_TOP_LEFT;
			addChild(pageUI);
			
			
			pageUI.refresh();
		}
		
		private function createText():void 
		{
			var textFormat:GaiaTextFormat = new GaiaTextFormat();
			textFormat.color = 0xFFFFFF;
			textFormat.size = 70;
			
			var textSprite:SplitTextSprite = new SplitTextSprite("Hello World", "letter", textFormat);
			textSprite.element = pageUI.add(textSprite);
			textSprite.element.top = 10;
			textSprite.element.left = 10;
			
			addChild(textSprite);
			
			textSprite.element.refresh(new Event(Event.RESIZE));
		}
		
		
		
		
		
		
		
		override public function createPage():void 
		{
			createPageUI();
			createText();
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
