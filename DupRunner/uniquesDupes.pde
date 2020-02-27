import java.util.Set;
import java.util.TreeSet;
import java.util.Arrays;
import java.util.ArrayList;
import static java.lang.System.*;

public static class UniquesDupes
{

  public static Set<String> getUniques(String input)
  {
    Set<String> uniques = new TreeSet<String>(Arrays.asList(input.split(" ")));
    return uniques;
  }

  public static Set<String> getDupes(String input)
  {
    String[] list = input.split(" ");
    Set<String> duh = new TreeSet<String>();    
    Set<String> dupes = new TreeSet<String>(); 

    for (String s : list) {
      if (duh.add(s) == false) {
        dupes.add(s);
      }
    }

    return dupes;
  }
  
}
