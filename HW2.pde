

void setup(){
    size(900,800);
}

int level=0;
void draw() {
  background(255);
  stroke(255,255,30);
  strokeWeight(3);

  float step = 30;

  translate(width/2,height/2);
    
    //String s = "M[LMM[LMM[LMM[LMX]RMX]RMM[LMX]RMX]RMM[LMM[LMX]RMX]RMM[LMX]RMX]RMM[LMM[LMM[LMX]RMX]RMM[LMX]RMX]RMM[LMM[LMX]RMX]RMM[LMX]RMX";
    String s = "RMRMRMRMRMRM";
    
   s = "[LMMRRMMM]RM[LMMRRMMM]RM[LMMRRMMM]RM[LMMRRMMM]RM[LMMRRMMM]RM[LMMRRMMM]RM";
    
    s = "[LMM[MMMRRMMMMMM]RRMMM]RM[LMM[MMMRRMMMMMM]RRMMM]RM[LMM[MMMRRMMMMMM]RRMMM]RM[LMM[MMMRRMMMMMM]RRMMM]RM[LMM[MMMRRMMMMMM]RRMMM]RM[LMM[MMMRRMMMMMM]RRMMM]RM";

    for(int i=0; i<s.length(); i++) {
        stroke((i*10)%255,100,100);
        char c = s.charAt(i);
        if(c == 'M') {
            line(0,0, 0,step);
            translate(0,step);
        } else if(c == 'R') {
            rotate(2*(PI/6));
        } else if(c == 'L') {
            rotate(-PI/3);

        } else if(c == 'S'){
            rotate(2*(PI/3));
        }
        else if(c == '['){
            pushMatrix();
        } else if(c == ']'){
            popMatrix();
        }
    }

    s= "MRMRRM";

    for(int i=0; i<s.length(); i++) {
        stroke((i*10)%255,100,100);
        char c = s.charAt(i);
        if(c == 'M') {
            line(0,0, 0,step);
            translate(0,step);
        } else if(c == 'R') {
            rotate(2*(PI/6));
        } else if(c == 'L') {
            rotate(-PI/3);

        } else if(c == 'S'){
            rotate(2*(PI/3));
        }
        else if(c == '['){
            pushMatrix();
        } else if(c == ']'){
            popMatrix();
        }
    }
}

