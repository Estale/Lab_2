package visual;
/* Доска */
import openfl.display.Sprite;

class Paddle extends Sprite {

	public function new () {
		/* Отрисовка */
		super ();
		graphics.beginFill(0x0077FF);
		graphics.drawRect(-5, -35, 10, 70);
		graphics.endFill();
	}
}