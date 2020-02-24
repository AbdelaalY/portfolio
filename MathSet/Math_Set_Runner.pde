import java.util.Scanner;
Scanner scan;
void setup() {
  
  String [] str=loadStrings("MathSetData.txt");
  MathSet m;
  //for(String s: str){
   // m=new MathSet(s);
  //}
  try {
    //ArrayList<mathSet> m = new ArrayList<mathSet>();
    scan = new Scanner(new File("MathSetData.txt"));
    while (scan.hasNextLine()) {
      m=new mathSet(scan.nextLine(), scan.nextLine());
    }
    println(m);
  }
  catch(Exception e) {
    println(e);
  }
  
}
