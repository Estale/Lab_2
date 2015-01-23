package logic;
/* Логика доски игрока */
import visual.Paddle;

class PaddleControl {

	var playerPaddle:Paddle;

	public function new (playerPaddle:Paddle) {
		this.playerPaddle = playerPaddle;
	}

	/* Действие на каждый кадр */
	public function move () {
		/* Передвинем к курсору мыши */
		playerPaddle.y = playerPaddle.stage.mouseY;

		/* Не дадим доске выйти за края экрана */
		if(playerPaddle.y - playerPaddle.height/2 < 0){
			playerPaddle.y = playerPaddle.height/2;
		} else if(playerPaddle.y + playerPaddle.height/2 > Main.SCREEN_H){
			playerPaddle.y = Main.SCREEN_H - playerPaddle.height/2;
		}
	}
}