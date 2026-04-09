# Dashboard Polisi (Android)

Project Android native (Kotlin + Jetpack Compose) yang bisa kamu kelola **langsung dari GitHub repo** tanpa Android Studio.

## 0) Cara otomatis membuat `gradle-wrapper.jar` (tanpa copy manual)
Karena `gradle-wrapper.jar` adalah file biner, cara paling aman adalah generate otomatis dengan command:

```bash
./scripts/bootstrap-wrapper.sh
```

Atau pilih versi Gradle tertentu:

```bash
./scripts/bootstrap-wrapper.sh 8.7
```

Script ini akan menjalankan `gradle wrapper` dan membuat file:
- `gradle/wrapper/gradle-wrapper.jar`
- `gradle/wrapper/gradle-wrapper.properties`
- `gradlew` dan `gradlew.bat`

## 1) Cara pakai tanpa Android Studio

### Opsi A — Full dari GitHub Web + GitHub Actions (paling mudah)
1. Buat repository baru di GitHub (mis. `dashboard-polisi`).
2. Upload semua file project ini ke repository.
3. Masuk tab **Actions** di GitHub, aktifkan workflow jika diminta.
4. Workflow CI akan generate wrapper JAR otomatis lalu build APK debug.
5. Download hasil APK dari artifact `app-debug-apk` di run Actions terbaru.

Workflow build sudah disiapkan di:
- `.github/workflows/android-build.yml`

### Opsi B — GitHub + Terminal lokal (tanpa Android Studio)
1. Install JDK 17.
2. Install Gradle (sekali saja, untuk bootstrap wrapper).
3. Clone repo:
   ```bash
   git clone https://github.com/<username>/<repo>.git
   cd <repo>
   ```
4. Generate wrapper JAR:
   ```bash
   gradle wrapper --gradle-version 8.7 --no-validate-url
   chmod +x gradlew
   ```
5. Build APK debug:
   ```bash
   ./gradlew assembleDebug
   ```
6. Ambil file APK di:
   ```
   app/build/outputs/apk/debug/app-debug.apk
   ```

## 2) Struktur file penting (yang wajib ada)

### Root project
- `settings.gradle.kts` → registrasi module.
- `build.gradle.kts` → konfigurasi plugin level project.
- `gradle.properties` → properti build global.
- `gradle/libs.versions.toml` → daftar versi dependency/plugin.
- `gradlew`, `gradlew.bat`, `gradle/wrapper/gradle-wrapper.properties`.

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
