Soal 5:
Safe (Aman):
Jika ada typo pada nama konstanta (misalnya keyNme bukan keyName), compiler akan langsung mendeteksi error pada saat compile time
Jika menggunakan string literal ('pizzaName'), typo seperti 'pizzaNme' tidak akan terdeteksi sampai runtime
Mencegah kesalahan pengetikan yang sulit di-debug

Maintainable (Mudah Dipelihara):
Jika perlu mengubah nama key JSON (misalnya dari 'pizzaName' ke 'name'), cukup ubah di satu tempat (konstanta)
Tanpa konstanta, harus mencari dan mengubah di semua tempat yang menggunakan string tersebut
Mengurangi risiko lupa mengubah di beberapa tempat
Kode lebih konsisten dan mudah di-refactor

Soal 8:
Langkah 3: Method untuk menulis data string ke file pizzas.txt. Menggunakan try-catch untuk error handling
Langkah 7: Setelah tombol "Read File" ditekan, konten file dibaca dan ditampilkan di layar