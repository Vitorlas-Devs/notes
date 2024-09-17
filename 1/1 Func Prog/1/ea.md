# Funkcionális Programozás 1. óra: Origins

## 1. Bevezetés

### 1.1 A funkcionális programozási nyelvek

- Haskell compiled nyelv
- Deklaratív programozási nyelvekhez tartoznak: a számítási folyamat leírása deklarációk halmaza
- Matematikai számítási modell alapján

## Lazy and Strict evaluation

Imperatív nyelvekben a kiértékelés így történik:

```c
int x = f(x);
int y = g(x);
int z = h(z);
```

A függvények kiértékelése sorrendben történik, a függvények paraméterei kiértékelődnek, majd a függvények maguk.

Ez 3 időegységbe telik. Ez a strict evaluation.

Funkcionális nyelvekben a kiértékelés így történik:

```haskell
test a =
    let a = f x
        b = g x
        c = h x
  in
    if a then b else c
```

A függvények kiértékelése nem szekvenciális, hanem párhuzamos. A függvények paraméterei kiértékelődnek, majd a függvények maguk.

Ez 1 időegységbe telik. Ez a lazy evaluation.
