2. Tujuannya adalah untuk menambahkan plugin dari pub.dev ke dalam project Flutter.
Plugin auto_size_text berfungsi agar teks otomatis menyesuaikan ukuran font sesuai ruang yang tersedia dan batas jumlah baris yang ditentukan.
3. Artinya widget RedTextWidget memiliki parameter wajib (text) yang harus diisi saat dipanggil.
Tujuannya supaya RedTextWidget lebih fleksibel dan dapat digunakan ulang dengan teks yang berbeda-beda sesuai kebutuhan.
4. perbedaannya adalah AutoSizeText lebih fleksibel dalam menyesuaikan teks terhadap ruang yang tersedia, sedangkan Text biasa sifatnya statis.
5. text = String yang akan ditampilkan pada widget.
style = Mengatur gaya teks, misalnya warna (red) dan ukuran font (14).
maxLines = Batas maksimal jumlah baris yang ditampilkan (di sini hanya 2 baris).
overflow = Mengatur perilaku jika teks terlalu panjang. TextOverflow.ellipsis artinya teks dipotong dan diganti tanda titik-titik
