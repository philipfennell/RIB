<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step 
    xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:p="http://www.w3.org/ns/xproc"
    xml:base="../../"
    name="generate-parser"
    version="1.0">
  <p:output port="result"/>
  
  <p:serialization port="result" encoding="UTF-8" indent="true" media-type="application/xml" method="xml"></p:serialization>
  
  <p:http-request method="xml" encoding="UTF-8" media-type="application/xml">
    <p:input port="source">
      <p:inline>
        <c:request method="GET" override-content-type="text/plain"
            href="file:/Users/pfennell/Projects/RIB/src/app/resources/ebnf/rib.ebnf"/>
      </p:inline>
    </p:input>
  </p:http-request>
  <p:sink/>
  <p:http-request method="xml" encoding="UTF-8" media-type="application/xml" indent="true">
    <p:input port="source">
      <p:inline>
        <c:request
            method="POST"
            detailed="true"
            href="http://www.bottlecaps.de/rex/">
          <c:multipart content-type="multipart/form-data;" boundary="=-=-=-=-=">
            <c:body content-type="" disposition='form-data; name="input"; filename="rib.ebnf"'><![CDATA[/* Parser type: LL1 with Backtracking */
RIB
::= Preamble EOF
Preamble
::= Command+
Command    
::= StructuralHint WS* NL?
StructuralHint
::= ( ('##RenderMan' WS Name) | ('##Scene' WS Name) | ('##Creator' WS Name) | 
('##CreationDate' WS DateTime) | ('##For' WS Name)|  ('##Frames' WS Number) | 
('##Textures' WS Texture+) | ('##Shaders' WS Shader+) | ('##CapabilitiesNeeded' WS Feature+) )
Shader
::= NMToken ','? WS?
Texture
::= NMToken ','? WS?
Feature
::= NMToken ','? WS?

<?TOKENS?>

Name    ::= ( [^#x000A#x000D#x000C\"] | WS | NONASCII | ESCAPE )*
Number
::= [0-9]+
DateTime
::= ( [^#x000A#x000D#x000C\"] | WS | NONASCII | ESCAPE )*
NMToken
::= [a-zA-Z]*

STRING  
::= ( STRING1 | STRING2 )
STRING1 
::= '"' ( [^#x000A#x000D#x000C\"] | '\' | NONASCII | ESCAPE )* '"'
STRING2 
::= "'" ( [^#x000A#x000D#x000C\'] | '\' | NONASCII | ESCAPE )* "'"
WS      ::= #x0020
NL      ::= #x000A
| #x000D #x000A
| #x000D
| #x000C
NONASCII 
::= [^#x0000-#x007F]
ESCAPE   
::= UNICODE
| '\' [^0-9a-f#x000A#x000D#x000C]
UNICODE  
::= '\' ONE-TO-SIX-HEX-DIGITS ( #x000D #x000A | [ #x000A#x000D#x0009#x000C] )?
ONE-TO-SIX-HEX-DIGITS
::= [0-9a-f]
| [0-9a-f] [0-9a-f]
| [0-9a-f] [0-9a-f] [0-9a-f]
| [0-9a-f] [0-9a-f] [0-9a-f] [0-9a-f]
| [0-9a-f] [0-9a-f] [0-9a-f] [0-9a-f] [0-9a-f]
| [0-9a-f] [0-9a-f] [0-9a-f] [0-9a-f] [0-9a-f] [0-9a-f]
EOF
::= #x0000]]></c:body>
            <c:body content-type="" disposition='form-data; name="command"'>-backtrack -xslt -main  -tree -ll 1</c:body>
          </c:multipart>
        </c:request> 
      </p:inline>
    </p:input>
  </p:http-request>
  
  <!--<p:store encoding="UTF-8" method="text" href="../test/results/parser.txt"/>-->
</p:declare-step>