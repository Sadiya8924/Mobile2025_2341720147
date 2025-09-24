(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  var hasilTukar = tukar((10, 20));
  print(hasilTukar);

  (String, int) mahasiswa = ('Diyaa', 123456);
  print(mahasiswa);

  var mahasiswa2 = ('first', a: 2, b: true, 'last');
  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);

  var mahasiswa3 = ('Diyaa', a: 2341720147, b: true, 'Informatika');
  print(mahasiswa3.$1);
  print(mahasiswa3.a);
  print(mahasiswa3.b);
  print(mahasiswa3.$2);
}