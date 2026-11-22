# myportofolio_mobile

# 15/11/2026 - Tugas 7
## A. Weekly Instruction Step :
> **Prasyarat Versi & Perangkat Lunak**
> - Flutter SDK : Versi 3.22.x atau lebih baru
> - Dart SDK : Versi 3.4.x atau lebih baru
> - Android Studio : Versi 2024.x (Koala / Ladybug):
>   - Android SDK Build-Tools: Versi 34.0.0 / kompatibel
>   - Android SDK Command-line Tools (latest) via SDK Manager
>   - Android SDK Platform-Tools
> - Java Development Kit (JDK): OpenJDK versi 17
> - Visual Studio Code / Android Studio IDE:
>   - Ekstensi Flutter (oleh Dart Code).
>   - Ekstensi Dart (otomatis terpasang bersama Flutter).
> - Web Browser: Google Chrome atau browser lain untuk target
--- 
1. Clone this repository `git clone https://github.com/ke-Vyn/myportofolio_mobile.git` `cd myportofolio_mobile`
2. Ensure Flutter SDK is installed and added to PATH `flutter --version`
3. Install project dependencies `flutter pub get`
4. Run code analysis / linter check `flutter analyze`
5. Run the application:
    - For web (Chrome): `flutter run -d chrome`
    - For web server (any browser): `flutter run -d web-server --web-port 8080`
    - For Android emulator / physical device: `flutter run`
6. If running via web-server, open http://localhost:8080 in any browser

## B. Weekly Updates :
1. Inisialisasi proyek Flutter **myportofolio_mobile**, memisahkan layar utama (`menu.dart`) dari file bootstrap (`main.dart`), serta mengubah `MyHomePage` menjadi `StatelessWidget`
2. Owner Identity Section (`InfoCard`): Membuat custom widget modular `InfoCard` dan menyusun 3 kartu responsif secara horizontal menggunakan `Row` untuk menampilkan data identitas
3. Menambahkan atribut `Color color` pada model `ItemHomepage` agar styling tombol modular dan tidak hardcoded.
4. Tombol Aksi (`ItemCard`) dengan Kustomisasi Warna:  
    - Membuat 3 kartu aksi dalam tata letak `GridView.count` 3 kolom dengan warna latar kontras:
        - Lihat Proyek: Biru (Colors.blue.shade700) dengan ikon folder.
        - Tambah Proyek: Hijau (Colors.green.shade700) dengan ikon tambah lingkaran.
        - Logout: Merah (Colors.red.shade700) dengan ikon keluar.
5. Meningkatkan respons sentuhan menggunakan `InkWell` & mengintegrasikan `SnackBar` melayang (`SnackBarBehavior.floating`) berdurasi 2 detik dengan warna latar dinamis sesuai kartu yang ditekan serta teks: `"Kamu telah menekan tombol [Button Name]!"`

## C. Reflection : 
### Assignment 7
1. -    A. Dalam flutter, setiap elemen visual & tata letak adalah widget. Widget Tree adalah struktur data hierarkis berbentuk pohon yang merepresentasikan komposisi, hubungan dan organisasi seluruh UI aplikasi.
    - B. Mekanisme Hubungan Parent-Child: Dalam hierarki widget tree, sebuah widget dapat berperan sebagai parent yang menampung satu turunan tunggal melalui properti child (cth: Padding, Center, Container, Card) ataupun banyak turunan sekaligus melalui properti children berbentuk List<Widget> (cth:  Column, Row, GridView). Proses penataan layout di antara keduanya berpedoman pada prinsip dasar Flutter, yaitu "Constraints go down, sizes go up, parent sets position", di mana parent meneruskan batasan ukuran (box constraints) ke bawah menuju child, lalu child menentukan ukurannya sendiri berdasarkan batasan tersebut dan mengembalikannya ke atas (parent), hingga akhirnya parent mengatur posisi child di dalam area miliknya. 

    &nbsp;

