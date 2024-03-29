# This is the Ultimate CAP'N PROTO tutorial

# CLI TOOL

# Rust
# capnp compile -orust:src schema.capnp

@0xab0e0a5b9a6b1733; # unique file ID, generated by `capnp id`

# Some notes:

# - Types come after names. The name is by far the most important thing to see, especially when quickly skimming,
# so we put it up front where it is most visible. Sorry, C got it wrong.
# - The @N annotations show how the protocol evolved over time, so that the system can make sure to maintain compatibility
# with older versions. Fields (and enumerants, and interface methods) must be numbered consecutively starting from zero
# in the order in which they were added. In this example, it looks like the birthdate field was added to the Person
# structure recently – its number is higher than the email and phones fields. Unlike Protobufs, you cannot skip numbers
# when defining fields – but there was never any reason to do so anyway.

# # This is a comment.
# Comments meant as documentation should appear after the declaration, either on the same line, or on a subsequent line. 
# Doc comments for aggregate definitions should appear on the line after the opening brace.

struct Date {
  # A standard Gregorian calendar date.

  year @0 :Int16;
  # The year.  Must include the century.
  # Negative value indicates BC.

  month @1 :UInt8;   # Month number, 1-12.
  day @2 :UInt8;     # Day number, 1-30.
}

# Placing the comment after the declaration rather than before makes the code more readable, especially when doc comments 
# grow long. You almost always need to see the declaration before you can start reading the comment.

# Built-in Types
# The following types are automatically defined:

# Void: Void
# Boolean: Bool
# Integers: Int8, Int16, Int32, Int64
# Unsigned integers: UInt8, UInt16, UInt32, UInt64
# Floating-point: Float32, Float64
# Blobs: Text, Data
# Lists: List(T)
# Notes:

# The Void type has exactly one possible value, and thus can be encoded in zero bits. It is rarely used, but can be useful
# as a union member. Text is always UTF-8 encoded and NUL-terminated.
# Data is a completely arbitrary sequence of bytes.
# List is a parameterized type, where the parameter is the element type. For example, List(Int32), List(Person), and 
# List(List(Text)) are all valid.

# Structs
# A struct has a set of named, typed fields, numbered consecutively starting from zero.

struct Person {
  name @0 :Text;
  email @1 :Text;
}

# Fields can have default values:
struct Struct {
  foo @0 :Int32 = 123;
  bar @1 :Text = "blah";
  baz @2 :List(Bool) = [ true, false, false, true ];
  qux @3 :Person = (name = "Bob", email = "bob@example.com");
  corge @4 :Void = void;
  grault @5 :Data = 0x"a1 40 33";
}

# Unions
# A union is two or more fields of a struct which are stored in the same location. Only one of these fields can be set at 
# a time, and a separate tag is maintained to track which one is currently set. Unlike in C, unions are not types, they are 
# simply properties of fields, therefore union declarations do not look like types.

struct Employee {
  struct Company {
    name @0 :Text;
    id @1 :UInt64;
  }

  struct School {
    name @0 :Text;
    id @1 :UInt64;
  }
  
  employment :union {
    # We assume that an employee is only one of these.
    unemployed @0 :Void;
    employer @1 :Company;
    school @2 :School;
    selfEmployed @3 :Void;
  }
}

# Additionally, unions can be unnamed. Each struct can contain no more than one unnamed union. Use unnamed unions in cases 
# where you would struggle to think of an appropriate name for the union, because the union represents the main body of the struct.
struct Shape {
  area @0 :Float64;
  union {
    circle @1 :Float64;      # radius
    square @2 :Float64;      # width
  }
}

# Notes:
# - Unions members are numbered in the same number space as fields of the containing struct. Remember that the purpose of the
# numbers is to indicate the evolution order of the struct. The system needs to know when the union fields were declared 
# relative to the non-union fields.
# - Notice that we used the “useless” Void type here. We don’t have any extra information to store for the unemployed or 
# selfEmployed cases, but we still want the union to distinguish these states from others.

# Groups
# A group is a set of fields that are encapsulated in their own scope.

struct Home {
  size @0 :Int32;
  
  address :group {
    # Note:  This is a terrible way to use groups, and meant
    #        only to demonstrate the syntax.
    houseNumber @1 :UInt32;
    street @2 :Text;
    city @3 :Text;
    country @4 :Text;
  }
}

# Interface-wise, the above group behaves as if you had defined a nested struct called Address and then a field 
# address :Address. However, a group is not a separate object from its containing struct: the fields are numbered in the
# same space as the containing struct’s fields, and are laid out exactly the same as if they hadn’t been grouped at all. 
# Essentially, a group is just a namespace.

