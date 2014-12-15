\version "2.18.0"
\include "naturalizeMusic.ly"
%#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "LilyJAZZ.ily"


\paper {
  #(define fonts
     (set-global-fonts
      #:music "lilyjazz"
      #:roman "Pea Missy with a Marker"
      #:sans "Pea Missy with a Marker"
      #:factor (/ staff-height pt 20)))
}

\paper {
  #(set-paper-size "letter")
%  paper-height = 11\in
%  paper-width = 8.5\in
  %indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0 
  %%set to ##t if your score is less than one page: 
  ragged-last-bottom = ##f 
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Bozic boli me"
composer = #"-Baksa & Horvat"
meter = #"(Med. Swing)"


realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup { 
        \fill-line {  
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #8
            \override #'(offset . 7)
            \override #'(thickness . 6) 
            \underline \sans #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \once \override Staff.Clef.stencil = ##f
      \once \override Staff.TimeSignature.stencil = ##f
      \once \override Staff.KeySignature.stencil = ##f
      ragged-right = ##f
      \override TextScript.font-name = #"Pea Missy with a Marker"
    }
  }
}

\header {
  title = \realBookTitle
  tagline = ##f
}

global = {
  \compressFullBarRests
  \time 4/4
  %\partial 8
  \tempo 4 = 154
  #(set-accidental-style 'modern-cautionary)
}

%%%%%% Marks %%%%%%%

hideNotes = { \hideNotes \override MultiMeasureRest #'transparent = ##t }
unHideNotes = { \revert MultiMeasureRest #'transparent \unHideNotes }

marks = {
  \set Score.markFormatter = #format-mark-box-barnumbers
  \compressFullBarRests
  \hideNotes
  R1*6 \mark \default \bar "||" %7
  R1*16 \mark \default %23
  R1*16 \mark \default \bar "||" %39
  R1*8 \mark \default \bar "||" %47
  R1*8 \mark \default \bar "||" %55
  R1*16 \mark \default
  R1*16 \mark \default \bar "||" %87
  R1*8 \mark \default \bar "||" %95
  R1*8 \mark \default \bar "||" %103
  R1*16 \mark \default \bar "||" %119
  R1*12 \bar "|." % 130

  \unHideNotes
  \bar "|."
}

altSax = \relative c {
  \set Staff.instrumentName = "altSax"
  \global
  \compressFullBarRests
  ais''4\staccato gis\staccato g8 gis\staccato r8 ais\staccato 
  | % 2
  R1 
  | % 3
  dis4\staccato d\staccato c\staccato d\staccato 
  | % 4
  dis8\accent d\marcato r8 dis8\accent ~ dis4 f4\marcato | 
  r8 g8\accent ~ g2.
  | % 6
  d4\staccato r8 d8\staccato r2 |
  R1*7
  r4 r8
  cis,8 ~ cis4 b8 ais8 ~ ais1 ~ ais1 d1 
  | % 18
  dis 
  | % 19
  R1*2 r2 f2 
  | % 22
  e dis4. d8 
  | % 23
  R1*3 r8 c4. cis8 d8 r8 dis8\staccato
  | % 27
  R1*3 r4 d'2 ais8 gis 
  | % 31
  R1 
  | % 32
  g2 fis 
  | % 33
  f1 
  | % 34
  r8 dis'4. c8 ais fis f8 ~ f1 ~ f1 r4 f4\staccato fis4.\accent f8\marcato 
  | % 38
  R1 
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
  R1*2 gis2 g 
  | % 65
  fis1 
  | % 66
  r4 g8 fis e b g fis8 ~ fis1 ~ fis1 r8 ais'4. c4\staccato r4 
  | % 70
  b4\staccato b4\staccato ais8\accent ais\staccato r8 ais\staccato
  | % 71
  R1*3 r8 e'4. dis8 c a gis8 ~ gis1 g1 
  | % 77
  fis 
  | % 78
  R1*7 r4 dis4\staccato fis8 f e dis 
  | % 86
  R1 
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
  gis4\staccato r2. R1 ais2 fis 
  | % 98
  dis1 
  | % 99
  e4\staccato r2. R1 r4 fis8 gis f fis\staccato r8 g\staccato 
  | % 102
  r8 g\staccato r8 a fis\accent g\marcato r4 R1 r4 ais8 g ais g f g8 ~ g1 r4 b g8 e dis d8 ~ d1 
  R1*7 r8 c'8\staccato r4 d4\staccato r8 d8 ~ d4 c8 b r2 r8 g4. f e8 
  | % 118
  R1*2 r2 r8 e8 f fis 
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
  R1*4
  | % 127
  
}

tenorSax = \relative c {
  \global
  \compressFullBarRests
  \set Staff.instrumentName = "tenorSax"
  f'1\trill ~ f1 ~ f1 ~ f1 r8 d4. dis4\staccato e4\staccato 
  | % 6
  f4\staccato r8 f8\staccato r2 R1*7 r4. f'8 ~ f4 dis8 d8 ~ d1 ~ d1 ais1 
  | % 18
  ais 
  | % 19
  R1*2 r2 dis2 
  | % 22
  d cis4. c8 
  | % 23
  R1*3 r2 ais8 b r8 c\staccato 
  | % 27
  R1*3 r4 ais'2 g8 f 
  | % 31
  R1 
  | % 32
  d,2 d 
  | % 33
  dis1 
  | % 34
  r8 c'4. ais8 gis fis f8 ~ f1 ~ f1 r4 f'4\staccato dis4.\accent d8\marcato
  | % 38
  R1 
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
  R1*3 r4 gis4\staccato ais8\accent ais\staccato r8 b
  | % 59
  R1*3 r4 b2 c8 cis 
  | % 63
  R1 
  | % 64
  dis,, 
  | % 65
  e 
  | % 66
  r4 g'8 fis e b g fis8 ~ fis1 ~ fis1 r8 dis'4. fis4\staccato r4 
  | % 70
  f4\staccato f4\staccato e8\accent e\staccato r8 dis\staccato 
  | % 71
  R1*3 r8 cis4. c8 a fis e8 ~ e1 e1 
  | % 77
  dis 
  | % 78
  R1*7 r4 b'4\staccato d8 cis c b 
  | % 86
  R1 
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
  e4\staccato r2. R1 fis2 dis 
  | % 98
  b1 
  | % 99
  cis4\staccato r2. R1 r4 dis8 dis d dis\staccato r8 f\staccato 
  | % 102
  r8 f\staccato r8 f cis\accent d\marcato r4 r4 e4\staccato a8 e\staccato r8 g8\accent ~ g1 r4 f4\marcato c8\accent f\staccato r8 g\staccato 
  | % 106
  r2. r8 e8\staccato
  | % 107
  r8 a\staccato r8 e\accent a4\staccato e4\staccato
  | % 108
  g4\marcato e4\marcato g8\accent e\staccato r8 f8\accent ~ f2.. g8\accent ~ g4 r2. R1*4 r8 b8\staccato r4 a4\staccato r8 dis,8 ~ dis4 cis8 c r2 r8 ais'4. 
  gis g8 
  | % 118
  R1*2 r2 r8 cis,8 d dis 
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
  R1
  R1
  R1
  R1
  | % 127
  
}

trumpet = \relative c' {
  \global
  \compressFullBarRests
  \set Staff.instrumentName = "trumpet"
  dis''4\staccato d4\staccato c8 d\staccato r8 dis\staccato 
  | % 2
  R1 
  | % 3
  g4\staccato f4\staccato dis4\staccato f4\staccato 
  | % 4
  g8\accent f\marcato r8 g8\accent ~ g4 a4\marcato r8 ais8\accent ~ ais2. 
  | % 6
  ais4\staccato r8 ais8\staccato r2 R1*14 r2 gis,2 
  | % 22
  g fis4. f8 
  | % 23
  R1*3 r8 dis'4. f8 fis r8 g\staccato 
  | % 27
  R1*3 r4 f2 d8 ais 
  | % 31
  R1*6 r4 f'4\staccato ais4.\accent ais8\marcato 
  | % 38
  R1*6 r2 \tuplet 3/2 { c,8 d dis } \tuplet 3/2 { f g a }
  | % 45
  ais4\marcato r4 r8 g4. 
  | % 46
  g4\staccato r4 r8 e8 f4\staccato 
  | % 47
  ais4\marcato r2. R1*2 g4\staccato g4\staccato g8\accent g\staccato r8 g\marcato 
  | % 51
  R1*2 r4 f2\glissando d4\staccato 
  | % 54
  fis4\staccato fis4\staccato fis8\accent fis\staccato r8 fis 
  | % 55
  R1*3 r4 e4\staccato fis8\accent g\staccato r8 gis 
  | % 59
  R1*3 r4 fis2 g8 gis 
  | % 63
  R1*6 r8 fis4. a4\staccato r4 
  | % 70
  gis4\staccato gis4\staccato g8\accent g\staccato r8 fis\staccato 
  | % 71
  R1*14 r4 fis4\staccato a8 gis g fis 
  | % 86
  R1*6 r2 r8 fis8 gis4\staccato 
  | % 93
  b4\staccato r4 r8 a4. 
  | % 94
  gis4\staccato r4 r8 g4. 
  | % 95
  fis4 r2. R1*7 r4 g4\staccato c8 g\staccato r8 ais8\accent ~ ais1 r4 a4\marcato f8\accent a\staccato r8 b\staccato 
  | % 106
  r2. r8 g8\staccato 
  | % 107
  r8 c\staccato r8 g\accent c4\staccato g4\staccato 
  | % 108
  ais4\marcato a4\marcato ais8\accent g\staccato r8 a8\accent ~ a2.. b8\accent ~ b4 r2. R1*4 r8 e,8\staccato r4 g4\staccato r8 g8 ~ g4 f8 e r2 r8 c'4. 
  c c8 
  | % 118
  R1*7 r4 g2 gis8 r8 
  | % 126
  a4\staccato ais4\staccato a8\accent f\staccato r8 e\staccato 
  | % 127
  R1*4
  
}

trombone = \relative c {
  \global
  \compressFullBarRests
  \set Staff.instrumentName = "trombone"
  \clef bass
  g''4\staccato f4\staccato dis8 f r8\staccato g\staccato 
  | % 2
  R1 
  | % 3
  ais4\staccato a4\staccato g4\staccato a4\staccato 
  | % 4
  ais8\accent a\marcato r8 ais8\accent ~ ais4 c4\marcato r8 f,8\accent ~ f2.
  | % 6
  g4\staccato r8 g8\staccato r2 R1*11 r2.. fis,8 
  | % 19
  f1 ~ f1 r2 c' 
  | % 22
  b ais4. a8 
  | % 23
  R1*3 r2 f8 fis r8 g\staccato 
  | % 27
  R1*3 r4 g'2 f8 dis 
  | % 31
  R1*2 d1 R1 r8 f,8 r4 f4\staccato r4
  | % 36
  f4. f8 r2 r4 f'4\staccato cis4.\accent ais8\marcato 
  | % 38
  R1*6 r2 \tuplet 3/2 { c8 d dis } \tuplet 3/2 { f g a }
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
  R1*3 r4 cis4\staccato cis8\accent dis\staccato r8 e 
  | % 59
  R1*3 r4 dis2 dis8 e 
  | % 63
  R1*6 r8 b4. d4\staccato r4 
  | % 70
  cis4\staccato cis4\staccato c8\accent c\staccato r8 b\staccato 
  | % 71
  R1*7 r4 fis'4\staccato g8\accent g\staccato r8 gis8 ~ gis1 g1 
  | % 81
  R1 r4 b,4\staccato g8\accent e\staccato r8 fis8 ~ fis1 ~ fis1 r4 b4\staccato d8 cis c b 
  | % 86
  R1*4 r2.. ais8 ~ ais1 ais2 r8 fis8 gis4\staccato 
  | % 93
  dis'4\staccato r4 r8 c4. 
  | % 94
  cis4\staccato r4 r8 ais4. 
  | % 95
  b4\staccato r2. R1 dis2 cis 
  | % 98
  gis1 
  | % 99
  b4 r2. R1 r4 b8 cis ais b\staccato r8 a\staccato
  | % 102
  r8 a\staccato r8 c ais\accent b\marcato r4 r4 b4\staccato e8 b\staccato r8 e8\accent ~ e1 r4 c4\marcato a8\accent c\staccato r8 f\staccato 
  | % 106
  r2. r8 b,8\staccato 
  | % 107
  r8 e\staccato r8 b\accent e4\staccato a,4\staccato 
  | % 108
  e'4\marcato cis4\marcato e8\accent cis\staccato r8 c8\accent ~ c2.. f8\accent ~ f4 r2. R1*4 r8 g,8\staccato r4 f4\staccato r8 ais8 ~ ais4 
  gis8 g r2 r8 dis'4. cis c8 
  | % 118
  R1*7 r4 b2 b8 r8 
  | % 126
  c4\staccato cis4\staccato c8\accent f\staccato r8 e\staccato 
  | % 127
  R1*4
  
}


\score {
  <<
    %\new Staff << \marks \naturalizeMusic \transpose bes c \trumpet >>
    \new Staff << \marks \naturalizeMusic \transpose es c' \altSax >>
    %\new Staff << \marks \naturalizeMusic \transpose bes c' \tenorSax >>
    %\new Staff << \marks \naturalizeMusic \trombone >>
  >>
  \layout {}
  \midi { \tempo 4 = 154 }
}
