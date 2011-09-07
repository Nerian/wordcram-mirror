# Wordcram         

http://wordcram.org/ 

Create awesome word clouds!              
                                       
<img width='700px' src='http://wordcram.files.wordpress.com/2011/03/wordcram-4th-copy.png'></img>  


## Example

This code:
 
```java
import wordcram.*;
import wordcram.text.*;

void setup() {
  size(600, 400);
  background(0);

  WordCram wordCram = new WordCram(this,
    new TextSplitter().split(loadStrings("tao-te-ching.txt")),
    Fonters.FonterFor(createFont("sans", 1)),
    Sizers.byWeight(5, 60),
    Colorers.TwoHuesRandomSats(this),
    Anglers.MostlyHoriz,
    new CenterClumpWordPlacer(),
    new SpiralWordNudger());

  while (wordCram.hasMore()) {
    wordCram.drawNext();
  }
}  
   
```
      
Gives you this image:

<img width='700px' src='http://wordcram.files.wordpress.com/2010/08/tao-word-cloud.png            '></img> 