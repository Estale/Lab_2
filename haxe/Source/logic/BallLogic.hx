package logic;
/* Логика шара */
import visual.Paddle;
import visual.Ball;

class BallLogic {

	/* Скорость шара */
	var ballSpeedX:Float = -3;
	var ballSpeedY:Float = -2;
	var ball:Ball;
	var enemyPaddle:Paddle;
	var playerPaddle:Paddle;

	public function new (enemyPaddle:Paddle, ball:Ball, playerPaddle:Paddle) {
		this.playerPaddle = playerPaddle;
		this.enemyPaddle = enemyPaddle;
		this.ball = ball;
	}

	/* Действие на каждый кадр */
	public function move () {

		/* Проверим шар на столкновения с досками */
		if( playerPaddle.hitTestObject(ball) == true ){
		if(ballSpeedX < 0){
			ballSpeedX *= -1;
			ballSpeedY = recalculateSpeed(playerPaddle.y, ball.y);
		}

		} else if(enemyPaddle.hitTestObject(ball) == true ){
			if(ballSpeedX > 0){
				ballSpeedX *= -1;
				ballSpeedY = recalculateSpeed(enemyPaddle.y, ball.y);
			}
		}

		/* Подвинем шар на текущем кадре */
		ball.x += ballSpeedX;
		ball.y += ballSpeedY;

		/* Отразим шар от правого и левого краев экрана */
		/* И увеличим число очков победителю */
		if(ball.x <= ball.width/2){
			ball.x = ball.width/2;
			ballSpeedX *= -1;
			Main.enemyScore ++;
		} else if(ball.x >= Main.SCREEN_W-ball.width/2){
			ball.x = Main.SCREEN_W-ball.width/2;
			ballSpeedX *= -1;
			Main.playerScore++;
		}

		/* Отразим шар от верхнего и нижнего краев экрана */
		if(ball.y <= ball.height/2){
			ball.y = ball.height/2;
			ballSpeedY *= -1;

		} else if(ball.y >= Main.SCREEN_H-ball.height/2){
			ball.y = Main.SCREEN_H-ball.height/2;
			ballSpeedY *= -1;
		}
	}

	/* Рассчет нового угла направления после соударения с доской */
	function recalculateSpeed(paddleY:Float, ballY:Float)
	{
		var ySpeed = 5 * ( (ballY-paddleY) / 25 );
		return ySpeed;
	}
}