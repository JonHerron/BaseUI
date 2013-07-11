package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.gaiaframework.templates.AbstractPage;
	import com.greensock.TweenMax;
	import flash.display.*;
	import flash.events.*;
	
	public class DefaultPage extends AbstractPage
	{	
		public function DefaultPage()
		{
			super();
			alpha = 0;
		}
		override public function transitionIn():void 
		{
			super.transitionIn();
			TweenMax.to(this, 1, {alpha:1, onComplete:transitionInComplete});
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 1, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
