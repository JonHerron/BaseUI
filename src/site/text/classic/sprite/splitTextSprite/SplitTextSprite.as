package site.text.classic.sprite.splitTextSprite
{
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;
	import site.layout.ElementUISprite;
	import site.text.classic.GaiaTextField;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SplitTextSprite extends ElementUISprite
	{
		public static const LETTER:String = "letter";
		public static const WORD:String = "word";
		
		public var letterList:Array;
		public var wordList:Array;
		
		public var textField:GaiaTextField;
		public var tweenList:Array = new Array();
		
		public function SplitTextSprite(text:String, splitType:String = "letter", format:TextFormat = null, textWidth:Number = NaN, wordWrap:Boolean = false)
		{
			textField = new GaiaTextField(text, format, textWidth, wordWrap);
			
			if ( !isNaN(textWidth) ) textField.width = textWidth;
			
			if (wordWrap) textField.wordWrap = true;
			
			//addChild(textField);
			
			//var word:String = "TextLineMetrics are useful";
			letterList = text.split("");
			wordList = text.split(" ");
			 
			var textFieldBuilder:GaiaTextField;
			var metrics:TextLineMetrics;
			var i:int = 0;
			
			switch(splitType)
			{
				case LETTER :
				for (i; i < letterList.length; i++)
				{
					var letterTextField:GaiaTextField = new GaiaTextField(letterList[i], format, NaN, wordWrap);
					//textFieldLetter.textColor = int(Math.random() * 0xFFFFFF);
					
					if (textFieldBuilder)
					{
						metrics = textFieldBuilder.getLineMetrics(0);
						letterTextField.x = metrics.width + textFieldBuilder.x;
					}
					textFieldBuilder = letterTextField;
					tweenList.push(letterTextField);
					addChild(letterTextField);
				}
				break;
				
				case WORD :
				for (i; i < wordList.length; i++)
				{
					wordList[i] = String(wordList[i]).concat(" ");
					var wordTextField:GaiaTextField = new GaiaTextField(wordList[i], format, NaN, wordWrap);
					//textFieldLetter.textColor = int(Math.random() * 0xFFFFFF);
					
					if (textFieldBuilder)
					{
						metrics = textFieldBuilder.getLineMetrics(0);
						wordTextField.x = metrics.width + textFieldBuilder.x;
					}
					textFieldBuilder = wordTextField;
					tweenList.push(wordTextField);
					addChild(wordTextField);
				}
				break;
			}
		}
		
		public function setText(value:String):void { textField.setText(value); }
		
		
		
	}
	
}