2. - `MyApp` (StatelessWidget): Widget root aplikasi yang mendefinisikan konfigurasi global dan tema.
    - `MaterialApp`: Widget pembungkus berstandar Material Design yang menyediakan layanan navigasi, konfigurasi tema aplikasi & lokalisasi
    - `MyHomePage` (StatelessWidget): Halaman utama yang menampung kartu identitas pemilik dan menu aksi portofolio.
    - `Scaffold`: Menyediakan kerangka dasar tata letak visual standar Material Design (wadah untuk AppBar, body, dan penampil SnackBar)
    - `AppBar`: Menampilkan header yang memuat judul aplikasi (MyPortfolio)
    - `Text`: Menampilkan teks string dengan pengaturan tipografi (ketebalan font, ukuran, dan warna).
    - `Padding`: Memberikan jarak ruang kosong (insets) di sekeliling widget anaknya agar tampilan tidak menempel ke tepi layar.
    - `Column`: Menyusun widget-widget turunannya secara vertikal dari atas ke bawah.
    - `Row`: Menyusun widget-widget turunannya secara horizontal dari kiri ke kanan.
    - `SizedBox`: Memberikan jarak kosong terukur (spasi vertikal/horizontal) antar elemen.
    - `Center`: Menempatkan widget anak tepat di tengah ruang yang dialokasikan oleh induknya.
    - `GridView.count`: Menyusun daftar widget dalam format kisi (grid) dengan jumlah kolom tetap (3 kolom) yang responsif dan dapat diatur jarak sumbunya (cross/main axis spacing).
    - `InfoCard` (`StatelessWidget`): Custom widget kartu profil yang menampilkan label judul (title) dan isi identitas (content).
    - `Card`: Menghasilkan wadah bergaya kartu Material dengan rounded corners dan bayangan kedalaman (elevation).
    - `Container`: Kotak serbaguna yang menggabungkan properti penataan ukuran (lebar/tinggi), padding, serta dekorasi.
    - `ItemCard` (`StatelessWidget`): Custom widget tombol aksi interaktif portofolio yang menampilkan ikon, nama tombol, dan warna latar belakang dinamis.
    - `Material`: Komponen dasar rendering grafis Material Design yang memegang warna latar kartu dan menyediakan kanvas untuk efek visual sentuhan.
    - `InkWell`: Memberikan efek ripple dan menangani interaksi ketukan jari user melalui callback onTap.
    - `Icon`: Merender grafis ikon dari Material Icons (Icons.folder, Icons.add_circle, Icons.logout).
    - `SnackBar`: Panel notifikasi singkat yang muncul melayang di layar bagian bawah untuk memberikan umpan balik interaktif saat tombol ditekan. 

    &nbsp;

3. MaterialApp adalah sebuah high-level wrapper yang mengonfigurasi aplikasi agar mengadopsi spesifikasi desain Material Design dari Google. Tujuan utamanya: 
    - Menyediakan infrastruktur navigasi terintegrasi (`Navigator`) untuk perpindahan antar halaman
    - Mengelola sistem tema global aplikasi (`ThemeData` dan `ColorScheme`) yang dapat diakses dari widget anak mana pun
    - Mengatur konfigurasi lokal, internasionalisasi, dan lokalisasi bahasa
    - Membungkus aplikasi dengan `Directionality` (arah baca teks LTR/RTL) dan `Overlay` yang diperlukan untuk dialog, pop-up, dan SnackBar

    Alasan Digunakan sebagai Root: Widget-widget Material seperti `Scaffold`, `AppBar`, `Card`, dan `InkWell` memerlukan widget induk (*ancestor*) yang menyediakan konfigurasi tema, arah teks (*directionality*), dan *media query*. Tanpa `MaterialApp` di pucuk *widget tree*, Flutter akan menghasilkan *runtime error* seperti `"No Directionality widget found"` / `"No MediaQuery widget found"`

    &nbsp;

4.  - `StatelessWidget` :
        - Bersifat immutable. Konfigurasi widget tidak dapat berubah sepanjang waktu setelah dibangun (*instantiated*). Seluruh propertinya bersifat `final` dan tampilannya hanya ditentukan oleh data yang dipasok dari luar melalui *constructor* serta konfigurasi `BuildContext`
        - Digunakan saat tampilan bersifat statis / hanya menampilkan data yang tidak berubah secara internal akibat interaksi langsung pengguna (cth: kartu profil seperti `InfoCard`, ikon, tombol statis, atau teks label)
    - `StatefulWidget` :
        - Bersifat mutable (dapat berubah). Meski kelas widget-nya sendiri tetap immutable `StatefulWidget` terhubung dengan objek `State` terpisah yang datanya dapat berubah dan bertahan (*persist*) selama siklus hidup widget. Tampilan dapat diperbarui secara dinamis dengan memanggil fungsi `setState()`, yang memicu Flutter menjalankan ulang method `build()` pada `State` tersebut
        - Digunakan saat komponen memiliki data dinamis yang berubah akibat interaksi pengguna, waktu, atau data asinkron (cth: input form teks, *checkbox*, *toggle* animasi, penghitung angka, atau hasil respons API jaringan)

    &nbsp;

