<?php
require '../config/database.php';
require '../config/auth.php';

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_POST = array_map(function ($v) { return is_array($v) ? '' : $v; }, $_POST);

    $nama = trim($_POST['nama_lengkap'] ?? '');
    $perusahaan = trim($_POST['nama_perusahaan'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $telepon = trim($_POST['no_telepon'] ?? '');
    $password = $_POST['password'] ?? '';
    $konfirmasi = $_POST['konfirmasi_password'] ?? '';

    if (!csrf_check()) { die('Token CSRF tidak valid. Muat ulang halaman.'); }

    if ($nama === '' || $email === '' || $telepon === '' || $password === '' || $konfirmasi === '') {
        $error = 'Nama lengkap, email, no. telepon, dan password wajib diisi.';
    } elseif (!preg_match('/[A-Za-z]/', $nama) || preg_match('/[0-9]/', $nama)) {
        $error = 'Nama lengkap hanya boleh berisi huruf (tidak boleh ada angka).';
    } elseif ($perusahaan !== '' && (!preg_match('/[A-Za-z]/', $perusahaan) || preg_match('/[0-9]/', $perusahaan))) {
        $error = 'Nama perusahaan hanya boleh berisi huruf (tidak boleh ada angka).';
    } elseif (!preg_match('/^[0-9\s\-\+]+$/', $telepon) || !preg_match('/[0-9]/', $telepon)) {
        $error = 'No. telepon hanya boleh berisi angka (tidak boleh ada huruf).';
    } elseif (filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
        $error = 'Format email tidak valid. Email boleh berupa kombinasi huruf, angka, dan simbol (@ . _ -).';
    } elseif (strlen($password) < 6) {
        $error = 'Password minimal 6 karakter.';
    } elseif (strlen($nama) > 150) {
        $error = 'Nama lengkap maksimal 150 karakter.';
    } elseif (strlen($perusahaan) > 150) {
        $error = 'Nama perusahaan maksimal 150 karakter.';
    } elseif (strlen($telepon) > 20) {
        $error = 'No. telepon maksimal 20 karakter.';
    } elseif (strlen($email) > 150) {
        $error = 'Email maksimal 150 karakter.';
    } elseif (strlen($password) > 72) {
        $error = 'Password maksimal 72 karakter.';
    } elseif ($password !== $konfirmasi) {
        $error = 'Konfirmasi password tidak cocok.';
    } else {
        $cek = $pdo->prepare("SELECT id FROM users WHERE email = ?");
        $cek->execute([$email]);

        if ($cek->fetch()) {
            $error = 'Email sudah terdaftar, silakan gunakan email lain.';
        } else {
            $passwordHash = password_hash($password, PASSWORD_BCRYPT);

            $stmt = $pdo->prepare(
                "INSERT INTO users (role, nama_lengkap, nama_perusahaan, email, no_telepon, password)
                 VALUES ('pelanggan', ?, ?, ?, ?, ?)"
            );
            try {
                $stmt->execute([$nama, $perusahaan, $email, $telepon, $passwordHash]);
            } catch (PDOException $e) {
                if ((int) $e->getCode() === 1062) {
                    $error = 'Email sudah terdaftar, silakan gunakan email lain.';
                } else {
                    error_log('register gagal: ' . $e->getMessage());
                    $error = 'Registrasi gagal. Silakan coba lagi nanti.';
                }
            }

            if ($error === '') {
                header('Location: register.php?msg=ok');
                exit;
            }
        }
    }
}

if (isset($_GET['msg']) && $_GET['msg'] === 'ok') {
    $success = 'Registrasi berhasil! Silakan login.';
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrasi - SIM Laboratorium PT ITI Utama</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body class="auth-wrapper">
    <div class="auth-card">
        <div class="auth-logo"><img src="../img1.jpeg" alt="Logo"></div>
        <h4>Registrasi Akun</h4>
        <p class="auth-subtitle">Buat akun pelanggan baru</p>

        <?php if ($error): ?>
            <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>
        <?php if ($success): ?>
            <div class="alert alert-success">
                <?= htmlspecialchars($success) ?>
                <a href="login.php" class="fw-bold">Klik di sini untuk login</a>.
            </div>
        <?php endif; ?>

        <?php if (!$success): ?>
        <form method="POST">
            <?= csrf_field() ?>
            <div class="mb-3">
                <label class="form-label">Nama Lengkap</label>
                <input type="text" name="nama_lengkap" class="form-control" placeholder="Masukkan nama lengkap" required
                       pattern="[A-Za-z][^0-9]*" title="Hanya huruf, tidak boleh ada angka">
            </div>
            <div class="mb-3">
                <label class="form-label">Nama Perusahaan</label>
                <input type="text" name="nama_perusahaan" class="form-control" placeholder="Masukkan nama perusahaan "
                       pattern="[A-Za-z][^0-9]*" title="Hanya huruf, tidak boleh ada angka">
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" placeholder="Masukkan email" required>
            </div>
            <div class="mb-3">
                <label class="form-label">No. Telepon</label>
                <input type="text" name="no_telepon" class="form-control" placeholder="Masukkan nomor telepon" required
                       pattern="[0-9+\-\s]+" title="Hanya angka, tidak boleh ada huruf">
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Minimal 6 karakter" required minlength="6">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Konfirmasi Password</label>
                    <input type="password" name="konfirmasi_password" class="form-control" placeholder="Ulangi password" required minlength="6">
                </div>
            </div>
            <button type="submit" class="btn btn-primary w-100">Daftar</button>
        </form>
        <p class="auth-footer">
            Sudah punya akun? <a href="login.php">Login di sini</a>
        </p>
        <?php endif; ?>
    </div>
</body>
</html>
