package ;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Assets;

import visual.*;
import logic.*;

class Main extends Sprite {

	/* Размеры экрана */
	public static var SCREEN_W = 640;
	public static var SCREEN_H = 480;

	/* Тексты очков */
	var playerScoreTxt:ScoreText;
	var enemyScoreTxt:ScoreText;

	/* Визуальные объекты */
	var ball = new Ball();
	var playerPaddle = new Paddle();
	var enemyPaddle = new Paddle();

	/* Количество очков */
	public static var playerScore = 0;
	public static var enemyScore = 0;

	/* Объекты логики */
	var ballLogic:logic.BallLogic;
	var playerLogic:logic.PaddleControl;
	var enemyLogic:logic.PaddleAI;

	public function new () {
		super (); /* Обязательно */
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	/* Событие помещения на экран */
	private function added (event) {
		removeEventListener(Event.ADDED_TO_STAGE, added);

		/* Установим высокй фреймрейт */
		stage.frameRate = 60;

		/* Фон, полученный средствами OpenFL */
		var bitmap = new Bitmap (Assets.getBitmapData ("assets/openfl.png"));
		addChild (bitmap);

		bitmap.x = (stage.stageWidth - bitmap.width) / 2;
		bitmap.y = (stage.stageHeight - bitmap.height) / 2;

		/* Разместим доски игроков */
		playerPaddle.x = 15;
		enemyPaddle.x = SCREEN_W - 15;

		playerPaddle.y = enemyPaddle.y = SCREEN_H / 2;

		addChild(playerPaddle);
		addChild(enemyPaddle);

		/* Поместим шар в кадр */
		ball.x = SCREEN_W / 2;
		ball.y = SCREEN_H / 2;

		addChild(ball);

		/* Создадим объекы логики */
		ballLogic = new BallLogic(enemyPaddle, ball, playerPaddle);
		playerLogic = new PaddleControl(playerPaddle);
		enemyLogic = new PaddleAI(enemyPaddle, ball);

		/* Создадим тексты */
		playerScoreTxt = new ScoreText(ScoreText.ALIGN_LEFT);
		enemyScoreTxt = new ScoreText(ScoreText.ALIGN_RIGHT);

		playerScoreTxt.x = 0;
		playerScoreTxt.y = 0;

		enemyScoreTxt.x = SCREEN_W - enemyScoreTxt.width;
		enemyScoreTxt.y = 0;

		enemyScoreTxt.text = "";
		playerScoreTxt.text = "";

		addChild(enemyScoreTxt);
		addChild(playerScoreTxt);

		/* Запустим обновление */
		addEventListener(Event.ENTER_FRAME, frame);
	}

	/* Действие на каждый кадр */
	private function frame (event) {
		playerLogic.move();
		enemyLogic.move();
		ballLogic.move();
		updateTextFields();
	}

	/* Обновление текста очков */
	function updateTextFields ()
	{
		playerScoreTxt.text = " Player Score: " + playerScore + " ";
		enemyScoreTxt.text = " Enemy Score: " + enemyScore + " ";
	}
}