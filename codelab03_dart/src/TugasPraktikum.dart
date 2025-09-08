void main() {
  String nama = "Sadiya Maritza"; 
  String nim = "2341720147"; 
  
  print("Mencari bilangan prima dari 0 sampai 201");
  print("Nama: $nama");
  print("NIM: $nim");
  print("=" * 50);
  
  for (int angka = 0; angka <= 201; angka++) {
    if (angka < 2) {
      continue; 
    }
    
    bool isPrima = true;

    for (int i = 2; i < angka; i++) {
      if (angka % i == 0) {
        isPrima = false;
        break;
      }
    }
    
    if (isPrima) {
      print("$angka adalah bilangan prima - $nama ($nim)");
    }
  }
}