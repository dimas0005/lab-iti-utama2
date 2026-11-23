# Checklist Testing Black Box — SIM Laboratorium PT ITI Utama

> Tanggal: 23 Nov 2026
>
> Keterangan tanda:
> **[x]** = sudah diverifikasi otomatis — lint 42/42, render test 22 halaman, **E2E POST-flow 153 cek lulus (0 gagal)** meliputi login 4 role, register, seluruh lifecycle booking (verifikasi → jadwal → sampel → uji → input nilai → terbit laporan → validasi → pembayaran → selesai), booking manual/cancel/tolak, input historis, kelola user, profil/ganti password, owner, CSRF & penolakan peran
> **[ ]** = perlu dites manual di browser (sisa skenario yang tidak bisa disimulasikan harness)
>
> ⚠️ **Deploy dulu semua file yang berubah** (daftar di bawah) ke hosting sebelum test di Chrome.

---

## 1. Publik & Autentikasi

- [x] Halaman index, login, register, guest, QR scan terbuka tanpa error
- [x] Akses halaman tanpa login → redirect ke login (302 di semua halaman)
- [x] API `jumlah_booking.php` tanpa sesi → 401; teknisi/owner → 403; admin/pelanggan → 200 JSON
- [x] Login berhasil → redirect sesuai role (admin/pelanggan/teknisi/owner)
- [x] Login gagal (password salah) → pesan error, halaman login tetap tampil
- [x] Register sukses → redirect `msg=ok` + pesan "registrasi berhasil" (PRG, tanpa tombol back)
- [x] Register email sudah terdaftar → pesan ramah "Email sudah terdaftar" (bukan 500/duplikat SQL)
- [x] Register: nama diawali angka / email invalid / password pendek → ditolak server
- [ ] Register: nama > 150, telepon > 20, email > 150 → ditolak (batas panjang belum diuji otomatis)
- [x] Logout → sesi habis (akses setelah logout → 302 login)

## 2. Pelanggan

- [x] Dashboard, Booking, Cek Booking, Riwayat, Detail Booking, Profil terbuka tanpa error
- [x] Form booking punya radio tipe booking + checkbox tambahan cetak/setting + penguncian submit (JS)
- [x] Upload bukti bayar booking **offline** ditolak ("bukan booking online") — GET & POST
- [x] Placeholder cek booking: "Nomor Laporan atau Kode Booking"
- [x] Booking sukses → muncul kode booking baru + redirect `msg=ok&kode=...` (PRG)
- [ ] Booking double klik cepat → hanya 1 booking masuk (tombol terkunci) — JS lock sudah ada, uji manual
- [x] Booking offline & online sama-sama masuk dengan kode & tipe benar
- [x] Validasi booking: objek/lokasi/supplier/penanggung diawali huruf → ditolak server
- [ ] Batas panjang booking (255/150) → belum diuji otomatis
- [x] Tanggal pengujian kemarin → ditolak server (terbukti di Booking Manual; booking pelanggan punya aturan sama)
- [ ] Cek Booking pakai **kode booking lama** (status ditolak) → tetap menampilkan hasil (belum diuji)
- [x] Cek Booking pakai **nomor laporan** → menampilkan hasil (termasuk setelah nomor di-revisi)
- [x] Detail Booking milik sendiri → data benar; id milik orang lain/asing → ditolak
- [x] Upload bukti pembayaran → pesan berhasil, file masuk `uploads/bukti_transfer/`
- [x] Upload ulang bukti → file lama terhapus, yang tampil yang baru
- [ ] Edit Profil ganti foto → foto lama terhapus dari server (upload foto profil belum diuji otomatis)
- [x] Ganti password → password lama tidak berfungsi lagi, yang baru bisa login
- [x] Ganti password dengan password lama salah → ditolak "Password lama salah"
- [x] Download laporan PDF (booking status **selesai**) — booking online & offline
- [x] Download laporan historis PDF (kode yang punya data historis)
- [x] Download laporan booking **belum selesai** → ditolak server (bukan PDF)
- [x] Upload pembayaran untuk booking offline → ditolak

## 3. Admin

