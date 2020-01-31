import java.util.*;
import java.util.Scanner;
Scanner scan;
ArrayList<Person> people = new ArrayList<Person>();

void setup() {
  try {
    scan = new Scanner(new File("Desktop/people/data/person.txt"));
    int lines = scan.nextInt();
    for (int x = 0; x < lines; x++) {
 
        people.add(new Person(scan.nextInt(), scan.nextInt(), scan.nextInt(), scan.next()));
       
    }

    Collections.sort(people);
    for (Person p : people) {
      println(p);
    }
  } 
  catch(Exception e) {
    println(e);
  }
  finally {
    scan.close();
  }
}
