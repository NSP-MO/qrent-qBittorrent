# qBittorrent - qrent bet dah
<p align="center">
  <img src="https://drive.google.com/uc?id=19B5AMjAKLjugMMzH6NZiu3SVQZh5e8wc" 
       width="200" height="200" alt="qBittorrent Logo">
</p>

[![GitHub Actions CI Status](https://github.com/qbittorrent/qBittorrent/actions/workflows/ci_ubuntu.yaml/badge.svg)](https://github.com/qbittorrent/qBittorrent/actions)
[![Coverity Status](https://scan.coverity.com/projects/5494/badge.svg)](https://scan.coverity.com/projects/5494)
********************************


## Apa itu qBittorrent?
qBittorrent adalah klien qBitTorrent gratis dan open‑source yang ringan, cepat, dan bebas iklan dalam mengakses jaringan torrent yang kalian inginkan. Pada repo ini kami menghadirkan qBitTorrent yang dapat diakses dari mana saja dengan mudah, baik dalam memanage torrent dari hostingan kalian hingga menambahkan unduhan ke device kalian dari jarak jauh!

<details>
    <summary><b>Anggota Kelompok 6 KDJK Parallel 1</b></summary>
    
| NIM | Nama |
| ------ | ------ |
| G6401231038 | Arief Abdul Rahman |
| G6401231080 | Muhammad Farhadh |
| G6401231011 | Hamzah Hudzaifah |
| G6401231091 | Yasir |
    
</details>


## Instalisasi & Setup
### instalisasi versi simple
- Download qBittorrent [di sini](http://qbittorrent.org/download)
- Selesaikan intalasisasi sampai ke halaman ini
<p align="left">
  <img src="https://drive.google.com/uc?id=1O632iPNSSm9EnI8VwDF7mJZl-nSSqWWP" 
       width="638" alt="Halaman awal">
</p>

### instalisasi versi lengkap untuk development (windows)
- Install CMake terlebih dahulu [di sini](https://cmake.org/download/), then restart terminal.
- Install vcpkg (bila belum)
```sh
git clone https://github.com/microsoft/vcpkg C:\vcpkg
C:\vcpkg\bootstrap-vcpkg.bat
```
- Install deps (x64):
```sh
C:\vcpkg\vcpkg.exe install libtorrent:x64-windows qtbase qttools zlib openssl boost:x64-windows qtsvg:x64-windows qttools:x64-windows
```
- Re-configure qBittorrent dengan vcpkg yang sudah kita install
```sh
cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-windows -DLibtorrentRasterbar_DIR=C:/vcpkg/installed/x64-windows/share/LibtorrentRasterbar -DVERBOSE_CONFIGURE=ON
```
- Build Aplikasinya
```sh
cmake --build build --config Release
```
- Setelah selesai, aplikasi ada di ./build/Release/qbittorrent.exe

### Setup qBittorent
- Ke laman option di Tools/Options atau Alt+O
<p align="left">
  <img src="https://drive.google.com/uc?id=1A7_IYsSDBPz9eqhKL-CGGmA7L7JwWTdw" 
       height="120" alt="Halaman WebUI">
</p>

- Di WebUI centang Web User Interface dengan IP address: 127.0.0.1 (Localhost) & port: 8080
<p align="left">
  <img src="https://drive.google.com/uc?id=1kOX6QzPeKnMgDNLSl4RbEHjWi6f1h4W2" 
       width="451" height="360" alt="Halaman WebUI">
</p>

- Masukkan Username dan Password untuk authentication setiap kali masuk, then apply.

### Setup Cloudflared
- Sign in & Sign up [Cloudflare](https://dash.cloudflare.com/)
- Buat Tunnel Network baru dengan tipe Cloudflared
<p align="left">
  <img src="https://drive.google.com/uc?id=1ZD74128s2LvS1SVzv1tNlsY2ZKCmzoqq" 
       width="638" alt="Cloudflared">
</p>

- Beri nama tunnelnya, then pilih environment sesuai yang dipakai lalu install cloudflared dari link yang disediakan (Matikan antivirus)
<p align="left">
  <img src="https://drive.google.com/uc?id=19ogafuiQzzNfm2Mtza4O4uk1PjSeNZs8" 
       width="638" alt="CloudflaredSetup">
</p>

- Jalankan command yang disediakan (cloudflared.exe service install ....) pada terminal dengan access Administrator
<p align="left">
  <img src="https://drive.google.com/uc?id=19_mc6dHhTCPssrktwQglKqua6Tww4zl8" 
       width="638" alt="CloudflaredSetup">
</p>

- Login Cloudflared
```sh
cloudflared tunnel login
```
Ganti Domain Nameservers (DNS) dengan:
```sh
collins.ns.cloudflare.com
```
```sh
trace.ns.cloudflare.com
```

<p align="left">
  <img src="https://drive.google.com/uc?id=1tYsWNuTYjqzpXxMFnHqv7iF0OsDzVITG" 
       width="638" alt="CloudflaredSetup">
</p>

- Lanjutkan ke laman Cloudflared kembali, lalu isikan domain dan service dari page yang ingin kalian tampilkan
<p align="left">
  <img src="https://drive.google.com/uc?id=1xa2VcuWMwht4mWL8eU2oM-ckQeWidD8L" 
       width="638" alt="CloudflaredSetup">
</p>

- Tunggu beberapa saat sekitar ~5 menitan

- Jalankan tunnel dengan
```sh
cloudflared tunnel run --token "<Token>"
```
ganti <token> dengan token milik kalian, cara cek nya?
```sh
cloudflared tunnel token <tunnel>
```
ganti <tunnel> sesuai nama tunnel yang tadi kalian buat

- Buka website domain kalian, then masukkan Username dan Password yang sudah kalian buat
<p align="left">
  <img src="https://drive.google.com/uc?id=1IZSyMwcWIdhRquTuj1st8AjI3zBmRyYO" 
       width="638" alt="CloudflaredSetup">
</p>

- Setup selesai, sekarang kalian dapat mengakses qBittorrent tanpa batasan jarak
<p align="left">
  <img src="https://drive.google.com/uc?id=1udpjPnKImuHLv1qVgm9QE3Edt4aWVUAh" 
       width="638" alt="CloudflaredSetup">
</p>
