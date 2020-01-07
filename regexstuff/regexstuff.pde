import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
 Pattern pat = Pattern.compile("[aeiouy]");
void setup() {
  String line = "Hello, I am nine syllables long. And it is great!";
  String text = line.toLowerCase();
  String[] words = text.split("[\\W]+");
  println(Arrays.toString(words)+"\n"+countWords(words)+"\n"+countVowels(words));
}

int countWords(String[] w) {
  return w.length;
}

int countVowels(String[] w) {
  int count = 0;
  for (int x = 0; x< w.length; x++) {
    for (int y = 0; y <w[x].length(); x++) {
      if (w[x].length() > 1) {
          Matcher mat = pat.matcher(w[x]);
        if () { 
          count++;
        } else if (w[x].matches("[aeiouy]")) {
          count++;
        }
      }
    }
    return(count);
  }
}
