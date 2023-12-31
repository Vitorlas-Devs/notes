<h1 align="left">
  WELCOME TO VITORLÁS NOTES MONOREPO
  <img align="right" height="150px" src="https://github.com/Vitorlas-Devs/notes/assets/36823200/7a962c6e-f75b-41d7-a2fa-fc02f537d5f9" />
</h1>

Ajánlott szoftver: **[Obsidian](https://obsidian.md/)** vagy **VS Code + [GitHub Desktop](https://desktop.github.com/)**

- mindenkinek külön branch névre
- onnan pull request mindig a mainbe
- a main az összesített anyagokat tartalmazza

> **Warning**
> A saját branch-edet frissíteni kell ha a `main` újabb, és meg szeretnéd kapni azokat a változtatásokat

## Felépítés

### Monorepo structure

```graphql
├─ README.md - # Ez a fájl, infók
├─ CODEOWNERS - # Egyes tárgyak felelősei
├─ Tutorials/* - # Egyéb tutoriálok
│  └─ Obsidian.md - # Obsidian tutorial
└─ Pasted images/* - # Képek
```

### Notes structure

```graphql
└─ [Semester] [Subject name]/* - # tárgyak szemeszterre lebontva
    └─ [Week number]/* - # minden hét külön mappában
      ├─ gyak.md - # gyakorlati anyagok (lehet source code is)
      └─ ea.md - # előadás anyagok
```

> **Warning**
> Ha egy tárgy más struktúrát követel, akkor a mappájában van egy `README.md` fájl, és az felülírja ezt.

### Lesson markdown structure

```md
# [Lesson]

## 1. [Fejezet]

### 1.1 [Alfejezet]

- Lista

Táblázat:
| Fejléc 1 | Fejléc 2 |
| -------- | -------- |
| Tartalom | Tartalom |
| Tartalom | Tartalom |
|

Link: TODO

Dropdown:
The `open` tag is optional, it means that the dropdown is open by default
<details open>
<summary><b>Title of dropdown</b></summary>

Content of dropdown
</details>
```

## Workflow

1. Kell egy saját branch a saját neveddel
2. A `main` branch a fő branch amibe már átnézett anyagok kerülnek be, **és csak pull request** után
3. A saját branchből lehet pull requestet nyitni a mainbe, a [`CODEOWNERS`](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) fájl mutatja hogy kinek kell review-olnia mielőtt mergelni lehet