# Groups on their own (as in the above example) are useless, almost as much so as the Void type.
# They become interesting when used together with unions.

struct Shape2 {
  area @0 :Float64;

  union {
    circle :group {
      radius @1 :Float64;
    }
    rectangle :group {
      width @2 :Float64;
      height @3 :Float64;
    }
  }
}

# There are two main reason to use groups with unions:

# - They are often more self-documenting. Notice that radius is now a member of circle,
# so we don’t need a comment to explain that the value of circle is its radius.
# - You can add additional members later on, without breaking compatibility. Notice how we upgraded square to rectangle above, 
# adding a height field. This definition is actually wire-compatible with the previous version of the Shape example from 
# the “union” section (aside from the fact that height will always be zero when reading old data – it’s not a perfect example). 
# - Note that a named union is actually exactly equivalent to a named group containing an unnamed union.

# Wait, weren’t groups considered a misfeature in Protobufs? Why did you do this again?
# - They are useful in unions, which Protobufs did not have. Meanwhile, you cannot have a “repeated group” in Cap’n Proto, 
# which was the case that got into the most trouble with Protobufs.

# Enums
# An enum is a type with a small finite set of symbolic values.

enum Rfc3092Variable {
  foo @0;
  bar @1;
  baz @2;
  qux @3;
  # ...
}

# Like fields, enumerants must be numbered sequentially starting from zero. In languages where enums have numeric values,
# these numbers will be used, but in general Cap’n Proto enums should not be considered numeric.

# Interfaces
# An interface has a collection of methods, each of which takes some parameters and return some results. Like struct fields,
# methods are numbered. Interfaces support inheritance, including multiple inheritance.

interface Node {
  isDirectory @0 () -> (result :Bool);
}

interface Directory extends(Node) {
  list @0 () -> (list :List(Entry));
  struct Entry {
    name @0 :Text;
    node @1 :Node;
  }

  create @1 (name :Text) -> (file :File);
  mkdir @2 (name :Text) -> (directory :Directory);
  open @3 (name :Text) -> (node :Node);
  delete @4 (name :Text);
  link @5 (name :Text, node :Node);
}

interface File extends(Node) {
  size @0 () -> (size :UInt64);
  read @1 (startAt :UInt64 = 0, amount :UInt64 = 0xffffffffffffffff)
       -> (data :Data);
  # Default params = read entire file.

  write @2 (startAt :UInt64, data :Data);
  truncate @3 (size :UInt64);
}

# Notice something interesting here: Node, Directory, and File are interfaces, but several methods take these types as parameters 
# or return them as results. Directory.Entry is a struct, but it contains a Node, which is an interface. 

# Generic Types
# A struct or interface type may be parameterized, making it “generic”. For example, this is useful for defining type-safe containers:

struct Map(Key, Value) {
  entries @0 :List(Entry);
  struct Entry {
    key @0 :Key;
    value @1 :Value;
  }
}

struct People {
  byName @0 :Map(Text, Person);
  # Maps names to Person instances.
}

struct PersonMap {
  # Encoded the same as Map(Text, Person).
  entries @0 :List(Entry);
  struct Entry {
    key @0 :Text;
    value @1 :Person;
  }
}

# Therefore, it is possible to upgrade non-generic types to generic types while retaining backwards-compatibility.

# Similarly, a generic interface’s protocol is the same as the interface obtained by manually substituting the generic parameters.

# Generic Methods
# Interface methods may also have “implicit” generic parameters that apply to a particular method call.
# This commonly applies to “factory” methods. For example:

interface Assignable(T) {
  # A generic interface, with non-generic methods.
  get @0 () -> (value :T);
  set @1 (value :T) -> ();
}

interface AssignableFactory {
  newAssignable @0 [T] (initialValue :T) -> (assignable :Assignable(T));
  # A generic method.
}

# Here, the method newAssignable() is generic. The return type of the method depends on the input type.

# Ideally, calls to a generic method should not have to explicitly specify the method’s type parameters, because they should be
# inferred from the types of the method’s regular parameters.

# Constants
# You can define constants in Cap’n Proto. These don’t affect what is sent on the wire, but they will be included
# in the generated code, and can be evaluated using the capnp tool.

const pi :Float32 = 3.14159;
const bob :Person = (name = "Bob", email = "bob@example.com");
const secret :Data = 0x"9f98739c2b53835e 6720a00907abd42f";

# Additionally, you may refer to a constant inside another value (e.g. another constant, or a default value of a field).
struct SomeStruct {
  id @0 :Int32;
  message @1 :Text;
}

