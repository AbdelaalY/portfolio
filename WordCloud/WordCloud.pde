import java.util.Scanner;
Scanner scan,scone;
void setup() {
  try {
    scan = new Scanner(new File("Desktop/WordCloud/data/Joker.txt"));
    scone = new Scanner(new File("Desktop/WordCloud/data/Joker.txt"));
    while(scone.hasNext()){
    
     StringParser swoog = new StringParser(scone.next());
    println(swoog);
    
    }
    scan.useDelimiter("\\s;:,");
    while (scan.hasNext()) {
      StringParser swag = new StringParser(scan.next());
      println(swag);
    }
  }
  catch(Exception e) {
    println(e);
  } 
  finally {
    scan.close();
  }
}
