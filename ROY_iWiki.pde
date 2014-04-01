String[] text;
ArrayList<String> words;

ArrayList<String> dates;
ArrayList<String> titles;

int count = 0;
int MAX_INTERVAL = 1;
int interval = MAX_INTERVAL;


void setup() {
  size(1280, 800);
  smooth();
  strokeWeight(1);
  textAlign(CENTER);

  text = loadStrings("iWiki.txt");
  words = new ArrayList<String>();
  dates = new ArrayList<String>();
  titles = new ArrayList<String>();

  // Removing blank arrays
  for (int i=0; i<text.length; i++) {
    if (text[i].equals("") || text[i].equals(" ")) {
      //      println("Blank ignored");
    } 
    else {
      words.add(new String(text[i]));
    }
  }

  // creating the arrayLists of Date and Title 
  for (int i=0; i<words.size(); i++) {
    int index = int(i/2);
    if (i%2 == 0) {
      //      print(words.get(i));
      dates.add(new String(words.get(i)));
    } 
    else {
      println(" + " + words.get(i));
      titles.add(new String(words.get(i)));
    }
  }
}

void draw() {
  
  drawBackground();

  // wairing for the interval and then count
  interval--;
  if (interval <= 0) {
    interval = MAX_INTERVAL;
    if (count == titles.size()-1 || count == dates.size()-1) {
      count = 0;
    } 
    else {
      count++;
    }
  }
  //show dates and titles in order
  float r1 = random(width);
  float r2 = random(height);
  float textColor = random(50);
  float textSize = random (10, 110);
  fill(0);
  textSize((int)textSize);
  text(titles.get(count), (int)r1, (int)r2);
  delay(100);
//  textSize(42);
//  text(dates.get(count), (int)r1, (int)r2+25);
}

void drawBackground() {
  noStroke();
  fill(255, 30);
  rect(0, 0, width, height);
  noFill();
}

