FloatList[] rr = new FloatList[10];
FloatList[] rl = new FloatList[10];


void setup(){
    size(900,500);
   
    for (int i = 0; i < 10; i++) {
        rr[i] = new FloatList();
        rl[i] = new FloatList();
    
        for (int j = 0; j < 10; j++) {
            rr[i].append(random(10));
            rl[i].append(random(10));
        }
    }
}


void draw() {
  background(200,200,255);

  noStroke();
  fill(150, 75, 0);
  rect(0,height-120,width,120);

  stroke(10);
  strokeWeight(3);
  for(int i = 0; i<9; i++){
    pushMatrix();
    translate(width/2+90*i-380,height/2);
    generateTower(10,i);
    popMatrix();
  }
  stroke(255);
  noFill();
  for(int i = 0; i<8; i++){
    pushMatrix();
    translate((50+100*i)+(rr[i].get(i) < 5 ? 0 : 10),height/2-100+rr[i].get(i)*-10);
    generateCloud(int(rr[3].get(i)));
  
    popMatrix();
  }
}
void generateCloud(int level){
    String axiom = "CRCRCRCX";
    String rule = "RCX";
    String sentence = axiom;
    String next = "";
    for(int j = 0; j<level; j++){       
        for (int i = 0; i < sentence.length(); i++) {
            char current = sentence.charAt(i);
            if (current == 'X') {
                next+=rule;
            }
            else {
                next += current;
            }
        }
        sentence = next;
        next="";
    }


    int length = 20;
 
   for (int i = 0; i < sentence.length(); i++) {
        char c = sentence.charAt(i);
        if (c == 'C') {
            bezier(
                0, 0,
                length/4, -length/2,
                3*length/4, -length/2,
                length, 0
            );          
            translate(length, 0);          
        }
        if (c == 'S') {
            bezier(
                0, 0,
                length/4, -length/2,
                3*length/4, -length/2,
                length, 0
            );          
            translate(length, 0);          
        }
        else if (c == 'R') {
            rotate((2*PI)/(4 + level));
        }
        else if (c == 'L') {
            rotate(-PI/2);
        }
    }
}
void generateTower(int level,int index) {
    String axiom = "L[MRD1]RD2";
    String sentence = axiom;
    String next = "";
    String rule1 = "LMRD1";
    String rule1Skip = "D1";
    String rule2 = "RMLD2";
    String rule2Skip = "D2";
    
    for(int j = 0; j<level; j++){       
        for (int i = 0; i < sentence.length(); i++) {
            char current = sentence.charAt(i);
            if (current == '1') {
                if(rr[index].get(j) <5){
                    next += rule1;
                }else{
                    next +=rule1Skip;
                }
                
            } else if(current == '2'){
                if(rl[index].get(j)<5){
                    next += rule2;
                }else{
                    next +=rule2Skip;
                }
            }
            else {
                next += current;
            }
        }
        sentence = next;
        next="";
    }
    
    float step = (height/15)/(level);
    
    for(int i=0; i<sentence.length(); i++) {
        
        char c = sentence.charAt(i);
        if(c == 'M') {
            line(0,0, 0,step);
            translate(0,step);
            
        }else if(c== 'D'){
            line(0,0, 0,step*4);
            translate(0,step*4);
        } else if(c == 'R') {
            rotate((PI/2));
        } else if(c == 'L') {
            rotate(-PI/2);
        } else if(c == '['){
            pushMatrix();
        } else if(c == ']'){
            popMatrix();
        }
    }
   
}