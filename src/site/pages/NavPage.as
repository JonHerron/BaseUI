package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.greensock.easing.Expo;
	import com.greensock.TweenMax;
	import com.soma.ui.ElementUI;
	import com.soma.ui.layouts.HBoxUI;
	import com.soma.ui.layouts.VBoxUI;
	import com.soma.ui.vo.GapUI;
	import com.soma.ui.vo.PaddingUI;
	import flash.display.*;
	import flash.events.*;
	import site.core.TimelinePage;
	import site.layout.ElementUISprite;
	import site.utils.ColourUtil;
	
	public class NavPage extends TimelinePage
	{	
		private var vbox:VBoxUI;
		private var vboxContent:ElementUISprite;
		private var hbox:HBoxUI;
		private var hboxContent:ElementUISprite;
		
		public function NavPage()
		{
			super();
			alpha = 0;
		}
		
		
		
		private function createLayoutUI():void 
		{
			createVBox();
			createHBox();
		}
		
		private function createVBox():void 
		{
			vboxContent = new ElementUISprite();
			vboxContent.graphics.beginFill(0xCAF495, 0);
			vboxContent.graphics.drawRect(0, 0, IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@left, 1);
			vboxContent.graphics.endFill();
			vboxContent.element = baseUI.add(vboxContent);
			vboxContent.setElementPropertiesFromXML( IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleLeft );
			
			addChild(vboxContent);
			
			vboxContent.element.refresh(new Event(Event.RESIZE));
			
			
			vbox = new VBoxUI(vboxContent, 1, 1);
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
				button.graphics.beginFill(ColourUtil.randomColourRange( 0x005BB2, 100 ), .7);
				button.graphics.drawRect(0, 0, 190, 30);
				button.buttonMode = true;
				vbox.addChild(button);
			}
			
			vbox.refresh();
		}
		
		private function createHBox():void 
		{
			hboxContent = new ElementUISprite();
			hboxContent.graphics.beginFill(0xCAF495, 0);
			hboxContent.graphics.drawRect(0, 0, 600, IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleCentre.@top);
			hboxContent.graphics.endFill();
			hboxContent.element = baseUI.add(hboxContent);
			hboxContent.setElementPropertiesFromXML( IXml(Gaia.api.getSiteTree().assets.baseUI).xml.middleTop );
			
			addChild(hboxContent);
			
			hboxContent.element.refresh(new Event(Event.RESIZE));
			
			
			hbox = new HBoxUI(hboxContent, 1, 1);
			hbox.ratio = ElementUI.RATIO_OUT;
			hbox.alignX = ElementUI.ALIGN_LEFT;
			hbox.alignY = ElementUI.ALIGN_CENTER;
			hbox.childrenGap = new GapUI(5, 5);
			hbox.childrenPadding = new PaddingUI(0, 0, 5, 5);
			hbox.childrenAlign = HBoxUI.ALIGN_TOP_LEFT;
			addChild(hbox);
			
			for (var i:int = 0; i < 8; ++i) 
			{
				var button:Sprite = new Sprite();
				button.addEventListener(MouseEvent.CLICK, onMouseClickHandler, false, 0, true);
				button.addEventListener(MouseEvent.ROLL_OVER, onMouseRollOverHandler, false, 0, true);
				button.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOutHandler, false, 0, true);
				button.graphics.lineStyle(1, 0xFFFFFF);
				button.graphics.beginFill(ColourUtil.randomColourRange( 0x005BB2, 100 ), .7);
				button.graphics.drawRect(0, 0, 90, 90);
				button.buttonMode = true;
				hbox.addChild(button);
			}
			
			hbox.refresh();
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
