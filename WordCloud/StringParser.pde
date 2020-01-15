import java.util.Arrays;

class StringParser {
  String line;
  String[] words;

  StringParser(String l) {
    line = l;
    words = line.toLowerCase().split("[^\\w']+");
  }

  int countWords() {
    return words.length;
  }

  int countLetters() {
    int count = 0;
    for (int x = 0; x< words.length; x++) {
      for (int y = 0; y <words[x].length(); y++) {
        count++;
      }
    }
    return count;
  }

  int countVowels() {
    int count = 0;
    for (int x = 0; x< words.length; x++) {
      for (int y = 0; y <words[x].length(); y++) {
        String temp = ""+words[x].charAt(y);
        if (temp.equals("a") || temp.equals("e") || temp.equals("i") || temp.equals("o") || temp.equals("u")|| temp.equals("y")) {
          count++;
        }
      }
    }
    return(count);
  }

  /*int countSyllables() {
    int count = 0;
    for (int x = 0; x < words.length; x++) {
      if (words[x].substring(words[x].length()-1).equals("e")) {
        println("test");
        count--;
      }

      String[] temp = words[x].split("([^a^e^i^o^u^y^\\s]+)");
      println(Arrays.toString(temp));
      count+=temp.length;
    }
    return count;
  }
  */

  int countSyllables(String s) {
    int count = 0;
    String[] words = s.split("[aeiouy]+[^$e(,.!?)]");
    for (int i = 0; i<words.length; i++) {
      count++;
    }
    return count-1;
  }

  String toString() {  
    String done = Arrays.toString(words)+"\n"+countWords()+"\n"+countLetters()+"\n"+countVowels()+"\n"+countSyllables(line.toLowerCase());
    return done;
  }
}
