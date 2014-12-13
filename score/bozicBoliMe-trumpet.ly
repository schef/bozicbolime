% Lily was here -- automatically converted by /usr/bin/midi2ly from trumpet_edited.mid
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

trackAchannelA = {
  
  \tempo 4 = 154 
  
  \time 4/4 
  
}

trackA = <<
  \context Voice = voiceA \trackAchannelA
>>


trackBchannelA = {
  
  \set Staff.instrumentName = "Trumpet  1"
  
}

trackBchannelB = \relative c {
  dis''8 r8 d r8 c d r8 dis 
  | % 2
  r1 
  | % 3
  g8 r8 f r8 dis r8 f r8 
  | % 4
  g f r8 g4. a8 r4 ais8*5 r4 
  | % 6
  ais8 r4 ais8 r1*15 gis,2 
  | % 22
  g fis4. f8 
  | % 23
  r8*25 dis'4. f8 fis r8 g 
  | % 27
  r4*13 f2 d8 ais 
  | % 31
  r4*25 f'8 r8 ais4. ais8 
  | % 38
  r2*13 c,4*32/96 d dis f g a 
  | % 45
  ais r4*208/96 g4. 
  | % 46
  g8 r2 e8 f r8 
  | % 47
  ais r8*23 g8 r8 g r8 g g r8 g 
  | % 51
  r4*800/96 gis'4*32/96 r4*32/96 f,4. e16 dis d8 r8 
  | % 54
  fis r8 fis r8 fis fis r8 fis 
  | % 55
  r4*13 e8 r8 fis g r8 gis 
  | % 59
  r4*13 fis2 g8 gis 
  | % 63
  r8*49 fis4. a8 r4. 
  | % 70
  gis8 r8 gis r8 g g r8 fis 
  | % 71
  r4*57 fis8 r8 a gis g fis 
  | % 86
  r8*53 fis8 gis r8 
  | % 93
  b r2 a4. 
  | % 94
  gis8 r2 g4. 
  | % 95
  fis8 r8*65 g8 r8 c g r8 ais8*9 r4 a8 r8 f a r8 b 
  | % 106
  r8*7 g8 
  | % 107
  r8 c r8 g c r8 g r8 
  | % 108
  ais r8 a r8 ais g r8 a1 b4. r8*39 e,8 r4 g8 r4 g4. f8 e r8*5 c'4. 
  c c8 
  | % 118
  r4*29 g2 gis8 r8 
  | % 126
  a r8 ais r8 a f r8 e 
  | % 127
  
}

trackB = <<
  \context Voice = voiceA \trackBchannelA
  \context Voice = voiceB \trackBchannelB
>>


\score {
  <<
    \context Staff=trackB \trackA
    \context Staff=trackB \trackB
  >>
  \layout {}
  \midi {}
}
