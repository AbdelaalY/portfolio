void setup() {
  String[] str = loadStrings("Desktop/RelativesRunner/data/relatives.txt");
  Relatives r = new Relatives(); 

  for (String n : str)
    r.setPersonRelative(n);

  println(r);
}
