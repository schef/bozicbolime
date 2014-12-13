\version "2.18.0"

\header {
  title = "bozic blu"
}

tenorSax = \relative c {
  \set Staff.instrumentName = "tenorSax"
  f'1\trill ~ f1 ~ f1 ~ f1 r8 d4. dis8 r8 e r8 
  | % 6
  f r4 f8 r2 r1 r1 r1 r1 r1 r1 r1 r4. f'4. dis8 d8 ~ d1 ~ d1 ais1 
  | % 18
  ais 
  | % 19
  r1 r1 r2 dis2 
  | % 22
  d cis4. c8 
  | % 23
  r1 r1 r1 r2 ais8 b r8 c 
  | % 27
  r1 r1 r1 r4 ais'2 g8 f 
  | % 31
  r1 
  | % 32
  d,2 d 
  | % 33
  dis1 
  | % 34
  r8 c'4. ais8 gis fis f8 ~ f1 ~ f1 r4 f'8 r8 dis4. d8 
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
  | % 127
  
}

\score {
  <<
    \transpose bes c' \tenorSax
  >>
  \layout {}
  \midi {}
}