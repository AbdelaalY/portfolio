public class Part implements Comparable<Part>
{
  private String make, model, theRest;
  private int year;

  public Part(String line) 
  {
    String[] list = line.split(" ");
    if(list.length == 6){
    theRest = list[0]+list[1]+list[2];
    make = list[3];
    model = list[4];
    year = parseInt(list[5]);
    }
    theRest = list[0]+list[1];
    make = list[2];
    model = list[3];
    year = parseInt(list[4]);
    
  }

  //have to have compareTo if implements Comparable
  public int compareTo( Part other )
  {
  
    if(make.compareTo(other.make) > 0)
   return 1;
   
   if(make.compareTo(other.make) < 0)
   return -1;
   
   if(model.compareTo(other.model) > 0)
   return 1;
   
    if(model.compareTo(other.model) < 0)
   return -1;
   
    if(year > other.year)
   return 1;
   
    if(year < other.year)
   return -1;


    return 0;
  }

  public String toString()
  {
    return theRest+make+model+year;
  }
}
