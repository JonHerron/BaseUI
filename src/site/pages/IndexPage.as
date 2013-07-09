package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.gaiaframework.templates.AbstractPage;
	import com.greensock.TweenMax;
	import com.soma.ui.BaseUI;
	import flash.display.*;
	import flash.events.*;
	import site.layout.ElementUISprite;
	
	
	public class IndexPage extends AbstractPage
	{	
		private var baseUI:BaseUI;
		
		public function IndexPage()
		{
			super();
			alpha = 0;
			new Scaffold(this);
		}
		override public function transitionIn():void 
		{
			super.transitionIn();
			createCanvas();
			createElements();
			TweenMax.to(this, 0.3, {alpha:1, onComplete:transitionInComplete});
		}
		
		private function createCanvas():void 
		{
			baseUI = new BaseUI(page.stage);
		}
		
		private function createElements():void 
		{
			var xml:XML = IXml(assets.baseUI).xml;
			
			var topLeft:ElementUISprite = new ElementUISprite();
			topLeft.graphics.beginFill(0xFF0000, .5);
			topLeft.graphics.drawRect(0, 0, 100, 100);
			
			topLeft.element = baseUI.add(topLeft);
			topLeft.element.left = xml.topLeft.@left;
			topLeft.element.top = xml.topLeft.@top;
			
			topLeft.element.refresh();	
			addChild(topLeft);
			
			var topCentre:ElementUISprite = new ElementUISprite();
			topCentre.graphics.beginFill(0x00FF00, .5);
			topCentre.graphics.drawRect(0, 0, 100, 100);
			
			topCentre.element = baseUI.add(topCentre);
			topCentre.element.top = xml.topCentre.@top;
			topCentre.element.left = xml.topCentre.@left;
			topCentre.element.right = xml.topCentre.@right;
			
			topCentre.element.refresh();	
			addChild(topCentre);
			
			var topRight:ElementUISprite = new ElementUISprite();
			topRight.graphics.beginFill(0x0000FF, .5);
			topRight.graphics.drawRect(0, 0, 100, 100);
			
			topRight.element = baseUI.add(topRight);
			topRight.element.top = xml.topRight.@top;
			topRight.element.right = xml.topRight.@right;
			
			topRight.element.refresh();	
			addChild(topRight);
			
		}
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
