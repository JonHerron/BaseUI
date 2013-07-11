package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.soma.ui.BaseUI;
	import flash.display.*;
	import flash.events.*;
	import site.core.TimelinePage;
	import site.layout.ElementUISprite;
	
	public class HomePage extends TimelinePage
	{	
		private var baseUI:BaseUI;
		private var sprite:ElementUISprite;
		
		public function HomePage()
		{
			super();
			alpha = 0;
		}
		
		override public function createPage():void 
		{
			createLayoutUI();
		}
		
		override public function pageTransitionIn():void 
		{
			//baseUI.refresh();
		}
		
		
		
		override public function pageTransitionOut():void 
		{
			//throw new IllegalOperationError("method must be overridden in a subclass");
		}
		
		override public function destroyPage():void
		{
			//baseUI.dispose();
			//baseUI = null;
		}
		
		
		
		
		
		
		
		private function createLayoutUI():void 
		{
			baseUI = new BaseUI(page.stage);

			sprite = new ElementUISprite();
			sprite.graphics.beginFill(0x495CAF, 1);
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
		
		
	}
}
