\version "2.18.0"
\include "naturalizeMusic.ly"

\header {
  title = "bozic blu"
}

altSax = \relative c {
  \set Staff.instrumentName = "altSax"
  ais''4\staccato gis\staccato g8 gis\staccato r8 ais\staccato 
  | % 2
  r1 
  | % 3
  dis4\staccato d\staccato c\staccato d\staccato 
  | % 4
  dis8\accent d\marcato r8 dis8\accent ~ dis4 f4\marcato | 
  r8 g4. ~ g2 
  | % 6
  d4\staccato r8 d8\staccato r2 |
  r1 r1 r1 r1 r1 r1 r1
  r4 r8
  cis,8 ~ cis4 b8 ais8 ~ ais1 ~ ais1 d1 
  | % 18
  dis 
  | % 19
  r1 r1 r2 f2 
  | % 22
  e dis4. d8 
  | % 23
  r1 r1 r1 r8 c4. cis8 d8 r8 dis8\staccato
  | % 27
  r1 r1 r1 r4 d'2 ais8 gis 
  | % 31
  r1 
  | % 32
  g2 fis 
  | % 33
  f1 
  | % 34
  r8 dis'4. c8 ais fis f8 ~ f1 ~ f1 r4 f4\staccato fis4.\accent f8\marcato 
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
  ais4\marcato r4 r8 g4. 
  | % 46
  g4\staccato e4\staccato r8 e8 f4\staccato 
  | % 47
  g4\marcato r4 ais2 
  | % 48
  a f 
  | % 49
  d a' 
  | % 50
  g4\staccato g4\staccato dis8\accent dis\staccato r8 c\marcato 
  | % 51
  r2 ais' 
  | % 52
  a f 
  | % 53
  r4 d'2 ais4\staccato 
  | % 54
  gis4\staccato gis4\staccato gis8\accent gis\staccato r8 gis
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
  r4 g8 fis e b g fis8 ~ fis1 ~ fis1 r8 ais'4. c4\staccato r4 
  | % 70
  b4\staccato b4\staccato ais8\accent ais\staccato r8 ais\staccato
  | % 71
  r1 r1 r1 r8 e'4. dis8 c a gis8 ~ gis1 g1 
  | % 77
  fis 
  | % 78
  r1 r1 r1 r1 r1 r1 r1 r4 dis4\staccato fis8 f e dis 
  | % 86
  r1 
  | % 87
  a'4 f8 d a'4 f8 d 
  | % 88
  a' f d a' r2 r8 ais8\staccato r4 ais4 r4 
  | % 90
  ais4\staccato ais4\staccato ais8 b ais a8 ~ a1 ais1 
  | % 93
  gis4\staccato r4 r8 gis4. 
  | % 94
  cis4\staccato r4 r8 e,4. 
  | % 95
  gis4\staccato r2. r1 ais2 fis 
  | % 98
  dis1 
  | % 99
  e4\staccato r2. r1 r4 fis8 gis f fis\staccato r8 g\staccato 
  | % 102
  r8 g\staccato r8 a fis\accent g\marcato r4 r1 r4 ais8 g ais g f g8 ~ g1 r4 b g8 e dis d8 ~ d1 
  r1 r1 r1 r1 r1 r1 r1 r8 c'8 r4 d4\staccato r8 d8 ~ d4 c8 b r2 r8 g4. f e8 
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
  e4\staccato f\staccato e8\accent cis\staccato r8 c\staccato
  r1
  r1
  r1
  r1
  | % 127
  
}

tenorSax = \relative c {
  \set Staff.instrumentName = "tenorSax"
  f'1\trill ~ f1 ~ f1 ~ f1 r8 d4. dis4\staccato e4\staccato 
  | % 6
  f4\staccato r8 f8\staccato r2 r1 r1 r1 r1 r1 r1 r1 r4. f'8 ~ f4 dis8 d8 ~ d1 ~ d1 ais1 
  | % 18
  ais 
  | % 19
  r1 r1 r2 dis2 
  | % 22
  d cis4. c8 
  | % 23
  r1 r1 r1 r2 ais8 b r8 c\staccato 
  | % 27
  r1 r1 r1 r4 ais'2 g8 f 
  | % 31
  r1 
  | % 32
  d,2 d 
  | % 33
  dis1 
  | % 34
  r8 c'4. ais8 gis fis f8 ~ f1 ~ f1 r4 f'4\staccato dis4.\accent d8\marcato
  | % 38
  r1 
  | % 39
  e, 
  | % 40
  gis 
  | % 41
  f 
  | % 42
  r4 a,8 cis d g d' ais 
  | % 43
  e'1 
  | % 44
  f 
  | % 45
  f8 r4. r8 b4. 
  | % 46
  ais8 r4. r8 e,8 f r8 
  | % 47
  f' r4. ais,2 
  | % 48
  a f 
  | % 49
  d a' 
  | % 50
  g8 r8 g r8 dis dis r8 g 
  | % 51
  r2 ais 
  | % 52
  a f 
  | % 53
  r4 g'2 f8 r8 
  | % 54
  cis r8 cis r8 cis cis r8 dis 
  | % 55
  r1 r1 r1 r4 gis8 r8 ais ais r8 b 
  | % 59
  r1 r1 r1 r4 b2 c8 cis 
  | % 63
  r1 
  | % 64
  dis,, 
  | % 65
  e 
  | % 66
  r4 g'8 fis e b g fis8 ~ fis1 ~ fis1 r8 dis'4. fis8 r4. 
  | % 70
  f8 r8 f r8 e e r8 dis 
  | % 71
  r1 r1 r1 r8 cis4. c8 a fis e8 ~ e1 e1 
  | % 77
  dis 
  | % 78
  r1 r1 r1 r1 r1 r1 r1 r4 b'8 r8 d cis c b 
  | % 86
  r1 
  | % 87
  f'4 d8 ais f'4 d8 ais 
  | % 88
  f' d ais f' r2 r8 fis8 r4 fis r4 
  | % 90
  fis8 r8 fis r8 fis g fis f8 ~ f1 fis1 
  | % 93
  fis8 r2 dis4. 
  | % 94
  e8 r2 cis4. 
  | % 95
  e8 r2.. r1 fis2 dis 
  | % 98
  b1 
  | % 99
  cis8 r2.. r1 r4 dis8 dis d dis r8 f 
  | % 102
  r8 f r8 f cis d r2 e8 r8 a e r8 g8 ~ g1 r4 f8 r8 c f r8 g 
  | % 106
  r2. r8 e8 
  | % 107
  r8 a r8 e a r8 e r8 
  | % 108
  g r8 e r8 g e r8 f1 g4. r2. r1 r1 r1 r1 r8 b8 r4 a8 r4 dis,4. cis8 c r8*5 ais'4. 
  gis g8 
  | % 118
  r1 r1 r2 r8 cis,8 d dis 
  | % 121
  e1 
  | % 122
  c2 a 
  | % 123
  f1 
  | % 124
  f 
  | % 125
  r4 e'2 fis8 r8 
  | % 126
  g r8 gis r8 g ais r8 a
  r1
  r1
  r1
  r1
  | % 127
  
}

\score {
  <<
    \new Staff \naturalizeMusic \transpose es c' \altSax
    \new Staff \naturalizeMusic \transpose bes c' \tenorSax
  >>
  \layout {}
  \midi {}
}
