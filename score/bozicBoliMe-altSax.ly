% Lily was here -- automatically converted by /usr/bin/midi2ly from test-bozic_blu-alt_sax.mid
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
  title = "bozic blu"
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
  
  \set Staff.instrumentName = "alt sax"
  
}

trackBchannelB = \relative c {
  ais''8 r8 gis r8 g gis r8 ais 
  | % 2
  r1 
  | % 3
  dis8 r8 d r8 c r8 d r8 
  | % 4
  dis d r8 dis8 ~ dis4 f8 r4 g4. ~ g4. r8 
  | % 6
  d r8 r8 d8 r8*63 cis,8 ~ cis4 b8 ais8*17 d1 
  | % 18
  dis 
  | % 19
  r2*5 f2 
  | % 22
  e dis4. d8 
  | % 23
  r8*25 c4. cis8 d r8 dis 
  | % 27
  r4*13 d'2 ais8 gis 
  | % 31
  r1 
  | % 32
  g2 fis 
  | % 33
  f1 
  | % 34
  r8 dis'4. c8 ais fis f8*17 r4 f8 r8 fis4. f8 
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
  r1*2 gis2 g 
  | % 65
  fis1 
  | % 66
  r4 g8 fis e b g fis8*17 r8 ais'4. c8 r4. 
  | % 70
  b8 r8 b r8 ais ais r8 ais 
  | % 71
  r8*25 e'4. dis8 c a gis8*9 g1 
  | % 77
  fis 
  | % 78
  r4*29 dis8 r8 fis f e dis 
  | % 86
  r1 
  | % 87
  a'4 f8 d a'4 f8 d 
  | % 88
  a' f d a' r8*5 ais8 r4 ais r4 
  | % 90
  ais8 r8 ais r8 ais b ais a8*9 ais1 
  | % 93
  gis8 r4. r8 gis4. 
  | % 94
  cis8 r4. r8 e,4. 
  | % 95
  gis8 r8*15 ais2 fis 
  | % 98
  dis1 
  | % 99
  e4 r1*2 fis8 gis f fis r8 g 
  | % 102
  r8 g r8 a fis g r1. ais8 g ais g f g8*9 r4 b g8 e dis d8*9 
  r8*57 c'8 r4 d8 r4 d4. c8 b r8*5 g4. f e8 
  | % 118
  r8*21 e8 f fis 
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

trackB = <<
  \context Voice = voiceA \trackBchannelA
  \context Voice = voiceB \trackBchannelB
>>


\score {
  <<
    \context Staff=trackB \trackA
    \context Staff=trackB \naturalizeMusic \transpose es c \trackB
  >>
  \layout {}
  \midi {}
}
