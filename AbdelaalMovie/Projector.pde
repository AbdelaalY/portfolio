import java.util.*;
void setup() {
  String[] flicks = loadStrings("moviereviews.txt");
  ArrayList<movie> robert = new ArrayList<movie>();
  for (String b : flicks) {
    Scanner scan = new Scanner(b);
    robert.add(new movie(scan.nextInt(), scan.nextLine()));
    scan.close();
  }
  MovieList l = new MovieList(robert);

  l.sortMoviesByCount();
  println(l);
  l.overallComment();
  

}
