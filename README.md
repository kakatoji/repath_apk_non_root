# repath_apk_non_root
bypass apk untuk android 14

# siapkan termux + apktool + apksigner
struktur folder
<pre>
/project-folder
 ├─ inject-frida.sh
 ├─ libfrida-gadget.so
 ├─ MyApp.smali
 ├─ ssl-bypass.js
</pre>

 # install apktool
<pre>
 pkg install openjdk-17 apksigner
 pkg install apktool
</pre>
 
# install frida gadged 
cari file frida-gadget-*-arm64.so
<pre>
 https://github.com/frida/frida/releases
</pre>

# EXTRAK
ini contoh saja samakan dengan yg udah di download
<pre>
 xz -d frida-gadget-16.1.8-android-arm64.so.xz
mv frida-gadget-16.1.8-android-arm64.so libfrida-gadget.so

</pre>

# JALANKAN
<pre>
 bash inject-frida.sh target.apk

</pre>

# FINISH
<pre>
Install APK hasil sign di HP.

Jalankan ProxyPin → Start VPN.

Jalankan APK target → semua HTTPS bisa dibaca.
</pre>

# KEY STORE UNTUK SIGNITER

letak kan keystore ini di folder yg sama dengan injeck-frida.sh nya buat dengan perintah
<pre>
 keytool -genkeypair -v \
  -keystore mykey.keystore \
  -alias myalias \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000
</pre>
