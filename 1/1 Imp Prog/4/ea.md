# 4. előadás: Operátorok, kifejezések, utasítások

## Kifejezések

A kifejezések a programozás alapvető építőkövei. A kifejezéseknek van egy értékük, amit a kifejezés kiértékelése során kapunk meg. A kifejezések lehetnek változók, konstansok, literálok, függvényhívások, operátorok, vagy ezek kombinációi.

A kifejezéseknek van egy típusuk és egy értékük. A típusuk meghatározza, hogy milyen értékekkel rendelkezhetnek.

A kifejezéseknek van egy precedenciájuk is, ami meghatározza, hogy milyen sorrendben értékelődnek ki. A kifejezések kiértékelése balról jobbra történik, azonos precedencia esetén.

## Operátorok

| Precedence | Operator | Name | Description | Associativity | Example |
| ---------- | -------- | ---- | ----------- | ------------- | ------- |
| Postfix | `++` | Increment by one | First returns the value, then adds one | Left-to-right | `a++` |
| | `--` | Decrement by one | First returns the value, then subtracts one | | `a--` |
| | `()` | Function call | Invoke a function | | `someFunction()` |
| | `[]` | Array subscripting | Access an array element at a specified index | | `array[0]` |
| | `.` | Structure and union member access | Access a member of a struct or union | | `struct.member` |
| | `->` | Structure and union member access through pointer | Access a member of a struct or union through a pointer | | `structPointer->member` |
| | `(type){list}` | Compound literal(C99) | Create an unnamed object with a given type and initialize it with a list of initializers | | `(int){1, 2, 3}` |
| Unary | `++` | Increment by one | First adds one, then returns the value | Right-to-left | `++a` |
| | `--` | Decrement by one | First subtracts one, then returns the value | | `--a` |
| | `+` | Unary plus | This operator doesn't do anything (just for symmetry) | | `+a` |
| | `-` | Unary minus | Multiply by -1 | | `-a` |
| | `!` | Logical NOT | Make true false and false true | | `!a` |
| | `~` | Bitwise NOT | In the binary representation of a number, change all ones to zeros and all zeros to ones | | `~a` |
| | `*` | Indirection (dereference) | Access the value at the address | | `*a` |
| | `&` | Address-of | Get the address of a variable | | `&a` |
| | `sizeof` | Size-of | Determine the size in bytes of a type or variable | | `sizeof(int)` |
| | `_Alignof` | Alignment requirement | Determine the alignment requirement of a type | | `_Alignof(int)` |
| Multiplicative | `*` | Multiplication | Multiply | Left-to-right | `a * b` |
| | `/` | Division | Divide | | `a / b` |
| | `%` | Remainder | Divide and return the remainder | | `a % b` |
| Additive | `+` | Addition | Add | Left-to-right | `a + b` |
| | `-` | Subtraction | Subtract | | `a - b` |
| Shift | `<<` | Left shift | Shift the bits of the first operand left by the specified number of bits | Left-to-right | `a << b` |
| | `>>` | Right shift | Shift the bits of the first operand right by the specified number of bits | | `a >> b` |
| Relational | `<` | Less than | True if the first operand is less than the second operand | Left-to-right | `a < b` |
| | `>` | Greater than | True if the first operand is greater than the second operand | | `a > b` |
| | `<=` | Less than or equal to | True if the first operand is less than or equal to the second operand | | `a <= b` |
| | `>=` | Greater than or equal to | True if the first operand is greater than or equal to the second operand | | `a >= b` |
| Equality | `==` | Equal to | True if the operands are equal | Left-to-right | `a == b` |
| | `!=` | Not equal to | True if the operands are not equal | | `a != b` |
| Bitwise | `&` | Bitwise AND | Perform a bitwise AND operation | Left-to-right | `a & b` |
| | `^` | Bitwise XOR | Perform a bitwise XOR operation | | `a ^ b` |
| | `I` | Bitwise OR | Perform a bitwise OR operation | | `a I b` |
| Logical | `&&` | Logical AND | True if both operands are true | Left-to-right | `a && b` |
| | `II` | Logical OR | True if either operand is true | | `a II b` |
| Ternary | `? :` | Conditional | If the first operand is true, evaluate the second operand, otherwise evaluate the third operand | Right-to-left | `a ? b : c` |
| Assignment | `=` | Simple assignment | Assign the value of the right operand to the left operand | Right-to-left | `a = b` |
| | `+=` | Add and assignment | Add the value of the right operand to the left operand and assign the result to the left operand | | `a += b` |
| | `-=` | Subtract and assignment | Subtract the value of the right operand from the left operand and assign the result to the left operand | | `a -= b` |
| | `*=` | Multiply and assignment | Multiply the value of the right operand with the left operand and assign the result to the left operand | | `a *= b` |
| | `/=` | Divide and assignment | Divide the value of the left operand by the right operand and assign the result to the left operand | | `a /= b` |
| | `%=` | Modulus and assignment | Calculate the modulus of the left operand by the right operand and assign the result to the left operand | | `a %= b` |
| | `<<=` | Left shift and assignment | Shift the bits of the left operand left by the number of bits specified by the right operand and assign the result to the left operand | | `a <<= b` |
| | `>>=` | Right shift and assignment | Shift the bits of the left operand right by the number of bits specified by the right operand and assign the result to the left operand | | `a >>= b` |
| | `&=` | Bitwise AND and assignment | Perform a bitwise AND operation between the left operand and the right operand and assign the result to the left operand | | `a &= b` |
| | `^=` | Bitwise XOR and assignment | Perform a bitwise XOR operation between the left operand and the right operand and assign the result to the left operand | | `a ^= b` |
| | `I=` | Bitwise OR and assignment | Perform a bitwise OR operation between the left operand and the right operand and assign the result to the left operand | | `a I= b` |
| Sequence | `,` | Comma | Evaluate both operands, discarding the result of the first operand, and return the result of the second operand | Left-to-right | `a, b` |

