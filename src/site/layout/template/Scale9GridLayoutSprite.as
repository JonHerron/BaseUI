package site.layout.template
{
	import com.soma.ui.BaseUI;
	import flash.events.Event;
	import site.layout.ElementUISprite;
	
	/**
	 * ...
	 * @author Jon Herron
	 */
	public class Scale9GridLayoutSprite extends ElementUISprite 
	{
		public var baseUI:BaseUI, xml:XML;
		
		public var topLeft:ElementUISprite;
		public var topCentre:ElementUISprite;
		public var topRight:ElementUISprite;
		public var middleLeft:ElementUISprite;
		public var middleCentre:ElementUISprite;
		public var middleRight:ElementUISprite;
		public var bottomLeft:ElementUISprite;
		public var bottomCentre:ElementUISprite;
		public var bottomRight:ElementUISprite;
		
		public function Scale9GridLayoutSprite(baseUI:BaseUI, xml:XML) 
		{
			this.baseUI = baseUI;
			this.xml = xml;
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStageHandler, false, 0, true);
		}
		
		private function onAddedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStageHandler);
			init();
		}
		
		private function init():void 
		{
			// reference width & height from the middleCentre nodes properties
			// values of 1 mean that property is not fixed and is automatically scaled
			var middleCentreNode:XMLList = xml.middleCentre;
			
			
			topLeft			= createElementUISprite(middleCentreNode.@left, middleCentreNode.@top, 0x005BB2);
			topCentre 		= createElementUISprite(1, middleCentreNode.@top, 0x005BB2);
			topRight 		= createElementUISprite(middleCentreNode.@right, middleCentreNode.@top, 0x005BB2);
			middleLeft 		= createElementUISprite(middleCentreNode.@left, 1, 0x005BB2);
			middleCentre 	= createElementUISprite(1, 1, 0x005BB2);
			middleRight 	= createElementUISprite(middleCentreNode.@right, 1, 0x005BB2);
			bottomLeft 		= createElementUISprite(middleCentreNode.@left, middleCentreNode.@bottom, 0x005BB2);
			bottomCentre 	= createElementUISprite(1, middleCentreNode.@bottom, 0x005BB2);
			bottomRight 	= createElementUISprite(middleCentreNode.@right, middleCentreNode.@bottom, 0x005BB2);
			
			
			topLeft.element = baseUI.add(topLeft);
			topCentre.element = baseUI.add(topCentre);
			topRight.element = baseUI.add(topRight);
			middleLeft.element = baseUI.add(middleLeft);
			middleCentre.element = baseUI.add(middleCentre);
			middleRight.element = baseUI.add(middleRight);
			bottomLeft.element = baseUI.add(bottomLeft);
			bottomCentre.element = baseUI.add(bottomCentre);
			bottomRight.element = baseUI.add(bottomRight);
			
			
			topLeft.setElementPropertiesFromXML(xml.topLeft);
			topCentre.setElementPropertiesFromXML(xml.topCentre);
			topRight.setElementPropertiesFromXML(xml.topRight);
			middleLeft.setElementPropertiesFromXML(xml.middleLeft);
			middleCentre.setElementPropertiesFromXML(xml.middleCentre);
			middleRight.setElementPropertiesFromXML(xml.middleRight);
			bottomLeft.setElementPropertiesFromXML(xml.bottomLeft);
			bottomCentre.setElementPropertiesFromXML(xml.bottomCentre);
			bottomRight.setElementPropertiesFromXML(xml.bottomRight);
			
			
			addChild(bottomLeft);
			addChild(bottomCentre);
			addChild(bottomRight);
			addChild(middleLeft);
			addChild(middleCentre);
			addChild(middleRight);
			addChild(topLeft);
			addChild(topCentre);
			addChild(topRight);
			
		}
		
		
		private function createElementUISprite(width:Number, height:Number, colour:uint):ElementUISprite
		{
			var elementUISprite:ElementUISprite = new ElementUISprite();
			elementUISprite.graphics.beginFill( colour, 0.6 );
			elementUISprite.graphics.drawRect(0, 0, width, height);
			elementUISprite.graphics.endFill();
			
			return elementUISprite;
		}
		
		private function randomColour():int 
		{
			var red:int = 128 + Math.round(Math.random() * 50);
			var green:int  = 128 + Math.round(Math.random() * 50);
			var blue:int  = 128 + Math.round(Math.random() * 50);
			var hex:int = red<<16|green<<8|blue;  
			return hex; 
		}
		
		
		
		
	}

}