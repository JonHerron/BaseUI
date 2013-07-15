package site.text.classic
{
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author ...
	 */
	public class GaiaTextField extends TextField
	{
		private var string:String;
		private var textField:TextField;
		private var textFormat:TextFormat;
		
		public function setText(value:String):void { string = text = value; }
		
		public function GaiaTextField(string:String, format:TextFormat = null, textWidth:Number = NaN, wordWrap:Boolean = false)
		{
			this.string = string;
			this.textFormat = format;
			
			antiAliasType = AntiAliasType.ADVANCED;
			autoSize = TextFieldAutoSize.LEFT;
			gridFitType = GridFitType.PIXEL;
			mouseEnabled = false;
			//sharpness = 20;
			//thickness = 200;
			selectable = false;
			//wordWrap = wordWrap;
			
			if (wordWrap)
			{
				multiline = true;
			}
			
			if (this.textFormat !== null)
			{
				defaultTextFormat = this.textFormat;
			}
			else
			{
				this.textFormat = new GaiaTextFormat();
				//this.textFormat.font = Gaia.api.getFontName( Gaia.api.getAvailableFonts()[0] );
				//this.textFormat.size = 14;
				//this.textFormat.color = 0xFF0000;
				
				defaultTextFormat = this.textFormat;
			}
			//if( !isNaN(textWidth) ) width = textWidth;
			//( isNaN(textWidth) ) ? trace(this, "didn't set the width on this") : width = textWidth;
			
			embedFonts = true; // <================ VERY IMPORTANT THAT YOU EMBED AFTER YOU HAVE ASSIGNED A FONT NAME
			text = this.string;
			
		}
		
		
		
		
		public function getTextField():TextField
		{
			textField = this;
			return textField;
		}
		
		override public function getTextFormat(beginIndex:int=-1, endIndex:int=-1):TextFormat
		{
			return textFormat;
		}
		
		
		
	}
	
}