const foo :Int32 = 123;
const bar :Text = "Hello";
const baz :SomeStruct = (id = .foo, message = .bar);

# Note that when substituting a constant into another value, the constant’s name must be qualified with its scope. 
# E.g. if a constant qux is declared nested in a type Corge, it would need to be referenced as Corge.qux rather than just qux,
# even when used within the Corge scope.

# Nesting, Scope, and Aliases
# You can nest constant, alias, and type definitions inside structs and interfaces (but not enums). 
# This has no effect on any definition involved except to define the scope of its name. So in Java terms, inner classes are
# always “static”. To name a nested type from another scope, separate the path with .s.

struct Foo {
  struct Bar {
    #...
  }
  bar @0 :Bar;
}

struct Baz {
  bar @0 :Foo.Bar;
}

# If typing long scopes becomes cumbersome, you can use `using` to declare an alias:
struct Qux {
  using Foo.Bar;
  bar @0 :Bar;
}

struct Corge {
  using T = Foo.Bar;
  bar @0 :T;
}

# Imports
# An import expression names the scope of some other file:

struct Foo2 {
  baz @0 :import "cap n proto.capnp".Baz;
}

# Of course, typically it’s more readable to define an alias:
using Bar = import "cap n proto.capnp";

struct Foo3 {
  baz @0 :Bar.Baz;
}

# Or even this, and then refer to the type as just Baz:
# using import "cap n proto.capnp".Baz;

# The above imports specify relative paths. If the path begins with a /, it is absolute.

# Annotations
# Sometimes you want to attach extra information to parts of your protocol that isn’t part of the Cap’n Proto language.
# This information might control details of a particular code generator, or you might even read it at run time to assist 
# in some kind of dynamic message processing. For example, you might create a field annotation which means “hide from the public”, 
# and when you send a message to an external user, you might invoke some code first that iterates over your message and
# removes all of these hidden fields.

# You may declare annotations and use them like so:

annotation ann(struct, enum) :Text;
# # Declare an annotation 'ann' which applies to struct and enum types.

struct MyType $ann("foo") {
  # Apply 'ann' to to MyType.
  # ...
}

# The possible targets for an annotation are: file, struct, field, union, group, enum, enumerant, interface, method, param, annotation, const. You may also specify * to cover them all.

annotation test(*) :Int32;
# 'test' can annotate anything!

$test(1);  # Annotate the file.

struct MyStruct $test(2) {
  myField @0 :Text = "default" $test(3);
  myUnion :union $test(4) {
    foo @1 :Text $test(5);
    bar @2 :Int32 $test(6);
  }
}

enum MyEnum $test(5) {
  myEnumerant @0 $test(6);
}

interface MyInterface $test(7) {
  myMethod @0 (myParam :Text $test(9)) -> () $test(8);
}

annotation myAnnotation(struct) :Int32 $test(10);
const myConst :Int32 = 123 $test(11);

# Void annotations can omit the value. Struct-typed annotations are also allowed.
# Tip: If you want an annotation to have a default value, declare it as a struct with a single field with a default value.
annotation qux(struct, field) :Void;

struct Annotator $qux {
  string @0 :Text $qux;
  number @1 :Int32 $qux;
}

annotation corge(file) :Annotator;

$corge(string = "hello", number = 123);

struct Grault {
  value @0 :Int32 = 123;
}

annotation grault(file) :Grault;

$grault();  # value defaults to 123
$grault(value = 456);

# Unique IDs
# A Cap’n Proto file must have a unique 64-bit ID, and each type and annotation defined therein may also have an ID.
# Use capnp id to generate a new ID randomly. ID specifications begin with @:

# @0xdbb9ad1f14bf0b36;
# file ID

struct A @0x8db435604d0d3723 {
  # ...
}

enum B @0xb400f69b5334aab3 {
  # ...
}

interface C @0xf7141baba3c12691 {
  # ...
}

annotation d @0xf8a1bedf44c89f00 (field) :Text;

# - If you omit the ID for a type or annotation, one will be assigned automatically. 
# - This default ID is derived by taking the first 8 bytes of the MD5 hash of the parent scope’s ID concatenated with the
# declaration’s name (where the “parent scope” is the file for top-level declarations, or the outer type for nested declarations).
# - You can see the automatically-generated IDs by “compiling” your file with the -ocapnp flag, which echos the schema back
# to the terminal annotated with extra information, e.g. capnp compile -ocapnp myschema.capnp.
# - In general, you would only specify an explicit ID for a declaration if that declaration has been renamed or moved and you
# want the ID to stay the same for backwards-compatibility.
