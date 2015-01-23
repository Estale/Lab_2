package visual;
/* Шар */
import openfl.display.Sprite;

class Ball extends Sprite {

	public function new () {
		/* Отрисовка */
		super ();
		graphics.beginFill(0xAA5230);
		graphics.drawCircle(-8, -8, 8);
		graphics.endFill();
	}
}