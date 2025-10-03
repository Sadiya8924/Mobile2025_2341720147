Tugas Praktikum
1. Dalam bahasa dart, function adalah blok kode yang bisa di panggil untuk menjalankan tugas tertentu. Fungsi biasanya memiliki nama, parameter(opsional), dan nilai balik(opsional).

--------------------------------------------------

2. - Positional parameter -> parameter wajib, harus diisi sesuai urutan
    eg: void greet(String name, int age) {
            print("Hello $name, umur $age");
        }
- opstional positional parameter->pakai [], bisa di isi bs tidak
eg: void greet(String name, [String? hobby]) {
        print("Hello $name, hobby: $hobby");
    }
- Named Parameter -> pakai {}, pemanggilan pakai nama parameter.
eg: void greet({String? name, int? age}) {
        print("Nama: $name, Umur: $age");
    }
- Default Parameters -> memberi nilai default kalau tidak diisi.
eg: void greet({String name = "Anonim"}) {
        print("Hai $name");
    }

--------------------------------------------------

3. Fungsi di anggap sebagai 1st class object akrena di simpan dalam variable, dikirim sebagai parameter ke fungsi lain, dan di kembalikan sebagai return dari fungsi lain
eg: void sayHello() {
        print("Hello World");
    }

    void main() {
        var func = sayHello;   // fungsi disimpan ke variabel
        func();                // dipanggil lewat variabel
    }

--------------------------------------------------

4. Anonymous Function adalah fungsi tanpa nama. Biasanya dipakai ketika fungsi hanya diperlukan sekali atau sebagai parameter fungsi lain.
eg: void main() {
        var numbers = [1, 2, 3];
        numbers.forEach((n) {
            print(n * 2);  // fungsi tanpa nama dipakai di sini
        });
    }

--------------------------------------------------

5. - Lexical Scope → aturan penentuan variabel berdasarkan posisi kode saat ditulis. Jadi variabel hanya bisa diakses dalam scope tempat dia didefinisikan.
eg: void main() {
        var a = 10;
        void printA() {
            print(a); // bisa diakses karena masih dalam scope
    }
        printA();
    }
- Lexical Closure → fungsi yang “membawa” variabel dari lingkungannya, walaupun lingkungannya sudah selesai dieksekusi.
eg: Function makeAdder(int x) {
        return (int y) => x + y; // closure bawa variabel x
    }

    void main() {
        var add5 = makeAdder(5);
        print(add5(3)); // output: 8
    }

--------------------------------------------------

6. fungsi secara default hanya bisa mengembalikan satu nilai dengan return. Kalau kita mau mengembalikan lebih dari satu nilai, ada beberapa cara yaitu:
- Menggunakan List
eg: List<int> getNumbers() {
        return [10, 20, 30];
    }

    void main() {
        var nums = getNumbers();
        print(nums[0]); // 10
        print(nums[1]); // 20
    }

- Menggunakan Map
eg: Map<String, dynamic> getUser() {
        return {
            'name': 'Diyaa',
            'nim': 123456
        };
    }

    void main() {
        var user = getUser();
        print(user['name']); // Diyaa
        print(user['nim']);  // 123456
    }

- Menggunakan Record
eg: (String, int) getUser() {
        return ('Diyaa', 123456);
    }

    void main() {
        var user = getUser();
        print(user.$1); // Diyaa
        print(user.$2); // 123456
    }
- Menggunakan Class
eg: class User {
        String name;
        int nim;

        User(this.name, this.nim);
    }

    User getUser() {
        return User('Diyaa', 123456);
    }

    void main() {
        var user = getUser();
        print(user.name);
        print(user.nim);
    }
