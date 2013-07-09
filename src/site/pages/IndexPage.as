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
	import site.layout.template.Scale9GridLayoutSprite;
	
	
	public class IndexPage extends AbstractPage
	{	
		private var baseUI:BaseUI;
		
		public function IndexPage()
		{
			super();
			alpha = 0;
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
			var scale9Grid:Scale9GridLayoutSprite = new Scale9GridLayoutSprite(baseUI, IXml(assets.baseUI).xml);
			addChild(scale9Grid);
		}
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
