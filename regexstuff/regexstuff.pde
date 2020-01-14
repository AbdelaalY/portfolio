import java.util.Arrays;

void setup() {
  String line = "Hello, I am nine syllables long. And it is great!";
  String text = line.toLowerCase();
  String[] words = text.split("[\\W]+");
  println(Arrays.toString(words)+"\n"+countWords(words)+"\n"+countLetters(words)+"\n"+countVowels(words)+"\n"+countSyllables(words));
}

int countWords(String[] w) {
  return w.length;
}

int countLetters(String[] w) {
  int count = 0;
  for (int x = 0; x< w.length; x++) {
    for (int y = 0; y <w[x].length(); y++) {
      count++;
    }
  }
  return count;
}

int countVowels(String[] w) {
  int count = 0;
  for (int x = 0; x< w.length; x++) {
    for (int y = 0; y <w[x].length(); y++) {
      String temp = ""+w[x].charAt(y);
      if (temp.equals("a") || temp.equals("e") || temp.equals("i") || temp.equals("o") || temp.equals("u")|| temp.equals("y")) {
        count++;
      }
    }
  }
  return(count);
}

int countSyllables(String[] w) {
  int count = 0;
  for (int x = 0; x < w.length; x++) {
    if (w[x].substring(w[x].length()-1).equals("e")) {
      println("test");
      count--;
    }

    String[] temp = w[x].split("([^a^e^i^o^u^y^\\s]+)");
    println(Arrays.toString(temp));
    count+=temp.length;
  }
  return count;
}
