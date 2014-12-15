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
  r8 g8\accent ~ g2.
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
  g4\staccato r4 r8 e8 f4\staccato 
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
  r4 d'2\glissando ais4\staccato 
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
  r1 r1 r1 r1 r1 r1 r1 r8 c'8\staccato r4 d4\staccato r8 d8 ~ d4 c8 b r2 r8 g4. f e8 
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
  f4\marcato r4 r8 b4. 
  | % 46
  ais4\staccato r4 r8 e,8 f4\staccato 
  | % 47
  f'4\marcato r4 ais,2 
  | % 48
  a f 
  | % 49
  d a' 
  | % 50
  g4\staccato g4\staccato dis8\accent dis\staccato r8 g \marcato
  | % 51
  r2 ais 
  | % 52
  a f 
  | % 53
  r4 g'2\glissando f4\staccato 
  | % 54
  cis4\staccato cis4\staccato cis8\accent cis\staccato r8 dis 
  | % 55
  r1 r1 r1 r4 gis4\staccato ais8\accent ais\staccato r8 b
  | % 59
  r1 r1 r1 r4 b2 c8 cis 
  | % 63
  r1 
  | % 64
  dis,, 
  | % 65
  e 
  | % 66
  r4 g'8 fis e b g fis8 ~ fis1 ~ fis1 r8 dis'4. fis4\staccato r4 
  | % 70
  f4\staccato f4\staccato e8\accent e\staccato r8 dis\staccato 
  | % 71
  r1 r1 r1 r8 cis4. c8 a fis e8 ~ e1 e1 
  | % 77
  dis 
  | % 78
  r1 r1 r1 r1 r1 r1 r1 r4 b'4\staccato d8 cis c b 
  | % 86
  r1 
  | % 87
  f'4 d8 ais f'4 d8 ais 
  | % 88
  f' d ais f' r2 r8 fis8 r4 fis r4 
  | % 90
  fis4\staccato fis4\staccato fis8 g fis f8 ~ f1 fis1 
  | % 93
  fis4\staccato r4 r8 dis4. 
  | % 94
  e4\staccato r4 r8 cis4. 
  | % 95
  e4\staccato r2. r1 fis2 dis 
  | % 98
  b1 
  | % 99
  cis4\staccato r2. r1 r4 dis8 dis d dis\staccato r8 f\staccato 
  | % 102
  r8 f\staccato r8 f cis\accent d\marcato r4 r4 e4\staccato a8 e\staccato r8 g8\accent ~ g1 r4 f4\marcato c8\accent f\staccato r8 g\staccato 
  | % 106
  r2. r8 e8\staccato
  | % 107
  r8 a\staccato r8 e\accent a4\staccato e4\staccato
  | % 108
  g4\marcato e4\marcato g8\accent e\staccato r8 f8\accent ~ f2.. g8\accent ~ g4 r2. r1 r1 r1 r1 r8 b8\staccato r4 a4\staccato r8 dis,8 ~ dis4 cis8 c r2 r8 ais'4. 
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
  g4\staccato gis4\staccato g8\accent ais\staccato r8 a\staccato
  r1
  r1
  r1
  r1
  | % 127
  
}

trumpet = \relative c' {
  \set Staff.instrumentName = "trumpet"
  dis''4\staccato d4\staccato c8 d\staccato r8 dis\staccato 
  | % 2
  r1 
  | % 3
  g4\staccato f4\staccato dis4\staccato f4\staccato 
  | % 4
  g8\accent f\marcato r8 g8\accent ~ g4 a4\marcato r8 ais8\accent ~ ais2. 
  | % 6
  ais4\staccato r8 ais8\staccato r2 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r2 gis,2 
  | % 22
  g fis4. f8 
  | % 23
  r1 r1 r1 r8 dis'4. f8 fis r8 g\staccato 
  | % 27
  r1 r1 r1 r4 f2 d8 ais 
  | % 31
  r1 r1 r1 r1 r1 r1 r4 f'4\staccato ais4.\accent ais8\marcato 
  | % 38
  r1 r1 r1 r1 r1 r1 r2 \tuplet 3/2 { c,8 d dis } \tuplet 3/2 { f g a }
  | % 45
  ais4\marcato r4 r8 g4. 
  | % 46
  g4\staccato r4 r8 e8 f4\staccato 
  | % 47
  ais4\marcato r2. r1 r1 g4\staccato g4\staccato g8\accent g\staccato r8 g\marcato 
  | % 51
  r1 r1 r4 f2\glissando d4\staccato 
  | % 54
  fis4\staccato fis4\staccato fis8\accent fis\staccato r8 fis 
  | % 55
  r1 r1 r1 r4 e4\staccato fis8\accent g\staccato r8 gis 
  | % 59
  r1 r1 r1 r4 fis2 g8 gis 
  | % 63
  r1 r1 r1 r1 r1 r1 r8 fis4. a4\staccato r4 
  | % 70
  gis4\staccato gis4\staccato g8\accent g\staccato r8 fis\staccato 
  | % 71
  r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r4 fis4\staccato a8 gis g fis 
  | % 86
  r1 r1 r1 r1 r1 r1 r2 r8 fis8 gis4\staccato 
  | % 93
  b4\staccato r4 r8 a4. 
  | % 94
  gis4\staccato r4 r8 g4. 
  | % 95
  fis4 r2. r1 r1 r1 r1 r1 r1 r1 r4 g4\staccato c8 g\staccato r8 ais8\accent ~ ais1 r4 a4\marcato f8\accent a\staccato r8 b\staccato 
  | % 106
  r2. r8 g8\staccato 
  | % 107
  r8 c\staccato r8 g\accent c4\staccato g4\staccato 
  | % 108
  ais4\marcato a4\marcato ais8\accent g\staccato r8 a8\accent ~ a2.. b8\accent ~ b4 r2. r1 r1 r1 r1 r8 e,8\staccato r4 g4\staccato r8 g8 ~ g4 f8 e r2 r8 c'4. 
  c c8 
  | % 118
  r1 r1 r1 r1 r1 r1 r1 r4 g2 gis8 r8 
  | % 126
  a4\staccato ais4\staccato a8\accent f\staccato r8 e\staccato 
  | % 127
  r1
  r1
  r1
  r1
  
}

