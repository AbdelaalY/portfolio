import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

void setup() {
  MarkovChain mc=new MarkovChain();
  String [] str=loadStrings("script.txt");
  String allText=join(str, " ");
  String [] cleanText=allText.toLowerCase().split("\\s+");//removes punct before splitting
  String s = cleanText[0];
  mc.trainMap(cleanText);
  for (String z : cleanText) {
    //println( z+mc.generateText(z, s)+"\n");
    //mc.generateText(s);
    //println(mc.generateText2(2));
  }
  mc.printMap();
}

interface Markov {
  void trainMap(String [] s);
  String generateText(String s, String bruh);
}


class MarkovChain implements Markov {
  List <String> wordList;
  Map<String, ArrayList<String>> myMap;

  public MarkovChain() {
    wordList=new ArrayList<String>();
    myMap=new HashMap<String, ArrayList<String>>();
  }

  void trainMap(String[] lines) {   
    for (int x = 0; x<lines.length-1; x++) {
      if (myMap.get(lines[x]) == null) {
        myMap.put(lines[x], new ArrayList<String>());
      }
      myMap.get(lines[x]).add(lines[x+1]);
    }
  }

  public String generateText(String str, String change) {
    String newString = new String();
    change = str;
    int randomIndex = 0;
    while (!change.contains("[!?.]")) {
      if (myMap.containsKey(change)) {
        randomIndex=getRandomIndex(change);
        println(randomIndex);
      }

      newString += " "+myMap.get(change).get(randomIndex)+"";
      change = myMap.get(change).get(randomIndex);
    }
    return newString;
  }

  int getRandomIndex(String s) {
    int randomIndex=(int)(Math.random()*myMap.get(s).size());
    return randomIndex;
  }
  void printMap() {
    println(myMap);
  }

  public String toString() {
    return ""+wordList;
  }
}
