% Lily was here -- automatically converted by /usr/bin/midi2ly from test-bozic_blu-harme-ritam.mid
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

#(define (naturalize-pitch p)
   (let ((o (ly:pitch-octave p))
         (a (* 4 (ly:pitch-alteration p)))
         ;; alteration, a, in quarter tone steps,
         ;; for historical reasons
         (n (ly:pitch-notename p)))
     (cond
      ((and (> a 1) (or (eq? n 6) (eq? n 2)))
       (set! a (- a 2))
       (set! n (+ n 1)))
      ((and (< a -1) (or (eq? n 0) (eq? n 3)))
       (set! a (+ a 2))
       (set! n (- n 1))))
     (cond
      ((> a 2) (set! a (- a 4)) (set! n (+ n 1)))
      ((< a -2) (set! a (+ a 4)) (set! n (- n 1))))
     (if (< n 0) (begin (set! o (- o 1)) (set! n (+ n 7))))
     (if (> n 6) (begin (set! o (+ o 1)) (set! n (- n 7))))
     (ly:make-pitch o n (/ a 4))))

#(define (naturalize music)
   (let ((es (ly:music-property music 'elements))
         (e (ly:music-property music 'element))
         (p (ly:music-property music 'pitch)))
     (if (pair? es)
         (ly:music-set-property!
          music 'elements
          (map (lambda (x) (naturalize x)) es)))
     (if (ly:music? e)
         (ly:music-set-property!
          music 'element
          (naturalize e)))
     (if (ly:pitch? p)
         (begin
           (set! p (naturalize-pitch p))
           (ly:music-set-property! music 'pitch p)))
     music))

naturalizeMusic =
#(define-music-function (parser location m)
   (ly:music?)
   (naturalize m))

trackAchannelA = {
  
  \tempo 4 = 154 
  
  \time 4/4 
  
}

trackA = <<
  \context Voice = voiceA \trackAchannelA
>>


trackBchannelA = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )

  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \set Staff.instrumentName = "Kontakt 5 5"
  
}

trackBchannelB = \relative c {
  c''4 c c8 c r8 c 
  | % 2
  r1 
  | % 3
  c4 c c c 
  | % 4
  c8 c r8 c4. c4 
  | % 5
  r8 c8*7 
  | % 6
  c4 r8 c r2 
  | % 7
  c4 c c c 
  | % 8
  c c c c 
  | % 9
  c c c c 
  | % 10
  c c c c 
  | % 11
  c c c c 
  | % 12
  c c c c 
  | % 13
  c c c c 
  | % 14
  c c c c 
  | % 15
  c c c c 
  | % 16
  c c c c 
  | % 17
  c c c c 
  | % 18
  c c c c 
  | % 19
  c c c c 
  | % 20
  c c c c 
  | % 21
  c c c c 
  | % 22
  c c c c 
  | % 23
  c c c c 
  | % 24
  c c c c 
  | % 25
  c c c c 
  | % 26
  c c c c 
  | % 27
  c c c c 
  | % 28
  c c c c 
  | % 29
  c c c c 
  | % 30
  c c c c 
  | % 31
  c c c c 
  | % 32
  c c c c 
  | % 33
  c c c c 
  | % 34
  c c c c 
  | % 35
  c c c c 
  | % 36
  c c c c 
  | % 37
  r4 c c4. c8 
  | % 38
  r1 
  | % 39
  c4 c c c 
  | % 40
  c c c c 
  | % 41
  c c c c 
  | % 42
  c c c c 
  | % 43
  c c c c 
  | % 44
  c c c c 
  | % 45
  c r4. c 
  | % 46
  c4 r4. c8 c4 
  | % 47
  c c c c 
  | % 48
  c c c c 
  | % 49
  c c c c 
  | % 50
  c c c c 
  | % 51
  c c c c 
  | % 52
  c c c c 
  | % 53
  r4 c2 c4 
  | % 54
  c c c8 c r8 c 
  | % 55
  c4 c c c 
  | % 56
  c c c c 
  | % 57
  c c c c 
  | % 58
  c c c c 
  | % 59
  c c c c 
  | % 60
  c c c c 
  | % 61
  c c c c 
  | % 62
  c c c c 
  | % 63
  c c c c 
  | % 64
  c c c c 
  | % 65
  c c c c 
  | % 66
  c c c c 
  | % 67
  c c c c 
  | % 68
  c c c c 
  | % 69
  c c c c 
  | % 70
  c c c c 
  | % 71
  c c c c 
  | % 72
  c c c c 
  | % 73
  c c c c 
  | % 74
  c c c c 
  | % 75
  c c c c 
  | % 76
  c c c c 
  | % 77
  c c c c 
  | % 78
  c c c c 
  | % 79
  c c c c 
  | % 80
  c c c c 
  | % 81
  c c c c 
  | % 82
  c c c c 
  | % 83
  c c c c 
  | % 84
  c c c c 
  | % 85
  r4 c c8 c c c 
  | % 86
  r1 
  | % 87
  c4 c c c 
  | % 88
  c c c c 
  | % 89
  c c c c 
  | % 90
  c c c c 
  | % 91
  c c c c 
  | % 92
  c c c c 
  | % 93
  c r4. c 
  | % 94
  c4 r4. c 
  | % 95
  c4 c c c 
  | % 96
  c c c c 
  | % 97
  c c c c 
  | % 98
  c c c c 
  | % 99
  c c c c 
  | % 100
  c c c c 
  | % 101
  c c c c 
  | % 102
  c c c c 
  | % 103
  c c c c 
  | % 104
  c c c c 
  | % 105
  c c c c 
  | % 106
  c c c c 
  | % 107
  c c c c 
  | % 108
  c c c c 
  | % 109
  c c c c 
  | % 110
  c c c c 
  | % 111
  c c c c 
  | % 112
  c c c c 
  | % 113
  c c c c 
  | % 114
  c c c c 
  | % 115
  c c c c 
  | % 116
  c c c r4. c8 r4 c4. c8 
  | % 118
  r1 
  | % 119
  c4 c c c 
  | % 120
  c c c c 
  | % 121
  c c c c 
  | % 122
  c c c c 
  | % 123
  c c c c 
  | % 124
  c c c c 
  | % 125
  c c c c 
  | % 126
  c c c c 
  | % 127
  c c c c 
  | % 128
  c c c c 
  | % 129
  r8 c4. c8 r8 c r8 
  | % 130
  c c c c 
}

trackB = <<
  \context Voice = voiceA \trackBchannelA
  \context Voice = voiceB \trackBchannelB
>>

akordi = \relative c' {
  \semiGermanChords
  \mark \markup { \box \bold "I" }
 <bes'' g es >8 s8 <as f d bes >8 s8 <bes c g es >8 <as f d bes >8 
  s8 <es bes' g >8 
  | % 2
  s1 
  | % 3
  <g' es bes' >8 s8 <bes, a' f d >8 s8 <bes' g es c >8 s8 <d, bes a' f >8 
  s8 
  | % 4
  <bes' g es >8 <d, f a >8 s8 <bes' g es >4. <f a c >8 s4 <g f bes, d >8*7 
  | % 6
  <f, a c es >8 s4 <es' c a f >8 s2 
  | % 7
  \mark \markup { \box \bold "K1" }
  <bes d f a>1 
  | % 8
  <bes d f a>1 
  | % 9
  <c es g bes >1 
  | % 10
  <b' c, es g >1 
  | % 11
  <bes es, g c, >1 
  | % 12
  <c, es f, a >1 
  | % 13
  <bes d f a >2 <g bes d f >2 
  | % 14
  <c es g bes >2 <f, es' c a >2 
  | % 15
  <f es' c as >1 
  | % 16
  <as' f d bes >1 
  | % 17
  <bes d es, g >1 
  | % 18
  <d bes ges es >1 
  | % 19
  <bes, d f a >2 <g' bes, d f >2 
  | % 20
  <c, es g bes >2 <f a c es >2 
  | % 21
  <d f a bes, >2 <as f es' c >2 
  | % 22
  <g e d' b >2 <des bes ges es >2 
  | % 23
  <bes, d f a >1 
  | % 24
  <bes d f a >1 
  | % 25
  <c es g bes >1 
  | % 26
  <b' c, es g >1 
  | % 27
  <bes es, g c, >1 
  | % 28
  <c es f, a >1 
  | % 29
  <d, f a bes, >2 <g bes d f >2 
  | % 30
  <bes g es c >2 <a c es f, >2 
  | % 31
  <c, as f es' >1 
  | % 32
  <as' f d bes >1 
  | % 33
  <bes d es, g >1 
  | % 34
  <d bes ges es >1 
  | % 35
  <bes, d f a >2 <g bes d f >2 
  | % 36
  <bes' g es c >2 <es, c a f >2 
  | % 37
  s4 <bes des f >8 s8 < b dis fis ais >4. <bes d f >8 
  | % 38
  s1 
  | % 39
  \mark \markup { \box \bold "B1" }
  <a cis e gis >1 
  | % 40
  <a cis e gis>1 
  | % 41
  <bes, d f a >1 
  | % 42
  <bes d f a >1 
  | % 43
  <a cis e gis >1 
  | % 44
  <f' c' a >1 
  | % 45
  <g f d bes >4*64/96 s4*176/96 <es g b f' >4. 
  | % 46
  <bes g f c >4*64/96 s4*176/96 <e, gis b >8 <c' a f >4 
  | % 47
  \mark \markup { \box \bold "R1" }
  <es d' g, bes >1 
  | % 48
  <f, a c es >1 
  | % 49
  <bes d f a >1 
  | % 50
  <g bes d f >1 
  | % 51
  <c g' bes es, >1 
  | % 52
  <c a f es' >1 
  | % 53
  s4 <f a bes, d >2 <d a' bes, f' >8 s8 
  | % 54
  <cis e gis b >8 s8 <cis e gis b >8 s8 <fis ais cis e >8 
  <fis ais cis e >8 s8 <b dis fis ais >8 
  | % 55
  \mark \markup { \box \bold "K2" }
  <b, dis fis ais >1 
  | % 56
  <b dis fis ais >1 
  | % 57
  <cis e gis b >1 
  | % 58
  <cis e gis bis >1 
  | % 59
  <b e, gis cis, >1 
  | % 60
  <cis, e fis, ais >1 
  | % 61
  <b dis fis ais >2 <gis b dis fis >2 
  | % 62
  <cis e gis b >2 <fis, e' cis ais >2 
  | % 63
  <fis e' cis a >1 
  | % 64
  <a' fis dis b >1 
  | % 65
  <b dis e, gis >1 
  | % 66
  <dis b g e >1 
  | % 67
  <b, dis fis ais >2 <gis' b, dis fis >2 
  | % 68
  <cis, e gis b >2 <fis ais cis e >2 
  | % 69
  <dis fis ais b, >2 <a' fis e' cis >2 
  | % 70
  <f as c es >2 <d' b g e >2 
  | % 71
  <b, dis fis ais >1 
  | % 72
  <b dis fis ais >1 
  | % 73
  <cis e gis b >1 
  | % 74
  <c' cis, e gis >1 
  | % 75
  <b e, gis cis, >1 
  | % 76
  <cis e fis, ais >1 
  | % 77
  <dis, fis ais b, >2 <gis b dis fis >2 
  | % 78
  <b gis e cis >2 <ais cis e fis, >2 
  | % 79
  <cis, a fis e' >1 
  | % 80
  <a' fis dis b >1 
  | % 81
  <b dis e, gis >1 
  | % 82
  <dis b g e >1 
  | % 83
  <b, dis fis ais >2 <gis b dis fis >2 
  | % 84
  <b' gis e cis >2 <e, cis ais fis >2 
  | % 85
  s4 <dis fis b, >8 s8 <d fis a >8 <cis eis gis >8 <g e c >8 <fis dis b >8 
  | % 86
  s1 
  | % 87
  \mark \markup { \box \bold "B2" }
  <bes d f a >1*2 <b dis fis ais >1*2 <bes d f a >1 
  | % 92
  <ais fis cis' >1 
  | % 93
  <fis dis b >8 s2 <as c es ges >4. 
  | % 94
  <cis b' gis e >8 s2 <e cis ais fis >4. 
  | % 95
  \mark \markup { \box \bold "R2" }
  <gis e b' dis >1 
  | % 96
  <e cis ais fis >1 
  | % 97
  <b dis fis ais >1 
  | % 98
  <gis b dis fis >1 
  | % 99
  <cis gis' b e, >1 
  | % 100
  <e fis, ais cis >1 
  | % 101
  <dis b ais' fis >1 
  | % 102
  <d f a c >2 <b d f g, >2 
  | % 103
  \mark \markup { \box \bold "S" }
  <b g e c >1 
  | % 104
  <a g' e c >1 
  | % 105
  <a f d c' >1 
  | % 106
  <f' d g, b >1 
  | % 107
  <g, b e, c >1 
  | % 108
  <g' e c a >1 
  | % 109
  <c, a f d >1 
  | % 110
  <d f g, b >1 
  | % 111
  <ais g e c >1 
  | % 112
  <g e ais c, >1 
  | % 113
  <e' c a f >1 
  | % 114
  <bes d f as >1 
  | % 115
  <e' c g' >4 <g c, e >4 <a f d >4 <f a d, >4 
  | % 116
  <es g bes >4 <cis eis gis >4 <g e c >4 s4. <es g bes >8 s4 <cis eis gis >4. 
  <g' e c >8 
  | % 118
  s1 
  | % 119
  \mark \markup { \box \bold "R3" }
  <a, c e f, d >1 
  | % 120
  <g b d f >1 
  | % 121
  <c e g b >1 
  | % 122
  <a c e g >1 
  | % 123
  <d a' c f, >1 
  | % 124
  <g, b d f >1 
  | % 125
  <e' g c, >1 
  | % 126
  <e c g' a, >1 
  | % 127
  <d c' f, a >1 
  | % 128
  <g, d' f b, >1 
  | % 129
  c'8 e,4. f8 s8 fis s8 
  | % 130
  g f es c 
}

\score {
  <<
    \new ChordNames { \akordi }
    \context Staff=trackB \trackA
    \context Staff=trackB \transpose c b,\trackB
  >>
  \layout {}
  \midi {}
}
