package site.core 
{
	import com.gaiaframework.api.Gaia;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jon Herron
	 */
	public class TimelinePage extends DeeplinkPage 
	{
		
		
		public var timeline:TimelineMax;
		public var tweenList:Array;
		
		public function TimelinePage() 
		{
			super();
		}
		
		
		
		
		
		public function createPage():void 
		{
			throw new IllegalOperationError("method must be overridden in a subclass");
		}
		
		public function pageTransitionIn():void 
		{
			throw new IllegalOperationError("method must be overridden in a subclass");
		}
		
		
		// TRANSITION IN --------------------------------------------------------------------------------------------//
		override public function transitionIn():void 
		{
			page.stage.addEventListener(Event.RESIZE, pageResizeHandler, false, 0, true);
			timeline = new TimelineMax();
			timeline.pause();
			deepLinkHandler( Gaia.api.getDeeplink() );
			createPage();
			super.transitionIn();
			timeline.add ( TweenMax.to(this, 0.3, {alpha:1, onComplete:transitionInCompleteProxy} ) );
			pageTransitionIn();
			timeline.play()
		}
		
		public function transitionInCompleteProxy():void 
		{
			transitionInComplete();
			//Site.setSiteFrameRate(24);
		}
		// END TRANSITION IN ----------------------------------------------------------------------------------------//
		
		
		
		
		
		
		
		
		public function pageTransitionOut():void 
		{
			throw new IllegalOperationError("method must be overridden in a subclass");
		}
		
		public function destroyPage():void
		{
			throw new IllegalOperationError("method must be overridden in a subclass");
		}
		
		
		// TRANSITION OUT -------------------------------------------------------------------------------------------//
		override public function transitionOut():void 
		{
			//Site.setSiteFrameRate(60);
			timeline = new TimelineMax();
			timeline.pause();
			pageTransitionOut();
			super.transitionOut();
			timeline.add ( TweenMax.to(this, 0.3, { alpha:0, onComplete:transitionOutCompleteProxy } ) );
			timeline.play()
		}
		
		public function transitionOutCompleteProxy():void 
		{
			destroyPage();
			page.stage.removeEventListener(Event.RESIZE, pageResizeHandler, false);
			transitionOutComplete();
		}
		// END TRANSITION OUT ---------------------------------------------------------------------------------------//
		
		
		
		
		
		
		
		
		
		
		
		// PAGE RESIZE ----------------------------------------------------------------------------------------------//
		public function pageResizeHandler(e:Event):void
		{
			//throw new IllegalOperationError("method must be overridden in a subclass");
		}
		// END PAGE RESIZE ------------------------------------------------------------------------------------------//
		
		
		
		
		
		
		
		
		
		
		
	}

}