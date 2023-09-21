### Alur setelah mendownload Project ini
1. Extract Zipnya lalu pindah ke folder yg sudah di extract
2. Jalankan perintah composer install
3. Ubah file .env.example menjadi .env dan sesuakan configurasinya
4. Jalankan perintah php artisan key:generate
5. Jalankan perintah php artisan migrate
6. Import database dari file ketuntasan.sql di dalam folder z_db
7. Jalankan perintah php artisan serve

### Password semua akun defaultnya adalah 123456

### Untuk template file excel bisa di cek di folder z_db


### Alur Superadmin

1. Tambah / Import data mapel
1. Tambah / import data guru
1. Tambah data mapel yg di ajar oleh guru
1. Tambah / Import data jurusan
1. Tambah data Kelas
1. Tambah data mapel yg di miliki oleh kelas
1. Tambah kan wali kelas
1. Tambah kan data siswa
1. Tambah Batas Waktu
1. Tambah Data Ketuntasan Siswa

### Alur Superadmin ketika tahun ajaran baru
1. Tambahkan Wali kelas
1. Tambahkan mapel yg di dimiliki oleh kelas
1. Naikkan siswa ke tingkatan berikutnya
1. Tambahkan Batas waktu ketuntasan
1. Tambahkan ketuntasan siswa

<hr>

## Info
1. Apa bila data ketuntasan siswa sudah di buat lalu data tingkatan / kelas siswa tersebut salah maka,ubah tingkatan / kelas menjadi yang benar,setelah itu tambahkan data ketuntasan sesuai tingkatan / kelas siswa tersebut

2. Untuk menaikkan siswa ketingkatan selanjutnya pada tahun ajaran baru,data siswa yg wajib di tingkatkan terlebih dahulu adalah tingkatan tertinggi (XII),supaya data siswa yg sudah di tingkatkan tidak tercampur dengan data siswa yang belum di tingkatkan

3. Jika data ketuntasan siswa sudah di buat lalu ada mapel dari kelas siswa tersebut yang ingin di hapus, maka cukup nonaktifkan <b> Data Kelas mapelnya saja </b>
