/*
firstnamesUsingWordProperties is a WordCram of the most popular first names from 
the 1990 US Census.  Predictably, males are blue, and females
are pink.  It also shows one way you can use a custom WordColorer.
See firstnamesUsingSubclasses for another.

When you're parsing the names data, you know whether each word
is a male or female name.  To take advantage of this, the sketch
creates a Word object, and gives it a property named "isFemale",
set to either true or false.

Then, the sketch gives WordCram a custom WordColorer that checks
each Word's isFemale property, and returns the corresponding pink or 
blue.

Names collected from http://www.census.gov/genealogy/names
Minya Nouvelle font from http://www.1001fonts.com/font_details.html?font_id=59
*/

import wordcram.*;

WordCram wc;
Word[] names;

void setup() {
  colorMode(HSB);
  size(800, 600);
  background(255);
  
  loadNames();
  makeWordCram();
}

void loadNames() { 
  String[] nameData = loadStrings("../names.txt");
  names = new Word[nameData.length];
  for (int i = 0; i < names.length; i++) {
    names[i] = parseName(nameData[i]);
  }
}

void makeWordCram() {
  wc = new WordCram(this)
    .fromWords(names)
    .withFont(createFont("../MINYN___.TTF", 1))
    .sizedByWeight(12, 60)
    .withColorer(colorer())
    .withAngler(Anglers.mostlyHoriz())
    .withPlacer(Placers.horizLine());
}

WordColorer colorer() {
  return new WordColorer() {
    public int colorFor(Word name) {
      boolean isFemale = (Boolean)name.getProperty("isFemale");
      
      if (isFemale) {
        return color(#f36d91); // pink
      }
      else {
        return color(#476dd5); // blue
      }
    }
  };
}

void draw() {
  if (wc.hasMore()) {
    wc.drawNext();
  }
  else {
    println("done");
    noLoop();
  }
}

void mouseClicked() {
  background(255);
  makeWordCram();
  loop();
}


Word parseName(String data) {
  String[] parts = split(data, '\t');
  String nameString = parts[0];
  float freq = float(parts[1]);
  boolean isFemale = "f".equals(parts[2]);
  Word name = new Word(nameString, freq);
  name.setProperty("isFemale", isFemale);
  return name;
}
