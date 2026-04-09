# Dashboard Polisi (Android)

Project Android native (Kotlin + Jetpack Compose) yang bisa kamu kelola **langsung dari GitHub repo** tanpa Android Studio.

## 1) Cara pakai tanpa Android Studio

Kamu punya 2 opsi:

### Opsi A — Full dari GitHub Web + GitHub Actions (paling mudah)
1. Buat repository baru di GitHub (mis. `dashboard-polisi`).
2. Upload semua file project ini ke repository.
3. Masuk tab **Actions** di GitHub, aktifkan workflow jika diminta.
4. Setiap `push`, workflow akan build APK debug otomatis.
5. Download hasil APK dari artifact `app-debug-apk` di run Actions terbaru.

Workflow build sudah disiapkan di:
- `.github/workflows/android-build.yml`

### Opsi B — GitHub + Terminal lokal (tanpa Android Studio)
1. Install JDK 17.
2. Clone repo:
   ```bash
   git clone https://github.com/<username>/<repo>.git
   cd <repo>
   ```
3. Build APK debug:
   ```bash
   ./gradlew assembleDebug
   ```
4. Ambil file APK di:
   ```
   app/build/outputs/apk/debug/app-debug.apk
   ```

## 2) Struktur file penting (yang wajib ada)

### Root project
- `settings.gradle.kts` → registrasi module.
- `build.gradle.kts` → konfigurasi plugin level project.
- `gradle.properties` → properti build global.
- `gradle/libs.versions.toml` → daftar versi dependency/plugin.
- `gradlew`, `gradlew.bat`, `gradle/wrapper/*` → Gradle Wrapper.

### Module aplikasi
- `app/build.gradle.kts` → konfigurasi Android app.
- `app/src/main/AndroidManifest.xml` → deklarasi app dan launcher activity.
- `app/src/main/java/.../MainActivity.kt` → dashboard UI utama.
- `app/src/main/java/.../ui/theme/*` → tema warna/typography Compose.
- `app/src/main/res/*` → resource (string, warna, theme, icon).

## 3) Detail dashboard yang sudah dibuat
- Top bar: **Dashboard Polisi**.
- Kartu ringkasan status operasional.
- Grid 2 kolom berisi statistik utama (laporan, patroli, kasus selesai, dll).
- Styling dasar Material 3 agar siap dikembangkan.

## 4) Catatan penting
- Project ini sengaja dibuat supaya bisa di-build via CLI/GitHub Actions.
- Android Studio **opsional**, bukan wajib.
- Untuk rilis ke Play Store nanti, tinggal tambah signing release + pipeline release.