### Megjegyzések

**Nem kiértékelt operátorok**

- `sizeof`, `_Alignof`

Ezek nem értékelik ki a bennük lévő kifejezéseket, hanem csak a típusukat. A `sizeof` operátor a típus méretét adja vissza bájtban, az `_Alignof` operátor pedig a típus igazítását adja vissza bájtban.

A preprocesszor hajtja végre ezeket az operátorokat, nem a fordító.

**Bináris vagy/és precedenciája**

A `&&` és `||` operátorok precedenciája nagyobb, mint a `&` és `|` operátoroké. Ezért a `&&` és `||` operátorokat használjuk logikai műveletekhez, a `&` és `|` operátorokat pedig bitenkénti műveletekhez.

Péládul:

```c
if (flag & 0xff == 0) {
    // ...
}
```

Itt a `==` operátor precedenciája nagyobb, mint a `&` operátoré, ezért a `0xff == 0` kifejezés kiértékelődik először, ami hamis értéket ad vissza. Ezután a `flag & 0` kifejezés kiértékelődik, ami mindig hamis értéket ad vissza.

**Többszörös értékadás és deklaráció**

A többszörös értékadás balról jobbra történik. A többszörös értékadás visszatérési értéke az utolsó értékadás visszatérési értéke.

```c
int a, b, c;   // többszörös deklaráció
a = b = c = 0; // többszörös értékadás
```

## Kifejezések kiértékelése

```c
int i = 1;

printf("%d %d\n", i, ++i); // 2 2
```

Ebben a példában a printf függvény nem sorban (balról jobbra) végzi el a műveleteket a paraméterekkel, hanem a paraméterek kiértékelése sorrendjében. A `++i` kifejezés kiértékelése előtt a `i` változó értéke 1, a kiértékelése után pedig 2. A `i` változó értéke tehát 2 lesz, mielőtt a `printf` függvény kiértékelné a `i` változó értékét.

**UNDEFINED BEHAVIOR!!!**

(undefined behaviors are bad, learn Rust guys)

Ez a nem definiált viselkedés. A C nyelv nem definiálja, hogy a kifejezések kiértékelése milyen sorrendben történik. A fenti példában a `printf` függvény paraméterei jobbról balra értékelődnek ki, de ez nem garantált. A `printf` függvény paraméterei között nincs szekvenciapont, ezért a `printf` függvény paraméterei között nincs szekvenciális függőség. A szekvenciapontokról később lesz szó.

## Szekvenciapontok

A szekvenciapontok olyan pontok a programban, ahol a program szekvenciálisan halad tovább. A szekvenciapontok biztosítják, hogy a program szekvenciálisan haladjon tovább, és hogy a program működése definiált legyen.

A szekvenciapontok a következők:

- A program végén
- A `;` operátor használatakor
- Az `&&`, `||`, `? :` operátorok használatakor
- A `for`, `while`, `do while` ciklusok feltételeinek kiértékelésekor
- Az `if`, `switch` feltételeinek kiértékelésekor
- A `return` utasítás végrehajtásakor
- A `break`, `continue` utasítások végrehajtásakor
- A `goto` utasítás végrehajtásakor

## Utasítások
