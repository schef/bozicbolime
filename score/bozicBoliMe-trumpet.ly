\version "2.18.0"
\include "naturalizeMusic.ly"

\header {
  title = "bozic blu"
}

trumpet = \relative c {
  \set Staff.instrumentName = "trumpet"
  dis''8 r8 d r8 c d r8 dis 
  | % 2
  r1 
  | % 3
  g8 r8 f r8 dis r8 f r8 
  | % 4
  g f r8 g4. a8 r4 ais8 ~ ais2. 
  | % 6
  ais8 r4 ais8 r2 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r2 gis,2 
  | % 22
  g fis4. f8 
  | % 23
  r1 r1 r1 r8 dis'4. f8 fis r8 g 
  | % 27
  r1 r1 r1 r4 f2 d8 ais 
  | % 31
  r1 r1 r1 r1 r1 r1 r4 f'8 r8 ais4. ais8 
  | % 38
  r1 r1 r1 r1 r1 r1 r2 \tuplet 3/2 { c,8 d dis } \tuplet 3/2 { f g a }
  | % 45
  ais4 r4 r8 g4. 
  | % 46
  g8 r2 e8 f r8 
  | % 47
  ais r2.. r1 r1 g8 r8 g r8 g g r8 g 
  | % 51
  r1 r1 r4 f2\glissando d8 r8 
  | % 54
  fis r8 fis r8 fis fis r8 fis 
  | % 55
  r1 r1 r1 r4 e8 r8 fis g r8 gis 
  | % 59
  r1 r1 r1 r4 fis2 g8 gis 
  | % 63
  r1 r1 r1 r1 r1 r1 r8 fis4. a8 r4. 
  | % 70
  gis8 r8 gis r8 g g r8 fis 
  | % 71
  r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r4 fis8 r8 a gis g fis 
  | % 86
  r1 r1 r1 r1 r1 r1 r2 r8 fis8 gis r8 
  | % 93
  b r2 a4. 
  | % 94
  gis8 r2 g4. 
  | % 95
  fis8 r2.. r1 r1 r1 r1 r1 r1 r1 r4 g8 r8 c g r8 ais8 ~ ais1 r4 a8 r8 f a r8 b 
  | % 106
  r2. r8 g8 
  | % 107
  r8 c r8 g c r8 g r8 
  | % 108
  ais r8 a r8 ais g r8 a1 b4. r2. r1 r1 r1 r1 r8 e,8 r4 g8 r4 g4. f8 e r8*5 c'4. 
  c c8 
  | % 118
  r1 r1 r1 r1 r1 r1 r1 r4 g2 gis8 r8 
  | % 126
  a r8 ais r8 a f r8 e 
  | % 127
  
}

\score {
  <<
    \new Staff  \naturalizeMusic \transpose c d \trumpet
  >>
  \layout {}
  \midi {}
}
