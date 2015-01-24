# RenderMan Interface Bytestream (RIB) Parser

Create a RIB parser by defining an EBNF for RIB and then generating the parser 
using bottlecap's Rex parser generator.

<http://www.bottlecaps.de/rex/>

Parser type: LL1 with Backtracking

## Scope

* Preamble and global variable declarations (RIB requests: version, declare)
* Static options and default attributes (image and display options, camera options) 
* Static camera transformations (camera location and orientation)
** Frame block (if more than one frame)
*** Frame-specific variable declarations 
*** Variable options and default attributes 
*** Variable camera transforms
*** World block
**** (scene description)
**** User Entity (enclosed within AttributeBegin/AttributeEnd) 
**** User Entity (enclosed within AttributeBegin/AttributeEnd) 
**** User Entity
*** more frame blocks