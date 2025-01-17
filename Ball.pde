class Ball extends Player
{
  
  PVector pos;
  float ballSize;
  float speedX;
  float speedY;
  
  Ball()
  {
    pos = new PVector(width/2, height/2);
    ballSize = width/60;
    //producing random number of either 1 or -1
    int r = int(random(-1, 1));
    while (r == 0)
    {
      r = int(random(-1, 1));
    }
      speedX = 15 * r;//send either left or right randomnly
      speedY = 0;
      
    }//end Ball()
  
  void display()
  {
    //draw ball
    stroke(255);
    fill(255); 
    ellipse(pos.x, pos.y, ballSize, ballSize);
    
  }
  
  void update()
  {
    
    pos.x += speedX;
    pos.y += speedY;
    
    //right paddle hit detection
    if (pos.x + (ballSize/2) >= p2.pos.x &&  (pos.y + ballSize/2) >= p2.pos.y  && + pos.y <= (p2.pos.y + p2.paddleH)   )
    {
      speedX *= -1;//reverse dirction of ball when it hits paddle
      //angle the ball depending on loction it hits on paddle
      float hit = pos.y - (p2.pos.y + paddleH/2); 
      speedY += (hit / (paddleH/2)) * 3;
      
      //play sound effect
      p2Sound.play();
      p2Sound.rewind();
    }
    
    //left paddle hit detection
    if (pos.x  - (ballSize/2) <= (p1.pos.x + p1.paddleW) &&  (pos.y + ballSize/2) >= p1.pos.y  && + pos.y <= (p1.pos.y + p1.paddleH)   )
    {
      speedX *= -1;//reverse dirction of ball when it hits paddle
      //angle the ball depending on loction it hits on paddle
      float hit = pos.y - (p1.pos.y + paddleH/2);//subtract centre of paddle position away from ball position
      speedY += (hit / (paddleH/2)) * 3;
      
      //play sound effect
      p1Sound.play();
      p1Sound.rewind();
    }
    
    //constrain ball to screen 
    if (pos.y >= height - (ballSize/2) || pos.y <= 0 + (ballSize/2))
    {
      speedY *= -1;
      //play sound effect
      wallHit.play();
      wallHit.rewind();
    }
    
    //lives counter and reinitialise
    if (pos.x >= width)
    {
      p2.lives--;
      initialise(); //(See GameMethods tab)
    }
    if (pos.x < 0)
    {
      p1.lives--;
      initialise(); //(See GameMethods tab)
    }
    
    
  }
}//end Ball

