# 2. elmélet

## Számok ábrázolása

### Tört számok

- Eltároljuk az egész részt és utána a törtrészt
- Nagy a helyigénye

### Lebegőpontos számábrázolás

- Számok normálalakban vannak tárolva
- Mantissza: A hatvány alapja, k hatványkitevő
- Például: A = 10, 517 alakja: 0.517 * 10^3
- A = 2 esetén: 517 = 1000000101 -> 1.000000101 × 2^9 vagy 0.1000000101 × 2^10

### Karakterek tárolása

- kódolás: karaktertáblából kiválasztjuk a karaktert és eltároljuk a kódját
- ASCII: 7 bit, 128 karakter
- Unicode: 16 bit, 65536 karakter
- UTF-8: változó hosszúságú, 1-4 bájt, 1 bájt: ASCII, 2 bájt: Latin-1, 3 bájt: többi latin, 4 bájt: többi

## Információ tárolás eszközei

### Memória

A processzor utasításait (háttértárolókból) a memóriából tölti be, programok adatait a memóriában tárolja és onnan dolgozza fel.

**Memória típusok**

- ROM, PROM, EPROM, EEPROM, Flash
- RAM, SRAM, DRAM, DDR, DDR2, DDR3, DDR4, DDR5
- Flash
  - elterjedt, olcsó, mozgó alkatrészektől mentes
  - működési elv: töltéshordozók felhalmozása a félvezető rétegben
  - Két fajta:
    - NOR: gyors, bárhonnan lehet olvasni, írni
    - NAND: lassú, csak blokkokban lehet olvasni és írni egy egész sort

### Mágneses adathordozók

Kiszorulúban vannak a flash miatt.

**Mágneses adathordozók típusai**

- Mágneses szalag
  - még ma is használt, elsősorban archiválásra
- Mágneses lemez
  - leggyakrabban használt adathordozó
  - FDD: floppy disk
  - HDD: hard disk drive
  - működési elv: egy cella mágneses polarizációja tárolja a biteket, visszaverődő fényt érzékelve olvassa ki
- Optikai lemezek
  - CD: 700 MB, vörös lézer
  - DVD:
    - vékonyabb vörös lézer
    - 1 oldal, 1 réteg: ~4,7 GB
    - 1 oldal, 2 réteg: ~5,2 GB
    - 2 oldal, 1 réteg: ~9,4 GB
    - 2 oldal, 2 réteg: ~10,4 GB
  - Blu-ray: 25 GB, 50 GB
    - kék lézer

## A szmítógépek

### Szoftver és hardver különbségek

Kliens-szerver gépek:

- Kliens: felhasználói felület, alkalmazások futtatása
- Szerver: adatok tárolása, feldolgozása, szolgáltatások nyújtása

Hardver különbségek:

- Szerver esetén klasszikus perifériák hiányoznak
- Szerverek jóval nagyobb kapacitásúak

Szoftver különbségek:

- Operációs rendszer
- Szerverek esetén: szerver folyamatok, szolgáltatások

### Kiszolgálók elérése

- Protokolok:
  - HTTP(S): weboldalak
  - FTP: fájlok
  - SMTP, POP3: levelek
  - SSH (Secure Shell), Telnet: távoli elérés
  - SSL (Secure Socket Layer): csomagok, forgalom titkosítása
  - RSA (Rivest-Shamir-Adleman): titkosítás, aláírás
- Karakteres elérés
  - SSH, Telnet
- Grafikus elérés
  - VNC, RDP

## Operációs rendszerek

### Operációs rendszer feladatai

- Felhasználói felület
- Fájlkezelés
- Perifériák, hardverek kezelése (driverekkel)
- Hálózati kommunikáció

### Népszerű operációs rendszerek

- Windows
- Linux
- macOS
- Android
- iOS

### Fájlrendszerek, szerepük

- Fastruktúra
- Jellemző UNIX könyvtárszerkezet:
  - `/`: gyökérkönyvtár
  - `/bin`: rendszer fontosságú programok
  - `/dev`: eszközök közös helye
  - `/etc`: konfigurációs fájlok
  - `/home`: felhasználói könyvtárak
  - `/usr`: programok, adatok (nem rendszer fontosságúak)
  - `/var`: változó adatok, logok
- Fájlrendszer típusok:
  - Windows: NTFS, FAT32, exFAT
  - Linux: ext2, ext3, ext4, XFS, Btrfs, ZFS
  - macOS: HFS, HFS+, APFS
- Shell típusok:
  - Windows: cmd.exe, PowerShell
  - Linux: sh, bash

