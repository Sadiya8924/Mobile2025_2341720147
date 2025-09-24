void main(){
  final list = List<dynamic>.filled(5, null, growable: false);

  assert(list.length == 5);
  print("Panjang list: ${list.length}");

  list[1]="Diya";
  list[2]="2341720147";

  assert(list[1] == "Diya");
  assert(list[2] == "2341720147");

  print(list[1]);
  print(list[2]);
  print(list);
}