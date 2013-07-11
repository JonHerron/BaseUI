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
	
	public class DefaultPage extends AbstractPage
	{	
		private var baseUI:BaseUI;
		private var sprite:ElementUISprite;
		
		public function DefaultPage()
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
			baseUI = new BaseUI(page.stage);

			sprite = new ElementUISprite();
			sprite.graphics.beginFill(0xCAF495, 1);
			sprite.graphics.drawRect(0, 0, 10, 10);
			sprite.graphics.endFill();
			sprite.element = baseUI.add(sprite);
			sprite.element.top = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@top;
			sprite.element.bottom = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@bottom;
			sprite.element.left = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@left;
			sprite.element.right = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@right;
			
			addChild(sprite);
			
			sprite.element.refresh(new Event(Event.RESIZE));
			
			
		}
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 1, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
