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