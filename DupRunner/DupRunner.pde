void setup(){
String data = "a b c d e f g h a b c d e f g h i j k";

println(data);
println("Uniques: "+UniquesDupes.getUniques(data));
println("Dupes: "+UniquesDupes.getDupes(data));

data = "one two three one two three six seven one two";
println(data);
println("Uniques: "+UniquesDupes.getUniques(data));
println("Dupes: "+UniquesDupes.getDupes(data));

data = "1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 6";
println(data);
println("Uniques: "+UniquesDupes.getUniques(data));
println("Dupes: "+UniquesDupes.getDupes(data));

}
