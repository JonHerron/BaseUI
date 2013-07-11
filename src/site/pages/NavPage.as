package site.pages
{
	import com.gaiaframework.api.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.events.*;
	import com.gaiaframework.templates.AbstractPage;
	import com.greensock.easing.Expo;
	import com.greensock.TweenMax;
	import com.soma.ui.ElementUI;
	import com.soma.ui.layouts.VBoxUI;
	import com.soma.ui.vo.GapUI;
	import com.soma.ui.vo.PaddingUI;
	import flash.display.*;
	import flash.events.*;
	
	public class NavPage extends AbstractPage
	{	
		private var vbox:VBoxUI;
		
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
				var sprite:Sprite = new Sprite();
				sprite.addEventListener(MouseEvent.CLICK, onMouseClickHandler, false, 0, true);
				sprite.addEventListener(MouseEvent.ROLL_OVER, onMouseRollOverHandler, false, 0, true);
				sprite.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOutHandler, false, 0, true);
				sprite.graphics.lineStyle(1, 0xFFFFFF);
				sprite.graphics.beginFill(Math.random() * 0xFFFFFF, .7);
				sprite.graphics.drawRect(0, 0, 190, 30);
				sprite.buttonMode = true;
				vbox.addChild(sprite);
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
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 1, {alpha:0, onComplete:transitionOutComplete});
		}
	}
}
