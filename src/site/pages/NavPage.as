package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.greensock.easing.Expo;
	import com.greensock.TweenAlign;
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
	import site.utils.fullScreen.FullScreenModeButton;
	
	public class NavPage extends TimelinePage
	{	
		private var fullScreenModeButton:FullScreenModeButton;
		
		private var vbox:VBoxUI;
		private var vboxReference:ElementUISprite;
		private var vboxItems:Array;
		
		private var hbox:HBoxUI;
		private var hboxReference:ElementUISprite;
		private var hboxItems:Array;
		
		private var sprite:ElementUISprite;
		
		public function NavPage()
		{
			super();
			alpha = 0;
		}
		
		
		
		private function createLayoutUI():void 
		{
			createFullScreenModeButton();
			createVBox();
			createHBox();
		}
		
		private function createFullScreenModeButton():void 
		{
			fullScreenModeButton = new FullScreenModeButton(page.stage);
			fullScreenModeButton.element = baseUI.add(fullScreenModeButton);
			fullScreenModeButton.element.top = 75;
			fullScreenModeButton.element.right = 20;
			addChild(fullScreenModeButton);
			fullScreenModeButton.element.refresh(new Event(Event.RESIZE));
		}
		
		private function createVBox():void 
		{
			vboxItems = new Array();
			
			vboxReference = Site.getElementUISprite(Site.middleLeft, 0xAAAAAA, 0);
			vboxReference.element = baseUI.add(vboxReference);
			vboxReference.setElementPropertiesFromXML( Site.middleLeft );
			
			addChild(vboxReference);
			
			vboxReference.element.refresh(new Event(Event.RESIZE));
			
			
			vbox = new VBoxUI(vboxReference, 1, 1);
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
				vboxItems.push(button);
				vbox.addChild(button);
			}
			
			vbox.refresh();
		}
		
		private function createHBox():void 
		{
			hboxItems = new Array();
			
			hboxReference = Site.getElementUISprite(Site.topCentre, 0xAAAAAA, 0);
			hboxReference.mouseEnabled = false;
			hboxReference.element = baseUI.add(hboxReference);
			hboxReference.setElementPropertiesFromXML( Site.topCentre );
			
			addChild(hboxReference);
			
			hboxReference.element.refresh(new Event(Event.RESIZE));
			
			
			hbox = new HBoxUI(hboxReference, 1, 1);
			hbox.mouseEnabled = false;
			hbox.ratio = ElementUI.RATIO_OUT;
			hbox.alignX = ElementUI.ALIGN_CENTER;
			hbox.alignY = ElementUI.ALIGN_CENTER;
			hbox.childrenGap = new GapUI(5, 5);
			hbox.childrenPadding = new PaddingUI(0, 0, 5, 5);
			hbox.childrenAlign = HBoxUI.ALIGN_CENTER_LEFT;
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
				hboxItems.push(button);
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
			
			if (hbox.contains(e.target as DisplayObject))
			{
				if (e.target.width < 100)
				{
					TweenMax.to(e.target, 0.3, { width: 100, onUpdate:hbox.refresh, ease:Expo.easeInOut } );
				}
				else
				{
					TweenMax.to(e.target, 0.3, { width: 90, onUpdate:hbox.refresh, ease:Expo.easeInOut } );
				}
			}
			else if (vbox.contains(e.target as DisplayObject))
			{
				if (e.target.height < 40)
				{
					TweenMax.to(e.target, 0.3, { height: 40, onUpdate:vbox.refresh, ease:Expo.easeInOut } );
				}
				else
				{
					TweenMax.to(e.target, 0.3, { height: 30, onUpdate:vbox.refresh, ease:Expo.easeInOut } );
				}
			}
			
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
			tweenList = new Array();
			
			for ( var i:int = 0; i < vboxItems.length; i++ )
			{
				tweenList.push( TweenMax.from(vboxItems[i], 0.1, { x:"-200", ease:Expo.easeInOut } ) );
			}
			for ( var j:int = 0; j < hboxItems.length; j++ )
			{
				tweenList.push( TweenMax.from(hboxItems[j], 0.1, { y:"-100", ease:Expo.easeInOut } ) );
			}
			
			timeline.appendMultiple(tweenList, 0, TweenAlign.SEQUENCE, 0 );
			timeline.totalDuration(3);
		}
		
		
		
		override public function pageTransitionOut():void 
		{
			tweenList = new Array();
			
			for ( var i:int = vboxItems.length - 1 ; i >= 0 ; i-- )
			{
				tweenList.push( TweenMax.to(vboxItems[i], 0.1, { alpha:0, ease:Expo.easeInOut } ) );
			}
			for ( var j:int = hboxItems.length - 1 ; j >= 0 ; j-- )
			{
				tweenList.push( TweenMax.to(hboxItems[j], 0.1, { alpha:0, ease:Expo.easeInOut } ) );
			}
			
			timeline.appendMultiple(tweenList, 0, TweenAlign.SEQUENCE, 0 );
			timeline.totalDuration(0.3);
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
