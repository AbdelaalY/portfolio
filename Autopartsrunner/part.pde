public class Part implements Comparable<Part>
{
  private String make, model, theRest;
  private int year;

  public Part(String line) 
  {
    String[] list = line.split(" ");
    theRest = list[0]+list[1]+list[2];
    


  }

  //have to have compareTo if implements Comparable
  public int compareTo( Part other )
  {





    return 0;
  }

  public String toString()
  {
    return "";
  }
}
