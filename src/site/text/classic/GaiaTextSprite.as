package site.text.classic
{
	import com.greensock.layout.AlignMode;
	import flash.text.TextFormat;
	import site.layout.ElementUISprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class GaiaTextSprite extends ElementUISprite
	{
		public var textField:GaiaTextField;
		
		public var verticalAlignment:String = AlignMode.CENTER;
		public var horizontalAlignment:String = AlignMode.LEFT;
		
		public function setText(value:String):void { textField.setText(value); }
		
		public function setAlignment(horizontalAlignment:String = "left", verticalAlignment:String = "center"):void
		{ 
			this.horizontalAlignment = horizontalAlignment;
			this.verticalAlignment = verticalAlignment;
		}
		
		public function GaiaTextSprite(text:String, format:TextFormat = null, textWidth:Number = NaN, wordWrap:Boolean = false, 
										horizontalAlignment:String="left", verticalAlignment:String="center")
		{
			textField = new GaiaTextField(text, format, textWidth, wordWrap);
			
			if ( !isNaN(textWidth) ) textField.width = textWidth;
			
			if (wordWrap) textField.wordWrap = true;
			
			
			addChild(textField);
			
			height = textField.textHeight;
		}
		
		
	}
	
}