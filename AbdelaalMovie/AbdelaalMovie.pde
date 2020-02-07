class movie implements Comparable<movie> {
  private int rating;
  private String review;

  movie(int r, String rev) {
    rating = r;
    review = rev;
  }

  int compareTo(movie other) {
    if (rating > other.rating)
      return -1;
    else if (rating < other.rating)
      return 1;

    return 0;
  }


  int getRate() {
    return rating;
  }

  String getReview() {
    return review;
  }

  String toString() {
    return"Rating: "+getRate()+"\n"+getReview();
  }
}
