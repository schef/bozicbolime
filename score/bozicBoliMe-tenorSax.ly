% Lily was here -- automatically converted by /usr/bin/midi2ly from test-bozic_blu-tenor_sax.mid
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

\header {
  title = "bozic blu"
}

trackAchannelA = {
  
  \tempo 4 = 154 
  
  \time 4/4 
  
}

trackA = <<
  \context Voice = voiceA \trackAchannelA
>>


trackBchannelA = {
  
  \set Staff.instrumentName = "tenor sax"
  
}

trackBchannelB = \relative c {
  f'1*4\trill r8 d4. dis8 r8 e r8 
  | % 6
  f r4 f8 r8*63 f'4. dis8 d8*17 ais1 
  | % 18
  ais 
  | % 19
  r2*5 dis2 
  | % 22
  d cis4. c8 
  | % 23
  r2*7 ais8 b r8 c 
  | % 27
  r4*13 ais'2 g8 f 
  | % 31
  r1 
  | % 32
  d,2 d 
  | % 33
  dis1 
  | % 34
  r8 c'4. ais8 gis fis f8*17 r4 f'8 r8 dis4. d8 
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
  r4*13 gis8 r8 ais ais r8 b 
  | % 59
  r4*13 b2 c8 cis 
  | % 63
  r1 
  | % 64
  dis,, 
  | % 65
  e 
  | % 66
  r4 g'8 fis e b g fis8*17 r8 dis'4. fis8 r4. 
  | % 70
  f8 r8 f r8 e e r8 dis 
  | % 71
  r8*25 cis4. c8 a fis e8*9 e1 
  | % 77
  dis 
  | % 78
  r4*29 b'8 r8 d cis c b 
  | % 86
  r1 
  | % 87
  f'4 d8 ais f'4 d8 ais 
  | % 88
  f' d ais f' r8*5 fis8 r4 fis r4 
  | % 90
  fis8 r8 fis r8 fis g fis f8*9 fis1 
  | % 93
  fis8 r2 dis4. 
  | % 94
  e8 r2 cis4. 
  | % 95
  e8 r8*15 fis2 dis 
  | % 98
  b1 
  | % 99
  cis8 r8*17 dis8 dis d dis r8 f 
  | % 102
  r8 f r8 f cis d r2 e8 r8 a e r8 g8*9 r4 f8 r8 c f r8 g 
  | % 106
  r2. r8 e8 
  | % 107
  r8 a r8 e a r8 e r8 
  | % 108
  g r8 e r8 g e r8 f1 g4. r8*39 b8 r4 a8 r4 dis,4. cis8 c r8*5 ais'4. 
  gis g8 
  | % 118
  r8*21 cis,8 d dis 
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

trackB = <<
  \context Voice = voiceA \trackBchannelA
  \context Voice = voiceB \trackBchannelB
>>


\score {
  <<
    \context Staff=trackB \trackA
    \context Staff=trackB \naturalizeMusic \transpose bes c' \trackB
  >>
  \layout {}
  \midi {}
}
