import java.util.Scanner;
Scanner scan;
void setup() {
  try{
    scan = new Scanner(new File("Desktop/Joker.txt"));
    scan.useDelimiter(".");
    while(scan.hasNextLine()){
    StringParser swag = new StringParser(scan.nextLine());
    println(swag);
    }
}catch(Exception e){
println(e);
} finally{
scan.close();
}
  StringParser text = new StringParser("Hello, I am nine syllables long. And it's great!");
 println(text);
}
