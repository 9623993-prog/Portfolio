// Jack Quinn | Calculator | 07 Oct 2025

Button [] buttons = new Button[13];
Button [] numButtons = new Button [10];
float l, r, result;
String dVal;
String op;
boolean left;

void setup () {
  size(220, 250);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  dVal = "0.0";
  op = " ";
  left = true;
  buttons[0] = new Button(25, 90, 30, 30, 'C', #FA880D, #FA880D);
  numButtons[7] = new Button(25, 125, 30, 30, '7', #1B41F7, #1B41F7);
  numButtons[4] = new Button(25, 160, 30, 30, '4', #1B41F7, #1B41F7);
  numButtons[1] = new Button(25, 195, 30, 30, '1', #1B41F7, #1B41F7);
  numButtons[0] = new Button(45, 230, 70, 30, '0', #1B41F7, #1B41F7);
  buttons[1] = new Button(65, 90, 30, 30, '±', #AFAAA5, #AFAAA5);
  numButtons[8] = new Button(65, 125, 30, 30, '8', #1B41F7, #1B41F7);
  numButtons[5] = new Button(65, 160, 30, 30, '5', #1B41F7, #1B41F7);
  numButtons[2] = new Button(65, 195, 30, 30, '2', #1B41F7, #1B41F7);
  buttons[2] = new Button(107, 90, 30, 30, '<', #AFAAA5, #AFAAA5);
  numButtons[9] = new Button(107, 125, 30, 30, '9', #1B41F7, #1B41F7);
  numButtons[6] = new Button(107, 160, 30, 30, '6', #1B41F7, #1B41F7);
  numButtons[3] = new Button(107, 195, 30, 30, '3', #1B41F7, #1B41F7);
  buttons[3] = new Button(107, 230, 30, 30, '.', #1B41F7, #1B41F7);
  buttons[4] = new Button(150, 90, 30, 30, '>', #AFAAA5, #AFAAA5);
  buttons[5] = new Button(150, 125, 30, 30, '*', #AFAAA5, #AFAAA5);
  buttons[6] = new Button(150, 160, 30, 30, '/', #AFAAA5, #AFAAA5);
  buttons[7] = new Button(150, 195, 30, 30, '-', #AFAAA5, #AFAAA5);
  buttons[8] = new Button(150, 230, 30, 30, '+', #AFAAA5, #AFAAA5);
  buttons[9] = new Button(195, 90, 30, 30, '%', #AFAAA5, #AFAAA5);
  buttons[10] = new Button(195, 125, 30, 30, '^', #AFAAA5, #AFAAA5);
  buttons[11] = new Button(195, 160, 30, 30, '√', #AFAAA5, #AFAAA5);
  buttons[12] = new Button(195, 213, 30, 65, '=', #AFAAA5, #AFAAA5);
}

void draw () {
  background(125);
  for (int i = 0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyReleased() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (keyCode == 107) {
    dVal = "0.0";
    left = false;
    op = "+";
  } else if (keyCode == 10) {
  } else if (keyCode == 45 || keyCode == 109) {
    dVal = "0.0";
    op = "-";
    left = false;
  }
  if (keyCode == 45 || keyCode == 97) {
    if (dVal.length()<8) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "1";
          l = float(dVal);
        } else {
          dVal += "1";
          l = float(dVal);
        }
      } else if (left == false) {
        if (dVal.equals("0.0")) {
          dVal = "1";
          r = float(dVal);
        }
      }
    }
  }
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (keyCode == 107) {
    dVal = "0.0";
    left = false;
    op = "+";
  } else if(keyCode == 109 || keyCode == 45) {
    dVal = "0.0";
    left = false;
    op = "-";
  } else if (keyCode == 48 || keyCode == 96) {
    if (dVal.length()<8) {
      if (left == true) {
        if (dVal.equals("0.0")) {
          dVal = "0";
          l = float(dVal);
        } else {
          dVal += "0.0";
          l = float(dVal);
        }
      } else if (!left) {
        if (dVal.equals("0.0")) {
          dVal = "0.0";
          r = float(dVal);
        } else {
          dVal += "0.0";
          r = float(dVal);
        }
      }
    }  
  }
}   
void mouseReleased() {
  for (int i =0; i<buttons.length; i++) {
    if (buttons[i].over && buttons[i].val == '+') {
      dVal = "0.0";
      left = false;
      op = "+";
    } else  if (buttons[i].over && buttons[i].val == 'C') {
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0.0";
      op = "C";
      left = true;
    } else  if (buttons[i].over && buttons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(l);
      }
    } else  if (buttons[i].over && buttons[i].val == '%') {
      if (left) {
        l = l*0.01;
        dVal = str(l);
      } else {
        r = r*0.01;
        dVal = str(l);
      }
    } else  if (buttons[i].over && buttons[i].val == '=') {
      performCalculation();
    } else  if (buttons[i].over && buttons[i].val == '±') {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(l);
      }
    } else  if (buttons[i].over && buttons[i].val == '*') {
      result = 0.0;
      dVal = "0.0";
      op = "*";
      left = false;
    } else  if (buttons[i].over && buttons[i].val == '/') {
      result = 0.0;
      dVal = "0.0";
      op = "/";
      left = false;
    } else  if (buttons[i].over && buttons[i].val == '<') {
      result = 0.0;
      dVal = "0.0";
      op = "<";
      left = false;
    } else  if (buttons[i].over && buttons[i].val == '>') {
      result = 0.0;
      dVal = "0.0";
      op = ">";
      left = false;
    } else  if (buttons[i].over && buttons[i].val == '-') {
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0.0";
      op = "-";
      left = false;
    } else  if (buttons[i].over && buttons[i].val == '^') {
      result = 0.0;
      dVal = "0.0";
      op = "*";
      left = false;
    } else  if (buttons[i].over && buttons[i].val == '.') {
      if (dVal.contains(".") == false) {
        dVal += ".";
      }
    }
  }
  for (int i = 0; i<numButtons.length; i++) {
    if (dVal.length()<8) {
      if (numButtons[i].over && left == true) {
        if (dVal.equals("0.0")) {
          dVal = str(numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          l = float(dVal);
        }
      } else if (numButtons[i].over && left == false) {
        if (dVal.equals("0.0")) {
          dVal = str(numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          r = float(dVal);
        }
      }
    }
  }
  println("l:" + l);
  println("r:" + r);
  println("result:" + result);
  println("left:" + left);
  println("op:" + op);
}

void updateDisplay () {
  rectMode(CENTER);
  fill(255);
  rect(115, 40, 240, 60, 10);

  fill(0);
  textSize(45);
  textAlign(RIGHT);
  text(dVal, 200, 55);
}

void performCalculation () {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("*")) {
    result = l * r;
  } else if (op.equals("/")) {
    result = l / r;
  } else if (op.equals("^")) {
    result = pow(l, r);
  }
  dVal = str(result);
  l = result;
  left = true;
}
