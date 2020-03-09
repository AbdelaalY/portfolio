void setup(){
String[] a = loadStrings("acronyms.txt");
String[] sent = loadStrings("acrotrans.txt");
Acronyms acron = new Acronyms();

for(String s : a)
acron.putEntry(s);

acron.convert(sent);
println(acron);


}
