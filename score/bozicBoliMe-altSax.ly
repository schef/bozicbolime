\version "2.18.0"
\include "naturalizeMusic.ly"

\header {
  title = "bozic blu"
}

altSax = \relative c {
  \set Staff.instrumentName = "altSax"
  ais''8 r8 gis r8 g gis r8 ais 
  | % 2
  r1 
  | % 3
  dis8 r8 d r8 c r8 d r8 
  | % 4
  dis d r8 dis8 ~ dis4 f8 r8 | 
  r8 g4. ~ g4. r8 
  | % 6
  d r8 r8 d8 r2 |
  r1 r1 r1 r1 r1 r1 r1
  r4.
  cis,8 ~ cis4 b8 ais8 ~ ais1 ~ ais1 d1 
  | % 18
  dis 
  | % 19
  r1 r1 r2 f2 
  | % 22
  e dis4. d8 
  | % 23
  r1 r1 r1 r8 c4. cis8 d r8 dis 
  | % 27
  r1 r1 r1 r4 d'2 ais8 gis 
  | % 31
  r1 
  | % 32
  g2 fis 
  | % 33
  f1 
  | % 34
  r8 dis'4. c8 ais fis f8 ~ f1 ~ f1 r4 f8 r8 fis4. f8 
  | % 38
  r1 
  | % 39
  gis, 
  | % 40
  b 
  | % 41
  a 
  | % 42
  r4 a8 cis d g d' ais 
  | % 43
  gis1 
  | % 44
  a 
  | % 45
  ais8 r8 r4 r8 g4. 
  | % 46
  g8 r8 e4 r8 e8 f r8 
  | % 47
  g r8 r4 ais2 
  | % 48
  a f 
  | % 49
  d a' 
  | % 50
  g8 r8 g r8 dis dis r8 c 
  | % 51
  r2 ais' 
  | % 52
  a f 
  | % 53
  r4 d'2 ais8 r8 
  | % 54
  gis r8 gis r8 gis gis r8 gis 
  | % 55
  b2 ais 
  | % 56
  gis ais 
  | % 57
  b1 
  | % 58
  c 
  | % 59
  b2 ais 
  | % 60
  gis ais 
  | % 61
  b1 
  | % 62
  r1 r1 gis2 g 
  | % 65
  fis1 
  | % 66
  r4 g8 fis e b g fis8 ~ fis1 ~ fis1 r8 ais'4. c8 r4. 
  | % 70
  b8 r8 b r8 ais ais r8 ais 
  | % 71
  r1 r1 r1 r8 e'4. dis8 c a gis8 ~ gis1 g1 
  | % 77
  fis 
  | % 78
  r1 r1 r1 r1 r1 r1 r1 r4 dis8 r8 fis f e dis 
  | % 86
  r1 
  | % 87
  a'4 f8 d a'4 f8 d 
  | % 88
  a' f d a' r2 r8 ais8 r4 ais r4 
  | % 90
  ais8 r8 ais r8 ais b ais a8 ~ a1 ais1 
  | % 93
  gis8 r4. r8 gis4. 
  | % 94
  cis8 r4. r8 e,4. 
  | % 95
  gis8 r2.. r1 ais2 fis 
  | % 98
  dis1 
  | % 99
  e4 r1 r1 fis8 gis f fis r8 g 
  | % 102
  r8 g r8 a fis g r1. ais8 g ais g f g8 ~ g1 r4 b g8 e dis d8 ~ d1 
  r1 r1 r1 r1 r1 r1 r1 r8 c'8 r4 d8 r4 d4. c8 b r2 r8 g4. f e8 
  | % 118
  r1 r1 r2 r8 e8 f fis 
  | % 121
  g1 
  | % 122
  e2 c 
  | % 123
  a1 
  | % 124
  gis 
  | % 125
  r4 d''2 dis8 r8 
  | % 126
  e r8 f r8 e cis r8 c 
  | % 127
  
}

\score {
  <<
    \new Staff \naturalizeMusic \transpose es c' \altSax
  >>
  \layout {}
  \midi {}
}
