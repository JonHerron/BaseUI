package site.core 
{
	import com.gaiaframework.events.GaiaSWFAddressEvent;
	import com.gaiaframework.templates.AbstractPage;
	import com.soma.ui.BaseUI;
	
	/**
	 * ...
	 * @author Jon Herron
	 */
	public class DeeplinkPage extends AbstractPage 
	{
		public var baseUI:BaseUI;
		
		public function DeeplinkPage() 
		{
			super();
		}
		
		override public function onDeeplink(event:GaiaSWFAddressEvent):void 
		{
			//remove the slash from the deeplink??
			deepLinkHandler(event.deeplink);
		}
		
		public function deepLinkHandler(deeplink:String):void
		{
			//throw new IllegalOperationError("method must be overridden in a subclass");
		}
		
		
		
		
		
		
		
	}

}