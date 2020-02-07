import java.util.*;
class MovieList {
  private ArrayList<movie> movieList = new ArrayList<movie>();
  private int count;

  MovieList(ArrayList<movie> m) {
    movieList = m;
  }

  int getCount() {
    return count;
  }

  double getAveScore() {
    double score = 0.0;
    for (movie m : movieList) {
      score += m.getRate();
    }
    return score/(double)movieList.size();
  }

  String overallComment() {
    if (getAveScore() <= 1) {
      return "this sux, save ur neet bux/GBP.";
    }

    if (getAveScore() < 2) {
      return "normie/mouthbreather tier";
    }

    if (getAveScore() < 3) {
      println("Average rating: soi face");
    }

    if (getAveScore() <=4 ) {
      return "this is some kino supremeo";
    }
    return "jeff";
  }

  void sortMoviesByCount() {
    Collections.sort(movieList);
  }

  String toString() {
    String done ="";
    Iterator chad = movieList.iterator();
    while (chad.hasNext())
      done +=chad.next();

    return done;
  }
}
