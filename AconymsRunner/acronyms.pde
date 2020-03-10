import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import static java.lang.System.*;

public class Acronyms
{
  private Map<String, String> acronymTable;
  private String foutput = "";

  public Acronyms()
  {
    acronymTable = new TreeMap<String, String>();
  }

  public void putEntry(String entry)
  {
    String[] str = entry.split(" - ");

    if (acronymTable.get(str[0]) == null)
      acronymTable.put(str[0], str[1]);
    
  }

  public void convert(String[] sent)
  {
    String output = "";
    for (String str : sent) {
      Scanner chop = new Scanner(str);
      Scanner slice = new Scanner(str);
      while (chop.hasNext()) {
        if (acronymTable.get(slice.next().replaceAll("\\.","")) == null) {
          output+=chop.next()+" ";
        } else {
          output+=acronymTable.get(chop.next().replaceAll("\\.",""))+" ";
        }
      }
      if(output.contains("//.") == false)
      output+=".";
      
      output+="\n";
    }
    foutput+=output;
  }

  public String toString()
  {
    return acronymTable.toString().replaceAll("\\,", "\n")+"\n"+foutput;
  }
}