trombone = \relative c {
  \set Staff.instrumentName = "trombone"
  \clef bass
  g''4\staccato f4\staccato dis8 f r8\staccato g\staccato 
  | % 2
  r1 
  | % 3
  ais4\staccato a4\staccato g4\staccato a4\staccato 
  | % 4
  ais8\accent a\marcato r8 ais8\accent ~ ais4 c4\marcato r8 f,8\accent ~ f2.
  | % 6
  g4\staccato r8 g8\staccato r2 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 r2.. fis,8 
  | % 19
  f1 ~ f1 r2 c' 
  | % 22
  b ais4. a8 
  | % 23
  r1 r1 r1 r2 f8 fis r8 g\staccato 
  | % 27
  r1 r1 r1 r4 g'2 f8 dis 
  | % 31
  r1 r1 d1 r1 r8 f,8 r4 f4\staccato r4
  | % 36
  f4. f8 r2 r4 f'4\staccato cis4.\accent ais8\marcato 
  | % 38
  r1 r1 r1 r1 r1 r1 r2 \tuplet 3/2 { c8 d dis } \tuplet 3/2 { f g a }
  | % 45
  ais4\marcato r4 r8 dis,4. 
  | % 46
  d4\staccato r4 r8 e8 f4\staccato 
  | % 47
  d'4\marcato r4 r8 ais,8\staccato r4 r8 a8\staccato r4 r8 a8\staccato r4 r8 a8\staccato r4 r8 a8\staccato r4 
  | % 50
  g4\staccato g4\staccato g8\accent g\staccato r4 r8 ais8\staccato r4 r8 ais8\staccato r4 r8 a8\staccato r4 r8 a8\staccato r4 r ais2\glissando ais4 
  | % 54
  b4\staccato b4\staccato ais8\accent ais\staccato r8 ais 
  | % 55
  r1 r1 r1 r4 cis4\staccato cis8\accent dis\staccato r8 e 
  | % 59
  r1 r1 r1 r4 dis2 dis8 e 
  | % 63
  r1 r1 r1 r1 r1 r1 r8 b4. d4\staccato r4 
  | % 70
  cis4\staccato cis4\staccato c8\accent c\staccato r8 b\staccato 
  | % 71
  r1 r1 r1 r1 r1 r1 r1 r4 fis'4\staccato g8\accent g\staccato r8 gis8 ~ gis1 g1 
  | % 81
  r1 r4 b,4\staccato g8\accent e\staccato r8 fis8 ~ fis1 ~ fis1 r4 b4\staccato d8 cis c b 
  | % 86
  r1 r1 r1 r1 r2.. ais8 ~ ais1 ais2 r8 fis8 gis4\staccato 
  | % 93
  dis'4\staccato r4 r8 c4. 
  | % 94
  cis4\staccato r4 r8 ais4. 
  | % 95
  b4\staccato r2. r1 dis2 cis 
  | % 98
  gis1 
  | % 99
  b4 r2. r1 r4 b8 cis ais b\staccato r8 a\staccato
  | % 102
  r8 a\staccato r8 c ais\accent b\marcato r4 r4 b4\staccato e8 b\staccato r8 e8\accent ~ e1 r4 c4\marcato a8\accent c\staccato r8 f\staccato 
  | % 106
  r2. r8 b,8\staccato 
  | % 107
  r8 e\staccato r8 b\accent e4\staccato a,4\staccato 
  | % 108
  e'4\marcato cis4\marcato e8\accent cis\staccato r8 c8\accent ~ c2.. f8\accent ~ f4 r2. r1 r1 r1 r1 r8 g,8\staccato r4 f4\staccato r8 ais8 ~ ais4 
  gis8 g r2 r8 dis'4. cis c8 
  | % 118
  r1 r1 r1 r1 r1 r1 r1 r4 b2 b8 r8 
  | % 126
  c4\staccato cis4\staccato c8\accent f\staccato r8 e\staccato 
  | % 127
  r1
  r1
  r1
  r1
  
}


\score {
  <<
    \new Staff \naturalizeMusic \transpose bes c \trumpet
    \new Staff \naturalizeMusic \transpose es c' \altSax
    \new Staff \naturalizeMusic \transpose bes c' \tenorSax
    \new Staff \naturalizeMusic \trombone
  >>
  \layout {}
  \midi { \tempo 4 = 154 }
}
