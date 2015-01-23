<?xml version="1.0" encoding="UTF-8"?>
<!-- This file was generated on Fri Jan 23, 2015 17:42 (UTC) by REx v5.32 which is Copyright (c) 1979-2014 by Gunther Rademacher <grd@gmx.net> -->
<!-- REx command line: rib.ebnf -xslt -tree -main -backtrack -ll 1 -->

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
    38, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 9, 9, 9, 9,
    9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 10, 10, 11, 12, 10, 13, 10, 10, 10, 10, 10, 10, 14, 15, 10, 10, 10, 16, 17, 18, 10, 10, 10, 10, 10, 10, 1, 19, 1, 1,
    1, 1, 20, 21, 22, 23, 24, 25, 10, 26, 27, 10, 10, 28, 29, 30, 31, 32, 10, 33, 34, 35, 36, 10, 10, 37, 10, 10, 1, 1, 1, 1, 1
  "/>

  <!--~
   ! The codepoint to charclass mapping for codepoints below the surrogate block.
  -->
  <xsl:variable name="p:MAP1" as="xs:integer+" select="
    54, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58,
    58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 58, 90, 122, 180, 211, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148,
    148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 148, 38, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 1, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 11, 12, 10, 13, 10, 10, 10, 10, 10, 10, 14, 15, 10, 10, 10, 16, 17, 18, 10, 10, 10, 10, 10, 10, 1,
    19, 1, 1, 1, 20, 21, 22, 23, 24, 25, 10, 26, 27, 10, 10, 28, 29, 30, 31, 32, 10, 33, 34, 35, 36, 10, 10, 37, 10, 10, 1, 1, 1, 1, 1
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
    257, 2, 515, 644, 5, 6, 7, 8, 649, 650
  "/>

  <!--~
   ! The DFA transition table.
  -->
  <xsl:variable name="p:TRANSITION" as="xs:integer+" select="
    1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1124, 867, 624, 1042, 719, 718, 717, 1092, 1092, 1092, 1092,
    1092, 1092, 1092, 1092, 1092, 779, 637, 624, 1042, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 779, 645, 1122, 1042, 719, 718, 717,
    1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 806, 657, 954, 661, 880, 879, 878, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 673, 680,
    624, 1042, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1042, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092,
    1092, 1092, 1092, 1092, 692, 698, 624, 1042, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1124, 706, 624, 1042, 719, 718, 717, 1092,
    1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 714, 902, 727, 973, 629, 744, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624,
    1042, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 760, 1042, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092,
    1092, 1092, 740, 752, 624, 1042, 719, 718, 717, 1092, 1092, 777, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 787, 1042, 719, 718, 717, 1092, 1092, 1092,
    1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 719, 718, 717, 1092, 804, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 719, 718,
    717, 1092, 1092, 1092, 814, 1092, 1092, 1092, 1092, 1092, 740, 752, 826, 1042, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740,
    752, 844, 1042, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 858, 1042, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092,
    1092, 1092, 1092, 875, 1032, 1116, 832, 818, 817, 816, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 888, 896, 999, 850, 744, 717, 1092, 1134,
    1011, 1092, 1092, 1092, 1092, 1092, 1092, 740, 888, 727, 973, 629, 836, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 888, 727, 910, 629,
    744, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 888, 727, 973, 629, 922, 717, 1092, 1092, 1092, 796, 1092, 1092, 1092, 1092, 1092, 740,
    888, 940, 948, 967, 744, 985, 1092, 765, 977, 993, 1092, 1092, 1092, 1092, 1092, 740, 888, 727, 973, 629, 744, 717, 1092, 1092, 1092, 1092, 1092, 1092,
    1092, 1092, 1092, 740, 752, 624, 1007, 719, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 719, 718, 717, 1019, 769,
    792, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 719, 718, 717, 1021, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 719,
    1029, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 1040, 864, 717, 1092, 665, 1057, 1092, 1092, 1092, 1092, 1092, 1092,
    740, 752, 1050, 1042, 719, 718, 717, 1068, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 684, 719, 718, 717, 1092, 1092, 1092, 1092, 1092,
    1092, 1092, 1092, 1092, 740, 752, 1076, 649, 719, 718, 717, 732, 1091, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 719, 718, 717, 929,
    1083, 1093, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 719, 914, 1101, 1092, 1092, 1109, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624,
    1042, 719, 718, 932, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 740, 752, 624, 1042, 959, 718, 717, 1092, 1092, 1092, 1092, 1092, 1092, 1092,
    1092, 1092, 1060, 1132, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 1092, 0, 257, 257, 515, 515, 0, 0, 0, 0, 302, 559, 0,
    0, 896, 896, 0, 0, 0, 896, 257, 515, 896, 896, 0, 0, 0, 0, 257, 515, 0, 0, 1536, 0, 910, 910, 0, 0, 0, 0, 274, 532, 0, 0, 0, 0, 0, 74, 0, 0, 257, 0, 515, 0,
    768, 0, 0, 768, 768, 257, 515, 0, 0, 257, 515, 39, 0, 0, 0, 257, 0, 515, 0, 0, 13, 13, 13, 257, 515, 17, 0, 257, 515, 0, 2304, 257, 515, 0, 0, 257, 515,
    257, 386, 515, 0, 0, 0, 0, 0, 0, 257, 515, 0, 0, 0, 257, 283, 515, 540, 0, 0, 0, 66, 67, 68, 0, 0, 257, 0, 515, 644, 0, 0, 0, 0, 0, 311, 568, 0, 644, 644,
    257, 515, 0, 0, 257, 515, 22, 257, 257, 515, 515, 0, 0, 0, 72, 0, 0, 0, 0, 73, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 896, 23, 257, 257, 515, 515, 0, 0, 0,
    78, 0, 0, 0, 0, 86, 0, 1152, 0, 0, 71, 0, 0, 0, 0, 0, 0, 0, 910, 0, 83, 0, 0, 0, 0, 0, 0, 11, 12, 0, 0, 24, 257, 257, 515, 515, 0, 0, 0, 11, 12, 0, 0, 0, 0,
    0, 311, 568, 57, 25, 257, 257, 515, 515, 0, 0, 0, 44, 0, 302, 559, 48, 49, 26, 257, 257, 515, 515, 0, 0, 0, 52, 0, 0, 257, 515, 0, 0, 257, 515, 11, 0, 12,
    0, 0, 0, 0, 0, 0, 274, 532, 0, 0, 644, 644, 271, 528, 0, 0, 275, 533, 0, 257, 283, 515, 540, 29, 0, 0, 271, 528, 0, 0, 275, 533, 34, 0, 293, 550, 0, 0, 0,
    0, 54, 257, 515, 0, 0, 51, 0, 53, 0, 311, 568, 0, 0, 1664, 0, 0, 0, 0, 0, 62, 257, 515, 0, 257, 283, 515, 540, 0, 0, 33, 0, 36, 293, 550, 0, 40, 0, 0, 274,
    0, 532, 0, 0, 0, 45, 257, 515, 0, 0, 0, 43, 0, 0, 302, 559, 0, 0, 293, 550, 0, 0, 0, 0, 0, 80, 0, 0, 0, 59, 60, 1920, 61, 0, 257, 515, 1280, 0, 84, 85, 0,
    87, 0, 0, 293, 550, 0, 0, 0, 41, 35, 0, 257, 515, 0, 0, 0, 0, 79, 0, 0, 0, 63, 64, 0, 0, 0, 0, 0, 0, 69, 0, 50, 0, 0, 0, 0, 257, 515, 0, 0, 11, 12, 42, 0,
    0, 0, 257, 515, 0, 0, 0, 0, 0, 257, 257, 515, 515, 0, 31, 0, 0, 1792, 0, 0, 0, 0, 0, 0, 1024, 1024, 0, 65, 0, 0, 0, 0, 0, 70, 0, 257, 257, 515, 515, 30, 32,
    0, 0, 2048, 0, 0, 0, 0, 2176, 1408, 0, 0, 0, 0, 0, 0, 0, 0, 82, 58, 0, 0, 0, 0, 0, 257, 515, 76, 0, 0, 0, 0, 0, 81, 0, 11, 11, 12, 12, 0, 0, 0, 257, 0, 515,
    0, 0, 0, 0, 0, 1024, 1024, 0, 0, 0, 0, 0, 0, 75, 0
  "/>

  <!--~
   ! The DFA-state to expected-token-set mapping.
  -->
  <xsl:variable name="p:EXPECTED" as="xs:integer+" select="
    46, 69, 44, 48, 50, 68, 52, 68, 45, 68, 54, 56, 71, 68, 61, 73, 64, 66, 68, 61, 63, 65, 67, 75, 62, 64, 66, 68, 61, 63, 66, 59, 77, 66, 59, 78, 59, 57, 60,
    60, 60, 58, 58, 58, 32, 130816, 2, 4, 130944, 131040, 131056, 262128, 130816, 64, 8, 1792, 6144, 8192, 256, 256, 512, 256, 1536, 4096, 8192, 16384, 32768,
    65536, 2, 8, 16, 49152, 65536, 2048, 4096, 8, 256, 1024, 8192, 65536
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
    'WS',
    'NL',
    'EOF',
    &quot;'##CapabilitiesNeeded'&quot;,
    &quot;'##CreationDate'&quot;,
    &quot;'##Creator'&quot;,
    &quot;'##For'&quot;,
    &quot;'##Frames'&quot;,
    &quot;'##RenderMan'&quot;,
    &quot;'##Scene'&quot;,
    &quot;'##Shaders'&quot;,
    &quot;'##Textures'&quot;,
    &quot;','&quot;
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
        <xsl:variable name="i0" select=". * 87 + $state - 1"/>
        <xsl:variable name="i1" select="$i0 idiv 2"/>
        <xsl:sequence select="p:token((), $p:EXPECTED[$i0 mod 2 + $p:EXPECTED[$i1 + 1] + 1], . * 32 + 1)"/>
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
    <xsl:variable name="state" select="p:lookahead1(9, $input, $state)"/>           <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 17">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shift(17, $input, $state)"/>         <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(8, $input, $state)"/>           <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 5">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 2)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(5, $input, $state)"/>     <!-- WS -->
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
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shift(5, $input, $state)"/>          <!-- WS -->
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
   ! Parse the 1st loop of production CapabilitiesNeeded (one or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-CapabilitiesNeeded-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:parse-Feature($input, $state)"/>
        <xsl:variable name="state" select="p:lookahead1(8, $input, $state)"/>       <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 4">                                      <!-- NMToken -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="p:parse-CapabilitiesNeeded-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse CapabilitiesNeeded.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-CapabilitiesNeeded" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(8, $input, $state)"/>                <!-- '##CapabilitiesNeeded' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:parse-CapabilitiesNeeded-1($input, $state)"/>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'CapabilitiesNeeded', $count, $begin, $end)"/>
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
    <xsl:variable name="state" select="p:lookahead1(9, $input, $state)"/>           <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 17">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shift(17, $input, $state)"/>         <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(8, $input, $state)"/>           <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 5">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 1)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(5, $input, $state)"/>     <!-- WS -->
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
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shift(5, $input, $state)"/>          <!-- WS -->
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
   ! Parse the 1st loop of production Textures (one or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Textures-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:parse-Texture($input, $state)"/>
        <xsl:variable name="state" select="p:lookahead1(8, $input, $state)"/>       <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 4">                                      <!-- NMToken -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="p:parse-Textures-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse Textures.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Textures" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(16, $input, $state)"/>               <!-- '##Textures' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:parse-Textures-1($input, $state)"/>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Textures', $count, $begin, $end)"/>
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
    <xsl:variable name="state" select="p:lookahead1(9, $input, $state)"/>           <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' | ',' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 17">                                        <!-- ',' -->
          <xsl:variable name="state" select="p:shift(17, $input, $state)"/>         <!-- ',' -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:lookahead1(8, $input, $state)"/>           <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 5">                                         <!-- WS -->
          <xsl:variable name="state" select="p:memoized($state, 0)"/>
          <xsl:choose>
            <xsl:when test="$state[$p:lk] != 0">
              <xsl:sequence select="$state"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="backtrack" select="$state"/>
              <xsl:variable name="state" select="p:strip-result($state)"/>
              <xsl:variable name="state" select="p:shiftT(5, $input, $state)"/>     <!-- WS -->
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
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:lk] = -1">
          <xsl:variable name="state" select="p:shift(5, $input, $state)"/>          <!-- WS -->
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
   ! Parse the 1st loop of production Shaders (one or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Shaders-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:parse-Shader($input, $state)"/>
        <xsl:variable name="state" select="p:lookahead1(8, $input, $state)"/>       <!-- NMToken | WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 4">                                      <!-- NMToken -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="p:parse-Shaders-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse Shaders.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Shaders" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(15, $input, $state)"/>               <!-- '##Shaders' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:parse-Shaders-1($input, $state)"/>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Shaders', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse Frames.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Frames" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(12, $input, $state)"/>               <!-- '##Frames' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:lookahead1(1, $input, $state)"/>           <!-- Number -->
    <xsl:variable name="state" select="p:shift(2, $input, $state)"/>                <!-- Number -->
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Frames', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse For.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-For" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(11, $input, $state)"/>               <!-- '##For' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>           <!-- Name -->
    <xsl:variable name="state" select="p:shift(1, $input, $state)"/>                <!-- Name -->
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'For', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse CreationDate.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-CreationDate" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(9, $input, $state)"/>                <!-- '##CreationDate' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:lookahead1(2, $input, $state)"/>           <!-- DateTime -->
    <xsl:variable name="state" select="p:shift(3, $input, $state)"/>                <!-- DateTime -->
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'CreationDate', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse Creator.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Creator" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(10, $input, $state)"/>               <!-- '##Creator' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>           <!-- Name -->
    <xsl:variable name="state" select="p:shift(1, $input, $state)"/>                <!-- Name -->
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Creator', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse Scene.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Scene" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(14, $input, $state)"/>               <!-- '##Scene' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>           <!-- Name -->
    <xsl:variable name="state" select="p:shift(1, $input, $state)"/>                <!-- Name -->
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Scene', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse Conformance.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Conformance" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:shift(13, $input, $state)"/>               <!-- '##RenderMan' -->
    <xsl:variable name="state" select="p:lookahead1(4, $input, $state)"/>           <!-- WS -->
    <xsl:variable name="state" select="p:shift(5, $input, $state)"/>                <!-- WS -->
    <xsl:variable name="state" select="p:lookahead1(0, $input, $state)"/>           <!-- Name -->
    <xsl:variable name="state" select="p:shift(1, $input, $state)"/>                <!-- Name -->
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Conformance', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse the 1st loop of production Line (zero or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Line-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:lookahead1(7, $input, $state)"/>       <!-- WS | NL | EOF | '##CapabilitiesNeeded' | '##CreationDate' |
                                                                                         '##Creator' | '##For' | '##Frames' | '##RenderMan' | '##Scene' |
                                                                                         '##Shaders' | '##Textures' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] != 5">                                      <!-- WS -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="state" select="p:shift(5, $input, $state)"/>        <!-- WS -->
            <xsl:sequence select="p:parse-Line-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse Line.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-Line" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:lookahead1(5, $input, $state)"/>           <!-- '##CapabilitiesNeeded' | '##CreationDate' | '##Creator' | '##For' |
                                                                                         '##Frames' | '##RenderMan' | '##Scene' | '##Shaders' | '##Textures' -->
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 13">                                        <!-- '##RenderMan' -->
          <xsl:variable name="state" select="p:parse-Conformance($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 14">                                        <!-- '##Scene' -->
          <xsl:variable name="state" select="p:parse-Scene($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 10">                                        <!-- '##Creator' -->
          <xsl:variable name="state" select="p:parse-Creator($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 9">                                         <!-- '##CreationDate' -->
          <xsl:variable name="state" select="p:parse-CreationDate($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 11">                                        <!-- '##For' -->
          <xsl:variable name="state" select="p:parse-For($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 12">                                        <!-- '##Frames' -->
          <xsl:variable name="state" select="p:parse-Frames($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 15">                                        <!-- '##Shaders' -->
          <xsl:variable name="state" select="p:parse-Shaders($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 16">                                        <!-- '##Textures' -->
          <xsl:variable name="state" select="p:parse-Textures($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="state" select="p:parse-CapabilitiesNeeded($input, $state)"/>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="state" select="p:parse-Line-1($input, $state)"/>
    <xsl:variable name="state" as="item()+">
      <xsl:choose>
        <xsl:when test="$state[$p:error]">
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:when test="$state[$p:l1] = 6">                                         <!-- NL -->
          <xsl:variable name="state" select="p:shift(6, $input, $state)"/>          <!-- NL -->
          <xsl:sequence select="$state"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:sequence select="$state"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'Line', $count, $begin, $end)"/>
  </xsl:function>

  <!--~
   ! Parse the 1st loop of production HeaderInformation (one or more). Use
   ! tail recursion for iteratively updating the parser state.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-HeaderInformation-1" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:choose>
      <xsl:when test="$state[$p:error]">
        <xsl:sequence select="$state"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="state" select="p:parse-Line($input, $state)"/>
        <xsl:variable name="state" select="p:lookahead1(6, $input, $state)"/>       <!-- EOF | '##CapabilitiesNeeded' | '##CreationDate' | '##Creator' |
                                                                                         '##For' | '##Frames' | '##RenderMan' | '##Scene' | '##Shaders' |
                                                                                         '##Textures' -->
        <xsl:choose>
          <xsl:when test="$state[$p:l1] = 7">                                       <!-- EOF -->
            <xsl:sequence select="$state"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="p:parse-HeaderInformation-1($input, $state)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <!--~
   ! Parse HeaderInformation.
   !
   ! @param $input the input string.
   ! @param $state the parser state.
   ! @return the updated parser state.
  -->
  <xsl:function name="p:parse-HeaderInformation" as="item()+">
    <xsl:param name="input" as="xs:string"/>
    <xsl:param name="state" as="item()+"/>

    <xsl:variable name="count" select="count($state)"/>
    <xsl:variable name="begin" select="$state[$p:e0]"/>
    <xsl:variable name="state" select="p:parse-HeaderInformation-1($input, $state)"/>
    <xsl:variable name="end" select="$state[$p:e0]"/>
    <xsl:sequence select="p:reduce($state, 'HeaderInformation', $count, $begin, $end)"/>
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
    <xsl:variable name="state" select="p:parse-HeaderInformation($input, $state)"/>
    <xsl:variable name="state" select="p:shift(7, $input, $state)"/>                <!-- EOF -->
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
          <xsl:attribute name="key" select="$backtrack[$p:e0] * 4 + $i"/>
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

    <xsl:variable name="value" select="data($state[$p:memo]/value[@key = $state[$p:e0] * 4 + $i])"/>
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