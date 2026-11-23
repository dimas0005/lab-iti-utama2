-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2026 at 06:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lab_iti_utama`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_booking` varchar(30) NOT NULL COMMENT 'Contoh: BK-20260716-0001',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Pelanggan yang melakukan booking',
  `jenis_pengujian_id` bigint(20) UNSIGNED NOT NULL,
  `penanggung_jawab` varchar(150) NOT NULL,
  `jumlah_sampel` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `tanggal_pengujian_diminta` date NOT NULL,
  `dokumen_persyaratan` varchar(255) DEFAULT NULL COMMENT 'Path file dokumen yang diunggah',
  `estimasi_biaya` decimal(12,2) NOT NULL DEFAULT 0.00,
  `catatan_pelanggan` text DEFAULT NULL,
  `objek_pengujian` varchar(255) DEFAULT NULL,
  `proyek` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `tipe_booking` enum('online','offline') NOT NULL DEFAULT 'online',
  `bukti_transfer` varchar(255) DEFAULT NULL COMMENT 'Path file bukti transfer pembayaran',
  `status_booking` enum('menunggu_verifikasi','menunggu_pembayaran','pembayaran_diverifikasi','booking_diterima','jadwal_ditentukan','sampel_diterima','menunggu_diuji','sedang_diuji','menunggu_input_admin','validasi_hasil','selesai','ditolak') NOT NULL DEFAULT 'menunggu_verifikasi',
  `alasan_ditolak` text DEFAULT NULL,
  `diverifikasi_oleh` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin yang memverifikasi',
  `diverifikasi_pada` timestamp NULL DEFAULT NULL,
  `diverifikasi_pembayaran_oleh` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_pembayaran` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mutu_beton` varchar(20) DEFAULT NULL,
  `sample_berat` decimal(10,2) DEFAULT NULL,
  `sample_diameter` decimal(10,2) DEFAULT NULL,
  `sample_tinggi` decimal(10,2) DEFAULT NULL,
  `sample_bentang_l` decimal(10,2) DEFAULT NULL,
  `sample_dimensi_b` decimal(10,2) DEFAULT NULL,
  `sample_dimensi_h` decimal(10,2) DEFAULT NULL,
  `sample_jenis_baja` varchar(20) DEFAULT NULL,
  `sample_panjang` decimal(10,2) DEFAULT NULL,
  `tambahan_cetak` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Pemotongan, Setting & Cetak Benda Uji (+250.000)',
  `tambahan_setting` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `kode_booking`, `user_id`, `jenis_pengujian_id`, `penanggung_jawab`, `jumlah_sampel`, `tanggal_pengujian_diminta`, `dokumen_persyaratan`, `estimasi_biaya`, `catatan_pelanggan`, `objek_pengujian`, `proyek`, `lokasi`, `supplier`, `tipe_booking`, `bukti_transfer`, `status_booking`, `alasan_ditolak`, `diverifikasi_oleh`, `diverifikasi_pada`, `diverifikasi_pembayaran_oleh`, `tanggal_pembayaran`, `created_at`, `updated_at`, `mutu_beton`, `sample_berat`, `sample_diameter`, `sample_tinggi`, `sample_bentang_l`, `sample_dimensi_b`, `sample_dimensi_h`, `sample_jenis_baja`, `sample_panjang`, `tambahan_cetak`, `tambahan_setting`) VALUES
