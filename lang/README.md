[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Lif - Lang
This is intended to be a small and simple language used primarily with the purpose of implementing a first skeleton of compiler optimizations (passes). This repository contains the implementation of a tool that, currently, has the following features: evaluate a given program (`-r`), generate a dot representation of the Control-flow Graph (CFG) (`--cfg`) and generate a dot representation of the Dominance Tree (`--dtree`).

## Grammar
Below is the grammar of the language. It is written in the BNF notation, extended with the following symbols:

- { }: repetition (zero or more)
- { }+: repetition (one or more)
- [ ]: optional

We use quotes (") on strings that conflict with special symbols.

<pre>
Unop       ::= - | ! | ~
Binop      ::= + | - | * | & | "|" | >> | << | = | != | < | > | <= | >=
Const      ::= { <i>digit</i> }+
Value      ::= Const | <i>id</i>
Expr       ::= Value | Unop Value | Value Binop Value
Terminator ::= jmp(<i>label</i>) | br(Value, <i>label</i>, <i>label</i>)
Inst       ::= alloc(<i>id</i>, Expr) | mov(<i>id</i>, Expr) | load(<i>id</i>, <i>id</i>, Value) | store(Value, <i>id</i>, Value)
            | phi(<i>id</i>, Value : <i>label</i> { , Value : <i>label</i> }+ | out(Expr)
Block      ::= { [label:] Inst } [label:] Terminator
Exit       ::= { [label:] Inst }
Prog       ::= { Block } Exit
</pre>

## Requirements
- [Stack](https://docs.haskellstack.org/en/stable/README/) >= 2.3.1

## Usage
- `stack run -- [opt]`, where opt can be one of the following:
  - -h: shows a help page with the commands available
  - -r <file.lif>: evaluates a given program
  - --cfg <file.lif>: generates a dot representation for the CFG of the given program
  - --dtree <file.lif>: generates a dot representation for the Dominance Tree of the given program
- `stack test`: runs a set of predefined tests, which can be found at folder _test_. Currently, the existing tests are related to the implementation of the invariant pass. Each one of those tests consists of two files: a source code _file.lif_ and a json _file.json_ that contains the initial state of the corresponding program as well as additional infos.
