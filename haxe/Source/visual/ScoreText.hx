package visual;
/* Текст количества очков игрока и соперника */
import openfl.display.Sprite;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.AntiAliasType;
import openfl.text.TextField;

class ScoreText extends Sprite {

	/* Выравнивание текста */
	public static var ALIGN_LEFT = "left";
	public static var ALIGN_RIGHT = "right";

	/* Текстовое поле */
	var textField:TextField;

	public function new (aligment:String) {

		super ();

		/* Шрифт */
		var format = new TextFormat();
		format.font = "Arial";
		format.size = 15;
		if(aligment == ALIGN_LEFT)
			format.align = TextFormatAlign.LEFT;
		else
			format.align = TextFormatAlign.RIGHT;

		/* Создание поля */
		textField = new TextField();
		textField.textColor = 0x001122;
		textField.selectable = textField.border = textField.embedFonts = textField.wordWrap = false;
		textField.width = 300;
		textField.height = 25;
		textField.text = "";
		textField.defaultTextFormat = format;
		addChild(textField);
	}

	/* Свойство текста только для записи */
	public var text(null, set):String;
	/* Метод, вызываемый для записи свойства */
	public function set_text (value:String):String {
		textField.text = value;
		return value;
	}
}