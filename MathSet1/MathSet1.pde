import java.util.Set;
import java.util.Scanner;
Scanner scan;
MathSet m;
void setup() {
  
  //String [] str=loadStrings("MathSetData.txt");

  //for(String s: str){
   // m=new MathSet(s);
  //}
  try {
    //ArrayList<mathSet> m = new ArrayList<mathSet>();
    scan = new Scanner(new File("Desktop/MathSet1/data/MathSetData.txt"));
    while (scan.hasNextLine()) {
       m=new MathSet(scan.nextLine(), scan.nextLine());
    }
    println(m);
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
}
