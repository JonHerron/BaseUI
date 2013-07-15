package site.text.classic
{
	import com.gaiaframework.api.Gaia;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Jon Herron
	 */
	public class GaiaTextFormat extends TextFormat 
	{
		public function GaiaTextFormat(font:String = null, size:Object = null, 
										color:Object = null, bold:Object = null, 
										italic:Object = null, underline:Object = null, 
										url:String = null, target:String = null, 
										align:String = null, leftMargin:Object = null, 
										rightMargin:Object=null, indent:Object=null, leading:Object=null):void
		{
			
			//this.font = (font == null) ? Gaia.api.getFontName( Gaia.api.getAvailableFonts()[0] ) : font;
			if (font == null)
			{
				if (Gaia.api.getAvailableFonts() == null || undefined)
				{
					this.font = "Arial";
				}
				else
				{
					this.font = Gaia.api.getFontName( Gaia.api.getAvailableFonts()[0] );
				}
			}
			
			this.size = (size == null) ? 14 : size;
			this.color = (color == null) ? 0xFF0000 : color;
			this.bold = (bold == null) ? true : bold;
			this.italic = italic;
			this.underline = underline;
			this.url = url;
			this.target = target;
			this.align = align;
			this.leftMargin = leftMargin;
			this.rightMargin = rightMargin;
			this.indent = indent;
			this.leading = leading;
			
			super(font, size, color, bold, italic, underline, url, target, align, leftMargin, rightMargin, indent, leading);
			
		}
		
		
		
	}
	
}