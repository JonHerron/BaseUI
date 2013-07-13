package  
{
	import com.gaiaframework.api.Gaia;
	import com.gaiaframework.api.IPageAsset;
	import com.gaiaframework.api.IXml;
	import com.soma.ui.BaseUI;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import site.layout.ElementUISprite;
	/**
	 * ...
	 * @author Jon Herron
	 */
	public class Site 
	{
		
		public static var baseUIAsset:XML = getBaseUIAsset();
		private static function getBaseUIAsset():XML
		{
			var xml:XML;
			
			try 
			{
				xml = IXml( Gaia.api.getSiteTree().assets.baseUI ).xml as XML
			} 
			catch (error:Error) 
			{
				trace("No Gaia Instance, baseUI = null");
				xml = null;
			};
			
			return xml;
		}
		
		
		
		
		
		public static var currentBranch:IPageAsset = getCurrentBranch();
		private static function getCurrentBranch():IPageAsset
		{
			var page:IPageAsset;
			
			try 
			{
				page = Gaia.api.getPage( Gaia.api.getCurrentBranch() ) as IPageAsset;
			} 
			catch (error:Error) 
			{
				trace("No Gaia Instance, currentBranch = null");
				page = null;
			};
			
			return page;
		}
		
		
		
		/**
		*	Determines whether Gaia.api.getCurrentBranch() contains any instances of newBranch.
		*
		*	@param newBranch The character or sub-string we are looking for.
		*
		*	@returns Boolean
		*
		* 	@langversion ActionScript 3.0
		*	@playerversion Flash 9.0
		*	@tiptext
		*/
		public static function branchCheck(newBranch:String):Boolean 
		{
			var value:Boolean;
			try 
			{
				(Gaia.api.getCurrentBranch().indexOf(newBranch) != -1) ? value = true : value = false;
			} 
			catch (error:Error) 
			{
				trace("No Gaia Instance, Gaia.api.getCurrentBranch() = null");
				value = false;
			}
			
			return value;
		}
		
		
		
		
		
		
		
		
		public static var topLeft:XMLList = getBaseUIAssetNode("topLeft");
		public static var topCentre:XMLList = getBaseUIAssetNode("topCentre");
		public static var topRight:XMLList = getBaseUIAssetNode("topRight");
		public static var middleLeft:XMLList = getBaseUIAssetNode("middleLeft");
		public static var middleCentre:XMLList = getBaseUIAssetNode("middleCentre");
		public static var middleRight:XMLList = getBaseUIAssetNode("middleRight");
		public static var bottomLeft:XMLList = getBaseUIAssetNode("bottomLeft");
		public static var bottomCentre:XMLList = getBaseUIAssetNode("bottomCentre");
		public static var bottomRight:XMLList = getBaseUIAssetNode("bottomRight");
		
		
		public static var topCentreRect:Rectangle = new Rectangle(0, 0, 1, middleCentre.@top);
		
		
		
		
		private static function getBaseUIAssetNode(node:String):XMLList
		{
			var xmlList:XMLList;
			
			try 
			{
				switch(node)
				{
					case "topLeft" :
						xmlList = getBaseUIAsset().topLeft as XMLList
					break;
					
					case "topCentre" :
						xmlList = getBaseUIAsset().topCentre as XMLList
					break;
					
					case "topRight" :
						xmlList = getBaseUIAsset().topRight as XMLList
					break;
					
					case "middleLeft" :
						xmlList = getBaseUIAsset().middleLeft as XMLList
					break;
					
					case "middleCentre" :
						xmlList = getBaseUIAsset().middleCentre as XMLList
					break;
					
					case "middleRight" :
						xmlList = getBaseUIAsset().middleRight as XMLList
					break;
					
					case "bottomLeft" :
						xmlList = getBaseUIAsset().bottomLeft as XMLList
					break;
					
					case "bottomCentre" :
						xmlList = getBaseUIAsset().bottomCentre as XMLList
					break;
					
					case "bottomRight" :
						xmlList = getBaseUIAsset().bottomRight as XMLList
					break;
					
					default :
						//trace(this, "No node (String) passed to Site.getBaseUIAssetNode(node:String)");
					break;
				}
			} 
			catch (error:Error) 
			{
				trace("No Gaia Instance, baseUI = null");
				xmlList = null;
			};
			
			return xmlList;
		}
		
		
		public static function getElementUISprite(node:XMLList, colour:uint = 0xFF0000, alpha = 1):ElementUISprite
		{
			var elementUISprite:ElementUISprite
			try 
			{
				elementUISprite = new ElementUISprite();
				elementUISprite.graphics.clear();
				elementUISprite.graphics.beginFill(colour, alpha);
				switch(node)
				{
					case topLeft : 
						elementUISprite.graphics.drawRect(0, 0, middleCentre.@left, middleCentre.@top);
					break;
					
					case topCentre : 
						elementUISprite.graphics.drawRect(0, 0, 1, middleCentre.@top);
					break;
					
					case topRight : 
						elementUISprite.graphics.drawRect(0, 0, middleCentre.@right, middleCentre.@top);
					break;
					
					case middleLeft : 
						elementUISprite.graphics.drawRect(0, 0, middleCentre.@left, 1);
					break;
					
					case middleCentre : 
						elementUISprite.graphics.drawRect(0, 0, 1, 1);
					break;
					
					case middleRight : 
						elementUISprite.graphics.drawRect(0, 0, middleCentre.@right, 1);
					break;
					
					case bottomLeft : 
						elementUISprite.graphics.drawRect(0, 0, middleCentre.@left, middleCentre.@bottom);
					break;
					
					case bottomCentre : 
						elementUISprite.graphics.drawRect(0, 0, 1, middleCentre.@bottom);
					break;
					
					case bottomRight : 
						elementUISprite.graphics.drawRect(0, 0, middleCentre.@right, middleCentre.@bottom);
					break;
					
					default :
						elementUISprite.graphics.drawRect(0, 0, 50, 50);
					break;
					
				}
				elementUISprite.graphics.endFill();
			} 
			catch (error:Error) 
			{
				trace("No Gaia Instance, elementUISprite = null");
				elementUISprite = null;
			};
			
			return elementUISprite;
		}
		
		
		
		
		
		
	}

}