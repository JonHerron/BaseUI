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
			
			var topLeft:ElementUISprite = createElementUISprite(100, 100);
			topLeft.element = baseUI.add(topLeft);
			topLeft.setElementPropertiesFromXML(xml.topLeft);
			addChild(topLeft);
			
			var topCentre:ElementUISprite = createElementUISprite(100, 100);
			topCentre.element = baseUI.add(topCentre);
			topCentre.setElementPropertiesFromXML(xml.topCentre);
			addChild(topCentre);
			
			var topRight:ElementUISprite = createElementUISprite(100, 100);
			topRight.element = baseUI.add(topRight);
			topRight.setElementPropertiesFromXML(xml.topRight);
			addChild(topRight);
			
			
			
			var middleLeft:ElementUISprite = createElementUISprite(100, 100);
			middleLeft.element = baseUI.add(middleLeft);
			middleLeft.setElementPropertiesFromXML(xml.middleLeft);
			addChild(middleLeft);
			
			var middleCentre:ElementUISprite = createElementUISprite(100, 100);
			middleCentre.element = baseUI.add(middleCentre);
			middleCentre.setElementPropertiesFromXML(xml.middleCentre);
			addChild(middleCentre);
			
			var middleRight:ElementUISprite = createElementUISprite(100, 100);
			middleRight.element = baseUI.add(middleRight);
			middleRight.setElementPropertiesFromXML(xml.middleRight);
			addChild(middleRight);
			
			
			
			var bottomLeft:ElementUISprite = createElementUISprite(100, 100);
			bottomLeft.element = baseUI.add(bottomLeft);
			bottomLeft.setElementPropertiesFromXML(xml.bottomLeft);
			addChild(bottomLeft);
			
			var bottomCentre:ElementUISprite = createElementUISprite(100, 100);
			bottomCentre.element = baseUI.add(bottomCentre);
			bottomCentre.setElementPropertiesFromXML(xml.bottomCentre);
			addChild(bottomCentre);
			
			var bottomRight:ElementUISprite = createElementUISprite(100, 100);
			bottomRight.element = baseUI.add(bottomRight);
			bottomRight.setElementPropertiesFromXML(xml.bottomRight);
			addChild(bottomRight);
			
		}
		
		private function createElementUISprite(width:Number, height:Number):ElementUISprite
		{
			var elementUISprite:ElementUISprite = new ElementUISprite();
			elementUISprite.graphics.beginFill(randomColour(), .7);
			elementUISprite.graphics.drawRect(0, 0, width, height);
			elementUISprite.graphics.endFill();
			
			return elementUISprite;
		}
		
		private function randomColour():int 
		{
			var red:int = 102 + Math.round(Math.random() * 25);
			var green:int  = 102 + Math.round(Math.random() * 25);
			var blue:int  = 102 + Math.round(Math.random() * 25);
			var hex:int = red<<16|green<<8|blue;  
			return hex; 
		}
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