5. `BuildContext` adalah objek referensi (*handle*) yang merepresentasikan lokasi persis suatu widget pada hierarki *widget tree*. Setiap widget memiliki `BuildContext` uniknya sendiri yang dikelola oleh `Element` terkait pada *Element Tree*
    - `BuildContext` krusial karena menjadi sarana penelusuran hierarki ke atas (*ancestor lookup*). Melalui `context`, sebuah widget dapat mengakses data / layanan dari widget induk (*ancestor*) seperti `InheritedWidget`(cth: mengambil tema warna lewat `Theme.of(context)`, dimensi layar lewat `MediaQuery.of(context)`, maupun menampilkan notifikasi lewat `ScaffoldMessenger.of(context)`)
    - Penggunaan di `build` Method: Parameter `BuildContext context` diteruskan sebagai argumen ke dalam method `Widget build(BuildContext context)` setiap kali Flutter merender tampilan. Di dalam blok `build()`, parameter `context` ini dipakai secara langsung untuk memanggil dependensi dari *ancestor* (seperti `ScaffoldMessenger.of(context).showSnackBar(...)` saat kartu ditekan atau `Navigator.of(context)` untuk navigasi) serta menentukan konfigurasi render widget pada posisinya saat ini

    &nbsp;

6. - Hot Reload: Menginjeksikan kode sumber yang baru   diubah langsung ke Dart Virtual Machine (VM) yang sedang aktif tanpa menghapus *state* aplikasi (*preserves state*). Flutter hanya membangun ulang *widget tree* yang terdampak dalam hitungan kurang dari 1 detik.
    - Hot Restart: menghapus seluruh *state* aplikasi, mengeksekusi ulang fungsi `main()`, dan menginisialisasi ulang seluruh widget dari awal (tetap lebih cepat dari *full rebuild* karena kode *native* tidak dikompilasi ulang).

* **Kapan Tidak Bisa Menggunakan Hot Reload:**
  - Perubahan pada fungsi `main()`, `initState()`, atau inisialisasi awal aplikasi *(butuh Hot Restart)*.
  - Modifikasi inisialisasi variabel global atau *static fields* *(butuh Hot Restart)*.
  - Perubahan tipe *constructor* widget, struktur *enum*, atau konversi `StatelessWidget` $\leftrightarrow$ `StatefulWidget` *(butuhHot Restart)*.
  - Penambahan *assets* baru atau dependensi pustaka di `pubspec.yaml` *(butuh Full Restart)*.
  - Perubahan kode *native* pada folder `android/` atau `ios/` *(butuh Full Restart)*.


## D. AI Disclosure :
- Tool used: Gemini AI
- How it was used: Diskusi dan eksplorasi konsep teknis dalam menyusun jawaban pertanyaan reflektif.


# 21/11/2026 - Tugas 8
## A. Weekly Instruction Step :
> **Prasyarat Versi & Perangkat Lunak**
> - Flutter SDK : Versi 3.22.x atau lebih baru
> - Dart SDK : Versi 3.4.x atau lebih baru
> - Android Studio : Versi 2024.x (Koala / Ladybug):
>   - Android SDK Build-Tools: Versi 34.0.0 / kompatibel
>   - Android SDK Command-line Tools (latest) via SDK Manager
>   - Android SDK Platform-Tools
> - Java Development Kit (JDK): OpenJDK versi 17
> - Visual Studio Code / Android Studio IDE:
>   - Ekstensi Flutter (oleh Dart Code).
>   - Ekstensi Dart (otomatis terpasang bersama Flutter).
> - Web Browser: Google Chrome atau browser lain untuk target
--- 
1. Clone this repository `git clone https://github.com/ke-Vyn/myportofolio_mobile.git` `cd myportofolio_mobile`
2. Ensure Flutter SDK is installed and added to PATH `flutter --version`
3. Install project dependencies `flutter pub get`
4. Run code analysis / linter check `flutter analyze`
5. Run the application:
    - For web (Chrome): `flutter run -d chrome`
    - For web server (any browser): `flutter run -d web-server --web-port 8080`
    - For Android emulator / physical device: `flutter run`
6. If running via web-server, open http://localhost:8080 in any browser

## B. Weekly Updates :
1. Membuat file `lib/screens/education_form.dart` menggunakan `StatefulWidget`, `Form`, dan `GlobalKey<FormState>`. Mengimpmlementasikan 5 elemen input sesuai model edukasi (Nama institusi, jenjang pendidikan, jurusan, tahun mulai/lulus, deskripsi). 
2. Menerapkan validasi input pada form edukasi (menolak input kosong/spasi, validasi rentang tahun 1900–2100, dan pengecekan agar tahun lulus tidak lebih kecil dari tahun mulai).
3. Menambahkan tombol Simpan dengan `AlertDialog` untuk menampilkan ringkasan data valid, dilengkapi tombol Tutup yang sekaligus mereset formulir.
4. Mengintegrasikan tombol aksi baru "Tambah Edukasi" (`Icons.school`) pada `lib/screens/menu.dart` dan mengonfigurasi navigasi `Navigator.push()` di `lib/widgets/project_card.dart`.
5. Menambahkan opsi navigasi "Add Education" menggunakan `Navigator.pushReplacement()` pada `lib/widgets/left_drawer.dart` dan menyematkan komponen `LeftDrawer` ke dalam `EducationFormPage`

