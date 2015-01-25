<?xml version="1.0" encoding="UTF-8"?>
<!-- This file was generated on Sun Jan 25, 2015 16:51 (UTC) by REx v5.32 which is Copyright (c) 1979-2014 by Gunther Rademacher <grd@gmx.net> -->
<!-- REx command line: rib.ebnf -xslt -main -tree -ll 1 -backtrack -->

<xsl:stylesheet version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="rib">
  <!--~
   ! The index of the parser state for accessing the combined
   ! (i.e. level > 1) lookahead code.
  -->
  <xsl:variable name="p:lk" as="xs:integer" select="1"/>

  <!--~
   ! The index of the parser state for accessing the position in the
   ! input string of the begin of the token that has been shifted.
  -->
  <xsl:variable name="p:b0" as="xs:integer" select="2"/>

  <!--~
   ! The index of the parser state for accessing the position in the
   ! input string of the end of the token that has been shifted.
  -->
  <xsl:variable name="p:e0" as="xs:integer" select="3"/>

  <!--~
   ! The index of the parser state for accessing the code of the
   ! level-1-lookahead token.
  -->
  <xsl:variable name="p:l1" as="xs:integer" select="4"/>

  <!--~
   ! The index of the parser state for accessing the position in the
   ! input string of the begin of the level-1-lookahead token.
  -->
  <xsl:variable name="p:b1" as="xs:integer" select="5"/>

  <!--~
   ! The index of the parser state for accessing the position in the
   ! input string of the end of the level-1-lookahead token.
  -->
  <xsl:variable name="p:e1" as="xs:integer" select="6"/>

  <!--~
   ! The index of the parser state for accessing the token code that
   ! was expected when an error was found.
  -->
  <xsl:variable name="p:error" as="xs:integer" select="7"/>

  <!--~
   ! The index of the parser state for accessing the memoization
   ! of backtracking results.
  -->
  <xsl:variable name="p:memo" as="xs:integer" select="8"/>

  <!--~
   ! The index of the parser state that points to the first entry
   ! used for collecting action results.
  -->
  <xsl:variable name="p:result" as="xs:integer" select="9"/>

  <!--~
   ! The codepoint to charclass mapping for 7 bit codepoints.
  -->
  <xsl:variable name="p:MAP0" as="xs:integer+" select="
    39, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1, 6, 7, 1, 1, 1, 8, 1, 1, 1, 1, 9, 1, 1, 1, 10, 10, 10,
    10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 11, 11, 12, 13, 11, 14, 11, 11, 11, 11, 11, 11, 15, 16, 11, 11, 11, 17, 18, 19, 11, 11, 11, 11, 11, 11, 1,
    20, 1, 1, 1, 1, 21, 22, 23, 24, 25, 26, 11, 27, 28, 11, 11, 29, 30, 31, 32, 33, 11, 34, 35, 36, 37, 11, 11, 38, 11, 11, 1, 1, 1, 1, 1
  "/>

  <!--~
   ! The codepoint to charclass mapping for codepoints below the surrogate block.
  -->
  <xsl:variable name="p:MAP1" as="xs:integer+" select="
    54, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58,
    58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 90, 122, 180, 211, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148,
    148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 39, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1, 6, 7, 1, 1, 1, 8, 1, 1, 1, 1, 9, 1, 1, 1, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 11, 12, 13, 11, 14, 11, 11, 11, 11, 11, 11, 15, 16, 11, 11, 11, 17, 18, 19, 11, 11, 11, 11, 11,
    11, 1, 20, 1, 1, 1, 21, 22, 23, 24, 25, 26, 11, 27, 28, 11, 11, 29, 30, 31, 32, 33, 11, 34, 35, 36, 37, 11, 11, 38, 11, 11, 1, 1, 1, 1, 1
  "/>

  <!--~
   ! The codepoint to charclass mapping for codepoints above the surrogate block.
  -->
  <xsl:variable name="p:MAP2" as="xs:integer+" select="
    57344, 65536, 65533, 1114111, 1, 1
  "/>

  <!--~
   ! The token-set-id to DFA-initial-state mapping.
  -->
  <xsl:variable name="p:INITIAL" as="xs:integer+" select="
    257, 2, 515, 4, 5, 6, 7, 8, 9, 10, 11, 12
  "/>

  <!--~
   ! The DFA transition table.
  -->
  <xsl:variable name="p:TRANSITION" as="xs:integer+" select="
    1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 640, 1039, 1040, 651, 1038, 770, 1039, 1167, 836, 1039,
    1289, 1167, 1167, 1167, 1167, 1167, 1167, 686, 698, 651, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 1167, 686, 849, 987, 847,
    919, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 1167, 711, 1072, 1013, 1070, 723, 662, 1167, 666, 662, 1355, 1167, 1167, 1167, 1167, 1167,
    736, 741, 1040, 651, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 690, 861, 1186, 1345, 1343, 753, 1344, 1167, 1055, 1344, 1344,
    1167, 1167, 1167, 1167, 1167, 640, 764, 833, 651, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 781, 670, 1271, 794, 1038, 1107,
    670, 1167, 674, 670, 1324, 1167, 1167, 1167, 1167, 1167, 640, 801, 1040, 651, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 815,
    873, 1020, 826, 1129, 844, 1204, 1167, 857, 1059, 1289, 1167, 1167, 1167, 1167, 1167, 869, 881, 1040, 651, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167,
    1167, 1167, 1167, 1167, 869, 881, 1040, 905, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 930, 937, 1040, 651, 1038, 770, 1039,
    1167, 836, 1039, 1289, 1167, 658, 1167, 1167, 1167, 869, 881, 1040, 945, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 869, 881,
    1040, 651, 1038, 770, 1039, 1167, 836, 1039, 1289, 1200, 1167, 1167, 1167, 1167, 869, 881, 1040, 651, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167,
    994, 1167, 1167, 869, 881, 1040, 960, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 869, 881, 1040, 980, 1038, 770, 1039, 1167, 836,
    1039, 1289, 1167, 1167, 1167, 1167, 1167, 869, 881, 1040, 1006, 1038, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 1035, 678, 728, 1048,
    726, 1067, 727, 1167, 1080, 727, 1334, 1167, 1167, 1167, 1167, 1167, 869, 1092, 1020, 826, 1100, 1118, 952, 1126, 857, 1059, 1289, 1167, 1137, 1167, 1167,
    1167, 869, 1092, 1020, 826, 1129, 844, 1204, 1167, 1152, 1059, 1289, 1167, 1167, 1167, 1167, 1167, 869, 1092, 1027, 826, 703, 844, 1204, 1167, 857, 1059,
    1289, 1167, 1167, 1167, 1167, 1167, 869, 1092, 1020, 826, 1129, 844, 1204, 715, 857, 1059, 1289, 1167, 1167, 773, 1166, 1167, 869, 1092, 1176, 826, 912,
    1194, 1212, 1167, 1220, 1228, 1289, 1110, 1306, 1144, 1167, 1167, 869, 1092, 1020, 826, 1129, 844, 1204, 1167, 857, 1059, 1289, 1167, 1167, 1167, 1167,
    1167, 869, 881, 1040, 651, 786, 770, 1039, 1167, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 869, 881, 1040, 651, 1038, 770, 1039, 1167, 836, 1039, 1236,
    643, 818, 1167, 1167, 1167, 869, 881, 1040, 1244, 1038, 770, 1039, 1167, 836, 1039, 1289, 1252, 1167, 1167, 1167, 1167, 869, 881, 1040, 651, 1038, 770,
    1039, 892, 836, 1039, 1289, 1167, 1167, 1167, 1167, 1167, 869, 881, 1040, 651, 1038, 770, 1261, 756, 836, 1039, 1289, 1253, 998, 1167, 1167, 1167, 869, 881,
    1040, 651, 1269, 770, 1039, 1167, 836, 1039, 1279, 1287, 1167, 1167, 1167, 1167, 869, 881, 1040, 651, 1038, 887, 1039, 1167, 836, 1039, 1289, 1167, 1167,
    1167, 1167, 1167, 869, 881, 1040, 651, 1297, 807, 1039, 1305, 836, 1039, 1158, 1183, 1167, 1167, 1167, 1167, 869, 881, 1040, 651, 1038, 770, 1039, 1167,
    836, 1039, 1314, 1084, 1322, 1332, 1167, 1167, 869, 881, 1040, 651, 1038, 770, 1039, 1168, 745, 1039, 1289, 1167, 967, 1342, 1167, 1167, 869, 881, 1040,
    651, 1038, 770, 1039, 1167, 836, 972, 1289, 1167, 1167, 1167, 1167, 1167, 869, 881, 1040, 651, 1038, 770, 897, 1167, 836, 1039, 1289, 1167, 1167, 1167,
    1167, 1167, 922, 1353, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 1167, 257, 0, 515, 0, 0, 0, 0, 0, 0, 99, 0, 0, 257,
    257, 515, 515, 15, 16, 0, 0, 0, 103, 0, 0, 0, 0, 282, 540, 40, 42, 0, 0, 0, 0, 257, 515, 15, 768, 0, 0, 0, 0, 257, 515, 22, 23, 1024, 0, 1024, 1024, 0, 0,
    0, 0, 15, 0, 0, 0, 0, 1024, 0, 257, 515, 0, 0, 0, 50, 0, 309, 566, 15, 1042, 0, 1042, 1042, 0, 0, 0, 0, 73, 0, 75, 0, 40, 0, 42, 0, 0, 0, 0, 0, 13, 14, 22,
    23, 0, 257, 0, 515, 0, 0, 896, 0, 896, 896, 257, 515, 15, 16, 0, 0, 82, 0, 768, 16, 16, 0, 0, 0, 0, 0, 74, 0, 0, 0, 1299, 1299, 1299, 257, 515, 15, 16, 16,
    0, 0, 0, 0, 0, 0, 112, 0, 257, 0, 515, 0, 16, 0, 0, 0, 51, 0, 257, 515, 15, 0, 257, 257, 515, 515, 15, 768, 0, 0, 0, 2560, 257, 515, 15, 16, 16, 0, 0, 0,
    1792, 0, 257, 386, 515, 0, 0, 0, 0, 0, 104, 0, 0, 0, 257, 294, 515, 551, 41, 43, 0, 0, 25, 257, 515, 15, 16, 0, 0, 0, 0, 55, 16, 56, 0, 0, 0, 0, 0, 257,
    515, 0, 0, 0, 333, 590, 79, 80, 0, 0, 0, 0, 257, 515, 768, 16, 257, 0, 515, 644, 0, 0, 0, 0, 276, 533, 15, 16, 0, 644, 644, 644, 257, 515, 15, 16, 16, 0,
    58, 0, 0, 0, 72, 0, 0, 0, 0, 64, 257, 515, 15, 16, 33, 257, 257, 515, 515, 15, 16, 0, 0, 49, 0, 52, 309, 566, 15, 0, 16, 0, 0, 0, 0, 0, 0, 1152, 1152, 257,
    0, 515, 644, 0, 0, 17, 17, 644, 644, 644, 257, 515, 15, 16, 34, 257, 257, 515, 515, 15, 16, 0, 0, 63, 0, 321, 578, 67, 68, 35, 257, 257, 515, 515, 15, 16,
    0, 0, 102, 0, 0, 0, 0, 0, 86, 257, 515, 15, 16, 36, 257, 257, 515, 515, 15, 16, 0, 0, 257, 0, 515, 15, 16, 0, 0, 0, 109, 0, 0, 0, 0, 2048, 0, 0, 0, 37, 257,
    257, 515, 515, 15, 16, 0, 0, 282, 0, 540, 40, 42, 0, 0, 0, 283, 541, 30, 31, 0, 0, 0, 283, 541, 30, 31, 32, 13, 0, 14, 0, 0, 0, 0, 0, 257, 515, 15, 16, 0,
    0, 13, 13, 14, 14, 22, 23, 0, 0, 768, 16, 0, 0, 0, 0, 257, 515, 87, 88, 22, 23, 23, 0, 0, 0, 0, 0, 282, 540, 0, 0, 0, 13, 14, 22, 23, 0, 0, 0, 0, 2304, 0,
    0, 0, 0, 644, 644, 644, 276, 533, 15, 16, 45, 0, 0, 0, 0, 309, 566, 15, 768, 768, 0, 0, 0, 0, 0, 98, 0, 0, 55, 16, 56, 57, 0, 0, 0, 60, 0, 70, 71, 0, 0, 0,
    0, 0, 309, 566, 15, 101, 0, 0, 0, 0, 0, 105, 0, 0, 1536, 0, 110, 111, 0, 113, 333, 590, 79, 80, 0, 81, 0, 0, 0, 92, 93, 94, 15, 16, 1408, 0, 0, 0, 0, 0, 0,
    0, 0, 76, 24, 0, 0, 283, 541, 30, 31, 0, 0, 1664, 0, 0, 0, 0, 0, 783, 16, 0, 55, 16, 56, 0, 0, 59, 0, 0, 0, 97, 0, 0, 0, 0, 321, 578, 67, 68, 0, 62, 0, 0,
    321, 578, 67, 68, 333, 590, 79, 80, 2688, 0, 0, 83, 84, 2176, 85, 0, 257, 515, 87, 88, 89, 90, 0, 0, 0, 0, 15, 16, 0, 257, 257, 515, 515, 15, 16, 44, 95, 0,
    0, 0, 0, 0, 0, 0, 100, 61, 0, 0, 0, 257, 515, 15, 16, 0, 47, 0, 0, 0, 257, 515, 15, 784, 0, 0, 91, 0, 0, 0, 0, 15, 16, 0, 96, 0, 0, 0, 0, 0, 0, 15, 16, 46,
    48, 0, 0, 0, 257, 515, 15, 69, 0, 0, 0, 0, 0, 0, 0, 106, 0, 0, 1920, 0, 0, 0, 15, 16, 0, 2432, 0, 0, 0, 0, 0, 0, 15, 768, 0, 108, 0, 0, 0, 0, 0, 0, 22, 23,
    107, 0, 0, 0, 0, 0, 0, 0, 768, 16, 0, 1152, 0, 0, 0, 0, 0, 0, 0, 40, 42
  "/>

  <!--~
   ! The DFA-state to expected-token-set mapping.
  -->
  <xsl:variable name="p:EXPECTED" as="xs:integer+" select="
    29, 33, 37, 52, 41, 53, 43, 53, 47, 51, 61, 89, 57, 52, 65, 57, 52, 65, 57, 52, 66, 59, 72, 70, 76, 80, 82, 86, 86, 2, 4, 8, 16, 32, 64, 1048832, 1048896,
    1049024, 523792, 523984, 1048272, 1048576, 128, 523264, 2, 2, 8, 7168, 24576, 32768, 196608, 262144, 2, 8, 32, 32, 1048576, 32768, 65536, 131072, 262144,
    32, 32, 32, 1048576, 1048576, 1024, 6144, 16384, 32768, 131072, 262144, 1024, 2048, 4096, 32768, 32768, 262144, 1024, 2048, 32768, 1024, 2048, 1024, 2048,
    1024, 1024, 1024, 1024, 1024, 6144, 8192, 16384
  "/>

  <!--~
   ! The token-string table.
  -->
  <xsl:variable name="p:TOKEN" as="xs:string+" select="
    '(0)',
    'Name',
    'Number',
    'DateTime',
    'NMToken',
    'String',
    'WS',
    'NL',
    'EOF',
    &quot;'#'&quot;,
    &quot;'##CapabilitiesNeeded'&quot;,
    &quot;'##CreationDate'&quot;,
    &quot;'##Creator'&quot;,
    &quot;'##For'&quot;,
    &quot;'##Frames'&quot;,
    &quot;'##RenderMan'&quot;,
    &quot;'##Scene'&quot;,
    &quot;'##Shaders'&quot;,
    &quot;'##Textures'&quot;,
    &quot;','&quot;,
    &quot;'Declare'&quot;
  "/>

  <!--~
   ! Match next token in input string, starting at given index, using
   ! the DFA entry state for the set of tokens that are expected in
   ! the current context.
   !
   ! @param $input the input string.
   ! @param $begin the index where to start in input string.
   ! @param $token-set the expected token set id.
   ! @return a sequence of three: the token code of the result token,
   ! with input string begin and end positions. If there is no valid
   ! token, return the negative id of the DFA state that failed, along
   ! with begin and end positions of the longest viable prefix.
  -->
  <xsl:function name="p:match" as="xs:integer+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="begin" as="xs:integer"/>
    <xsl:param name="token-set" as="xs:integer"/>

    <xsl:variable name="result" select="$p:INITIAL[1 + $token-set]"/>
    <xsl:sequence select="p:transition($input, $begin, $begin, $begin, $result, $result mod 128, 0)"/>
  </xsl:function>

  <!--~
   ! The DFA state transition function. If we are in a valid DFA state, save
   ! it's result annotation, consume one input codepoint, calculate the next
   ! state, and use tail recursion to do the same again. Otherwise, return
   ! any valid result or a negative DFA state id in case of an error.
   !
   ! @param $input the input string.
   ! @param $begin the begin index of the current token in the input string.
   ! @param $current the index of the current position in the input string.
   ! @param $end the end index of the result in the input string.
   ! @param $result the result code.
   ! @param $current-state the current DFA state.
   ! @param $previous-state the  previous DFA state.
   ! @return a sequence of three: the token code of the result token,
   ! with input string begin and end positions. If there is no valid
   ! token, return the negative id of the DFA state that failed, along
   ! with begin and end positions of the longest viable prefix.
  -->
  <xsl:function name="p:transition" as="xs:integer+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="begin" as="xs:integer"/>
    <xsl:param name="current" as="xs:integer"/>
    <xsl:param name="end" as="xs:integer"/>
    <xsl:param name="result" as="xs:integer"/>
    <xsl:param name="current-state" as="xs:integer"/>
    <xsl:param name="previous-state" as="xs:integer"/>

    <xsl:choose>
      <xsl:when test="$current-state = 0">
        <xsl:variable name="result" select="$result idiv 128"/>
        <xsl:sequence select="
          if ($result != 0) then
          (
            $result - 1,
            $begin,
            $end
          )
          else
          (
            - $previous-state,
            $begin,
            $current - 1
          )
        "/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="c0" select="(string-to-codepoints(substring($input, $current, 1)), 0)[1]"/>
        <xsl:variable name="c1" as="xs:integer">
          <xsl:choose>
            <xsl:when test="$c0 &lt; 128">
              <xsl:sequence select="$p:MAP0[1 + $c0]"/>
            </xsl:when>
            <xsl:when test="$c0 &lt; 55296">
              <xsl:variable name="c1" select="$c0 idiv 32"/>
              <xsl:variable name="c2" select="$c1 idiv 32"/>
              <xsl:sequence select="$p:MAP1[1 + $c0 mod 32 + $p:MAP1[1 + $c1 mod 32 + $p:MAP1[1 + $c2]]]"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="p:map2($c0, 1, 2)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="current" select="$current + 1"/>
        <xsl:variable name="i0" select="128 * $c1 + $current-state - 1"/>
        <xsl:variable name="i1" select="$i0 idiv 8"/>
        <xsl:variable name="next-state" select="$p:TRANSITION[$i0 mod 8 + $p:TRANSITION[$i1 + 1] + 1]"/>
        <xsl:sequence select="
          if ($next-state &gt; 127) then
            p:transition($input, $begin, $current, $current, $next-state, $next-state mod 128, $current-state)
          else
            p:transition($input, $begin, $current, $end, $result, $next-state, $current-state)
        "/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Recursively translate one 32-bit chunk of an expected token bitset
   ! to the corresponding sequence of token strings.
   !
   ! @param $result the result of previous recursion levels.
   ! @param $chunk the 32-bit chunk of the expected token bitset.
   ! @param $base-token-code the token code of bit 0 in the current chunk.
   ! @return the set of token strings.
  -->
  <xsl:function name="p:token" as="xs:string*">
    <xsl:param name="result" as="xs:string*"/>
    <xsl:param name="chunk" as="xs:integer"/>
    <xsl:param name="base-token-code" as="xs:integer"/>

    <xsl:sequence select="
      if ($chunk = 0) then
        $result
      else
        p:token
        (
          ($result, if ($chunk mod 2 != 0) then $p:TOKEN[$base-token-code] else ()),
          if ($chunk &lt; 0) then $chunk idiv 2 + 2147483648 else $chunk idiv 2,
          $base-token-code + 1
        )
    "/>
  </xsl:function>

  <!--~
   ! Calculate expected token set for a given DFA state as a sequence
   ! of strings.
   !
   ! @param $state the DFA state.
   ! @return the set of token strings
  -->
  <xsl:function name="p:expected-token-set" as="xs:string*">
    <xsl:param name="state" as="xs:integer"/>

    <xsl:if test="$state > 0">
      <xsl:for-each select="0 to 0">
        <xsl:variable name="i0" select=". * 113 + $state - 1"/>
        <xsl:variable name="i1" select="$i0 idiv 4"/>
        <xsl:sequence select="p:token((), $p:EXPECTED[$i0 mod 4 + $p:EXPECTED[$i1 + 1] + 1], . * 32 + 1)"/>
      </xsl:for-each>
    </xsl:if>
  </xsl:function>

  <!--~
   ! Classify codepoint by doing a tail recursive binary search for a
   ! matching codepoint range entry in MAP2, the codepoint to charclass
   ! map for codepoints above the surrogate block.
   !
   ! @param $c the codepoint.
   ! @param $lo the binary search lower bound map index.
   ! @param $hi the binary search upper bound map index.
   ! @return the character class.
  -->
  <xsl:function name="p:map2" as="xs:integer">
    <xsl:param name="c" as="xs:integer"/>
    <xsl:param name="lo" as="xs:integer"/>
    <xsl:param name="hi" as="xs:integer"/>

    <xsl:variable name="m" select="($hi + $lo) idiv 2"/>
    <xsl:choose>
      <xsl:when test="$lo &gt; $hi">
        <xsl:sequence select="0"/>
      </xsl:when>
      <xsl:when test="$p:MAP2[$m] &gt; $c">
        <xsl:sequence select="p:map2($c, $lo, $m - 1)"/>
      </xsl:when>
      <xsl:when test="$p:MAP2[2 + $m] &lt; $c">
        <xsl:sequence select="p:map2($c, $m + 1, $hi)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$p:MAP2[4 + $m]"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse the 1st loop of production Declaration (one or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Declaration-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>       <!-- WS -->
        <xsl:variable name="state" select="p:shift(6, $input, $state)"/>            <!-- WS -->
        <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>       <!-- String -->
        <xsl:variable name="state" select="p:shift(5, $input, $state)"/>            <!-- String -->
        <xsl:variable name="state" select="p:lookahead1(7, $input, $state)"/>       <!-- WS | EOF | 'Declare' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 6">                                      <!-- WS -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="p:parse-Declaration-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse Declaration.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Declaration" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(20, $input, $state)"/>               <!-- 'Declare' -->
    <xsl:variable name="state" select="p:parse-Declaration-1($input, $state)"/>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Declaration', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse the 1st loop of production Version (zero or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Version-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:lookahead1(8, $input, $state)"/>       <!-- WS | NL | EOF | 'Declare' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 6">                                      <!-- WS -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="state" select="p:shift(6, $input, $state)"/>        <!-- WS -->
            <xsl:sequence select="p:parse-Version-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse Version.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Version" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(4, $input, $state)"/>                <!-- NMToken -->
    <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(6, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:lookahead1(1, $input, $state)"/>           <!-- Number -->
    <xsl:variable name="state" select="p:shift(2, $input, $state)"/>                <!-- Number -->
    <xsl:variable name="state" select="p:parse-Version-1($input, $state)"/>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 7">                                         <!-- NL -->
          <xsl:variable name="state" select="p:shift(7, $input, $state)"/>          <!-- NL -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Version', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse the 1st loop of production Comment (zero or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Comment-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>      <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 6">                                      <!-- WS -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="state" select="p:shift(6, $input, $state)"/>        <!-- WS -->
            <xsl:sequence select="p:parse-Comment-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse Comment.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Comment" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(9, $input, $state)"/>                <!-- '#' -->
    <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>           <!-- Name -->
    <xsl:variable name="state" select="p:shift(1, $input, $state)"/>                <!-- Name -->
    <xsl:variable name="state" select="p:parse-Comment-1($input, $state)"/>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 7">                                         <!-- NL -->
          <xsl:variable name="state" select="p:shift(7, $input, $state)"/>          <!-- NL -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Comment', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse Feature.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Feature" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:lookahead1(3, $input, $state)"/>           <!-- NMToken -->
    <xsl:variable name="state" select="p:shift(4, $input, $state)"/>                <!-- NMToken -->
    <xsl:variable name="state" select="p:lookahead1(11, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 19">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shift(19, $input, $state)"/>         <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 6">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 5)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>     <!-- WS -->
              <xsl:choose>
                <xsl:when test="not($state[$p:error])">
                  <xsl:sequence select="p:memoize($backtrack, $state, -1, 5)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:sequence select="p:memoize($backtrack, $state, -2, 5)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Feature', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Try parsing Feature.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:try-Feature" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="state" select="p:lookahead1(3, $input, $state)"/>           <!-- NMToken -->
    <xsl:variable name="state" select="p:shiftT(4, $input, $state)"/>               <!-- NMToken -->
    <xsl:variable name="state" select="p:lookahead1(11, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 19">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shiftT(19, $input, $state)"/>        <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 6">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 5)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>     <!-- WS -->
              <xsl:choose>
                <xsl:when test="not($state[$p:error])">
                  <xsl:sequence select="p:memoize($backtrack, $state, -1, 5)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:sequence select="p:memoize($backtrack, $state, -2, 5)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>         <!-- WS -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:sequence select="$state"/>
  </xsl:function>

  <!--~
   ! Parse Shader.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Shader" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:lookahead1(3, $input, $state)"/>           <!-- NMToken -->
    <xsl:variable name="state" select="p:shift(4, $input, $state)"/>                <!-- NMToken -->
    <xsl:variable name="state" select="p:lookahead1(11, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 19">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shift(19, $input, $state)"/>         <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 6">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 3)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>     <!-- WS -->
              <xsl:choose>
                <xsl:when test="not($state[$p:error])">
                  <xsl:sequence select="p:memoize($backtrack, $state, -1, 3)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:sequence select="p:memoize($backtrack, $state, -2, 3)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Shader', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Try parsing Shader.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:try-Shader" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="state" select="p:lookahead1(3, $input, $state)"/>           <!-- NMToken -->
    <xsl:variable name="state" select="p:shiftT(4, $input, $state)"/>               <!-- NMToken -->
    <xsl:variable name="state" select="p:lookahead1(11, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 19">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shiftT(19, $input, $state)"/>        <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 6">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 3)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>     <!-- WS -->
              <xsl:choose>
                <xsl:when test="not($state[$p:error])">
                  <xsl:sequence select="p:memoize($backtrack, $state, -1, 3)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:sequence select="p:memoize($backtrack, $state, -2, 3)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>         <!-- WS -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:sequence select="$state"/>
  </xsl:function>

  <!--~
   ! Parse Texture.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Texture" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:lookahead1(3, $input, $state)"/>           <!-- NMToken -->
    <xsl:variable name="state" select="p:shift(4, $input, $state)"/>                <!-- NMToken -->
    <xsl:variable name="state" select="p:lookahead1(11, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 19">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shift(19, $input, $state)"/>         <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 6">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 4)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>     <!-- WS -->
              <xsl:choose>
                <xsl:when test="not($state[$p:error])">
                  <xsl:sequence select="p:memoize($backtrack, $state, -1, 4)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:sequence select="p:memoize($backtrack, $state, -2, 4)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Texture', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Try parsing Texture.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:try-Texture" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="state" select="p:lookahead1(3, $input, $state)"/>           <!-- NMToken -->
    <xsl:variable name="state" select="p:shiftT(4, $input, $state)"/>               <!-- NMToken -->
    <xsl:variable name="state" select="p:lookahead1(11, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 19">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shiftT(19, $input, $state)"/>        <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>          <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 6">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 4)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>     <!-- WS -->
              <xsl:choose>
                <xsl:when test="not($state[$p:error])">
                  <xsl:sequence select="p:memoize($backtrack, $state, -1, 4)"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:sequence select="p:memoize($backtrack, $state, -2, 4)"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shiftT(6, $input, $state)"/>         <!-- WS -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:sequence select="$state"/>
  </xsl:function>

  <!--~
   ! Parse the 1st loop of production StructuralHint (one or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-StructuralHint-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:parse-Texture($input, $state)"/>
        <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>      <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:variable name="state" as="item()+">
          <xsl:choose>
            <xsl:when test="$state[$p:error]">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:when test="$state[$p:l1] = 4">                                     <!-- NMToken -->
              <xsl:variable name="state" select="p:memoized($state, 0)"/>
              <xsl:choose>
                <xsl:when test="$state[$p:lk] != 0">
                  <xsl:sequence select="$state"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="backtrack" select="$state"/>
                  <xsl:variable name="state" select="p:strip-result($state)"/>
                  <xsl:variable name="state" select="p:try-Texture($input, $state)"/>
                  <xsl:choose>
                    <xsl:when test="not($state[$p:error])">
                      <xsl:sequence select="p:memoize($backtrack, $state, -1, 0)"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:sequence select="p:memoize($backtrack, $state, -2, 0)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$state[$p:lk] != -1">
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="p:parse-StructuralHint-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse the 2nd loop of production StructuralHint (one or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-StructuralHint-2" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:parse-Shader($input, $state)"/>
        <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>      <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:variable name="state" as="item()+">
          <xsl:choose>
            <xsl:when test="$state[$p:error]">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:when test="$state[$p:l1] = 4">                                     <!-- NMToken -->
              <xsl:variable name="state" select="p:memoized($state, 1)"/>
              <xsl:choose>
                <xsl:when test="$state[$p:lk] != 0">
                  <xsl:sequence select="$state"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="backtrack" select="$state"/>
                  <xsl:variable name="state" select="p:strip-result($state)"/>
                  <xsl:variable name="state" select="p:try-Shader($input, $state)"/>
                  <xsl:choose>
                    <xsl:when test="not($state[$p:error])">
                      <xsl:sequence select="p:memoize($backtrack, $state, -1, 1)"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:sequence select="p:memoize($backtrack, $state, -2, 1)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$state[$p:lk] != -1">
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="p:parse-StructuralHint-2($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse the 3rd loop of production StructuralHint (one or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-StructuralHint-3" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:parse-Feature($input, $state)"/>
        <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>      <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:variable name="state" as="item()+">
          <xsl:choose>
            <xsl:when test="$state[$p:error]">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:when test="$state[$p:l1] = 4">                                     <!-- NMToken -->
              <xsl:variable name="state" select="p:memoized($state, 2)"/>
              <xsl:choose>
                <xsl:when test="$state[$p:lk] != 0">
                  <xsl:sequence select="$state"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="backtrack" select="$state"/>
                  <xsl:variable name="state" select="p:strip-result($state)"/>
                  <xsl:variable name="state" select="p:try-Feature($input, $state)"/>
                  <xsl:choose>
                    <xsl:when test="not($state[$p:error])">
                      <xsl:sequence select="p:memoize($backtrack, $state, -1, 2)"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:sequence select="p:memoize($backtrack, $state, -2, 2)"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:sequence select="($state[$p:l1], subsequence($state, 2))"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$state[$p:lk] != -1">
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="p:parse-StructuralHint-3($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse StructuralHint.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-StructuralHint" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 15">                                        <!-- '##RenderMan' -->
          <xsl:variable name="state" select="p:shift(15, $input, $state)"/>         <!-- '##RenderMan' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>     <!-- Name -->
          <xsl:variable name="state" select="p:shift(1, $input, $state)"/>          <!-- Name -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 16">                                        <!-- '##Scene' -->
          <xsl:variable name="state" select="p:shift(16, $input, $state)"/>         <!-- '##Scene' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>     <!-- Name -->
          <xsl:variable name="state" select="p:shift(1, $input, $state)"/>          <!-- Name -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 12">                                        <!-- '##Creator' -->
          <xsl:variable name="state" select="p:shift(12, $input, $state)"/>         <!-- '##Creator' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>     <!-- Name -->
          <xsl:variable name="state" select="p:shift(1, $input, $state)"/>          <!-- Name -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 11">                                        <!-- '##CreationDate' -->
          <xsl:variable name="state" select="p:shift(11, $input, $state)"/>         <!-- '##CreationDate' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:lookahead1(2, $input, $state)"/>     <!-- DateTime -->
          <xsl:variable name="state" select="p:shift(3, $input, $state)"/>          <!-- DateTime -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 13">                                        <!-- '##For' -->
          <xsl:variable name="state" select="p:shift(13, $input, $state)"/>         <!-- '##For' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>     <!-- Name -->
          <xsl:variable name="state" select="p:shift(1, $input, $state)"/>          <!-- Name -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 14">                                        <!-- '##Frames' -->
          <xsl:variable name="state" select="p:shift(14, $input, $state)"/>         <!-- '##Frames' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:lookahead1(1, $input, $state)"/>     <!-- Number -->
          <xsl:variable name="state" select="p:shift(2, $input, $state)"/>          <!-- Number -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 18">                                        <!-- '##Textures' -->
          <xsl:variable name="state" select="p:shift(18, $input, $state)"/>         <!-- '##Textures' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:parse-StructuralHint-1($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 17">                                        <!-- '##Shaders' -->
          <xsl:variable name="state" select="p:shift(17, $input, $state)"/>         <!-- '##Shaders' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:parse-StructuralHint-2($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="state" select="p:shift(10, $input, $state)"/>         <!-- '##CapabilitiesNeeded' -->
          <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>     <!-- WS -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- WS -->
          <xsl:variable name="state" select="p:parse-StructuralHint-3($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'StructuralHint', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse the 1st loop of production Command (zero or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Command-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:lookahead1(10, $input, $state)"/>      <!-- NMToken | WS | NL | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 6">                                      <!-- WS -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="state" select="p:shift(6, $input, $state)"/>        <!-- WS -->
            <xsl:sequence select="p:parse-Command-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse Command.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Command" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:parse-StructuralHint($input, $state)"/>
    <xsl:variable name="state" select="p:parse-Command-1($input, $state)"/>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 7">                                         <!-- NL -->
          <xsl:variable name="state" select="p:shift(7, $input, $state)"/>          <!-- NL -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Command', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse the 1st loop of production Preamble (zero or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Preamble-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:lookahead1(9, $input, $state)"/>       <!-- NMToken | '#' | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] = 4">                                       <!-- NMToken -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="state" as="item()+">
              <xsl:choose>
                <xsl:when test="$state[$p:error]">
                  <xsl:sequence select="$state"/>
                </xsl:when>
                <xsl:when test="$state[$p:l1] = 9">                                 <!-- '#' -->
                  <xsl:variable name="state" select="p:parse-Comment($input, $state)"/>
                  <xsl:sequence select="$state"/>
                </xsl:when>
                <xsl:when test="$state[$p:error]">
                  <xsl:sequence select="$state"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="state" select="p:parse-Command($input, $state)"/>
                  <xsl:sequence select="$state"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:sequence select="p:parse-Preamble-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse the 2nd loop of production Preamble (zero or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Preamble-2" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:lookahead1(6, $input, $state)"/>       <!-- EOF | 'Declare' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 20">                                     <!-- 'Declare' -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="state" select="p:parse-Declaration($input, $state)"/>
            <xsl:sequence select="p:parse-Preamble-2($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse Preamble.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Preamble" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:parse-Preamble-1($input, $state)"/>
    <xsl:variable name="state" select="p:parse-Version($input, $state)"/>
    <xsl:variable name="state" select="p:parse-Preamble-2($input, $state)"/>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Preamble', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse RIB.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-RIB" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:parse-Preamble($input, $state)"/>
    <xsl:variable name="state" select="p:shift(8, $input, $state)"/>                <!-- EOF -->
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'RIB', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Create a textual error message from a parsing error.
   !
   ! @param $input the input string.
   ! @param $error the parsing error descriptor.
   ! @return the error message.
  -->
  <xsl:function name="p:error-message" as="xs:string">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="error" as="element(error)"/>

    <xsl:variable name="begin" select="xs:integer($error/@b)"/>
    <xsl:variable name="context" select="string-to-codepoints(substring($input, 1, $begin - 1))"/>
    <xsl:variable name="linefeeds" select="index-of($context, 10)"/>
    <xsl:variable name="line" select="count($linefeeds) + 1"/>
    <xsl:variable name="column" select="($begin - $linefeeds[last()], $begin)[1]"/>
    <xsl:choose>
      <xsl:when test="$error/@o">
        <xsl:sequence select="
          concat
          (
            'syntax error, found ', $p:TOKEN[$error/@o + 1], '&#10;',
            'while expecting ', $p:TOKEN[$error/@x + 1], '&#10;',
            'at line ', string($line), ', column ', string($column), '&#10;',
            '...', substring($input, $begin, 32), '...'
          )
        "/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="expected" select="p:expected-token-set($error/@s)"/>
        <xsl:sequence select="
          concat
          (
            'lexical analysis failed&#10;',
            'while expecting ',
            '['[exists($expected[2])],
            string-join($expected, ', '),
            ']'[exists($expected[2])],
            '&#10;',
            if ($error/@e = $begin) then
              ''
            else
              concat('after successfully scanning ', string($error/@e - $begin), ' characters '),
            'at line ', string($line), ', column ', string($column), '&#10;',
            '...', substring($input, $begin, 32), '...'
          )
        "/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Shift one token, i.e. compare lookahead token 1 with expected
   ! token and in case of a match, shift lookahead tokens down such that
   ! l1 becomes the current token, and higher lookahead tokens move down.
   ! When lookahead token 1 does not match the expected token, raise an
   ! error by saving the expected token code in the error field of the
   ! parser state.
   !
   ! @param $code the expected token.
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:shift" as="item()+">
    <xsl:param name="code" as="xs:integer"/>
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:when test="$state[$p:l1] = $code">
        <xsl:variable name="begin" select="$state[$p:e0]"/>
        <xsl:variable name="end" select="$state[$p:b1]"/>
        <xsl:variable name="whitespace">
          <xsl:if test="$begin ne $end">
            <xsl:value-of select="substring($input, $begin, $end - $begin)"/>
          </xsl:if>
        </xsl:variable>
        <xsl:variable name="token" select="$p:TOKEN[1 + $state[$p:l1]]"/>
        <xsl:variable name="name" select="if (starts-with($token, &quot;'&quot;)) then 'TOKEN' else $token"/>
        <xsl:variable name="begin" select="$state[$p:b1]"/>
        <xsl:variable name="end" select="$state[$p:e1]"/>
        <xsl:variable name="node">
          <xsl:element name="{$name}">
            <xsl:sequence select="substring($input, $begin, $end - $begin)"/>
          </xsl:element>
        </xsl:variable>
        <xsl:sequence select="
          subsequence($state, $p:l1, $p:e1 - $p:l1 + 1),
          0,
          $state[$p:e1],
          subsequence($state, $p:e1),
          $whitespace/node(),
          $node/node()
        "/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="error">
          <xsl:element name="error">
            <xsl:choose>
              <xsl:when test="$state[$p:e1] &lt; $state[$p:memo]/@e">
                <xsl:sequence select="$state[$p:memo]/@*"/>
              </xsl:when>
              <xsl:otherwise>
              <xsl:attribute name="b" select="$state[$p:b1]"/>
              <xsl:attribute name="e" select="$state[$p:e1]"/>
              <xsl:choose>
                <xsl:when test="$state[$p:l1] &lt; 0">
                  <xsl:attribute name="s" select="- $state[$p:l1]"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="o" select="$state[$p:l1]"/>
                  <xsl:attribute name="x" select="$code"/>
                </xsl:otherwise>
              </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:variable>
        <xsl:sequence select="
          subsequence($state, 1, $p:error - 1),
          $error/node(),
          subsequence($state, $p:error + 1)
        "/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Shift one token, i.e. compare lookahead token 1 with expected
   ! token and in case of a match, shift lookahead tokens down such that
   ! l1 becomes the current token, and higher lookahead tokens move down.
   ! When lookahead token 1 does not match the expected token, raise an
   ! error by saving the expected token code in the error field of the
   ! parser state. In contrast to p:shift, do not create any output.
   !
   ! @param $code the expected token.
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:shiftT" as="item()+">
    <xsl:param name="code" as="xs:integer"/>
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:when test="$state[$p:l1] = $code">
        <xsl:sequence select="
          subsequence($state, $p:l1, $p:e1 - $p:l1 + 1),
          0,
          $state[$p:e1],
          subsequence($state, $p:e1)
        "/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="error">
          <xsl:element name="error">
            <xsl:choose>
              <xsl:when test="$state[$p:e1] &lt; $state[$p:memo]/@e">
                <xsl:sequence select="$state[$p:memo]/@*"/>
              </xsl:when>
              <xsl:otherwise>
              <xsl:attribute name="b" select="$state[$p:b1]"/>
              <xsl:attribute name="e" select="$state[$p:e1]"/>
              <xsl:choose>
                <xsl:when test="$state[$p:l1] &lt; 0">
                  <xsl:attribute name="s" select="- $state[$p:l1]"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="o" select="$state[$p:l1]"/>
                  <xsl:attribute name="x" select="$code"/>
                </xsl:otherwise>
              </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:variable>
        <xsl:sequence select="
          subsequence($state, 1, $p:error - 1),
          $error/node(),
          subsequence($state, $p:error + 1)
        "/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Lookahead one token on level 1.
   !
   ! @param $set the code of the DFA entry state for the set of valid tokens.
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:lookahead1" as="item()+">
    <xsl:param name="set" as="xs:integer"/>
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:l1] != 0">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="match" select="p:match($input, $state[$p:b1], $set)"/>
        <xsl:sequence select="
          $match[1],
          subsequence($state, $p:lk + 1, $p:l1 - $p:lk - 1),
          $match,
          subsequence($state, $p:e1 + 1)
        "/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Reduce the result stack, creating a nonterminal element. Pop
   ! $count elements off the stack, wrap them in a new element
   ! named $name, and push the new element.
   !
   ! @param $state the parser state.
   ! @param $name the name of the result node.
   ! @param $count the number of child nodes.
   ! @param $begin the input index where the nonterminal begins.
   ! @param $end the input index where the nonterminal ends.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:reduce" as="item()+">
    <xsl:param name="state" as="item()+"/>
    <xsl:param name="name" as="xs:string"/>
    <xsl:param name="count" as="xs:integer"/>
    <xsl:param name="begin" as="xs:integer"/>
    <xsl:param name="end" as="xs:integer"/>

    <xsl:variable name="node">
      <xsl:element name="{$name}">
        <xsl:sequence select="subsequence($state, $count + 1)"/>
      </xsl:element>
    </xsl:variable>
    <xsl:sequence select="subsequence($state, 1, $count), $node/node()"/>
  </xsl:function>

  <!--~
   ! Strip result from parser state, in order to avoid carrying it while
   ! backtracking.
   !
   ! @param $state the parser state after an alternative failed.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:strip-result" as="item()+">
    <xsl:param name="state" as="item()+"/>

    <xsl:sequence select="subsequence($state, 1, $p:memo)"/>
  </xsl:function>

  <!--~
   ! Restore parser state after unsuccessfully trying an alternative,
   ! merging any memoization that was collected on the way.
   !
   ! @param $backtrack the parser state before backtracking started.
   ! @param $state the parser state after an alternative failed.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:restore" as="item()+">
    <xsl:param name="backtrack" as="item()+"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="memo">
      <xsl:element name="memo">
        <xsl:variable name="errors" select="($state[$p:memo], $state[$p:error])[.]"/>
        <xsl:sequence select="$errors[@e = max($errors/xs:integer(@e))][last()]/@*, $state[$p:memo]/value"/>
      </xsl:element>
    </xsl:variable>
    <xsl:sequence select="subsequence($backtrack, 1, $p:memo - 1), $memo/node()"/>
  </xsl:function>

  <!--~
   ! Memoize the backtracking result that was computed at decision point
   ! $i for input position $state[$p:e0].
   !
   ! @param $backtrack the parser state before backtracking started.
   ! @param $state the parser state after successfully trying an alternative.
   ! @param $v the id of the successful alternative.
   ! @param $i the decision point id.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:memoize" as="item()+">
    <xsl:param name="backtrack" as="item()+"/>
    <xsl:param name="state" as="item()+"/>
    <xsl:param name="v" as="xs:integer"/>
    <xsl:param name="i" as="xs:integer"/>

    <xsl:variable name="memo">
      <xsl:element name="memo">
        <xsl:variable name="errors" select="($state[$p:memo], $state[$p:error])[.]"/>
        <xsl:sequence select="$errors[@e = max($errors/xs:integer(@e))][last()]/@*, $state[$p:memo]/value"/>
        <xsl:element name="value">
          <xsl:attribute name="key" select="$backtrack[$p:e0] * 8 + $i"/>
          <xsl:sequence select="$v"/>
        </xsl:element>
      </xsl:element>
    </xsl:variable>
    <xsl:sequence select="
      $v,
      subsequence($backtrack, $p:lk + 1, $p:memo - $p:lk - 1),
      $memo/node(),
      subsequence($backtrack, $p:memo + 1)
    "/>
  </xsl:function>

  <!--~
   ! Retrieve memoized backtracking result for decision point $i
   ! and input position $state[$p:e0] into $state[$p:lk].
   !
   ! @param $state the parser state.
   ! @param $i the decision point id.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:memoized" as="item()+">
    <xsl:param name="state" as="item()+"/>
    <xsl:param name="i" as="xs:integer"/>

    <xsl:variable name="value" select="data($state[$p:memo]/value[@key = $state[$p:e0] * 8 + $i])"/>
    <xsl:sequence select="
      if ($value) then $value else 0,
      subsequence($state, $p:lk + 1)
    "/>
  </xsl:function>

  <!--~
   ! Parse start symbol RIB from given string.
   !
   ! @param $s the string to be parsed.
   ! @return the result as generated by parser actions.
  -->
  <xsl:function name="p:parse-RIB" as="item()*">
    <xsl:param name="s" as="xs:string"/>

    <xsl:variable name="memo">
      <xsl:element name="memo"/>
    </xsl:variable>
    <xsl:variable name="state" select="p:parse-RIB($s, (0, 1, 1, 0, 1, 0, false(), $memo/node()))"/>
    <xsl:variable name="error" select="$state[$p:error]"/>
    <xsl:choose>
      <xsl:when test="$error">
        <xsl:variable name="ERROR">
          <xsl:element name="ERROR">
            <xsl:sequence select="$error/@*, p:error-message($s, $error)"/>
          </xsl:element>
        </xsl:variable>
        <xsl:sequence select="$ERROR/node()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="subsequence($state, $p:result)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! The input filename, or string, if surrounded by curly braces.
  -->
  <xsl:param name="input" as="xs:string?" select="()"/>

  <!--~
   ! The (simple) main program.
  -->
  <xsl:template name="main" match="/">
    <xsl:param name="input" as="xs:string?" select="$input"/>

    <xsl:choose>
      <xsl:when test="empty($input)">
        <xsl:sequence select="error(xs:QName('main'), '&#xA;    Usage: java net.sf.saxon.Transform -xsl:rib.xslt -it:main input=INPUT&#xA;&#xA;      parse INPUT, which is either a filename or literal text enclosed in curly braces')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="result" select="
          if (matches($input, '^\{.*\}$')) then
            p:parse-RIB(substring($input, 2, string-length($input) - 2))
          else
            p:parse-RIB(unparsed-text($input))
        "/>
        <xsl:sequence select="
          if (empty($result/self::ERROR)) then
            $result
          else
            error(xs:QName('p:parse-RIB'), concat('&#10;    ', replace($result, '&#10;', '&#10;    ')))
        "/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>