(270, 'ITI-U/X/26/BTN/UT/01', 28, 5, 'PT. TUNAS KARYA ADITAMA', 3, '2026-10-27', 'uploads/dokumen/dok_1793082601_6ae044e9c2dac.png', 1250000.00, '', 'who', NULL, 'who', '18', 'online', NULL, 'ditolak', '.', 6, '2026-10-27 06:31:58', NULL, NULL, '2026-10-27 06:30:01', '2026-10-27 06:31:58', 'K-350', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(271, 'ITI-U/X/26/BTN/UT/02', 29, 5, 'PT. ETONA CEMERLANG ABADI', 3, '2026-10-28', 'uploads/dokumen/dok_1793082646_6ae045160ea7e.png', 1250000.00, '', 'who', NULL, 'who', '18', 'online', NULL, 'ditolak', '.', 6, '2026-10-27 06:32:04', NULL, NULL, '2026-10-27 06:30:46', '2026-10-27 06:32:04', 'K-275', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(272, 'ITI-U/X/26/BTN/UT/03', 30, 5, 'PT. GRAHA PONDASI', 3, '2026-10-27', NULL, 1250000.00, '', 'who', NULL, 'who', 'who', 'online', NULL, 'ditolak', '.', 6, '2026-10-27 06:31:54', NULL, NULL, '2026-10-27 06:31:15', '2026-10-27 06:31:54', 'K-250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(273, 'ITI-U/X/26/BTN/UT/04', 29, 1, 'PT. ETONA CEMERLANG ABADI', 6, '2026-10-27', NULL, 350000.00, '', 'who', NULL, 'who', 'who', 'online', NULL, 'menunggu_input_admin', NULL, 6, '2026-10-27 11:29:12', NULL, NULL, '2026-10-27 11:28:48', '2026-10-27 11:29:44', 'K-275', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(274, 'ITI-U/X/26/BTN/UT/05', 28, 11, 'PT. TUNAS KARYA ADITAMA', 6, '2026-10-29', 'uploads/dokumen/dok_1793268285_6ae31a3dae24c.png', 350000.00, '', 'who', NULL, 'who', 'who', 'online', NULL, 'ditolak', 'scam', 6, '2026-10-29 10:05:35', NULL, NULL, '2026-10-29 10:04:45', '2026-10-29 10:06:46', 'K-250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(275, 'ITI-U/X/26/BTN/UT/06', 28, 11, 'PT. TUNAS KARYA ADITAMA', 6, '2026-10-29', NULL, 350000.00, '', 'who', NULL, 'who', 'who', 'online', NULL, 'menunggu_input_admin', NULL, 6, '2026-10-29 10:07:58', NULL, NULL, '2026-10-29 10:07:35', '2026-10-29 10:12:25', 'K-275', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_pengujian`
--

CREATE TABLE `hasil_pengujian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sampel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `teknisi_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kode` varchar(100) DEFAULT NULL,
  `jenis_pengujian` varchar(100) DEFAULT NULL,
  `parameter_uji` varchar(150) DEFAULT NULL COMMENT 'Contoh: Kuat tekan, kadar air, dsb',
  `tgl_cor` date DEFAULT NULL,
  `tgl_ditest` date DEFAULT NULL,
  `umur_hari` int(11) DEFAULT NULL,
  `berat_kg` decimal(8,3) DEFAULT NULL,
  `diameter` decimal(8,2) DEFAULT NULL,
  `luas_penampang` decimal(10,2) DEFAULT NULL,
  `kode_beton` varchar(255) DEFAULT NULL,
  `mutu_beton` varchar(20) DEFAULT NULL,
  `beban_maksimum` decimal(10,2) DEFAULT NULL,
  `tegangan_tekan` decimal(10,3) DEFAULT NULL,
  `tegangan_tekan_28_hari` decimal(10,3) DEFAULT NULL,
  `mpa` decimal(10,2) DEFAULT NULL,
  `tegangan_tarik` decimal(10,2) DEFAULT NULL,
  `tegangan_leleh` decimal(10,2) DEFAULT NULL,
  `perpanjangan` decimal(5,2) DEFAULT NULL,
  `reduksi_penampang` decimal(5,2) DEFAULT NULL,
  `nilai_hasil` varchar(100) DEFAULT NULL,
  `satuan` varchar(30) DEFAULT NULL,
  `kesimpulan` enum('memenuhi_syarat','tidak_memenuhi_syarat') DEFAULT NULL,
  `dokumentasi_file` varchar(255) DEFAULT NULL COMMENT 'Path foto/dokumentasi pengujian',
  `catatan_teknisi` text DEFAULT NULL,
  `status_verifikasi` enum('belum_diverifikasi','terverifikasi','perlu_revisi') NOT NULL DEFAULT 'belum_diverifikasi',
  `diverifikasi_oleh` bigint(20) UNSIGNED DEFAULT NULL,
  `diverifikasi_pada` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kode_benda_uji` varchar(100) DEFAULT NULL COMMENT 'Kode Benda Uji',
  `diameter_akhir` decimal(10,2) DEFAULT NULL COMMENT 'D0u diameter setelah patah (mm)',
  `luas_penampang_akhir` decimal(10,2) DEFAULT NULL COMMENT 'Au luas penampang setelah patah (mm2)',
  `beban_tarik_leleh` decimal(10,2) DEFAULT NULL COMMENT 'Beban Tarik kN - Leleh (kN)',
  `panjang_awal` decimal(10,2) DEFAULT NULL COMMENT 'Panjang awal L0 (mm)',
  `panjang_akhir` decimal(10,2) DEFAULT NULL COMMENT 'Panjang akhir Lu (mm)',
  `supplier` varchar(255) DEFAULT NULL,
  `objek` varchar(255) DEFAULT NULL,
  `proyek` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `rata_rata` decimal(10,2) DEFAULT NULL COMMENT 'Rata-rata (Kg/cm2) - input manual',
  `bentang_l` decimal(10,2) DEFAULT NULL COMMENT 'Bentang L (Cm)',
  `dimensi_b` decimal(10,2) DEFAULT NULL COMMENT 'Dimensi b (Cm)',
  `dimensi_h` decimal(10,2) DEFAULT NULL COMMENT 'Dimensi h (Cm)',
  `modulus_seksi` decimal(12,4) DEFAULT NULL COMMENT 'W = 1/6.b.h2 (Cm3)',
  `momen_lentur` decimal(12,2) DEFAULT NULL COMMENT 'Momen Lentur M = 1/6.P.L (KgCm)',
  `tegangan_lentur` decimal(10,2) DEFAULT NULL COMMENT 'Tegangan Lentur (M/W) (Kg/cm2)',
  `tinggi_l` decimal(10,2) DEFAULT NULL COMMENT 'Tinggi (L) Cm',
  `rasio_ld` decimal(10,4) DEFAULT NULL COMMENT 'L/D',
  `faktor_koreksi` decimal(10,4) DEFAULT NULL COMMENT 'Faktor Koreksi C',
  `tegangan_benda_uji` decimal(10,3) DEFAULT NULL,
  `konversi_silider6` decimal(10,3) DEFAULT NULL,
  `konversi_kubus15` decimal(10,3) DEFAULT NULL,
  `konversi_umur28` decimal(10,3) DEFAULT NULL,
  `konversi_umur28_mpa` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hasil_pengujian`
--

INSERT INTO `hasil_pengujian` (`id`, `sampel_id`, `teknisi_id`, `user_id`, `kode`, `jenis_pengujian`, `parameter_uji`, `tgl_cor`, `tgl_ditest`, `umur_hari`, `berat_kg`, `diameter`, `luas_penampang`, `kode_beton`, `mutu_beton`, `beban_maksimum`, `tegangan_tekan`, `tegangan_tekan_28_hari`, `mpa`, `tegangan_tarik`, `tegangan_leleh`, `perpanjangan`, `reduksi_penampang`, `nilai_hasil`, `satuan`, `kesimpulan`, `dokumentasi_file`, `catatan_teknisi`, `status_verifikasi`, `diverifikasi_oleh`, `diverifikasi_pada`, `created_at`, `updated_at`, `kode_benda_uji`, `diameter_akhir`, `luas_penampang_akhir`, `beban_tarik_leleh`, `panjang_awal`, `panjang_akhir`, `supplier`, `objek`, `proyek`, `lokasi`, `rata_rata`, `bentang_l`, `dimensi_b`, `dimensi_h`, `modulus_seksi`, `momen_lentur`, `tegangan_lentur`, `tinggi_l`, `rasio_ld`, `faktor_koreksi`, `tegangan_benda_uji`, `konversi_silider6`, `konversi_kubus15`, `konversi_umur28`, `konversi_umur28_mpa`) VALUES
(197, NULL, 6, 28, '213/UT/ITI-U/VIII/26', 'Uji Tekan Kubus (15x15 Cm)', 'Kuat Tekan', '2026-07-24', '2026-08-07', 14, 7.710, NULL, NULL, 'PT.TKAD/Pondasi Tower TB/Leg A', 'K-275', 60232.00, 267.700, 304.200, NULL, NULL, NULL, NULL, NULL, '304.2', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-19 08:49:06', '2026-10-19 08:20:01', '2026-10-19 08:49:06', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. TUNAS KARYA ADITAMA', NULL, 'RE-ROUTE TOWER SUTT 150kV CILEGON BARU – KRAKATAU POSCO', 'CILEGON BARU – KRAKATAU POSCO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, NULL, 6, 28, '213/UT/ITI-U/VIII/26', 'Uji Tekan Kubus (15x15 Cm)', 'Kuat Tekan', '2026-07-24', '2026-08-07', 14, 7.790, NULL, NULL, 'PT.TKAD/Pondasi Tower TB/Leg B', 'K-275', 57309.00, 254.710, 289.440, NULL, NULL, NULL, NULL, NULL, '289.44', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-19 08:49:06', '2026-10-19 08:20:01', '2026-10-19 08:49:06', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. TUNAS KARYA ADITAMA', NULL, 'RE-ROUTE TOWER SUTT 150kV CILEGON BARU – KRAKATAU POSCO', 'CILEGON BARU – KRAKATAU POSCO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, NULL, 6, 28, '213/UT/ITI-U/VIII/26', 'Uji Tekan Kubus (15x15 Cm)', 'Kuat Tekan', '2026-07-24', '2026-08-07', 14, 7.830, NULL, NULL, 'PT.TKAD/DPT BP TC', 'K-275', 60184.00, 267.490, 303.960, NULL, NULL, NULL, NULL, NULL, '303.96', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-19 08:49:06', '2026-10-19 08:20:01', '2026-10-19 08:49:06', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. TUNAS KARYA ADITAMA', NULL, 'RE-ROUTE TOWER SUTT 150kV CILEGON BARU – KRAKATAU POSCO', 'CILEGON BARU – KRAKATAU POSCO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, NULL, 6, 28, '213/UT/ITI-U/VIII/26', 'Uji Tekan Kubus (15x15 Cm)', 'Kuat Tekan', '2026-07-24', '2026-08-07', 14, 7.820, NULL, NULL, 'PT.TKAD/DPT BP TC', 'K-275', 55869.00, 248.310, 282.170, NULL, NULL, NULL, NULL, NULL, '282.17', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-19 08:49:06', '2026-10-19 08:20:01', '2026-10-19 08:49:06', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. TUNAS KARYA ADITAMA', NULL, 'RE-ROUTE TOWER SUTT 150kV CILEGON BARU – KRAKATAU POSCO', 'CILEGON BARU – KRAKATAU POSCO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, NULL, 6, 28, '213/UT/ITI-U/VIII/26', 'Uji Tekan Kubus (15x15 Cm)', 'Kuat Tekan', '2026-07-24', '2026-08-07', 14, 7.840, NULL, NULL, 'PT.TKAD/DPT BP TC', 'K-275', 54830.00, 243.690, 276.920, NULL, NULL, NULL, NULL, NULL, '276.92', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-19 08:49:06', '2026-10-19 08:20:01', '2026-10-19 08:49:06', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. TUNAS KARYA ADITAMA', NULL, 'RE-ROUTE TOWER SUTT 150kV CILEGON BARU – KRAKATAU POSCO', 'CILEGON BARU – KRAKATAU POSCO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, NULL, 6, 28, '213/UT/ITI-U/VIII/26', 'Uji Tekan Kubus (15x15 Cm)', 'Kuat Tekan', '2026-07-24', '2026-08-07', 14, 7.860, NULL, NULL, 'PT.TKAD/DPT BP TC', 'K-275', 55479.00, 246.570, 280.200, NULL, NULL, NULL, NULL, NULL, '280.2', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-19 08:49:06', '2026-10-19 08:20:01', '2026-10-19 08:49:06', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. TUNAS KARYA ADITAMA', NULL, 'RE-ROUTE TOWER SUTT 150kV CILEGON BARU – KRAKATAU POSCO', 'CILEGON BARU – KRAKATAU POSCO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, NULL, 6, 28, '213/UT/ITI-U/VIII/26', 'Uji Tekan Kubus (15x15 Cm)', 'Kuat Tekan', '2026-07-24', '2026-08-07', 14, 7.840, NULL, NULL, 'PT.TKAD/DPT BP TC', 'K-275', 55232.00, 245.480, 278.950, NULL, NULL, NULL, NULL, NULL, '278.95', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-19 08:49:06', '2026-10-19 08:20:01', '2026-10-19 08:49:06', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. TUNAS KARYA ADITAMA', NULL, 'RE-ROUTE TOWER SUTT 150kV CILEGON BARU – KRAKATAU POSCO', 'CILEGON BARU – KRAKATAU POSCO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, NULL, 6, 28, '213/UT/ITI-U/VIII/26', 'Uji Tekan Kubus (15x15 Cm)', 'Kuat Tekan', '2026-07-24', '2026-08-07', 14, 7.800, NULL, NULL, 'PT.TKAD/DPT BP TC', 'K-275', 56452.00, 250.900, 285.110, NULL, NULL, NULL, NULL, NULL, '285.11', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-19 08:49:06', '2026-10-19 08:20:01', '2026-10-19 08:49:06', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. TUNAS KARYA ADITAMA', NULL, 'RE-ROUTE TOWER SUTT 150kV CILEGON BARU – KRAKATAU POSCO', 'CILEGON BARU – KRAKATAU POSCO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, NULL, 6, 30, '214/UTB/ITI-U/X/21', 'Uji Tekuk Baja Tulangan', NULL, NULL, '2021-10-25', NULL, NULL, 10.00, 78.50, NULL, NULL, 58.50, NULL, NULL, NULL, 745.22, 477.71, 30.67, 15.00, NULL, NULL, NULL, NULL, 'Baik\nTidak Retak', 'terverifikasi', 6, '2026-10-24 08:15:24', '2026-10-21 09:55:20', '2026-10-24 08:15:24', 'IS D 10', 8.50, 56.72, 37.50, 150.00, 196.00, '-', 'Besi D 10, D 22', 'Fly Over Kadusuirung Cisauk', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, NULL, 6, 30, '214/UTB/ITI-U/X/21', 'Uji Tekuk Baja Tulangan', NULL, NULL, '2021-10-25', NULL, NULL, 10.00, 78.50, NULL, NULL, 57.80, NULL, NULL, NULL, 736.31, 473.89, 30.00, 16.00, NULL, NULL, NULL, NULL, '-', 'terverifikasi', 6, '2026-10-24 08:15:24', '2026-10-21 09:55:20', '2026-10-24 08:15:24', 'IS D 10', 8.40, 55.39, 37.20, 150.00, 195.00, '-', 'Besi D 10, D 22', 'Fly Over Kadusuirung Cisauk', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, NULL, 6, 30, '214/UTB/ITI-U/X/21', 'Uji Tekuk Baja Tulangan', NULL, NULL, '2021-10-25', NULL, NULL, 16.00, 200.96, NULL, NULL, 150.90, NULL, NULL, NULL, 750.90, 486.66, 31.33, 16.25, NULL, NULL, NULL, NULL, 'Baik\nTidak Retak', 'terverifikasi', 6, '2026-10-24 08:15:24', '2026-10-21 09:55:20', '2026-10-24 08:15:24', 'IS D 22', 13.40, 140.95, 97.80, 150.00, 197.00, '-', 'Besi D 10, D 22', 'Fly Over Kadusuirung Cisauk', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, NULL, 6, 30, '214/UTB/ITI-U/X/21', 'Uji Tekuk Baja Tulangan', NULL, NULL, '2021-10-25', NULL, NULL, 16.00, 200.96, NULL, NULL, 160.80, NULL, NULL, NULL, 800.16, 488.65, 32.00, 15.63, NULL, NULL, NULL, NULL, '-', 'terverifikasi', 6, '2026-10-24 08:15:24', '2026-10-21 09:55:20', '2026-10-24 08:15:24', 'IS D 22', 13.50, 143.07, 98.20, 150.00, 198.00, '-', 'Besi D 10, D 22', 'Fly Over Kadusuirung Cisauk', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-09-01', '2026-09-16', 15, 12.680, NULL, NULL, 'Fc 30 Mpa. Slump 12+-2 SLF - BM/S1 (As A s/d B- As 4 s/d 1).', NULL, 44183.00, 301.390, 338.640, 24.50, NULL, NULL, NULL, NULL, '24.5', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-09-01', '2026-09-16', 15, 12.620, NULL, NULL, 'PL - BM/PL2 (As A s/d B-As4 s/d 1).', NULL, 46160.00, 314.870, 353.790, 25.60, NULL, NULL, NULL, NULL, '25.6', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-09-05', '2026-09-16', 11, 12.550, NULL, NULL, 'Fc 30 Mpa. Slump 12+-2 PC/ P3 (As B - As 1a s/d 1b).', NULL, 34998.00, 238.740, 305.680, 19.40, NULL, NULL, NULL, NULL, '19.4', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-09-05', '2026-09-16', 11, 12.790, NULL, NULL, 'SLF/ S1 (As B - As 1a s/d 1b).', NULL, 35729.00, 243.720, 312.060, 19.80, NULL, NULL, NULL, NULL, '19.8', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-09-09', '2026-09-16', 7, 12.550, NULL, NULL, 'FC 30 Mpa. Slump 12+-2 KLM - BM/K4A (As C - As 1a)', NULL, 35262.00, 240.540, 370.060, 19.60, NULL, NULL, NULL, NULL, '19.6', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-09-09', '2026-09-16', 7, 12.520, NULL, NULL, 'KLM - L2/K4A (As G s/d H - As 3 s/d 1).', NULL, 33007.00, 225.150, 346.390, 18.30, NULL, NULL, NULL, NULL, '18.3', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-08-16', '2026-09-16', 31, 12.530, NULL, NULL, 'FC 30 Mpa. slump 12+-2 PC/ P1 (As B - As 1).', NULL, 54780.00, 373.670, 373.670, 30.40, NULL, NULL, NULL, NULL, '30.4', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-08-16', '2026-09-16', 31, 12.930, NULL, NULL, 'SLF/S1 (As B s/d D - As 1 s/d 2).', NULL, 55519.00, 378.710, 378.710, 30.80, NULL, NULL, NULL, NULL, '30.8', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-08-19', '2026-09-16', 28, 13.090, NULL, NULL, 'FC 30 Mpa. slump 12+-2 DDG-BM/DPT (As F s/d D - As 1b)', NULL, 55317.00, 377.330, 377.330, 30.70, NULL, NULL, NULL, NULL, '30.7', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, NULL, 6, 29, '246/UT/ITI-U/IX/26', 'Uji Tekan Silinder (ø15x30 Cm)', 'Kuat Tekan', '2026-08-19', '2026-09-16', 28, 12.830, NULL, NULL, 'KLM-BM/K1A (As C - As 3 s/d 1).', NULL, 56299.00, 384.030, 384.030, 31.20, NULL, NULL, NULL, NULL, '31.2', 'MPa', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 07:25:18', '2026-10-23 07:22:57', '2026-10-23 07:25:18', NULL, NULL, NULL, NULL, NULL, NULL, 'PT. KARYA MANDIRI READYMIX', NULL, 'Pembangunan Gedung IGD Maternal, Hemodialisasi dan Rawat Inap RSUD Balaraja Kabupaten Tangerang Tahap 1', 'Kab. Tangerang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, NULL, 6, 71, '247/UT/ITI-U/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-09-17', NULL, 1.970, 10.00, 78.50, '1. STA0+036', NULL, 15476.50, NULL, NULL, 16.49, NULL, NULL, NULL, NULL, '171.523', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:16:25', '2026-10-23 19:15:11', '2026-10-23 19:20:57', NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'Pembangunan Jalan Warungbaseum – Cibogo Desa Malingping Utara Kec. Malingping', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 1.0000, 0.8700, 171.523, 164.926, 198.705, 198.705, 16.49),
(251, NULL, 6, 71, '247/UT/ITI-U/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-09-17', NULL, 1.915, 10.00, 78.50, '2. STA0+110', NULL, 15120.50, NULL, NULL, 16.11, NULL, NULL, NULL, NULL, '167.577', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:16:25', '2026-10-23 19:15:11', '2026-10-23 19:16:25', NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'Pembangunan Jalan Warungbaseum – Cibogo Desa Malingping Utara Kec. Malingping', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 1.0000, 0.8700, 167.577, 161.132, 194.135, 194.135, 16.11),
(252, NULL, 6, 71, '247/UT/ITI-U/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-09-17', NULL, 1.960, 10.00, 78.50, '3. STA0+182', NULL, 16691.30, NULL, NULL, 17.79, NULL, NULL, NULL, NULL, '184.986', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:16:25', '2026-10-23 19:15:11', '2026-10-23 19:16:25', NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'Pembangunan Jalan Warungbaseum – Cibogo Desa Malingping Utara Kec. Malingping', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 1.0000, 0.8700, 184.986, 177.871, 214.303, 214.303, 17.79),
(253, NULL, 6, 71, '247/UT/ITI-U/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-09-17', NULL, 1.965, 10.00, 78.50, '4. STA0+254', NULL, 15973.20, NULL, NULL, 17.02, NULL, NULL, NULL, NULL, '177.028', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:16:25', '2026-10-23 19:15:11', '2026-10-23 19:16:25', NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'Pembangunan Jalan Warungbaseum – Cibogo Desa Malingping Utara Kec. Malingping', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 1.0000, 0.8700, 177.028, 170.219, 205.083, 205.083, 17.02),
(254, NULL, 6, 71, '247/UT/ITI-U/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-09-17', NULL, 1.935, 10.00, 78.50, '5. STA0+326', NULL, 16491.40, NULL, NULL, 17.57, NULL, NULL, NULL, NULL, '182.770', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:16:25', '2026-10-23 19:15:11', '2026-10-23 19:16:25', NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'Pembangunan Jalan Warungbaseum – Cibogo Desa Malingping Utara Kec. Malingping', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 1.0000, 0.8700, 182.770, 175.741, 211.736, 211.736, 17.57),
(255, NULL, 6, 71, '247/UT/ITI-U/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-09-17', NULL, 1.925, 10.00, 78.50, '6. STA0+398', NULL, 15652.90, NULL, NULL, 16.68, NULL, NULL, NULL, NULL, '173.478', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:16:25', '2026-10-23 19:15:11', '2026-10-23 19:16:25', NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'Pembangunan Jalan Warungbaseum – Cibogo Desa Malingping Utara Kec. Malingping', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 1.0000, 0.8700, 173.478, 166.806, 200.971, 200.971, 16.68),
(256, NULL, 6, 71, '247/UT/ITI-U/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-09-17', NULL, 1.895, 10.00, 78.50, '7. STA0+470', NULL, 15257.20, NULL, NULL, 16.26, NULL, NULL, NULL, NULL, '169.092', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:16:25', '2026-10-23 19:15:11', '2026-10-23 19:16:25', NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'Pembangunan Jalan Warungbaseum – Cibogo Desa Malingping Utara Kec. Malingping', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 1.0000, 0.8700, 169.092, 162.589, 195.890, 195.890, 16.26),
(257, NULL, 6, 71, '247/UT/ITI-U/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-09-17', NULL, 1.990, 10.00, 78.50, '8. STA0+542', NULL, 17576.60, NULL, NULL, 18.73, NULL, NULL, NULL, NULL, '194.798', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:16:25', '2026-10-23 19:15:11', '2026-10-23 19:16:25', NULL, NULL, NULL, NULL, NULL, NULL, '-', NULL, 'Pembangunan Jalan Warungbaseum – Cibogo Desa Malingping Utara Kec. Malingping', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 1.0000, 0.8700, 194.798, 187.306, 225.670, 225.670, 18.73),
(260, NULL, 6, 70, '275/UT/ITI-U/X/26', 'Uji Tekan Paving, Uskup, Kanstin', 'Kuat Tekan', NULL, '2026-10-16', NULL, 3.980, NULL, NULL, 'Paving 8 Cm Abu - Abu', NULL, 65175.00, 334.230, 334.230, NULL, NULL, NULL, NULL, NULL, '334.230', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:42:27', '2026-10-23 19:39:52', '2026-10-23 19:42:27', NULL, NULL, NULL, NULL, NULL, NULL, 'CV. LINKA BLOCK', 'Paving ( 10 x 20cm )', 'TRIAL TEST', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, NULL, 6, 70, '275/UT/ITI-U/X/26', 'Uji Tekan Paving, Uskup, Kanstin', 'Kuat Tekan', NULL, '2026-10-16', NULL, 4.020, NULL, NULL, 'Paving 8 Cm Abu - Abu', NULL, 86451.00, 443.339, 443.339, NULL, NULL, NULL, NULL, NULL, '443.339', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:42:27', '2026-10-23 19:39:52', '2026-10-23 19:42:27', NULL, NULL, NULL, NULL, NULL, NULL, 'CV. LINKA BLOCK', 'Paving ( 10 x 20cm )', 'TRIAL TEST', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, NULL, 6, 70, '275/UT/ITI-U/X/26', 'Uji Tekan Paving, Uskup, Kanstin', 'Kuat Tekan', NULL, '2026-10-16', NULL, 3.860, NULL, NULL, 'Paving 8 Cm Hitam', NULL, 78543.00, 402.785, 402.785, NULL, NULL, NULL, NULL, NULL, '402.785', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:42:27', '2026-10-23 19:39:52', '2026-10-23 19:42:27', NULL, NULL, NULL, NULL, NULL, NULL, 'CV. LINKA BLOCK', 'Paving ( 10 x 20cm )', 'TRIAL TEST', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(263, NULL, 6, 70, '275/UT/ITI-U/X/26', 'Uji Tekan Paving, Uskup, Kanstin', 'Kuat Tekan', NULL, '2026-10-16', NULL, 3.300, NULL, NULL, 'Paving 8 Cm Hitam', NULL, 75690.00, 388.154, 388.154, NULL, NULL, NULL, NULL, NULL, '388.154', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:42:27', '2026-10-23 19:39:52', '2026-10-23 19:42:27', NULL, NULL, NULL, NULL, NULL, NULL, 'CV. LINKA BLOCK', 'Paving ( 10 x 20cm )', 'TRIAL TEST', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, NULL, 6, 70, '275/UT/ITI-U/X/26', 'Uji Tekan Paving, Uskup, Kanstin', 'Kuat Tekan', NULL, '2026-10-16', NULL, 4.210, NULL, NULL, 'Paving 8 Cm Merah', NULL, 80112.00, 410.830, 410.830, NULL, NULL, NULL, NULL, NULL, '410.830', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:42:27', '2026-10-23 19:39:52', '2026-10-23 19:42:27', NULL, NULL, NULL, NULL, NULL, NULL, 'CV. LINKA BLOCK', 'Paving ( 10 x 20cm )', 'TRIAL TEST', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, NULL, 6, 70, '275/UT/ITI-U/X/26', 'Uji Tekan Paving, Uskup, Kanstin', 'Kuat Tekan', NULL, '2026-10-16', NULL, 4.080, NULL, NULL, 'Paving 8 Cm Merah', NULL, 69289.00, 355.326, 355.326, NULL, NULL, NULL, NULL, NULL, '355.326', 'Kg/cm²', NULL, NULL, NULL, 'terverifikasi', 6, '2026-10-23 19:42:27', '2026-10-23 19:39:52', '2026-10-23 19:42:27', NULL, NULL, NULL, NULL, NULL, NULL, 'CV. LINKA BLOCK', 'Paving ( 10 x 20cm )', 'TRIAL TEST', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(277, NULL, 6, 27, '2/UT/ITI-U/03/IX/26', 'Uji Tekan Core Drill', 'Uji Tekan Core Drill', NULL, '2026-10-24', NULL, 18.000, 18.00, 18.00, '18', NULL, 18.00, NULL, NULL, 18.00, NULL, NULL, NULL, NULL, '18', 'Kg/cm²', NULL, 'uploads/dokumentasi/dokumentasi_1792832980_6adc75d4c3520.png', NULL, 'terverifikasi', 6, '2026-10-24 09:09:46', '2026-10-24 09:09:40', '2026-10-24 09:09:46', NULL, NULL, NULL, NULL, NULL, NULL, 'who', NULL, 'who', 'who', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18.00, 18.0000, 18.0000, 18.000, 18.000, 18.000, 18.000, 18.00),
(279, 159, 6, NULL, NULL, NULL, 'Kuat Tekan', '2026-10-14', '2026-10-27', 13, 18.000, NULL, NULL, 'SPL-20261027-2672-0118', 'K-275', 18.00, 18.000, 18.000, 18.00, NULL, NULL, NULL, NULL, '18', 'MPa', NULL, 'uploads/dokumentasi/dokumentasi_1793100635_6ae08b5b4bf8a.png', NULL, 'terverifikasi', NULL, NULL, '2026-10-27 11:30:39', '2026-10-27 11:30:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pengujian`
--

CREATE TABLE `jenis_pengujian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori` enum('beton','tanah','besi') NOT NULL,
  `nama_pengujian` varchar(150) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `satuan_sampel` varchar(50) DEFAULT NULL COMMENT 'Contoh: buah, titik, batang',
  `estimasi_durasi_hari` int(10) UNSIGNED DEFAULT NULL COMMENT 'Estimasi lama pengujian dalam hari',
  `harga` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis_pengujian`
--

INSERT INTO `jenis_pengujian` (`id`, `kategori`, `nama_pengujian`, `deskripsi`, `satuan_sampel`, `estimasi_durasi_hari`, `harga`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, 'beton', 'Uji Tekan Silinder (ø15x30 Cm)', 'Minimal 6 Sampel @Rp 50.000/sampel', 'sampel', NULL, 50000.00, 1, '2026-07-30 11:01:30', '2026-07-30 11:01:30'),
(2, 'beton', 'Uji Tekan Kubus (15x15 Cm)', 'Minimal 6 Sampel @Rp 50.000/sampel', 'sampel', NULL, 50000.00, 1, '2026-07-30 11:01:30', '2026-07-30 11:01:30'),
(3, 'beton', 'Uji Tekan Kubus Mortar (5x5 Cm)', 'Minimal 6 Sampel @Rp 50.000/sampel', 'sampel', NULL, 50000.00, 1, '2026-07-30 11:01:30', '2026-07-30 11:01:30'),
(4, 'beton', 'Uji Tekan Paving, Uskup, Kanstin', 'Minimal 6 Sampel @Rp 50.000/sampel', 'sampel', NULL, 50000.00, 1, '2026-07-30 11:01:30', '2026-07-30 11:01:30'),
(5, 'beton', 'Uji Tekan Core Drill', 'Minimal 3 Sampel @Rp 150.000/sampel', 'sampel', NULL, 150000.00, 1, '2026-07-30 11:01:30', '2026-07-30 11:01:30'),
(6, 'beton', 'Uji Lentur / Flexural Balok Beton (15x60 Cm)', 'Minimal 3 Sampel @Rp 100.000/sampel', 'sampel', NULL, 100000.00, 1, '2026-07-30 11:01:30', '2026-07-30 11:01:30'),
(7, 'besi', 'Uji Tarik Baja Tulangan', 'Minimal 3 Sampel @Rp 500.000/sampel (Di Luar Biaya Bubut)', 'sampel', NULL, 500000.00, 1, '2026-07-30 11:01:30', '2026-07-30 11:01:30'),
(8, 'besi', 'Setting Ukuran Baja Tulangan (Tarik Ø16 & Tekuk Ø22)', 'Rp 100.000/sampel', 'sampel', NULL, 100000.00, 0, '2026-07-30 11:01:30', '2026-10-06 10:46:19'),
(9, 'besi', 'Uji Tekuk Baja Tulangan', 'Rp 100.000/sampel', 'sampel', NULL, 100000.00, 1, '2026-07-30 11:01:30', '2026-07-30 11:01:30'),
(10, 'beton', 'Pemotongan, Seting & Cetak Benda Uji (Core Drill)', 'Uditch, Panel Beton, Batu Dll @Rp 250.000 di Luar Biaya Pengetesan', 'sampel', NULL, 250000.00, 0, '2026-07-30 11:01:30', '2026-10-06 10:34:23'),
(11, 'beton', 'Uji Tekan Bata Merah (19x9)', 'Minimal 6 Sampel @Rp 50.000/sampel', 'sampel', NULL, 50000.00, 1, '2026-10-05 09:46:48', '2026-10-05 09:46:48'),
(12, 'beton', 'Uji Tekan Hebel (60x20x10)/(60x20x7)', 'Minimal 6 Sampel @Rp 50.000/sampel', 'sampel', NULL, 50000.00, 1, '2026-10-05 09:46:48', '2026-10-05 09:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `nomor_laporan` varchar(30) NOT NULL,
  `file_laporan` varchar(255) NOT NULL COMMENT 'Path file PDF laporan',
  `dicetak_oleh` bigint(20) UNSIGNED NOT NULL,
  `tanggal_terbit` date NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjadwalan`
--

CREATE TABLE `penjadwalan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `teknisi_id` bigint(20) UNSIGNED NOT NULL COMMENT 'User dengan role teknisi',
  `tanggal_jadwal` date NOT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `dijadwalkan_oleh` bigint(20) UNSIGNED NOT NULL COMMENT 'Admin yang membuat jadwal',
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjadwalan`
--

INSERT INTO `penjadwalan` (`id`, `booking_id`, `teknisi_id`, `tanggal_jadwal`, `jam_mulai`, `jam_selesai`, `dijadwalkan_oleh`, `keterangan`, `created_at`, `updated_at`) VALUES
(44, 273, 7, '2026-10-27', '08:00:00', '16:00:00', 6, '', '2026-10-27 11:29:16', '2026-10-27 11:29:16'),
(46, 275, 7, '2026-10-29', '08:00:00', '16:00:00', 6, '', '2026-10-29 10:08:05', '2026-10-29 10:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_status`
--

CREATE TABLE `riwayat_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('menunggu_verifikasi','menunggu_pembayaran','pembayaran_diverifikasi','booking_diterima','jadwal_ditentukan','sampel_diterima','menunggu_diuji','sedang_diuji','menunggu_input_admin','validasi_hasil','selesai','ditolak') NOT NULL,
  `diubah_oleh` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'User (admin/teknisi) yang mengubah status, NULL jika otomatis oleh sistem',
  `keterangan` varchar(255) DEFAULT NULL COMMENT 'Contoh: "Sampel diterima oleh Admin", "Diproses oleh teknisi Andi"',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `riwayat_status`
--

INSERT INTO `riwayat_status` (`id`, `booking_id`, `status`, `diubah_oleh`, `keterangan`, `created_at`) VALUES
(479, 270, 'menunggu_verifikasi', 28, 'Booking dibuat oleh pelanggan', '2026-10-27 06:30:01'),
(480, 271, 'menunggu_verifikasi', 29, 'Booking dibuat oleh pelanggan', '2026-10-27 06:30:46'),
(481, 272, 'menunggu_verifikasi', 30, 'Booking dibuat oleh pelanggan', '2026-10-27 06:31:15'),
(482, 272, 'ditolak', 6, 'Ditolak oleh Admin: .', '2026-10-27 06:31:54'),
(483, 270, 'ditolak', 6, 'Ditolak oleh Admin: .', '2026-10-27 06:31:58'),
(484, 271, 'ditolak', 6, 'Ditolak oleh Admin: .', '2026-10-27 06:32:04'),
(485, 273, 'menunggu_verifikasi', 29, 'Booking dibuat oleh pelanggan', '2026-10-27 11:28:48'),
(486, 273, 'booking_diterima', 6, 'Booking diverifikasi dan diterima oleh Admin', '2026-10-27 11:29:12'),
(487, 273, 'jadwal_ditentukan', 6, 'Jadwal ditentukan: 27-10-2026, Teknisi: Teknisi Andi', '2026-10-27 11:29:16'),
(488, 273, 'sampel_diterima', 6, 'Sampel diterima oleh Admin (Kode: SPL-20261027-2672-06).', '2026-10-27 11:29:22'),
(489, 273, 'menunggu_diuji', 6, 'Menunggu pengujian oleh teknisi.', '2026-10-27 11:29:22'),
(490, 273, 'sedang_diuji', 7, 'Pengujian dimulai oleh teknisi Teknisi Andi', '2026-10-27 11:29:41'),
(491, 273, 'menunggu_input_admin', 7, 'Seluruh sampel selesai diuji oleh teknisi Teknisi Andi, menunggu input nilai oleh admin', '2026-10-27 11:29:44'),
(492, 274, 'menunggu_verifikasi', 28, 'Booking dibuat oleh pelanggan', '2026-10-29 10:04:45'),
(493, 274, 'booking_diterima', 6, 'Booking diverifikasi dan diterima oleh Admin', '2026-10-29 10:05:35'),
(494, 274, 'jadwal_ditentukan', 6, 'Jadwal ditentukan: 29-10-2026, Teknisi: Teknisi Andi', '2026-10-29 10:05:47'),
(495, 274, 'ditolak', 6, 'Pengujian dibatalkan oleh Admin sebelum Sampel Diterima. scam', '2026-10-29 10:06:46'),
(496, 275, 'menunggu_verifikasi', 28, 'Booking dibuat oleh pelanggan', '2026-10-29 10:07:35'),
(497, 275, 'booking_diterima', 6, 'Booking diverifikasi dan diterima oleh Admin', '2026-10-29 10:07:58'),
(498, 275, 'jadwal_ditentukan', 6, 'Jadwal ditentukan: 29-10-2026, Teknisi: Teknisi Andi', '2026-10-29 10:08:05'),
(499, 275, 'sampel_diterima', 6, 'Sampel diterima oleh Admin (Kode: SPL-20261029-9820-06).', '2026-10-29 10:08:23'),
(500, 275, 'menunggu_diuji', 6, 'Menunggu pengujian oleh teknisi.', '2026-10-29 10:08:23'),
(501, 275, 'sedang_diuji', 7, 'Pengujian dimulai oleh teknisi Teknisi Andi', '2026-10-29 10:12:18'),
(502, 275, 'menunggu_input_admin', 7, 'Seluruh sampel selesai diuji oleh teknisi Teknisi Andi, menunggu input nilai oleh admin', '2026-10-29 10:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `sampel`
--

CREATE TABLE `sampel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `kode_sampel` varchar(30) NOT NULL COMMENT 'Contoh: SPL-20260716-0001',
  `deskripsi_sampel` varchar(255) DEFAULT NULL,
  `tanggal_diterima` date DEFAULT NULL,
  `diterima_oleh` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin yang menerima sampel',
  `status_sampel` enum('belum_diterima','diterima','sedang_diuji','selesai_diuji') NOT NULL DEFAULT 'belum_diterima',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sampel`
--

INSERT INTO `sampel` (`id`, `booking_id`, `kode_sampel`, `deskripsi_sampel`, `tanggal_diterima`, `diterima_oleh`, `status_sampel`, `created_at`, `updated_at`) VALUES
(159, 273, 'SPL-20261027-2672-01', '6 (Sampel ke-1 dari 6)', '2026-10-27', 6, 'selesai_diuji', '2026-10-27 11:29:22', '2026-10-27 11:29:44'),
(160, 273, 'SPL-20261027-2672-02', '6 (Sampel ke-2 dari 6)', '2026-10-27', 6, 'selesai_diuji', '2026-10-27 11:29:22', '2026-10-27 11:29:44'),
(161, 273, 'SPL-20261027-2672-03', '6 (Sampel ke-3 dari 6)', '2026-10-27', 6, 'selesai_diuji', '2026-10-27 11:29:22', '2026-10-27 11:29:44'),
(162, 273, 'SPL-20261027-2672-04', '6 (Sampel ke-4 dari 6)', '2026-10-27', 6, 'selesai_diuji', '2026-10-27 11:29:22', '2026-10-27 11:29:44'),
(163, 273, 'SPL-20261027-2672-05', '6 (Sampel ke-5 dari 6)', '2026-10-27', 6, 'selesai_diuji', '2026-10-27 11:29:22', '2026-10-27 11:29:44'),
(164, 273, 'SPL-20261027-2672-06', '6 (Sampel ke-6 dari 6)', '2026-10-27', 6, 'selesai_diuji', '2026-10-27 11:29:22', '2026-10-27 11:29:44'),
(165, 275, 'SPL-20261029-9820-01', '6 (Sampel ke-1 dari 6)', '2026-10-29', 6, 'selesai_diuji', '2026-10-29 10:08:23', '2026-10-29 10:12:25'),
(166, 275, 'SPL-20261029-9820-02', '6 (Sampel ke-2 dari 6)', '2026-10-29', 6, 'selesai_diuji', '2026-10-29 10:08:23', '2026-10-29 10:12:25'),
(167, 275, 'SPL-20261029-9820-03', '6 (Sampel ke-3 dari 6)', '2026-10-29', 6, 'selesai_diuji', '2026-10-29 10:08:23', '2026-10-29 10:12:25'),
(168, 275, 'SPL-20261029-9820-04', '6 (Sampel ke-4 dari 6)', '2026-10-29', 6, 'selesai_diuji', '2026-10-29 10:08:23', '2026-10-29 10:12:25'),
(169, 275, 'SPL-20261029-9820-05', '6 (Sampel ke-5 dari 6)', '2026-10-29', 6, 'selesai_diuji', '2026-10-29 10:08:23', '2026-10-29 10:12:25'),
(170, 275, 'SPL-20261029-9820-06', '6 (Sampel ke-6 dari 6)', '2026-10-29', 6, 'selesai_diuji', '2026-10-29 10:08:23', '2026-10-29 10:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('pelanggan','admin','teknisi','owner') NOT NULL DEFAULT 'pelanggan',
  `nama_lengkap` varchar(150) NOT NULL,
  `nama_perusahaan` varchar(150) DEFAULT NULL COMMENT 'Diisi jika role = pelanggan (perusahaan/kontraktor)',
  `email` varchar(150) NOT NULL,
  `no_telepon` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `nama_lengkap`, `nama_perusahaan`, `email`, `no_telepon`, `alamat`, `password`, `foto_profil`, `status_aktif`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'admin', 'Admin Utama', NULL, 'admin@admin', '081200000001', NULL, '$2b$10$NSS1VJAis0xHw/Zo77MPR.GrLh09vw51brUwFG99HlgNJgq1L4hra', NULL, 1, NULL, NULL, '2026-07-27 07:39:46', '2026-10-06 10:05:24'),
(7, 'teknisi', 'Teknisi Andi', NULL, 'teknisi@teknisi', '081200000002', NULL, '$2b$10$1v/KY6BXLkrUDGLbBdl2EuyUKKHROVNBXk428i1dPToSTcAI6yxoK', NULL, 1, NULL, NULL, '2026-07-27 07:39:46', '2026-07-27 07:43:25'),
(8, 'owner', 'Manajer Operasional', NULL, 'owner@owner', '081200000003', NULL, '$2b$10$IV5hBuUH/5pvVlmb062Io.flmrJEGWwoKTtmngTGwQjpWBc3IdI/q', NULL, 1, NULL, NULL, '2026-07-27 07:39:46', '2026-07-30 09:36:46'),
(27, 'pelanggan', 'Test Updated', 'PT Updated', 'pelanggan1@gmail.com', '081777777777', '', '$2y$10$ktlb.SriR9g.ckzR/P8cTeBJJo7kqlEMqH5YB5VlarX2Scx.bmOC.', NULL, 1, NULL, NULL, '2026-10-12 07:01:31', '2026-10-16 11:08:32'),
(28, 'pelanggan', 'PT. TUNAS KARYA ADITAMA', 'PT. TUNAS KARYA ADITAMA', 'pelanggan2@gmail.com', '09948888888888888888', NULL, '$2y$10$XwEPIdYvjZVnN1jftihG.OrvqWmmS1M1tsMYBL.BBAXQtG/VZFBea', NULL, 1, NULL, NULL, '2026-10-12 07:02:49', '2026-10-24 08:15:27'),
(29, 'pelanggan', 'PT. ETONA CEMERLANG ABADI', 'PT. ETONA CEMERLANG ABADI', 'pelanggan3@gmail.com', '08888888888888888888', NULL, '$2y$10$XLPVeTn.9Uk1/xKob20djuBotlzifpc5DpLkFfZBbP4bcr35t1kQe', NULL, 1, NULL, NULL, '2026-10-12 07:03:41', '2026-10-12 07:06:19'),
(30, 'pelanggan', 'PT. GRAHA PONDASI', 'PT. GRAHA PONDASI', 'pelanggan4@gmail.com', '08888888888888888', NULL, '$2y$10$XdFO8FL0YYxHsqsbmGiDkuZ6/IFaxueE3f0O3aldkTaJU8NYr7ixq', NULL, 1, NULL, NULL, '2026-10-12 07:05:40', '2026-10-12 07:05:40'),
(70, 'pelanggan', 'CV. LINKA BLOCK', 'CV. LINKA BLOCK', 'pelanggan5@gmail.com', '0888888888888888', NULL, '$2y$10$lPPDJeD8zp5DMo3DD.apuOs7O5TOPEWbRDWfUphg9uf8NnKTXRKV2', NULL, 1, NULL, NULL, '2026-10-23 18:25:07', '2026-10-23 18:25:26'),
(71, 'pelanggan', 'CV. LIESDA CIPTA KARYA', 'CV. LIESDA CIPTA KARYA', 'pelanggan6@gmail.com', '09948888888888888888', NULL, '$2y$10$YBBBJ49Ofd177DFY.x8o4uSV27kyyGxJfdBWenrZllSLtcIU4NVjC', NULL, 1, NULL, NULL, '2026-10-23 18:26:23', '2026-10-23 18:26:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_booking` (`kode_booking`),
  ADD KEY `fk_booking_user` (`user_id`),
  ADD KEY `fk_booking_jenis` (`jenis_pengujian_id`),
  ADD KEY `fk_booking_verifikator` (`diverifikasi_oleh`),
  ADD KEY `idx_status_booking` (`status_booking`),
  ADD KEY `idx_tanggal_pengujian` (`tanggal_pengujian_diminta`);

--
-- Indexes for table `hasil_pengujian`
--
ALTER TABLE `hasil_pengujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hasil_sampel` (`sampel_id`),
  ADD KEY `fk_hasil_teknisi` (`teknisi_id`),
  ADD KEY `fk_hasil_verifikator` (`diverifikasi_oleh`);

--
-- Indexes for table `jenis_pengujian`
--
ALTER TABLE `jenis_pengujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kategori` (`kategori`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_laporan` (`nomor_laporan`),
  ADD KEY `fk_laporan_booking` (`booking_id`),
  ADD KEY `fk_laporan_admin` (`dicetak_oleh`);

--
-- Indexes for table `penjadwalan`
--
ALTER TABLE `penjadwalan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_booking` (`booking_id`),
  ADD KEY `fk_jadwal_teknisi` (`teknisi_id`),
  ADD KEY `fk_jadwal_admin` (`dijadwalkan_oleh`),
  ADD KEY `idx_tanggal_jadwal` (`tanggal_jadwal`);

--
-- Indexes for table `riwayat_status`
--
ALTER TABLE `riwayat_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_riwayat_user` (`diubah_oleh`),
  ADD KEY `idx_riwayat_booking` (`booking_id`,`created_at`);

--
-- Indexes for table `sampel`
--
ALTER TABLE `sampel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_sampel` (`kode_sampel`),
  ADD KEY `fk_sampel_booking` (`booking_id`),
  ADD KEY `fk_sampel_admin` (`diterima_oleh`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT for table `hasil_pengujian`
--
ALTER TABLE `hasil_pengujian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `jenis_pengujian`
--
ALTER TABLE `jenis_pengujian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `penjadwalan`
--
ALTER TABLE `penjadwalan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `riwayat_status`
--
ALTER TABLE `riwayat_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT for table `sampel`
--
ALTER TABLE `sampel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_booking_jenis` FOREIGN KEY (`jenis_pengujian_id`) REFERENCES `jenis_pengujian` (`id`),
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_booking_verifikator` FOREIGN KEY (`diverifikasi_oleh`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hasil_pengujian`
--
ALTER TABLE `hasil_pengujian`
  ADD CONSTRAINT `fk_hasil_teknisi` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_hasil_verifikator` FOREIGN KEY (`diverifikasi_oleh`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `fk_laporan_admin` FOREIGN KEY (`dicetak_oleh`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_laporan_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `penjadwalan`
--
ALTER TABLE `penjadwalan`
  ADD CONSTRAINT `fk_jadwal_admin` FOREIGN KEY (`dijadwalkan_oleh`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_jadwal_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jadwal_teknisi` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `riwayat_status`
--
ALTER TABLE `riwayat_status`
  ADD CONSTRAINT `fk_riwayat_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_riwayat_user` FOREIGN KEY (`diubah_oleh`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sampel`
--
ALTER TABLE `sampel`
  ADD CONSTRAINT `fk_sampel_admin` FOREIGN KEY (`diterima_oleh`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sampel_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
