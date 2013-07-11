package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.gaiaframework.templates.AbstractPage;
	import com.greensock.TweenMax;
	import com.soma.ui.ElementUI;
	import com.soma.ui.BaseUI;
	import flash.display.*;
	import flash.events.*;
	import site.layout.ElementUISprite;
	import site.layout.template.Scale9GridLayoutSprite;
	
	
	public class IndexPage extends AbstractPage
	{	
		public var baseUI:BaseUI;
		public var scale9GridLayout:Scale9GridLayoutSprite;
		
		public function IndexPage()
		{
			super();
			alpha = 0;
		}
		override public function transitionIn():void 
		{
			super.transitionIn();
			createCanvas();
			createBackground();
			createElements();
			baseUI.refresh();
			TweenMax.to(this, 1, {alpha:1, onComplete:transitionInComplete});
		}
		
		private function createCanvas():void 
		{
			baseUI = new BaseUI(stage);
		}
		
		private function createBackground():void 
		{
			var background:ElementUISprite = new ElementUISprite();
			var bitmap:Bitmap = IBitmap(assets.background).content;
			bitmap.visible = true;
			bitmap.smoothing = true;
			background.addChild(bitmap);
			background.element = baseUI.add(background);
			background.element.ratio = ElementUI.RATIO_OUT;
			background.element.refresh();
			addChild(background);
		}
		
		private function createElements():void 
		{
			scale9GridLayout = new Scale9GridLayoutSprite(baseUI, IXml(assets.baseUI).xml);
			addChild(scale9GridLayout);
		}
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 1, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
