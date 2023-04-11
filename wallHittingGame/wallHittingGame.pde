float x = 0.0; // 球の初期位置
float y = 0.0; // 球の初期位置
int e = 15; //円のサイズ
int playerW = 100; //playerの幅
int playerH = 20; //playerの高さ
float px = 0; // playerXの位置
float py = 550; // playerYの位置
float v_x = 4; // x速度
float v_y = 3; // y速度
int scoreW = 10; //スコアの幅
int scoreH = 10; //スコアの高さ
float scoreX = 200; //スコアのX位置
float scoreY = 50; //スコアのY位置
int score = 0; //スコア

void setup(){
  size(400,600); 
  colorMode(HSB,100); 
  background(99);
}

void draw(){
  px = mouseX;
  // playerに触れたかどうかの判定
  int touch = 0;
  if (abs(x-px)<((e/2)+playerW/2)&&abs(y-py)<((e/2)+playerH/2)){
  touch = 1;
  }else{
    touch = 0;
  }

  // scoreを獲得した場合はscoreを加算
  if (abs(x-scoreX)<((e/2)+scoreW/2)&&abs(y-scoreY)<((e/2)+scoreH/2)){
    score = score + 50;
  }
  
  // gameOverの判定
  int gameOver = 0;
  if(y + e/2 >= 600){
    gameOver = 1;
  }
  
  //右側での反射
  if( x + e/2 >= 400) { //矩形の右側が画面の右端に接触した
    x = 400 - e/2; //壁の位置に移動
    v_x = v_x * (-1); //速度を反対方向にする
  }
  //左側での反射
  if ( x - e/2 <= 0) { //矩形の左側が画面の左端に接触した
    x = 0 + e/2; //壁の位置に移動
    v_x = v_x * (-1); //速度を反対方向にする
  }
  //上側での反射
  if ( y - e/2 <= 0) {
    y = 0 + e/2; //壁の位置に移動
    v_y = v_y * (-1); //速度を反対方向にする
  }

  //playerに触れた時の反射
  if(touch == 1){
    v_x = (v_x + random(0, 1)) * (-1);
    v_y = (v_y + random(0, 1)) * (-1);
  }
  
  //描画
  if(gameOver == 0){
  background(99);
  textSize(20);
  fill(0, 0, 0);
  text("speed: "+sqrt(sq(v_x)+sq(v_y)),10,50);
  textSize(20);
  fill(0, 0, 0);
  text("score: "+ score ,10,70);
  noStroke();
  rectMode(CENTER);
  fill(3, 1, 80);
  rect(px,py,playerW,playerH);
  fill(300, 80, 99);
  rect(scoreX,scoreY,scoreW,scoreH);
  fill(60, 90, 90);
  ellipse(x,y,e,e);
  x = x + v_x; //位置をv_xピクセル移動
  y = y + v_y; //位置をv_yピクセル移動
  }else{
    background(300,80,99);
    fill(3,1,80);
    textSize(50);
    text("game over",100,300);
  }
}