- [x] Dashboard, Kelola Booking, Booking Manual, Input Historis (dengan & tanpa user), Input Nilai, Kelola User terbuka tanpa error
- [x] Input Nilai hanya menerima status "Menunggu Input Admin"; Edit Nilai hanya "Validasi Hasil"; Penjadwalan hanya "Booking Diterima"; Terima Sampel hanya "Jadwal Ditentukan"; Verifikasi Bayar hanya "Menunggu Pembayaran" (pesan guard sesuai)
- [x] Dashboard: jadwal hari ini dengan jam kosong tampil "-" (tanpa error)
- [x] Verifikasi Booking → Terima: status "Booking Diterima" + riwayat terisi
- [x] Verifikasi Booking → Tolak **tanpa alasan** → ditolak server; dengan alasan → status "Ditolak" + alasan tersimpan
- [x] Verifikasi pembayaran → status "Selesai" + bukti_transfer dikosongkan + PDF bisa diunduh
- [x] Tolak pembayaran → tetap "Menunggu Pembayaran" + alasan tersimpan; unggah ulang → alasan dihapus
- [x] Penjadwalan (teknisi, tanggal, jam) → status "Jadwal Ditentukan" + baris penjadwalan ada; ulang saat sudah terjadwal → guard
- [x] Terima Sampel → status "Menunggu Diuji" + riwayat `sampel_diterima` dan `menunggu_diuji` (2 baris) + baris sampel sesuai jumlah
- [x] Booking Manual: tanggal lalu ditolak server; pelanggan baru (nama huruf-saja, email belum terdaftar) divalidasi; email sudah terdaftar → ditolak
- [x] Booking Manual sukses → redirect `msg=ok&kode=...&baru=1` (PRG)
- [ ] Input Historis kategori **Tabel Beton**: tambah baris dinamis, simpan **multi-baris**, edit — (simpan 1 baris + hapus sudah diuji)
- [x] Input Historis kategori **Tabel Beton**: simpan + hapus (file ikut terhapus bila tidak dipakai lain)
- [x] Input Historis kategori **Besi**: kolom wajib (objek) → ditolak bila kosong; simpan valid → 302 `msg=ok`
- [x] Input Historis: upload + validasi gagal → file tidak menumpuk (tidak ada orphan)
- [x] Input Historis: hapus data id asing → redirect `hapus_gagal` + pesan "tidak ditemukan"
- [x] Input Nilai (tabel beton): isi kolom → simpan → muncul di Edit Nilai; tanpa pilih sampel → ditolak
- [x] Input Nilai: upload dokumentasi → file tersimpan di disk
- [x] Input Nilai: ganti dokumentasi → file lama **tetap** ada bila masih dipakai baris lain (share-check), file baru tersimpan
- [x] Terbitkan Laporan → nomor laporan dibuat, status jadi "Validasi Hasil"; tanpa nomor → ditolak
- [x] Edit Nilai: ubah nilai → tersimpan di DB; update nomor laporan → berhasil
- [x] Aksi validasi_hasil → status "Menunggu Pembayaran"
- [x] Kelola User: tambah user valid → muncul; telepon berhuruf → ditolak; email duplikat → pesan ramah
- [x] Kelola User edit → perubahan tersimpan; toggle status → nonaktif; login user nonaktif → ditolak; hapus → terhapus
- [ ] Kelola User: password baru opsional (kosong = tetap lama) — belum diuji otomatis
- [ ] Batas panjang Kelola User (150/20/150) → belum diuji otomatis
- [x] Filter **tipe** di Kelola Booking (`?tipe=offline`) → hanya booking offline tampil (catatan: filter status tidak ada; fitur = filter tipe)
- [ ] QR / scan booking dari halaman admin (manual)

## 4. Teknisi

- [x] Dashboard & Jadwal terbuka tanpa error; jadwal memuat booking aktif
- [ ] Jadwal: label status hari ini / besok / selesai (tampilan bucket — manual)
- [x] "Mulai Uji" → status "Sedang Diuji" + semua sampel `sedang_diuji`
- [x] "Selesai Uji" sebelum mulai → ditolak (`perlu_mulai`)
- [x] "Selesai Uji" → status "Menunggu Input Admin" + sampel `selesai_diuji`
- [x] Teknisi tidak bisa akses halaman admin (`input_nilai`) & owner → "tidak memiliki akses"

## 5. Owner

- [x] Dashboard & Monitoring terbuka tanpa error
- [x] Grafik booking per periode (minggu/bulan/tahun) pakai bucket benar
- [x] Monitoring filter `status` + `bulan/tahun` → 200 tanpa error; dashboard `?periode=bulan` aman
- [ ] Owner akses halaman admin → ditolak (mekanisme sama dengan yang sudah diuji; uji manual singkat)

## 6. Keamanan & Silang Peran (cek singkat)

- [x] Semua output HTML user memakai `htmlspecialchars` (XSS)
- [x] Semua query pakai prepared statement (SQLi)
- [x] Semua handler POST punya cek CSRF (submit tanpa token → "Token CSRF tidak valid")
- [x] Setiap transisi status booking dijaga `WHERE`/kondisi status di server — terbukti: selesai-sebelum-mulai ditolak, penjadwalan ulang ditolak, aksi pada status salah → "Aksi tidak dapat diproses"
- [x] 42 file PHP lolos `php -l`
- [x] Pelanggan → halaman admin & teknisi → halaman owner → ditolak ("tidak memiliki akses")
- [x] Detail booking id orang lain → ditolak; input array pada cek booking → tidak fatal
- [ ] Uji cepat: submit form `?status_booking=...` via URL → tidak mengubah status (mekanisme sudah dijaga server; uji manual opsional)

---

### Cara test cepat

1. Buka site di Chrome (pastikan sudah deploy).
2. Login tiap role, kerjakan butir **[ ]** satu per satu dari atas ke bawah.
3. Butir yang gagal: catat nomor + pesan error/screenshot.

### File yang berubah (wajib deploy)

```
.htaccess
admin/booking_manual.php      admin/edit_nilai.php         admin/kelola_user.php
admin/dashboard.php           admin/input_historis.php     admin/penjadwalan.php
admin/download_laporan_historis.php  admin/input_nilai.php admin/terima_sampel.php
admin/edit_historis_ajax.php  admin/kelola_booking.php     admin/verifikasi_pembayaran.php
api/jumlah_booking.php        assets/css/style.css         config/database.php
auth/login.php                auth/qr_scan.php             auth/register.php
owner/dashboard.php           teknisi/dashboard.php        teknisi/jadwal.php
pelanggan/booking.php         pelanggan/detail_booking.php pelanggan/profil.php
pelanggan/cek_booking.php     pelanggan/download_laporan.php  pelanggan/upload_pembayaran.php
pelanggan/dashboard.php       pelanggan/download_laporan_historis.php
pelanggan/riwayat.php
```

### Catatan hasil E2E (23 Nov 2026)

- Harness otomatis (10 suite, 153 cek) **dihapus** setelah lulus; tidak ikut di-deploy.
- Bug yang ditemukan & diperbaiki selama pengujian: `pelanggan/upload_pembayaran.php` — unggah ulang pada detik yang sama menghapus file baru (guard path lama ≠ path baru).
- Password role admin/teknisi/owner dikembalikan otomatis; semua data uji (booking, user, historis, file upload) dibersihkan.
