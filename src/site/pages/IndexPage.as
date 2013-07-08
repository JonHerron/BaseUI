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
	
	
	public class IndexPage extends AbstractPage
	{	
		private var baseUI:BaseUI;
		
		public function IndexPage()
		{
			super();
			alpha = 0;
			new Scaffold(this);
		}
		override public function transitionIn():void 
		{
			super.transitionIn();
			createCanvas();
			TweenMax.to(this, 0.3, {alpha:1, onComplete:transitionInComplete});
		}
		
		private function createCanvas():void 
		{
			baseUI = new BaseUI(page.stage);
			
			var sprite:ElementUISprite = new ElementUISprite();
			sprite.graphics.beginFill(0xFF0000, .5);
			sprite.graphics.drawRect(0, 0, 100, 100);
			
			sprite.element = baseUI.add(sprite);
			sprite.element.verticalCenter = 0;
			sprite.element.left = 0;
			sprite.element.right = 0;
			
			sprite.element.refresh();	
			addChild(sprite)
		}
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
