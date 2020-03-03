import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import static java.lang.System.*;

public class SpanishToEnglish
{
  private Map<String, String> pairs;
  private String output = "";

  public SpanishToEnglish()
  {
    pairs = new TreeMap<String, String>();
  }

  public void putEntry(String entry)
  {
    String[] list = entry.split(" ");
    pairs.put(list[0], list[1]);
    if (pairs.get(list[0]) == null) {
      pairs.put(list[0], list[1]);
    }
  }

  public void translate(String[] sent)
  {
    for (String str : sent) {
      Scanner chop = new Scanner(str); 
      while (chop.hasNext()) {
        output+= pairs.get(chop.next())+" ";
      }
      output+=".\n";
    }
  }

  public String toString()
  {
    return pairs.toString().replaceAll("\\,", "\n")+"\n"+output;    
  }
}
