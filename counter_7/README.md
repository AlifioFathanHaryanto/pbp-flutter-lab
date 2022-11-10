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
- Ketiga, saya membuat if else pada fungsi _decrementCounter dan _incrementCounter untuk mengiidentifikasi apakah angka pada _counter adalah genap atau ganjil. Saat _counter dimodulo dengan 2 hasilnya bukan 0, maka akan maka variabel temp akan berisi "GANJIL". Jika tidak masuk ke if condition, maka akan masuk ke else condition dan temp akan berisi "GENAP" Karena value dari _counter bernilai 0 saat dimodulo 2.
- Keempat,  saya menggunakan widget Text dengan mengimplementasikan TextStyle untuk memberikan warna pada teks. Dimana saat _counter adalah ganjil, maka warna tulisan "GANJIL" akan menjadi biru. Sementara itu, saat _counter adalah genap, maka warna tulisan "GENAP" akan menjadi merah.



