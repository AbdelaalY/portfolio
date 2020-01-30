import java.util.*;
import java.util.Scanner;
Scanner scan;
ArrayList<Person> people;

void setup(){
  try{
  scan = new Scanner(new File("person.txt"));
for(int x = 0; x < scan.nextInt(); x++){
people.add(new Person(scan.nextInt(),scan.nextInt(), scan.nextInt(), scan.next()));  
}
Collections.sort(people);
  } catch(Exception e){
  println(e);
  }
  finally{
  scan.close();
  }
}
