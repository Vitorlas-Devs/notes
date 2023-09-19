# WELOME TO VITORLÁS NOTES MONOREPO

- mindenkinek külön branch névre
- onnan pull request mindig a mainbe
- a main az összesített anyagokat tartalmazza

- **Ajánlott szoftver: Obsidian vagy VS Code**

## Felépítés

### Monorepo structure

```graphql
├─ README.md - # Ez a fájl, infók
├─ CODEOWNERS - # Egyes tárgyak felelősei
├─ Tutorials/* - # Egyéb tutoriálok
│  └─ Obsidian.md - # Obsidian tutorial
├─ Pasted images/* - # Képek
├─ Home/* - # házi feladatok
│  └─ [Week number].md - # heti házik összeszedve
```

### Notes structure

```graphql
├─ [Semester] [Subject name]/* - # subject name
│  ├─ [Lesson number] - [Date]/* - # lesson number
│  │  ├─ [Lesson number].md - # lesson notes
│  │  ├─ [Other files] - # other files like code
```

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
```

## Workflow

1. Kell egy saját branch a saját neveddel
2. A `main` branch a fő branch amibe már átnézett anyagok kerülnek be, **és csak pull request** után
3. A saját branchből lehet pull requestet nyitni a mainbe, a `CODEOWNERS` fájl mutatja hogy kinek kell review-olnia mielőtt mergelni lehet
