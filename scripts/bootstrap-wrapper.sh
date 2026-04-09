#!/usr/bin/env bash
set -euo pipefail

GRADLE_VERSION="${1:-8.7}"

if ! command -v gradle >/dev/null 2>&1; then
  echo "Gradle belum terpasang. Install Gradle dulu untuk bootstrap wrapper."
  exit 1
fi

echo "Membuat gradle/wrapper/gradle-wrapper.jar dan update script wrapper..."
gradle wrapper --gradle-version "$GRADLE_VERSION" --no-validate-url
chmod +x gradlew

echo "Selesai. File wrapper siap dipakai:"
ls -lah gradlew gradlew.bat gradle/wrapper/gradle-wrapper.properties gradle/wrapper/gradle-wrapper.jar
