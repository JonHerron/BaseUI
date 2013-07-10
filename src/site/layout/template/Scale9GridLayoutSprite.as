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
			// reference widdth & height from the middleCentre nodes properties
			// values of 1 mean that property is not fixed and is automatically scaled
			var middleCentreNode:XMLList = xml.middleCentre;
			
			
			topLeft = createElementUISprite(middleCentreNode.@left, middleCentreNode.@top, 0x666666);
			topLeft.element = baseUI.add(topLeft);
			topLeft.setElementPropertiesFromXML(xml.topLeft);
			addChild(topLeft);
			
			topCentre = createElementUISprite(1, middleCentreNode.@top, 0x666666);
			topCentre.element = baseUI.add(topCentre);
			topCentre.setElementPropertiesFromXML(xml.topCentre);
			addChild(topCentre);
			
			topRight = createElementUISprite(middleCentreNode.@right, middleCentreNode.@top, 0x666666);
			topRight.element = baseUI.add(topRight);
			topRight.setElementPropertiesFromXML(xml.topRight);
			addChild(topRight);
			
			
			
			middleLeft = createElementUISprite(middleCentreNode.@left, 1, 0x666666);
			middleLeft.element = baseUI.add(middleLeft);
			middleLeft.setElementPropertiesFromXML(xml.middleLeft);
			addChild(middleLeft);
			
			middleCentre = createElementUISprite(1, 1, 0x999999);
			middleCentre.element = baseUI.add(middleCentre);
			middleCentre.setElementPropertiesFromXML(xml.middleCentre);
			addChild(middleCentre);
			
			middleRight = createElementUISprite(middleCentreNode.@right, 1, 0x666666);
			middleRight.element = baseUI.add(middleRight);
			middleRight.setElementPropertiesFromXML(xml.middleRight);
			addChild(middleRight);
			
			
			
			bottomLeft = createElementUISprite(middleCentreNode.@left, middleCentreNode.@bottom, 0x666666);
			bottomLeft.element = baseUI.add(bottomLeft);
			bottomLeft.setElementPropertiesFromXML(xml.bottomLeft);
			addChild(bottomLeft);
			
			bottomCentre = createElementUISprite(1, middleCentreNode.@bottom, 0x666666);
			bottomCentre.element = baseUI.add(bottomCentre);
			bottomCentre.setElementPropertiesFromXML(xml.bottomCentre);
			addChild(bottomCentre);
			
			bottomRight = createElementUISprite(middleCentreNode.@right, middleCentreNode.@bottom, 0x666666);
			bottomRight.element = baseUI.add(bottomRight);
			bottomRight.setElementPropertiesFromXML(xml.bottomRight);
			addChild(bottomRight);
			
		}
		
		
		private function createElementUISprite(width:Number, height:Number, colour:uint):ElementUISprite
		{
			var elementUISprite:ElementUISprite = new ElementUISprite();
			elementUISprite.graphics.beginFill( randomColour(), 0.6 );
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