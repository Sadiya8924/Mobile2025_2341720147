Praktikum 1: Dasar State dengan Model-View
1. Langkah 4 membuat file data_layer.dart yang berfungsi sebagai "barrel file" (file barel). Tujuannya adalah untuk menyederhanakan proses impor (import).
2. Variabel plan (Plan plan = const Plan();) di Langkah 6 adalah state atau sumber data utama untuk PlanScreen. Ia menyimpan objek Plan yang berisi semua daftar tugas (tasks) yang akan ditampilkan dan dimanipulasi oleh UI, Yang konstan (const) adalah nilai awalnya (const Plan()). Ini adalah optimasi performa. Saat _PlanScreenState pertama kali dibuat, ia diinisialisasi dengan objek Plan kosong yang konstan (Flutter dapat menggunakan kembali instance objek yang sama di memori). Variabel plan ini nantinya akan terus-menerus diisi ulang dengan objek Plan baru setiap kali setState dipanggil (misalnya, saat menambah atau mengedit tugas).
3. initState(): Dipanggil satu kali saat state pertama kali dibuat (sebelum build() pertama). Ini adalah tempat yang tepat untuk melakukan inisialisasi satu kali, seperti membuat ScrollController dan mendaftarkan listener-nya. Kita tidak melakukannya di build() karena build() bisa dipanggil berkali-kali.
dispose(): Dipanggil satu kali saat state akan dihancurkan secara permanen. Ini adalah tempat untuk "membersihkan" sumber daya yang dibuat di initState() untuk mencegah kebocoran memori.

Praktikum 2: Mengelola Data dengan InheritedWidget
1. InheritedWidget yang dimaksud adalah PlanProvider itu sendiri. PlanProvider adalah sub-class dari InheritedNotifier, dan InheritedNotifier adalah sub-class khusus dari InheritedWidget.
Mengapa InheritedNotifier?
    InheritedWidget standar bagus untuk meneruskan data ke bawah pohon widget, tetapi tidak punya cara bawaan yang efisien untuk memberi tahu widget-widget tersebut jika datanya berubah.
    InheritedNotifier adalah spesialisasi yang dirancang untuk bekerja dengan Listenable (seperti ValueNotifier yang kita gunakan). Ia "mendengarkan" notifier tersebut. Ketika nilai di dalam ValueNotifier berubah (planNotifier.value = ...), InheritedNotifier secara otomatis dan efisien memicu rebuild hanya pada widget-widget yang mendengarkannya (dalam kasus kita, ValueListenableBuilder).
2. completedCount: Menghitung jumlah tugas yang selesai, completenessMessage: Menggunakan completedCount untuk membuat string progres

Praktikum 3: State di Multiple Screens
1. Diagram tersebut mengilustrasikan arsitektur aplikasi dan alur navigasi yang menggunakan state terpusat (Shared State)
diagram ini menunjukkan bahwa kita memiliki dua layar berbeda yang sama-sama dapat mengakses dan memodifikasi satu sumber data yang sama. Inilah yang memungkinkan perubahan yang dibuat di PlanScree dapat terlihat di PlanCreatorScreen.