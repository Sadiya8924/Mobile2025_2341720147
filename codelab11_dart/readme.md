Praktikum 1
Soal no 3
- Substring adalah fungsi bawaan dart untuk memotong teks. 
- catchError Ini adalah penangkap error. Saat kita mengambil data dari internet, prosesnya bisa gagal karena alasan seperti, koneksi internet putus, server Google sedang down, atau URL-nya salah. catchError berfungsi seperti jaring pengaman. Jika getData() gagal, program tidak akan crash. Sebaliknya, program akan menjalankan kode yang ada di dalam catchError (yaitu mengubah result menjadi 'An error occurred') agar pengguna tahu bahwa ada masalah.

Praktikum 2
Soal no 4
- async adalah "penanda" yang kamu pasang di sebuah fungsi. Ini memberitahu Dart: "Fungsi ini adalah fungsi asynchronous, artinya dia butuh waktu untuk selesai dan tidak akan langsung mengembalikan hasil."
- await adalah perintah "TUNGGU". Perintah ini hanya bisa dipakai di dalam fungsi async. Saat program bertemu await, dia akan berhenti di baris itu dan menunggu sampai "janji" (Future) di sebelahnya selesai, tanpa membuat seluruh aplikasi macet.

Praktikum 3
Soal no 5
- Kode langkah 2 memisahkan antara "Pembuat Janji" (getNumber) dengan "Pekerja" (calculate)
- getNumber(): Tugasnya membuat "janji" kosong (Completer) dan langsung memberikan "kunci" janjinya (.future) ke tombol.
- calculate(): Tugasnya adalah "pekerja" yang berjalan di latar belakang (menunggu 5 detik), lalu menepati janji itu dengan mengisinya (completer.complete(42)).
Soal no 6
- Kode Langkah 2 (Tidak Aman): Kode ini berasumsi calculate() akan selalu sukses. Jika terjadi error, aplikasi akan crash atau freeze karena error-nya tidak ditangani.
- Kode Langkah 5-6 (Aman): Kode ini siap jika terjadi kegagalan. Langkah 5 (calculate): Memakai try...catch untuk melaporkan error (completer.completeError) jika gagal. Langkah 6 (onPressed): Memakai .catchError untuk menangkap error itu dan menampilkan pesan ke pengguna (misal: 'An error occurred') tanpa membuat aplikasi crash.

Praktikum 4
Soal 8
- Perbedaan utama antara kode Langkah 1 dan Langkah 4 terletak pada cara mereka menjalankan Future secara paralel.
- Kode pada Langkah 1 menggunakan class FutureGroup yang berasal dari package eksternal async. Dengan FutureGroup, kamu harus membuat sebuah instance (objek) dari FutureGroup, kemudian secara manual menambahkan setiap Future satu per satu menggunakan method .add(), dan terakhir memanggil .close() untuk memberi tahu grup bahwa semua Future sudah ditambahkan dan siap dijalankan.
- Sebaliknya, kode pada Langkah 4 menggunakan Future.wait, yang merupakan fungsi bawaan dari Dart (dart:async). Cara ini jauh lebih ringkas dan modern. Kamu tidak perlu membuat objek manual; kamu hanya perlu menyediakan sebuah List (daftar) yang berisi semua Future yang ingin kamu tunggu, dan Future.wait akan mengurus sisanya secara otomatis. Keduanya mencapai hasil yang sama (eksekusi paralel), tetapi Future.wait umumnya lebih disukai karena lebih sederhana.

Praktikm 5
Soal no 10
- Saat memanggil handleError() di ElevatedButton, hasilnya akan sama persis dengan metode sebelumnya, yaitu menampilkan pesan error 'Exception: Something terrible happened!' di layar dan mencetak 'Complete' di konsol.
- Langkah 2 menggunakan gaya callback .catchError() untuk menangani Future secara eksplisit, sedangkan Langkah 4 menggunakan gaya try...catch...finally yang lebih modern dan seringkali lebih mudah dibaca karena terlihat seperti kode sinkronus (berurutan).

Praktikum 6
Soal no 12
- tidak akan mendapatkan koordinat GPS jika menjalankan aplikasi di browser. Ini terjadi karena plugin geolocator bekerja dengan cara mengakses API perangkat keras GPS native (asli) dari Android atau iOS, dan API native tersebut tidak ada atau tidak dapat diakses dari lingkungan browser web.

Praktikum 7
Soal no 13
- Perbedaan UI-nya adalah kita tidak lagi mengontrol loading state (animasi putar) secara manual menggunakan variabel String myPosition yang kosong. Ini terjadi karena FutureBuilder secara otomatis mengelola status UI berdasarkan siklus hidup Future (yaitu waiting, done, atau error), sehingga kode di dalam build menjadi jauh lebih bersih dan reaktif.
Soal no 14
- Perbedaan UI-nya adalah aplikasi kita sekarang dapat menampilkan pesan error 'Something terrible happened!' di layar jika Future (janji) gagal dieksekusi. Ini terjadi karena kita menambahkan pengecekan if (snapshot.hasError) di dalam FutureBuilder, yang secara spesifik menangani status error dari snapshot dan menampilkan UI yang sesuai untuk error tersebut.