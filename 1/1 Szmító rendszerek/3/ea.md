# Hozzáférési jogosultságok

## Unix rendszerek jogosultságai

A fájl engedélyrendszer egy 3 jegyű nyolcas (octal) számot használ egy fájl vagy könyvtár engedélyeinek reprezentálására. Minden számjegy más engedélykészletet reprezentál:

1. számjegy: a fájl tulajdonosának engedélyei
2. számjegy: a fájlhoz tartozó csoport engedélyei
3. számjegy: mindenki más engedélyei

Minden számjegy egy három bitből álló kombináció, ahol:

1. bit: olvasási engedély
2. bit: írási engedély
3. bit: végrehajtási engedély

A bit értékei:

- 4: olvasási engedély
- 2: írási engedély
- 1: végrehajtási engedély

Az engedélyek oktális értékének kiszámításához egyszerűen össze kell adni a bit értékeit az engedélykészletekhez.

**Például:**

- Ha a tulajdonos olvasási és írási engedéllyel rendelkezik (4 + 2 = 6), az első számjegy 6 lenne.
- Ha a csoport olvasási és végrehajtási engedéllyel rendelkezik (4 + 1 = 5), a második számjegy 5 lenne.
- Ha mindenki másnak nincs engedélye (0), a harmadik számjegy 0 lenne.

**Tehát például, ha egy fájl engedélyei 644 (alapértelmezett), az azt jelenti:**

- A tulajdonos olvasási és írási engedéllyel rendelkezik (6)
- A csoport olvasási engedéllyel rendelkezik (4)
- Mindenki más olvasási engedéllyel rendelkezik (4)

Az umask azon jogok összege, amelyeket a rendszer nem engedélyez. Például, ha az umask 022, akkor a rendszer nem engedélyezi a csoport és a többi felhasználó írási és végrehajtási jogát. Az umask értéke alapértelmezés szerint 022, de a felhasználók megváltoztathatják az umask értékét a .bashrc fájlban.

**Példa jogosultságok megtekintésére a parancssorban:**

```bash
$ ls -l
total 0
-rw-r--r-- 1 user user 0 Sep 27 10:00 file.txt
```

Itt a `rw-r--r--` rész a jogosultságokat jelenti.

- `rw-` a tulajdonos jogosultságai: olvasás és írás
- `r--` a csoport jogosultságai: olvasás
- `r--` mindenki más jogosultságai: olvasás

**Példa jogosultságok szerkesztésére a parancssorban:**

```bash
$ chmod 777 file.txt
$ ls -l
total 0
-rwxrwxrwx 1 user user 0 Sep 27 10:00 file.txt
```

Itt a `777` az összes jogosultságot jelenti.

- `7` a tulajdonos jogosultságai: olvasás, írás és végrehajtás
- `7` a csoport jogosultságai: olvasás, írás és végrehajtás
- `7` mindenki más jogosultságai: olvasás, írás és végrehajtás

## ACL (Access Control List)

Az ACL egy olyan rendszer, amely lehetővé teszi a felhasználók számára, hogy a fájlokhoz és könyvtárakhoz hozzáférési jogosultságokat rendeljenek hozzá. Az ACL-eket a fájlrendszeren kívül tárolják, és a fájlrendszeren keresztül érhetők el. Az ACL-eket például a Windows rendszerek is használják.

### Parancsok: `getfacl` és `setfacl`

A `getfacl` parancs segítségével tudjuk lekérdezni az ACL-eket, míg a `setfacl` parancs segítségével tudunk ACL-eket létrehozni, módosítani és törölni.

**Példa ACL létrehozására:**

```bash
$ setfacl -m u:user:rwx file.txt
$ getfacl file.txt
# file: file.txt
# owner: user
# group: user
user::rwx
user:user:rwx
group::r--
mask::rwx
other::r--
```

- a `u:user:rwx` rész a jogosultságokat jelenti: a `user` felhasználó számára `rwx` (read, write, execute) jogosultságokat adtunk meg a `file.txt` fájlhoz
- a `getfacl` paranccsal tudjuk lekérdezni az ACL-eket
- az ezutáni sorok a többi jogosultságot jelentik
- a `mask` rész a maszkot jelenti, ami az umask értékétől függ, ezek azok a jogosultságok, amelyeket a rendszer kizár a többi felhasználó számára
- az `other` rész a többi felhasználó jogosultságait jelenti (akik nem a tulajdonosok és nem a csoport tagjai)

## Parancsfuttatás a háttérben

Ha a parancsot a `&` karakterrel zárjuk, akkor a parancs a háttérben fut le, és a terminálunk továbbra is használható lesz.

### `sleep` parancs

A `sleep` parancs a megadott másodpercekig várakozik, majd leáll. Ha a `sleep` parancsot a `&` karakterrel zárjuk, akkor a parancs a háttérben fut le.

```bash
$ sleep 10 &
[1] 1234
$ echo "Hello"
Hello
```

- első sorban a `sleep 10` parancsot futtattuk a háttérben, majd a `&` után megjelenik egy `[1] 1234` szöveg. Ez a `[1]` jelzi, hogy a `sleep 10` parancs az első háttérben futó parancsunk, a `1234` pedig a parancs PID-je (Process ID).
- ezután kiírjuk a `Hello` szöveget, ami a `sleep 10` parancs leállása után jelenik meg.

## Folyamatok

A folymatok a háttérben futó parancsok. Amikor kijelentkezünk, a folyamatok leállnak.

### `nice` és `top` parancsok

A `nice` parancs segítségével a parancsok prioritását állíthatjuk be. A `top` parancs segítségével pedig a futó folyamatokat listázhatjuk ki.

```bash
$ nice -n 19 sleep 10 &
[1] 1234
$ top

top - 12:34:56 up  1:23,  1 user,  load average: 0.00, 0.00, 0.00
Tasks:  95 total,   1 running,  94 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   7841.9 total,   1067.8 free,   4608.4 used,   2165.7 buff/cache
MiB Swap:   2048.0 total,   2048.0 free,      0.0 used.   2618.8 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   1234 user      19  19       0      0      0 S   0.0   0.0   0:00.00 sleep
```

- a `nice -n 19` paranccsal a `sleep 10` parancs prioritását állítottuk be 19-re. A `top` parancs kimenetében a `PR` oszlopban látható, hogy a `sleep 10` parancs prioritása 19.
- a `top` parancs kimenete kiírja a `sleep 10` parancs PID-jét is, ami a `PID` oszlopban látható.

### `kill` parancs
