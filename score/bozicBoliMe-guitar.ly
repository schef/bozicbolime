\version "2.18.2"
%#(set-global-staff-size 18)
\include "jazzchords.ily"
\include "LilyJAZZ.ily"
\language "deutsch"

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
%  indent = 0\mm
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

theNotes = \relative c'' {
  \set Staff.midiInstrument = "guitar"
  \key c \major
  %\showStartRepeatBar \bar "[|:"
  \improvisationOn
  \set Staff.instrumentName = "Guitar"
  \numericTimeSignature
  h4 h4 h8 h r8 h8 |
  r1 |
  h4 h h h |
  h8 h r8 h4. h4 |
  r8 h8 ~ h2. |
  h4 r8 h8 r2 |
  \bar "||"
  
  \override Voice.Stem.stencil = ##f
  \repeat unfold 15 {h4 h h h |}
  h4 h h 
  \override Voice.Stem.stencil = ##t
  h8 h |
  \override Voice.Stem.stencil = ##f
  r4 h4 h h |
  \repeat unfold 13 {h4 h h h |}
  \override Voice.Stem.stencil = ##t
  r4 h4 h4. h8 |
  \override Voice.Stem.stencil = ##f
  r1 |
  \bar "||"
  
  \repeat unfold 6 {h4 h h h |}
  \override Voice.Stem.stencil = ##t
  h4 r4. h4. |
  h4 r4. h8 h4 |
  \override Voice.Stem.stencil = ##f
  \bar "||"
  
  \repeat unfold 6 {h4 h h h |}
  \override Voice.Stem.stencil = ##t
  r4 h2 h4 |
  h4 h h8 h r8 h8 |
  \override Voice.Stem.stencil = ##f
  \bar "||"
  
  \repeat unfold 30 {h4 h h h |}
  \override Voice.Stem.stencil = ##t
  r4 h4 h8 h h h |
  \override Voice.Stem.stencil = ##f
  r1 |
  \bar "||"
  
  \repeat unfold 6 {h4 h h h |}
  \override Voice.Stem.stencil = ##t
  h4 r4. h4. |
  h4 r4. h4. |
  \override Voice.Stem.stencil = ##f
  \bar "||"
  
  \repeat unfold 21 {h4 h h h |}
  \override Voice.Stem.stencil = ##t
  h4 h8 h r2 |
  r8 h8 r4 h4. h8 |
  \override Voice.Stem.stencil = ##f
  r1 |
  \bar "||"
  
  \repeat unfold 10 {h4 h h h |}
  \override Voice.Stem.stencil = ##t
  r8 h4. h8 r8 h8 r8 |
  h8 h h h r2 |
  \override Voice.Stem.stencil = ##f
  \bar "|."
}

theChords = \chordmode {
 %\semiGermanChords
  \set chordChanges = ##t
  %INTRO
es4 b:7 es8:6 b:7 s8 es8 |
es1 |
\set chordChanges = ##f
es4 b:maj7 c:m7 b:maj7 |
\set chordChanges = ##t
es8 d:m s8 es4. f4 |
s8 b2..:6 |
f4:7 s8 f8:7 s2 |
%KITICA1
b1:maj7 |
q1 |
c1:m7 |
c1:maj7.3- |
c1:m7 |
f1:7 |
b2:maj7 g:m7 |
c2:m7 f:7 |
f1:m7 |
b1:7 |
es1:maj7 |
es1:maj7.3- |
b2:maj7 b:6 |
c2:m7 f:7 |
b2:maj7 des:7 |
c2:7 ces4.:7 b8:maj7 |
\set chordChanges = ##f
s4 b2.:maj7 |
\set chordChanges = ##t
q1 | 
c1:m7 |
c1:maj7.3- |
c1:m7 |
f1:7 |
b2:maj7 g:m7 |
c2:m7 f:7 |
f1:m7 |
b1:7 |
es1:maj7 |
es1:maj7.3- |
b2:maj7 g:m7 |
c2:m7 f:7 |
s4 b4:m h4.:maj7 b8 |
s1 |
%BRIDGE1
a1:maj7 |
q1 |
b1:maj7 |
q1 |
a1:maj7 |
f1 |
b4:6 s4. g4.:7.5+ |
c4:7sus4 s4. e8 f4 |
%REFREN1
es1:maj7 |
f1:7 |
b1:maj7 |
g1:m7 |
c1:m7 |
f1:7 |
s4 b2:maj7 b4:maj7 |
cis4:m7 q fis8:7 q s8 h8:maj7 |
%KITICA2
h1:maj7 |
q1 |
cis1:m7 |
cis1:maj7.3- |
cis1:m7 |
fis1:7 |
h2:maj7 gis:m7 |
cis2:m7 fis:7 |
fis1:m7 |
h1:7 |
e1:maj7 |
e1:maj7.3- |
h2:maj7 gis:m7 |
cis2:m7 fis:7 |
h2:maj7 d:7 |
des2:7 c:7 |
h1:maj7 |
q1 | 
cis1:m7 |
cis1:maj7.3- |
cis1:m7 |
fis1:7 |
h2:maj7 gis:m7 |
cis2:m7 fis:7 |
fis1:m7 |
h1:7 |
e1:maj7 |
e1:maj7.3- |
h2:maj7 gis:m7 |
cis2:m7 fis:7 |
s4 h4 d8 cis c h |
s1 |
%BRIDGE2
b1:maj7 |
q1 |
h1:maj7 |
q1 |
b1:maj7 |
fis1 |
h4 s4. as4.:7 |
cis4:m7 s4. fis4.:7 |
%REFREN2
e1:maj7 |
fis1:7 |
h1:maj7 |
gis1:m7 |
cis:m7 |
fis1:7 |
h1:maj7 |
d2:m7 g:7 |
%SOLO
c1:maj7 |
a1:m7 |
d1:m7 |
g1:7 |
c1:maj7 |
a1:m7 |
d1:m7 |
g1:7 |
c1:7 |
q1 |
f1:maj7 |
b1:7 |
c4 c d:m d:m |
es4 cis8 c s2 |
s8 es8 s4 cis4. c8 |
s1 |
%REFREN3
d1:m9 |
g1:7 |
c1:maj7 |
a1:m7 |
d1:m7 |
g1:7 |
c1 |
a1:m7 |
d1:m7 |
g1:7 |
c8 e4. f8 s8 fis8 s8 |
g8 f es c s2|
}

theWords = \lyricmode {
  \repeat "volta" 2 {
    All of me
    Why not take all of me
    Can't you see
    I'm no good with -- out you
    
    Take my lips
    I want to lose them
    Take my arms
    I ne -- ver use them
    
    Your Good -- bye
    Left me with eyes that cry
    How can I go on dear with -- out you
  }
  \alternative {
    { 
      You took the part
      That once was my heart
      So why not take all of me	
    }
    {
      You took the best 
      So why not take the rest
      Ba -- by take all of me.	
    }
  }
}

\score {
  <<
    \new ChordNames \theChords
    \new Staff << \marks \theNotes >>
    %\new Lyrics \lyricsto chant \theWords
  >>
  \layout {
    \override Score.Clef #'break-visibility = #'#(#f #f #f)  % make only the first clef visible
    \override Score.KeySignature #'break-visibility = #'#(#f #f #f)  % make only the first time signature visible
    \override Score.SystemStartBar #'collapse-height = #1  % allow single-staff system bars
    \override LyricHyphen.thickness = #4
    \override Score.VoltaBracket.font-name = #"Pea Missy with a Marker"
  }
  \midi {
    \tempo 4 = 88
  }
}
