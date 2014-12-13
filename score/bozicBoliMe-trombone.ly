% Lily was here -- automatically converted by /usr/bin/midi2ly from trombone_edited.mid
\version "2.14.0"

\layout {
  \context {
    \Voice
    \remove "Note_heads_engraver"
    \consists "Completion_heads_engraver"
    \remove "Rest_engraver"
    \consists "Completion_rest_engraver"
  }
}

\header {
  title = "Bozić boli me"
  composer = "Igor Baksa"
  arranger = "Stjepan Horvat"
}

trombone = \relative c {
  \set Staff.instrumentName = "Trombone"
  \clef bass
  g''8 r8 f r8 dis f r8 g 
  | % 2
  r1 
  | % 3
  ais8 r8 a r8 g r8 a r8 
  | % 4
  ais a r8 ais4. c8 r4 f,8 ~ f2.
  | % 6
  g8 r4 g8 r8*99 fis,8 
  | % 19
  f1*2 r2 c' 
  | % 22
  b ais4. a8 
  | % 23
  r2*7 f8 fis r8 g 
  | % 27
  r4*13 g'2 f8 dis 
  | % 31
  r1*2 d8*9 r1 f,8 r4 f8 r4. 
  | % 36
  f f8 r2. f'8 r8 cis4. ais8 
  | % 38
  r2*13 \times 2/3 { c8 d dis } \times 2/3 { f g a }
  | % 45
  ais8 r2 dis,4. 
  | % 46
  d8 r2 e8 f r8 
  | % 47
  d' r2 ais,8 r4. a8 r4. a8 r4. a8 r4. a8 r4 
  | % 50
  g8 r8 g r8 g g r4. ais8 r4. ais8 r4. a8 r4. a8 r2 ais4. r8 ais 
  r8 
  | % 54
  b r8 b r8 ais ais r8 ais 
  | % 55
  r4*13 cis8 r8 cis dis r8 e 
  | % 59
  r4*13 dis2 dis8 e 
  | % 63
  r8*49 b4. d8 r4. 
  | % 70
  cis8 r8 cis r8 c c r8 b 
  | % 71
  r4*29 fis'8 r8 g g r8 gis8*9 g1 
  | % 81
  r4*5 b,8 r8 g e r8 fis8*17 r4 b8 r8 d cis c b 
  | % 86
  r8*39 ais8 ~ ais1 ~ ais2 r8 fis8 gis r8 
  | % 93
  dis' r2 c4. 
  | % 94
  cis8 r2 ais4. 
  | % 95
  b8 r8*15 dis2 cis 
  | % 98
  gis1 
  | % 99
  b8 r8*17 b8 cis ais b r8 a 
  | % 102
  r8 a r8 c ais b r2 b8 r8 e b r8 e8*9 r4 c8 r8 a c r8 f 
  | % 106
  r8*7 b,8 
  | % 107
  r8 e r8 b e r8 a, r8 
  | % 108
  e' r8 cis r8 e cis r8 c8*7 r8 f4. r8*39 g,8 r4 f8 r4 ais4. 
  gis8 g r8*5 dis'4. cis c8 
  | % 118
  r4*29 b2 b8 r8 
  | % 126
  c r8 cis r8 c f r8 e 
  | % 127
  
}

\score {
  <<
    \new Staff { \trombone }
  >>
  \layout {}
  \midi {}
}
