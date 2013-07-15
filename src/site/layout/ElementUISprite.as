package site.layout
{
	import com.soma.ui.ElementUI;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jon Herron
	 */
	public class ElementUISprite extends Sprite
	{
		public var element:ElementUI;
		
		public function ElementUISprite() 
		{
			
		}
		
		public function setElementPropertiesFromXML(node:XMLList):void
		{
			for each ( var item:XML in node )
			{
				for each ( var attr:XML in item.attributes() )
				{
					//trace(this, attr.name() + " = " + attr.toString());
					element[ String( attr.name() ) ] = attr.toString();
				}
			}
			element.rounded = true;
			element.refresh();
		}
		
		
	}

}