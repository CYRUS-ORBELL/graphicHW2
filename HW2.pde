String[] Lsystem = new String [4];
void setup(){
    size(400,400);
}

int level=0;
void draw() {
  background(20,130,20);
  stroke(160);
  strokeWeight(3);

  float step = height / pow(3,level);

  translate(width/2,0);
    String s= "RUR";

    for(int i=0; i<s.length(); i++) {
        char c = s.charAt(i);
        if(c == 'U') {
            line(0,0, 0,step);
            translate(0,step);
        } else if(c == 'R') {
            rotate(PI/3);
        } else if(c == 'L') {
            rotate(-PI/3);
        }
    }
}