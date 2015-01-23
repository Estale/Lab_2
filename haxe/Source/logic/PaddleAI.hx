package logic;
/* Логика доски соперника */
import visual.Paddle;
import visual.Ball;

class PaddleAI {

	/* Скорость доски */
	var paddleSpeed:Int = 3;
	var enemyPaddle:Paddle;
	var ball:Ball;

	public function new (enemyPaddle:Paddle, ball:Ball) {
		this.enemyPaddle = enemyPaddle;
		this.ball = ball;
	}

	/* Действие на каждый кадр */
	public function move () {
		/* Постепенно передвинем доску к шару */
		if(enemyPaddle.y < ball.y - 10){
			enemyPaddle.y += paddleSpeed;
		} else if(enemyPaddle.y > ball.y + 10){
			enemyPaddle.y -= paddleSpeed;
		}

		/* Не дадим доске выйти за края экрана */
		if(enemyPaddle.y - enemyPaddle.height/2 < 0){
			enemyPaddle.y = enemyPaddle.height/2;
		} else if(enemyPaddle.y + enemyPaddle.height/2 > Main.SCREEN_H){
			enemyPaddle.y = Main.SCREEN_H - enemyPaddle.height/2;
		}
	}
}