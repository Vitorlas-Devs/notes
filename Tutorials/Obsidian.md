Ez alapvetően egy notepad, DE van benne markdown support, rengeteg plugin és tömérdek hasznos feature. Tudom ajánlani mindenkinek, aki telefonon/gépen szeretne egyetemen jegyzetelni.

Egy nagyon jó ízelítőnek ajánlom megnézni ezt a videót: <https://youtu.be/DbsAQSIKQXk>

## Telepítés
**Gépre:** <https://obsidian.md/>
**Telefonra:** Megtalálod a Play Store-ban vagy az App Store-ban.

Telepítés után hozzatok létre egy Vault-ot. Ez egy szimpla mappa kell legyen, bárhol az eszközön, ahol elérhető. Ez lesz a workspace, ide hozhattok létre majd az Obsidian-on belül még mappákat és fájlokat.

## Plugin-ok, beállítások
Ajánlom, hogy nézegessétek végig a beállításokat, hogy Nektek kényelmes legyen majd használni, illetve nem árt kicsit görgetni a leghíresebb plugin-ok között se, mert sok hasznosat lehet találni.

**Fontos!**
Amelyik plugin-t telepítitek, azt ne felejtsétek el aktiválni is.
Minden beállítást, illetve plugin-t be kell állítani minden eszközön. Az `.obsidian` mappába kerülnek ezek, tehát van lehetőség átdobni.

Ha nem akartok keresgélni, akkor itt vannak, amiket Én telepítettem és ajánlom, hogy Ti is:

Core plugin-ok:

*Képek helye... WIP*

Community plugin-ok:

*Képek helye... WIP*

## Obsidian with Git
Talán a Git a legegyszerűbb módja annak, hogy eszközök közötti szinkronizációt valósítsunk meg, illetve, hogy egymás között oszthassunk meg egyszerűen jegyzeteket. Ehhez mindössze telepíteni és aktiválni kell az `Obsidian Git` plugin-t.

### Git beállítások
Azért, hogy használhassátok a Git autentikációt igénylő funkcióit, meg kell majd adnotok pár adatot. Emellett mutatok néhány egyéb hasznos beállítást is, hogy kényelmesen mentsen mindent magától az Obsidian.

Számítógépen a telepített git-ből kiszedi a belépési adatokat. Ehhez útmutatót itt találtok: <https://docs.github.com/en/get-started/quickstart/set-up-git>
Ne felejtsétek el autentikálni is magatokat, ehhez itt van még segítség: <https://cli.github.com/manual/gh_auth_login>

**Fontos!**
A GitHub nem engedi, hogy szimplán a jelszavaitokkal lépjetek be Git-en keresztül. Ehhez csinálnotok kell egy **`access token`**-t, és azt használni jelszónak.

### GitHub Access Token
1. Lépjetek be GitHub-ra.
2. Menjetek a beállításokba.
3. 

### Repository klónozása
VSCode-hoz hasonlóan az Obsidian-nak is van **Command Palette**-je, amit alapértelmezetten a `Ctrl + P` billentyű kombinációval lehet felhozni. Szinte mindent innen lehet elérni, és innen kell beállítani a Git repository-t is.
1. Ha szeretnétek, akkor csináljatok egy saját repository-t valahova, ahol el tudjátok érni. **Figyelem!** Legyen már most létrehozva egy main branch, különben az Obsidian nem tud vele mit kezdeni.
2. Keressétek meg az `Obsidian Git: Clone an existing remote repo` parancsot és válasszátok ki.
3. Illesszétek be a repository URL-jét. Ha szeretnétek a közös repo-t is használni, akkor annak a linkje: <https://github.com/Vitorlas-Devs/Obsidian-Vitorla> (Ne felejtsetek először hozzáférést kérni az organization-höz, illetve a repo-hoz.)
4. Adjatok meg egy nevet a repo mappájának. Én azt tanácsolom, hogy ne a root-ba állítsátok, mert akkor úgy már egyrészt nem tudtok több repot beállítani a Vault-ba, másrészt a beállításaitokat is feltöltitek, ami lehet nem fog mindenkinek megfelelni, illetve ebben benne lesz az autentikációs kulcsotok. A közös repo-nak én azt a nevet adtam, hogy `Obsidian Vitorla`.
5. Utolsó prompt-nál egy szimpla enter, aztán mikor kéri, indítsátok újra az Obsidian-t.