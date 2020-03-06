import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import static java.lang.System.*;

public class PartList
{
  private TreeMap<Part, Integer> partsMap;

  public PartList(String fileName)
  {
    partsMap = new TreeMap<Part, Integer>();
    String[] txt = loadStrings(fileName);
    for (String line : txt) {
      Part p = new Part(line);
      if (partsMap.get(p) == null) {
        partsMap.put(p, 1);
      }
      partsMap.put(p, partsMap.get(p)+1);
    }
  }

  public String toString()
  {
    String output="";
  for(Part k : partsMap.keySet())
  output += ""+k+"-"+partsMap.get(k);



    return output;
  }
}