## C. Reflection : 
### Assignment 7
1. - `Navigator.push()` --> menambahkan (push) route/halaman baru ke puncak navigation stack. Halaman sebelumnya tetap tersimpan di bawahnya sehingga user dapat kembali dengan menekan tombol back
    - `Navigator.pushReplacement()` -->  mengganti route teratas saat ini dengan route baru. Halaman lama dibuang dari stack sehingga pengguna tidak dapat kembali ke halaman sebelumnya melalui tombol back
    - `Navigator.pop()` -->  menghapus (pop) route teratas dari stack dan kembali menampilkan halaman tepat di bawahnya (biasanya untuk menutup modal dialog atau drawer)
    - Metode yang digunakan pada kartu aksi adalah `Navigator.push()`, karena alurnya bersifat hierarkis dari beranda menuju formulir, sehingga pengguna tetap memiliki opsi kembali ke beranda melalui tombol back bawaan perangkat 
    - Mekanisme opsi Home di drawer --> Menggunakan `Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()))`. Halaman form yang sedang aktif langsung digantikan oleh halaman beranda, mencegah terjadinya penumpukan halaman yang berlebihan pada stack navigasi.

    &nbsp;
    
2. - `Scaffold` berfungsi sebagai root layout dasar berstandar Material Design yang menyediakan slot struktur visual halaman melalui properti `appBar`, `drawer`, dan `body`

    - `AppBar` menstandarkan komponen top bar pada setiap screen, termasuk penyelarasan judul (`title`), ketinggian bayangan (`elevation`), serta penempatan otomatis tombol pemicu drawer (`leading`) maupun back button pada navigation stack

    - `Drawer` berperan sebagai komponen reusable navigation menu (umumnya menampung `ListView` & `ListTile`) yang menyediakan akses routing terpusat dan konsisten di seluruh screen dalam aplikasi.

Contoh Penggunaan Warna Tema Portofolio: Warna `Colors.indigo` digunakan secara konsisten sebagai latar belakang `AppBar` pada halaman utama (`menu.dart`), form proyek (`project_form.dart`), form edukasi (`education_form.dart`), latar belakang `DrawerHeader` (`left_drawer.dart`), serta tombol aksi utama Simpan.

3. - Form menggunakan susunan vertikal (Column di dalam Form) karena alur pengisian data secara intuitif berjalan dari atas ke bawah. Ini memberikan hierarki pembacaan label dan isian yang rapi pada layar perangkat mobile.

    - Widget Pengatur Jarak (`Padding`, `SizedBox`) memberikan margin di sekeliling form agar input tidak menempel ke tepi layar (`insets`) & memberikan jarak terukur antar-elemen input untuk mempermudah fokus sentuhan jari user
    
    - Widget Penggulir (`SingleChildScrollView`) mengantisipasi keterbatasan ruang layar ketika keyboard virtual muncul. Dengan `SingleChildScrollView`, seluruh form tetap dapat digulir dan tombol simpan tetap dapat diakses. Tanpa widget, ruang layar yang menyempit karena keyboard akan memicu error luapan piksel (RenderFlex overflowed) 

    &nbsp;
    
4. - `GlobalKey<FormState>` --> kunci identitas unik yang memberikan akses langsung ke status internal (`FormState`) dari widget `Form`

    - `validator` --> logika pemeriksaan pada masing-masing field input yang mengembalikan pesan kesalahan (string) jika input tidak valid, atau `null` jika valid.

    - `validate()` --> method yang dipicu oleh `_formKey.currentState!.validate()` saat tombol Simpan ditekan untuk mengeksekusi seluruh fungsi validator pada field secara serentak. Jika ada satu saja validator yang tidak mengembalikan null, form dinyatakan gagal divalidasi.

    - Contoh nilai ditolak --> pengisian tahun lulus 2020 & tahun mulai 2024, atau pengisian tahun di luar rentang, contohnya 99999 atau angka negatif.

    - Alasan Memilih Jenis Input/Papan Ketik Saja Belum Cukup --> pengaturan seperti `keyboardType: TextInputType.number` hanya membatasi tampilan tombol keyboard, tetapi tidak dapat mencegah input copy-paste yang tidak sesuai maupun memeriksa logika bisnis (cth: input kosong, rentang nilai, dan relasi tahun lulus >= tahun mulai), sehingga validasi programatik via validator tetap wajib.

## D. AI Disclosure :
- Tool used: Gemini AI
- How it was used: Diskusi konsep arsitektur navigasi Flutter serta manajemen state formulir menggunakan GlobalKey.
