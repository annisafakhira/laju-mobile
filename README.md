# Tugas Individu
## Annisa Fakhira Cendekia - 3406354606

## Tugas 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    Pada flutter semua komponennya adalah widget (semua elemen UI berbentuk widget), dari semua widget tersebut terbentuk widget tree yang merupakan struktur atau hierarki widget dengan hubungan parent-child dalam aplikasi Flutter. Sama seperti hubungan parent-child pada umumnya, parent dapat memiliki banyak child, tetapi child hanya punya satu parent. Parent akan mengatur child, tetapi child tidak dapat mengatur parent, parent memastikan bagaimana child ditempatkan atau . Sebagai contoh Column merupakan parent dari Text dan childnya adalah Text("Hello World") maka text akan disusun secara vertikal sesuai parent.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    Terdapat beberapa widget yang digunakan dalam proyek ini, root widget untuk aplikasi adalah MyApp yang extends StatelessWidget di main.dart dan return MaterialApp yang menyediakan kerangka Material Design, tema, dan navigator, serta menetapkan MyHomePage sebagai home. MyHomePage sendiri menggunakan Scaffold untuk menyusun struktur dari pagenya dengan AppBar untuk judul. Dalam mengatur layoutnya terdapat Padding yang memberi jarak tepi, Column yang menyusun secara vertikal, Row yang menyusun secara horizontal, SizedBox yang memberi jarak antar widget, Center yang memusatkan konten, Container yang mengatur ukuran lebarnya. Tampilan untuk datanya dengan GridView yang menampilkan tiga tombol berwarna yang bisa diklik (ItemCard) dalam grid 3 kolom, serta InfoCard yang menggunakan Card sebagai kartu yang menampilkan data. Pada ItemCard digunakan Material penyedia konteks material & latar berwarna dengan sudut melengkung dan InkWell untuk mendeteksi dan efek ripple serta memanggil ScaffoldMessenger untuk menampilkan SnackBar saat diklik. Semua dibangun dengan widget dasar seperti Text untuk tulisan dan Icon untuk gambar.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    MaterialApp adalah widget yang menyediakan inti Material Design untuk seluruh aplikasi, seperti ThemeData dan ColorScheme untuk memastikan widget di bawahnya memiliki tema yang konsisten, sistem navigasi dan routing sehingga bisa pindah layar, lokalisasi, dan mempermudah untuk memanggil SnackBar atau Dialog. Oleh karena itu, MaterialApp digunakan sebagai root widget agar dapat diwariskan dan diakses dari mana saja di dalam widget tree menggunakan BuildContext. Selain itu, MaterialApp juga menentukan home, widget pertama yang akan ditampilkan saat aplikasi berjalan.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    Perbedaan utamanya StatelessWidget dan StatefulWidget adalah data yang bisa diubah, StatelessWidget adalah widget tanpa state internal yang sepenuhnya ditentukan oleh input dan hanya rebuild ketika parent memberi data baru. StatelessWidget cocok untuk tampilan statis seperti label, ikon, atau komponen presentasional murni. StatefulWidget memiliki objek State yang menyimpan data dinamis dengan method seperti initState, setState, dispose yang memungkinkan UI berubah saat interaksi pengguna, async fetch, atau timer. Penggunaanya sendiri tergantung kerbutuhan, pilih StatelessWidget untuk UI yang tidak bergantung perubahan internal dan hanya membaca data dan pilih StatefulWidget jika ada interaksi yang mengubah tampilan.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    BuildContext merupakan address sebuah widget di dalam widget tree serta penting karena BuildContext yang memberi akses ke ancestor sehingga dapat mencari data atau layanan dari ancestors di atasnya. Sebagai contoh Theme.of(context) untuk warna atau typography, ScaffoldMessenger.of(context) untuk SnackBar, Navigator.of(context) untuk pindah page, dan MediaQuery.of(context) untuk ukuran dan membuat UI responsif. Dalam metode build(BuildContext context), context diterima sebagai parameter dari Flutter dan digunakan untuk mengambil fungsionalitas yang diwariskan dengan memanggil method .of().

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    Konsep hot reload adalah fitur yang meng-inject perubahan ke Dart yang Virtual Machine-nya yang sedang berjalan, memanggil ulang build() pada widget yang terpengaruh, dan mempertahankan state sehingga dapat melihat perubahan UI secara instan. Sedangkan, hot restart menjalankan ulang aplikasi dari main(), menghapus seluruh state, dan membangun ulang widget tree dari awal sehingga lebih lambat dari hot reload. Perbedaan utamanya hot reload menjaga state dan hot restart akan reset state-nya. Dalam penggunaannya, hot reload digunakan untuk perubahan lokal yang tidak mengubah inisialisasi global dan hot restart digunakan saat mengubah variabel global, konstruktor awal, atau logika yang butuh aplikasi reset dari kondisi awal.

## Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    Pada Flutter, Navigator.push() dan Navigator.pushReplacement() sama sama digunakan untuk berpindah atau mengganti page. Perbedaan keduanya adalah Navigator.push() menambahkannya sedangkan Navigator.pushReplacement() itu menggantinya sehingga untuk Navigator.push() dapat kembali ke halaman sebelumnya karena kita hanya "menumpuk" tetapi untuk Navigator.pushReplacement() kita tidak dapat kembali karena kita sudah mengganti yang sebelumnya. Penggunaannya di aplikasi adalah ketika ingin Add Product dari ItemCard (di home page) cukup menggunakan push sehingga bisa kembali ke page sebelumnya (home page). Akan tetapi, untuk drawer menggunakan Navigator.pushReplacement() agar tidak salah page, contohnya ketika menekan home tetapi hanya back ke page sebelumnya bisa saja page sebelumnya bukan home sehingga untuk drawer diganti pagenya dengan page yang sesuai oleh Navigator.pushReplacement().

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
    Dalam membangun struktur halaman yang konsisten di seluruh aplikasi Scaffold digunakan untuk kerangka halaman tempat elemen-elemen lain seperti AppBar dan Drawer berada. Sementara itu, AppBar digunakan untuk header sehingga judul atau nama halaman konsisten gayanya di seluruh aplikasi dan Drawer digunakan untuk mempermudah user berpindah halaman dan untuk setiap menu navigasi akan berpindah ke halaman yang benar serta konsisten.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    Menggunakan layout widget dalam desain akan membuat tampilan form jadi lebih rapi dan nyaman untuk dilihat. Pada aplikasi padding memberi jarak agar setiap field form tidak mepet ke tepi layar. SingleChildScrollView membuat form yang panjang dapat discroll ke bawah sehingga halaman tidak error dan user tetap bisa melihat semua input. Sementara ListView digunakan untuk menampilkan item seperti daftar menu “Home” dan “Add Product” dapat discroll jika menu terlalu banyak.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
    Untuk saat ini saya masih mengikuti warna pada tugas sebelumnya tetapi untuk penyesuaian warna dapat dilakukan dengan mengubah warna pada elemen-elemen penting seperti AppBar, ItemCard, dan Drawer. Dengan menggunakan warna yang sama di seluruh halaman maka aplikasi Football Shop akan memiliki identitas visual yang konsisten.

## Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

2.  Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).