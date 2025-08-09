#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 <target.apk> <package.name>"
    exit 1
fi

APK="$1"
PKG="$2"
APKNAME=$(basename "$APK" .apk)

# Decompile APK
apktool d "$APK" -o "${APKNAME}_src"

# Copy Frida Gadget & Config
mkdir -p "${APKNAME}_src/lib/arm64-v8a"
cp libfrida-gadget.so "${APKNAME}_src/lib/arm64-v8a/"
cp libfrida-gadget.config.so "${APKNAME}_src/lib/arm64-v8a/"

# Tambah Application Class
mkdir -p "${APKNAME}_src/smali/com/frida"
cp MyApp.smali "${APKNAME}_src/smali/com/frida/"

# Edit AndroidManifest.xml
sed -i "s/<application /<application android:name=\"com.frida.MyApp\" /" "${APKNAME}_src/AndroidManifest.xml"

# Tambah ssl-bypass.js ke assets APK
mkdir -p "${APKNAME}_src/assets"
cp ssl-bypass.js "${APKNAME}_src/assets/"

# Ganti @PACKAGE_NAME@ di config
sed -i "s/@PACKAGE_NAME@/${PKG}/g" "${APKNAME}_src/lib/arm64-v8a/libfrida-gadget.config.so"

# Rebuild APK
apktool b "${APKNAME}_src" -o "${APKNAME}_mod.apk"

# Sign APK
apksigner sign --ks mykey.keystore --out "${APKNAME}_signed.apk" "${APKNAME}_mod.apk"

echo "[+] APK signed: ${APKNAME}_signed.apk"
echo "[+] Install lalu jalankan app, ProxyPin akan langsung baca semua HTTPS"
