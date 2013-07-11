package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.gaiaframework.templates.AbstractPage;
	import com.greensock.TweenMax;
	import com.soma.ui.ElementUI;
	import com.soma.ui.layouts.LayoutUI;
	import flash.display.*;
	import flash.events.*;
	
	public class NavPage extends AbstractPage
	{	
		private var layout:LayoutUI;
		
		public function NavPage()
		{
			super();
			alpha = 0;
		}
		override public function transitionIn():void 
		{
			super.transitionIn();
			createLayoutUI();
			TweenMax.to(this, 1, {alpha:1, onComplete:transitionInComplete});
		}
		
		private function createLayoutUI():void 
		{
			layout = new LayoutUI(Gaia.api.getSiteTree().content.scale9GridLayout.middleLeft, 1, 1);
			layout.ratio = ElementUI.RATIO_OUT;
			layout.backgroundColor = 0xFF0000;
			layout.backgroundAlpha = 0.5;
			addChild(layout);
			layout.refresh();
		}
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 1, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
