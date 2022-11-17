# counter_7

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

README TUGAS 8 PBP
1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement!
- Navigator.push berfungsi untuk melakukan penambahan rute ke halaman selanjutnya (baru) yang akan muncul di atas tumpukan tampilan layar sebelumnya.
- Navigator.pushReplacement berfungsi untuk melakukan penambahan rute tampilan ke halaman selanjutnya. Namun, saat halaman selanjutnya muncul, halaman sebelumnya akan dihapus karena tampilan layar digantikan dengan halaman yang baru.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Widget Text, untuk menampilkan segala text pada halaman, seperti text "Form".
- Widget Column, untuk melakukan pengaturan tata letak jarak vertikal pada elemen-elemen yang ingin diatur letaknya di halaman form.
- Widget DropdownButton, berfungsi untuk membuat beberapa pilihan input, misal pada pilih jenis di halaman form.
- Widget Scaffold, untuk menggunakan parameter AppBar, Drawer, dll.
- Widget Padding, menambah jarak di antara container dan widget.
- Widget Row, untuk melakukan pengaturan tata letak jarak secara horizontal pada elemen-elemen yang ingin diatur letak tampilannya pada halaman counter_7.

3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- onChanged()
- onSaved()
- onHover()
- onTap()
- onPresent()

4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator bereperan penting dalam perpindahan layar, widget navigator akan melakukan pengaturan pergantian layar/halaman dengan logic yang sudah diberikan oleh programmer. Cara kerja navigator dapat diibaratkan seperti stack yang melakukan penyimpanan page. Saat user melakukan event yang menyebabkan terbukanya page baru, page baru tersebut akan masuk ke stack yang kemudian menimpa previous page. 

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Melakukan penambahan drawer/hamburger dengan widget drawer dengan 3 pilihan dan akan diarahkan menuju page Counter_7, Tambah Budget, atau Data Budget.
- Membuat file form.dart untuk membuat form agar user dapat memasukkan input judul, nominal, dan pilih jenis. Pada file ini, diimplementasikan TextFormField serta Dropdown. Kemudian, diinisiasi pula variabel _nominalItem, _titleItem, dan _pilihJenis.
- Membuat file appearData.dart untuk melakukan penampilan data apa saja yang telah diinput user pada form.



README Tugas 7 PBP

Nama   : Alifio Fathan Haryanto
NPM    : 2106653483

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
- Stateless widget merupakan widget yang menampilkan suatu hal dengan statis (Hanya mempunyai properti akhir yang dideklarasikan saat konstruksi). 
- Stateful widget merupakan widget yang dapat menampilkan suatu widget yang bersifat dinamis. Stateful widget bisa diberikan perubahan seperti diperbaharui saat adanya action yang diberikan oleh user.

Kesimpulan perbedaan :
Jadi, stateless widget tampilan dari stateless widget tidak akan berubah karena tidak adanya mekanisme yang bisa mengecek state dari perubahan widget pada aplikasi. Sementara itu, pada stateful widget dapat terjadi perubahan tampilan widget (bersifat dinamis).

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Widget Text untuk melakukan perubahan pada text, contohnya saya menggunakan widget tersebut untuk mengubah warna dari text "GANJIL" menjadi biru dan "GENAP" menjadi merah
- Widget Padding berfungsi untuk melakukan penambahan jarak di antara widget dan container.
- Widget Visibility untuk mengatur kemunculan suatu tombol atau apapun, pada tugas ini saya menggunakannya untuk melakukan pengaturan tombol decrement (-) yang hanya akan muncul saat angka dalam _counter lebih besar dari 0 (dimulai dari 1).
- Widget FloatingActionButton untuk membuat tombol melayang berbentuk lingkaran, pada tugas ini saya menggunakannya untuk membuat tombol melayang (+) dan (-).

3.  Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() digunakan pada statefull widget yang berperan dalam melakukan pemberitahuan kepada widget ketika terdapat perubahan objek pada state. Dengan itu, aplikasi dapat langsung melakukan pemuatan kembali widget agar dapat menampilkan widget dengan perubahan yang tadi dilakukan. Pada tugas saya, setState() yang berada pada fungsi _decrementCounter() dan _incrementCounter() akan berdampak pada variabel _counter yang akan melakukan penambahan angka (saat increment) dan pengurangan angka saat (decrement). 

4. Jelaskan perbedaan antara const dengan final.
const dan final sama sama bisa kita gunakan untuk menginisiasi variabel yang immutable. Namun, terdapat perbedaan antara keduanya. Variabel const memiliki value secara eksplisit yang konstan dan harus dilakukan inisiasi saat kompilasi variabel. Sementara itu, variabel final tidak mewajibkan programmer untuk melakukan pemberian value secara eksplisit ketika kompilasi variabel dijalankan, sehingga variabel final dapat dikompilasi walaupun value nya belum diketahui.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- Pertama, saya membuat fungsi _decrementCounter yang akan melakukan decrement pada variabel _counter, untuk _incrementCounter sudah tersedia dari template awal aplikasi Flutter.
- Kedua, saya membuat floating action button, yang terdiri atas tombol increment (+) dan tombol decrement (-). Dalam mengimplementasikan floating action button untuk decrement, saya menggunakan widget visibility untuk memberikan pembatasan kemunculan, dimana tombol decrement hanya akan muncul saat value dari _counter lebih besar dari 0.
- Ketiga, saya membuat if else pada widget build untuk mengiidentifikasi apakah angka pada _counter adalah genap atau ganjil. Lalu, return menggunakan widget Text. Saat _counter dimodulo dengan 2 hasilnya bukan 0, maka akan menggunakan widget Text untuk menampilkan "GANJIL" dan menggunakan widget TextStyle untuk memberi warna biru pada teks "GANJIL". Jika tidak masuk ke if condition, maka akan masuk ke else condition dan akan menggunakan widget Text untuk menampilkan "GENAP" dan menggunakan widget TextStyle untuk memberi warna merah pada teks "GENAP".

Alifio Fathan Haryanto - 2106653483



