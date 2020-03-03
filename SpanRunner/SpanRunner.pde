void setup(){

 String[] str = loadStrings("Desktop/SpanRunner/data/spantoeng.txt");
 String[] sent = loadStrings("Desktop/SpanRunner/data/spantoengtest.txt");
SpanishToEnglish jefe = new SpanishToEnglish();


for(String j : str)
jefe.putEntry(j);

jefe.translate(sent);

println(jefe);

}
