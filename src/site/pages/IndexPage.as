package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.soma.ui.BaseUI;
	import com.soma.ui.ElementUI;
	import flash.display.*;
	import flash.events.*;
	import site.core.TimelinePage;
	import site.layout.ElementUISprite;
	import site.layout.template.Scale9GridLayoutSprite;
	
	
	public class IndexPage extends TimelinePage
	{	
		public var baseUI:BaseUI;
		public var scale9GridLayout:Scale9GridLayoutSprite;
		
		public function IndexPage()
		{
			super();
			alpha = 0;
		}
		
		override public function createPage():void 
		{
			createCanvas();
			createBackground();
			createElements();
		}
		
		override public function pageTransitionIn():void 
		{
			baseUI.refresh();
		}
		
		
		
		override public function pageTransitionOut():void 
		{
			//throw new IllegalOperationError("method must be overridden in a subclass");
		}
		
		override public function destroyPage():void
		{
			baseUI.dispose();
			baseUI = null;
		}
		
		
		
		
		
		
		
		
		
		private function createCanvas():void 
		{
			baseUI = new BaseUI(page.stage);
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
		
	}
}
