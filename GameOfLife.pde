import de.bezier.guido.*;
 public final static int Roww = 20;
 public final static int Coll = 20;
 private Life[][] buttons; 
 private boolean[][] buffer; 
 private boolean running = true; 
 public void settings() {
   size(800, 800);
 }
 
 public void setup () {
  
   frameRate(5);
   Interactive.make( this );
   buttons = new Life[Roww][Coll];
   for(int r = 0; r < Roww; r++)
     for(int c = 0; c < Coll; c++)
       buttons[r][c] = new Life(r,c);
   buffer = new boolean[Roww][Coll];
 }
 
 public void draw () {
   background(1);
   if (running == false) 
     return;
   copyFromButtonsToBuffer();
 
   for(int r = 0; r < Roww; r++)
   {
     for(int c = 0; c < Coll; c++)
     {
       if(countNeighbors(r, c) == 3 )
       {
         buffer[r][c] = true;
       }
       else if(countNeighbors(r, c) == 2 && buttons[r][c].getLife()==true)
       {
         buffer[r][c] = true;
       }
       else
       {
         buffer[r][c] = false;
       }
     buttons[r][c].draw();
     }
   }
   copyFromBufferToButtons();
 
 
 }
 
 public void keyPressed() {
   if(key == 'p')
     running = !running;
 }
 
 public void copyFromBufferToButtons() {
 for(int r = 0; r < Roww; r++)
   for(int c = 0; c < Coll; c++)
     if(buffer[r][c] == true)
       buttons[r][c].alive = true;
     else
     buttons[r][c].alive = false;
 }
 
 public void copyFromButtonsToBuffer() {
 for(int r = 0; r < Roww; r++)
   for(int c = 0; c < Coll; c++)
     if(buttons[r][c].alive == true)
       buffer[r][c] = true;
     else
     buffer[r][c] = false;
 }
 
 public boolean isValid(int r, int c) {
   if(r < Roww && r >= 0 && c < Coll && c >= 0)
 return true;
 else
 return false;
 }
 
 public int countNeighbors(int row, int col) {
 int neighbors = 0;
 if(isValid(row, col-1)==true && buttons[row][col-1].getLife()==true)
   neighbors ++;
 if(isValid(row, col+1)==true && buttons[row][col+1].getLife()==true)
   neighbors ++;
 if(isValid(row-1, col-1)==true && buttons[row-1][col-1].getLife()==true)
   neighbors ++;
 if(isValid(row+1, col+1)==true && buttons[row+1][col+1].getLife()==true)
   neighbors ++;
 if(isValid(row+1, col)==true && buttons[row+1][col].getLife()==true)
   neighbors ++;
 if(isValid(row-1, col)==true && buttons[row-1][col].getLife()==true)
   neighbors ++;
 if(isValid(row+1, col-1)==true && buttons[row+1][col-1].getLife()==true)
   neighbors ++;
 if(isValid(row-1, col+1)==true && buttons[row-1][col+1].getLife()==true)
   neighbors ++;
 return neighbors;
 }
 
 public class Life {
   private int myRow, myCol;
   private float x, y, width, height;
   private boolean alive;
 
   public Life (int row, int col) {
     width = 1000/Coll;
     height = 1000/Roww;
     myRow = row;
     myCol = col;
     x = myCol*width;
     y = myRow*height;
     alive = Math.random() < .5; 
     Interactive.add( this );
   }
 
   public void mousePressed () {
     alive = !alive; 
   }
   public void draw () {   
     if (alive != true)
       fill(0);
     else
     fill( (int)(Math.random()*500), (int)(Math.random()*500),(int)(Math.random()*500) );
     rect(x, y, width, height);
   }
   public boolean getLife() {
   if(alive == true)
     return true;
   else if(alive != true)
     return false;
   else
     return false;
   }
 }
