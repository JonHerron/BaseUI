package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.greensock.easing.Expo;
	import com.greensock.TweenMax;
	import com.soma.ui.ElementUI;
	import com.soma.ui.layouts.VBoxUI;
	import com.soma.ui.vo.GapUI;
	import com.soma.ui.vo.PaddingUI;
	import flash.display.*;
	import flash.events.*;
	import site.core.TimelinePage;
	import site.layout.ElementUISprite;
	
	public class NavPage extends TimelinePage
	{	
		private var sprite:ElementUISprite;
		private var vbox:VBoxUI;
		
		public function NavPage()
		{
			super();
			alpha = 0;
		}
		
		
		
		private function createLayoutUI():void 
		{
			//sprite = new ElementUISprite();
			//sprite.graphics.beginFill(0xCAF495, 0.7);
			//sprite.graphics.drawRect(0, 0, 1, 1);
			//sprite.graphics.endFill();
			//sprite.element = baseUI.add(sprite);
			//sprite.setElementPropertiesFromXML( IXml(Gaia.api.getSiteTree().assets.baseUI).xml.topLeft );
			//sprite.element.top = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleLeft.@top;
			//sprite.element.bottom = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleLeft.@bottom;
			//sprite.element.left = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleLeft.@left;
			//sprite.element.right = IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleLeft.@right;
			//
			//addChild(sprite);
			//
			//sprite.element.refresh(new Event(Event.RESIZE));
			
			
			vbox = new VBoxUI(Gaia.api.getSiteTree().content.scale9GridLayout.middleLeft, 1, 1);
			vbox.ratio = ElementUI.RATIO_OUT;
			vbox.alignX = ElementUI.ALIGN_LEFT;
			vbox.alignY = ElementUI.ALIGN_TOP;
			vbox.childrenGap = new GapUI(5, 5);
			vbox.childrenPadding = new PaddingUI(5, 5, 0, 0);
			vbox.childrenAlign = VBoxUI.ALIGN_TOP_LEFT;
			addChild(vbox);
			
			for (var i:int = 0; i < 8; ++i) 
			{
				var button:Sprite = new Sprite();
				button.addEventListener(MouseEvent.CLICK, onMouseClickHandler, false, 0, true);
				button.addEventListener(MouseEvent.ROLL_OVER, onMouseRollOverHandler, false, 0, true);
				button.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOutHandler, false, 0, true);
				button.graphics.lineStyle(1, 0xFFFFFF);
				button.graphics.beginFill(Math.random() * 0xFFFFFF, .7);
				button.graphics.drawRect(0, 0, 190, 30);
				button.buttonMode = true;
				vbox.addChild(button);
			}
			
			vbox.refresh();
		}
		
		private function onMouseClickHandler(e:MouseEvent):void 
		{
			if (Gaia.api.getCurrentBranch() == Pages.HOME)
			{
				Gaia.api.goto(Pages.DEFAULT);
			}
			else if (Gaia.api.getCurrentBranch() == Pages.DEFAULT)
			{
				Gaia.api.goto(Pages.HOME);
			}
			else
			{
				trace("Button clicked, but nowhere to go");
			}
			TweenMax.to(e.target, 0.3, { height: 40, onUpdate:vbox.refresh, ease:Expo.easeInOut } );
		}
		
		private function onMouseRollOverHandler(e:MouseEvent):void 
		{
		}
		
		private function onMouseRollOutHandler(e:MouseEvent):void 
		{
			//TweenMax.to(e.target, 0, { height: 30, onUpdate:vbox.refresh } );
		}
		
		
		
		
		
		
		
		
		override public function createPage():void 
		{
			createLayoutUI();
		}
		
		override public function pageTransitionIn():void 
		{
			
		}
		
		
		
		override public function pageTransitionOut():void 
		{
			
		}
		
		override public function destroyPage():void
		{
			
		}
		
		
		
		override public function pageResizeHandler(e:Event):void
		{
			
		}
		
		override public function deepLinkHandler(deeplink:String):void
		{
			
		}
		
		
		
		
		
	}
}
