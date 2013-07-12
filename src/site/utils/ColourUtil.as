package site.utils 
{
	import flash.display.BitmapData;

	public class ColourUtil 
	{
		
		public static function averageColour( source:BitmapData ):uint
		{
			var red:Number = 0;
			var green:Number = 0;
			var blue:Number = 0;
			
			var count:Number = 0;
			var pixel:Number;
			
			for (var x:int = 0; x < source.width; x++)
			{
				for (var y:int = 0; y < source.height; y++)
				{
					pixel = source.getPixel(x, y);
					
					red += pixel >> 16 & 0xFF;
					green += pixel >> 8 & 0xFF;
					blue += pixel & 0xFF;
					
					count++
				}
			}
			
			red /= count;
			green /= count;
			blue /= count;
			
			return red << 16 | green << 8 | blue;
		}
		
		/**
		 * Create new colour blended into another.
		 * @param colour to blend
		 * @param into other colour
		 * @param factor amount of original colour to keep, i.e. 0 would be no "colour", all "into"
		 * @param blendAlpha uses the 0xFF000000 part of the colour as well
				 * @returns blended colour uint
		 */
		public static function blendColour( colour:uint, into:uint=0xFFFFFFFF, factor:Number=0.5, blendAlpha:Boolean=false ) : uint
		{
			if( factor < 0 || factor > 1 ) factor = 0.5;
			var a1:uint = ( colour >> 24 ) & 0xFF;
			var r1:uint = ( colour >> 16 ) & 0xFF;
			var g1:uint = ( colour >>  8 ) & 0xFF;
			var b1:uint = ( colour >>  0 ) & 0xFF;
			var a2:uint = (  into >> 24 ) & 0xFF;
			var r2:uint = (  into >> 16 ) & 0xFF;
			var g2:uint = (  into >>  8 ) & 0xFF;
			var b2:uint = (  into >>  0 ) & 0xFF;
			var a3:uint = ( a1*factor + a2*(1-factor) ) & 0xFF;
			var r3:uint = ( r1*factor + r2*(1-factor) ) & 0xFF;
			var g3:uint = ( g1*factor + g2*(1-factor) ) & 0xFF;
			var b3:uint = ( b1*factor + b2*(1-factor) ) & 0xFF;
			return ( blendAlpha?a3<<24:0x0 ) | (r3<<16) | (g3<<8) | b3;
		}
		
		public static function randomColourRange(colour:uint = 0xFF0000, range:Number = 20):int 
		{
			var rgb:Object = hexToRGB(colour);
			
			var red:int = rgb.r + Math.round(Math.random() * range);
			var green:int  = rgb.g + Math.round(Math.random() * range);
			var blue:int  = rgb.b + Math.round(Math.random() * range);
			
			var hex:int = red << 16 | green << 8 | blue;
			
			return hex; 
		}
		
		
		
		
		
		
		
		
		
		
		public static function uintToHex( value:uint ):String
		{
			var hexRadix:Number = 16;
			var calculation:String = value.toString(hexRadix);
			
			var hexValue:String = "0x" + calculation.toUpperCase();
			return hexValue;
		}
		
		public static function hexToRGB( value:uint ):Object 
		{	
			var rgb:Object = new Object();
			rgb.r = (value >> 16) & 0xFF
			rgb.g = (value >> 8) & 0xFF
			rgb.b = value & 0xFF			
			return rgb;
		}
		
		
		
		
	}

}