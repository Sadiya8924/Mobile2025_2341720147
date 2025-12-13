# Mobile2025_2341720147 
1. async adalah kata kunci yang menandakan fungsi tersebut asynchronous:
void = fungsi tidak mengembalikan nilai
async = fungsi berjalan secara asinkron, bisa menunggu operasi lain selesai tanpa memblokir program
await = digunakan di dalam fungsi async untuk menunggu operasi asinkron selesai

2. @immutable
Menandakan bahwa objek/widget tidak bisa diubah setelah dibuat
Fungsi:
Memastikan widget lebih efisien dan predictable
Mencegah bug karena perubahan data tidak terduga
Best practice di Flutter untuk StatelessWidget dan StatefulWidget

@override
Menandakan bahwa method ini menimpa/override method dari parent class
Fungsi:
Memberitahu Dart bahwa kita sengaja menimpa method dari parent
Membantu catch error (jika typo nama method, Dart akan warning)
Meningkatkan readability kode
Best practice untuk kejelasan kode