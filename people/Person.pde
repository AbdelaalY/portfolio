
import static java.lang.System.*;

public class Person implements Comparable<Person>
{
  private int myYear;
  private int myMonth;
  private int myDay;
  private String myName;

  public Person( int y, int m, int d, String n)
  {
    myYear = y;
    myMonth = m;
    myDay = d;
    myName = n;
  }

  public int compareTo(Person other)
  {
    if (myYear > other.myYear) {
      return 1;
    } 
    if (myYear < other.myYear) 
      return -1;

    if (myMonth > other.myMonth)
      return 1;

    if (myMonth < other.myMonth)
      return -1;

    if (myDay > other.myDay)
      return 1;

    if (myDay < other.myDay)
      return -1;

    return 0;
  }

  public String toString( )
  {
    return myName;
  }
}
