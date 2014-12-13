m\version "2.14.2"

\include "AccordsJazzDefs.ly"
\include "deutsch.ly"

#(set-default-paper-size "a4" )
myStaffSize = #20
#(set-global-staff-size myStaffSize)
\paper {
  #(define fonts (make-pango-font-tree "Monospace" "Dom Casual" "lilyjazzchord" (/ myStaffSize 20)))
  %markup-system-spacing #'padding = #7
  %system-system-spacing #'padding = #10
  indent = 25
}

date = "29.02.2012"

\header {
  title = "FEVER"
  composer = "JOHN DAVENPOR EDDIE COOLE"
  arranger = "ROGER HOLME"
  meter = "MEDIUM SWING FEEL"
  tagline = \markup
  { \fontsize #-3.5
    { Engraved on \date using \with-url #"http://lilypond.org/"
      { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
    }
  }
}

%%%%%%%% Macros %%%%%%%%%
sOne = {
  \override NoteHead #'style = #'slash
  %\override Stem #'transparent = ##t
}
nsOne = {
  \revert NoteHead #'style
  %\revert Stem #'transparent
}
crOn = \override NoteHead #'style = #'cross
crOff = \revert NoteHead #'style

%%%%%%% Naturalize Music %%%%%%

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

%%%%%%% Range Control %%%%%%%

\layout {
  \context {
    \Voice
    \consists "Ambitus_engraver"
  }
}

%%%%%%% Global varijabla %%%%%%%

global = {
  \compressFullBarRests
  \time 4/4
  \partial 8
  \tempo 4 = 130
  #(set-accidental-style 'modern-cautionary)
}
Key = { \key a \major }

%%%%%% Marks %%%%%%%

hideNotes = { \hideNotes \override MultiMeasureRest #'transparent = ##t }
unHideNotes = { \revert MultiMeasureRest #'transparent \unHideNotes }

marks = {
  \set Score.markFormatter = #format-mark-box-barnumbers
  \compressFullBarRests
  \hideNotes
  \partial 8 s8
  R1*8 \mark \default \bar "||" %9
  R1*8 \mark \default %17
  R1*8 \mark \default %25
  R1*8 \mark \default %33
  R1*8 \mark \default %41
  R1*8 \mark \default %49
  R1*8 \mark \default \bar "||" %57
  R1*8 \mark \default %65
  R1*12 \mark \default \bar "||" %77
  R1*8 \mark \default %85
  R1*12 \mark \default \bar "||" %97
  R1*8
  \unHideNotes
  \bar "|."
}

%RythamSection
%Bass
bass = \relative c' {
  \clef bass
  \global
  
  e,8 |
  a,4 r c r |
  a4 r8 c ~ c4 a |
  e'4 r gis, r8 a ~ |
  a2 r8 e' e,4 |
  
  a4 r c r |
  a4 r8 c8 ~ c4 a |
  e'4 r gis, r8 a ~ |
  a8 e'4 d8 c4 h |
  
  a4 r c r |
  a4 r8 c ~ c4 e |
  a,4 r c r |
  a4 r8 c8 ~ c4 e |
  a,4 r c r |
  
  a4 r8 c8 ~ c4 a |
  e'4 r gis, r8 a8 ~ |
  a4 r r8 e'8 e,4 |
  a4 r c r |
  a4 r8 c8 ~ c4 e4 |
  
  f4 r c r |
  a4 r8 c8 ~ c4 e |
  a,4 r c r |
  a r8 c8 ~ c4 a4 |
  e'4 r gis, r8 a8 ~ |
  
  a4 f' e b |
  a r c r |
  a r8 c8 ~ c4 e |
  a, r c r |
  a r8 c ~ c4 e 
  
  a,4 r c r |
  a4 r8 c ~ c4 a |
  e'4 r gis, r8 a ~ |
  a8 e'4 d8 c4 e |
  a,4 r c r |
  
  a4 r8 c ~ c4 e4 |
  f4 r c r |
  a4 r8 c8 ~ c4 e |
  a,4 r c r |
  a4 r8 c ~ c4 a |
  
  e'4 f e b8 a ~ |
  a4 c e c |
  \repeat percent 2 {a e' c e |}
  a,4 c e a, |
  
  f'4 c a e' |
  a, e' c e |
  a, c e a, |
  f' c e b8 a ~ |
  a4 e' c e |
  
  %---------pg2
  
  gis,8 a c4 e gis8 a |
  r8 a,4. gis8 a r f' ~ |
  f4 c f b, |
  a c e c |
  
  a4 e' a gis |
  g e fis d |
  f c e b |
  a a' f f, |
  
  \key des \major
  b4 r4 des r |
  b4 r8 des ~ des4 f |
  b,4 r des r |
  b4 r8 des ~ des4 f |
  b,4 r des r |
  
  b4 r8 des ~ des4 b |
  f' r a, r8 b ~ |
  b4 r4 r8 f'8 f,4 |
  b4 des f a8 b |
  r8 f b,4 des f |
  
  ges4 des b ges |
  b c des f |
  b b, des f |
  b, f' des b |
  f' ges f ces8 b ~ |
  
  b4 f' des f |
  a,8 b des4 f a8 b |
  r8 b,4. a8 b r8 g'~ |
  g4 des f ces |
  b f' ges g |
  
  \key es \major
  c,4 es g d |
  es c as g |
  c d es g |
  c c, g' es |
  c d es f |
  
  g4 c g c, |
  g h d g,8 c |
  r2 r4 g\staccato |
  c4 es g h |
  c4 g c, b |
  
  as4 c es as, |
  c d es g |
  c g es g |
  c, d es c |
  as es' g des |
  
  c4 g' c b |
  as es g des |
  c4 d es g |
  a4 r g r8 c, ~ |
  c8 g'4 f8 es4 d |
  
  c4 r es r |
  c4 r8 es ~ es4 c |
  g' r h, r8 c ~ |
  c2 r8 g' g,4 |
  c4 r es r |
  c4 r8 es ~ es4 c |
  g'4 r h r8 c ~ |
  %ending 1
  %c4 r8 c,8 ~ c2 |
  %ending 2
  c4 r c,2 |
  
}

guitar = \relative c'' {
  \global
  r8 |
  R1*8
  R1*8
  \sOne
  \repeat percent 2 { r4 h r h }|
  r4 h r h
  r4 h r h
  \repeat percent 2 { r4 h r h }|
  r4 h r h
  r4 h r h
  \repeat percent 4 { r4 h r h }|
  \repeat percent 2 { r4 h r h }|
  r4 h4 h4. h8 |
  r1
  %33
  h8 h ~ h2 h8 h
  r4 h r h
  r4 h r h |
  r4 h r h |
  
  \repeat percent 2 { r4 h r h | }
  h4 h h h8 h ~ |
  h4 h h h |
  %41
  \repeat percent 3 { h4 h h h }
  h4 h h h |	
  
  \repeat percent 2 { h4 h h h |}
  h4 h h h8 h ~ |
  h4 h h h |
  h8 h ~ h4 h h8 h |
  r8 h4. h8 h r8 h8 ~ |
  h4 h h h8 h ~ |
  h4 h h h |
  
  h4 h h h |
  h h h h |
  h h h h8 h ~ |
  h4. h8 r h4. |
  
  \key des \major		
  b4 b r b |
  \repeat percent 3 { r4 b r b | }
  \repeat percent 2 { r4 b r b | }
  r8 b r4 b r8 b |
  r1
  
  b8 b ~ b2 b8 b |
  r4 b b b |
  b4 b b b |
  b4 b b b |
  
  \repeat percent 2 { b4 b b b }
  b4 b b b8 b ~ |
  b4 b b b |
  
  b8 b ~ b4 b b8 b |
  r8 b4. b8 b r b8 ~ |
  b4 b b b8 b ~ |
  b4. b8 r8 b4. |
  
  \key es \major
  b4 b b b |
  b b b b |
  \repeat percent 2 { b b b b }
  
  \repeat percent 2 { b4 b b b |}
  r8 b r4 b4 r8 b8 |
  r1 |
  
  b8 b ~ b2 b8 b |
  r4 b b b |
  b b b b |
  b b b b |
  \repeat percent 2 { b b b b | }
  b4 b b b8 b ~ |
  b4 b b b |
  b4 b b b8 b ~ |
  b4 b r b |
  r b r b |
  r1
  R1*8 |
}

guitarChords = \chordmode {
  \set chordChanges = ##t
  \semiGermanChords 
  \compressFullBarRests
  s8
  R1*16
  a1:m6 a:m6 f:13 a:m6
  a:m6 a:m6 e:7 a4:m6 f:13 e:7 b:maj7
  \repeat unfold 4 { a1:m6 }
  a:m6 a:m6 s4 e2:7 s8 a:m6 | s1
  
  gis8:m6 a2:m6 s8 gis8:m6 a:m6 | s1 |
  f1:13 | a:m6 | a:m6 | a:m6 | e4:9 f:13 e:9 b8:maj7 a:m6 | a1:m6 |
  a1:m6 | a:m6 | a:m6 | f2:13 a:m6 |
  a1:m6 | a:m6 | f2:13 e4:7 b8:m7 a:m6 | a1:m6 |
  
  gis8:m6 a:m6 a2:m6 gis8:m6 a:m6 |
  s8 a4.:m6 gis8:m6 a:m6 s8 f:13 |
  f2.:13 b8:m7 a:m6 | a1:m6 |
  
  a2.:m6 a4:maj7.3-/gis
  a2:m7/g d:7/fis |
  f:13 e4:7 b8:maj7 a:m6 |
  a4.:m6 f8:aug7 s8 f4.:aug7
  
  b1:m6 | b:m6 | b:m6 | b:m6 |
  s4 b2.:m6 | s4 b2.:m6 | s8 f:aug7 s4 f:aug7 s8 b:m6 | s1 |
  a8:m6 b:m6 b2:m6 a8:m6 b:m6 | b1:m6 | ges:13 | b:m6 |
  b1:m6 | b:m6 | f4:9 ges:13 f:7 h8:maj7 b:m6 | b1:m6 |
  a8:m6 b:m6 b2:m6 a8:m6 b:m6 | s8 b4.:m6 a8:m6 b:m6 s8 ges:13 |
  ges2:13 f4:aug7 h8:maj7 b:m6 | b4.:m6 ges4:aug7 g4.:aug7 |
  
  c1:m6 | c2:m6 as4:13 g:aug7 | c1:m6 | c1:m6 |
  c1:m6 | c1:m6 | s8 g2.:aug7 c8:m6 | s1 |
  
  h8:m6 c:m6 c2:m6 h8:m6 c:m6 | s1 | as1:13 | c:m6 |
  c1:m6 | c1:m6 | as2:13 g4:aug7 des8:maj7 c:m6 | c1:m6 |
  as2:13 g4:aug7 des8:maj7 c:m6 | c1:m6 | s4 as:13 s g:aug7 | c1:m6 |
  
}

altoSaxOne = \relative c'' {
  \global
  \key a \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis}
  \repeat percent 7 { r4 cis r cis}
  r1 | \crOff
  r2 fis4 a,8 fis ~ |
  fis2 r8 fis8 a e' ~ |
  e2. e8 cis ~ |
  cis4 \times 2/3 { fis8 ( e cis } c8 h a fis )
  his8 cis r4 r2 |
  r4 r8 fis8 ~ fis cis fis gis ~ |
  gis4 r4 r r8 fis8 ( ~ |
  fis4 e cis d8 cis ~ |
  
  cis2. ) r4 |
  R1*4 |
  r8 fis, ( \times 2/3 { a8 h cis } fis8 a fis eis ~ |
  eis2 ) gis4 ( d8 cis ~ |
  
  cis4 ) r r cis\staccato |
  eis8 fis8 ~ fis2 eis8 fis |
  r2 r8 fis, ( a e' ~ |
  e2. e8 cis8 ~ |
  
  cis1 ) |
  his8 cis r fis ~ fis4 r |
  r r8 fis8 ( ~ fis cis fis fis ) |
  gis4 ( e cis a'8 fis ~ |
  fis2. ~ fis8 dis ) |
  
  r2 r4 r8 cis |
  r2 r4 r8 fis |
  r1 |
  e4. fis8 ~ fis4. cis8 |
  
  r2 r4 r8 fis |
  r2 r8 fis,8 a e' ~ |
  e2 cis4 a'8 fis ~ |
  fis2. r4 |
  his,8 cis ~ cis2 his8 cis |
  r2 r4 r8 e ~ ( |
  e2. d8 cis8 ~ |
  cis4 ) \times 2/3 { his8 ( cis fis } \times 2/3 { c h a } h a )
  
  eis'8 fis r4 r8 a8 ( e cis ) |
  e8 ( a e dis ~ dis4. ) e8 ~ |
  e2 cis4 ( d8 cis8 ~ |
  cis8 ) fis cis d r8 d4. |
  %\mark \markup { \tiny "FEVER" }
  
  \key b \major
  g4 r r2 |
  r8 c,4. b8 c g4 |
  d'8 d r4 r2 |
  r8 fis ( \times 2/3 { d8 des c } b8 g b d |
  d2. ) r4 |
  r8 d4. cis8 ( d4. ) |
  r8 d8 r4 d r8 d |
  r1 |
  r1 |
  r2 r8 g, b f' ~ |
  f2. f8 d ~ |
  d1 |
  
  r4 r8 b'8 ~ b4 r |
  r4 r8 g8 ( ~ g d g g ) |
  a4 ( f d b'8 g ~ |
  g2. ) r4 |
  cis,8 d ~ d2 cis8 d |
  r2 r4 r8 f ~ |
  f2 d4 ( es8 d ~ |
  d ) f d es r8 e4. |
  
  \key c \major
  a4 r4 r2 |
  r8 a4. g8 ( a f e ~ |
  e2. ) r4 |
  r8 g8 ( \times 2/3 { e8 es d } c a c e ~ |
  e2. ) r4 |
  r8 e4. dis8 ( e4. ) |
  r8 e8 r4 e4 r8 e |
  r2 r4 e\staccato |
  
  gis8 a ~ a2 g8 a |
  r2 r8 a,8 ( c g' ~ |
  g2. g8 e ~ |
  e1 )
  
  dis8 e r a8 ~ a4 r |
  r8 a4. ( \times 2/3 { es8 d c } a g' ~ |
  g2 e4 d8 c ~ |
  c2. ) r4 |
  
  r1 r8 e4. ( \times 2/3 { es8 d c } a8 a ~ |
  a2. ) r4 |
  r1 |
  \crOn
  \repeat percent 7 { r4 c r c | }
  r1 |
}

altoSaxTwo = \relative c'' {
  \global
  \key a \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis}
  \repeat percent 7 { r4 cis r cis}
  r1 | \crOff
  r2 fis4 a,8 fis ~ |
  fis2 r8 fis8 a fis ~ |
  fis2. fis8 a ~ |
  a4 \times 2/3 { fis'8 ( e cis } c8 h a fis )
  gis8 a r4 r2 |
  r4 r8 cis8 ~ cis a cis cis ~ |
  cis4 r4 r r8 a8 ~ |
  a4 fis h h8 a ~ |
  
  a2. r4 |
  R1*4 |
  r8 fis ( \times 2/3 { a8 h cis } fis8 a fis eis ~ |
  eis2 ) cis4 ( h8 a ~ |
  
  a4 ) r r cis\staccato |
  d8 dis8 ~ dis2 d8 dis |
  r2 r8 fis, ( a fis ~ |
  fis2. fis8 a8 ~ |
  
  a1 ) |
  gis8 a r cis ~ cis4 r |
  r r8 cis8 ( ~ cis fis, cis' cis ) |
  dis4 ( h h h8 a ~ |
  a2. ~ a8 a ) |
  
  r2 r4 r8 a |
  r2 r4 r8 dis |
  r1 |
  fis,4. a8 ~ a4. a8 |
  
  r2 r4 r8 dis |
  r2 r8 fis,8 a fis ~ |
  fis2 h4 h8 a ~ |
  a2. r4 |
  gis8 a ~ a2 gis8 a |
  r2 r4 r8 fis ~ ( |
  fis2. h8 a8 ~ |
  a4 ) \times 2/3 { his8 ( cis fis } \times 2/3 { c h a } h a )
  
  his8 cis r4 r8 a'8 ( eis cis ) |
  e8 ( a e dis ~ dis4. ) fis,8 ~ |
  fis2 h4 ( h8 a8 ~ |
  a8 ) cis a b r8 b4. |
  %\mark \markup { \tiny "FEVER" }
  
  \key b \major
  b4 r r2 |
  r8 c4. b8 c g4 |
  b8 b r4 r2 |
  r8 fis' \times 2/3 { d8 des c } b8 g b b |
  b2. r4 |
  r8 b4. a8 ( b4. ) |
  r8 fis8 r4 fis r8 b |
  r1 |
  r1 |
  r2 r8 g b g ~ |
  g2. g8 b ~ |
  b1 |
  
  r4 r8 e8 ~ e4 r |
  r4 r8 d8 ( ~ d g, d' d ) |
  e4 ( c c c8 b ~ |
  b2. ) r4 |
  a8 b ~ b2 a8 b |
  r2 r4 r8 g ~ |
  g2 fis4 ( c'8 b ~ |
  b ) e b h r8 c4. |
  
  \key c \major
  c4 r4 r2 |
  r8 e4. d4 ( c8 a ~ |
  a2. ) r4 |
  r8 g'8 ( \times 2/3 { e8 es d } c a c c ~ |
  c2. ) r4 |
  r8 c4. b8 ( c4. ) |
  r8 as8 r4 as4 r8 c |
  r2 r4 e\staccato |
  
  eis8 fis ~ fis2 eis8 fis |
  r2 r8 a,8 ( c a ~ |
  a2. a8 c ~ |
  c1 )
  
  h8 c r e8 ~ e4 r |
  r8 a4. ( \times 2/3 { es8 d c } a a ~ |
  a2 gis4 a8 a ~ |
  a2. ) r4 |
  
  r1 r8 e'4. ( \times 2/3 { es8 d c } a8 a ~ |
  a2. ) r4 |
  r1 |
  \crOn
  \repeat percent 7 { r4 c r c | }
  r1 |
}

tenorSaxOne = \relative c'' {
  \global
  \key d \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis}
  \repeat percent 7 { r4 cis r cis}
  r1 | \crOff
  r2 h'4 d,8 h ~ |
  h2 r8 h8 d f, ~ |
  f2. f8 gis ~ |
  gis4 \times 2/3 { h'8 ( a fis } f8 e d h )
  g8 gis r4 r2 |
  r4 r8 d8 ~ d h d e ~ |
  e4 r4 r r8 gis8 ( ~ |
  gis4 f b h8 gis ~ |
  
  gis2. ) r4 |
  R1*4 |
  r8 h ( \times 2/3 { d8 e fis } h8 d h ais ~ |
  ais2 ) e4 ( ais,8 gis ~ |
  
  gis4 ) r r fis'\staccato |
  cis8 d8 ~ d2 cis8 d |
  r2 r8 h ( d f, ~ |
  f2. f8 gis8 ~ |
  
  gis1 ) |
  g8 gis r d' ~ d4 r |
  r r8 d8 ( ~ d gis, d' d ) |
  e4 ( h ais h8 gis ~ |
  gis2. ~ gis8 h ) |
  
  r2 r4 r8 gis |
  r2 r4 r8 d' |
  r1 |
  fis,4. gis8 ~ gis4. gis8 |
  
  r2 r4 r8 d' |
  r2 r8 h8 d f, ~ |
  f2 b4 h8 gis ~ |
  gis2. r4 |
  g8 gis ~ gis2 g8 gis |
  r2 r4 r8 f ~ ( |
  f2. h8 gis8 ~ |
  gis4 ) \times 2/3 { eis'8 ( fis h } \times 2/3 { f e d } e d )
  
  cis8 d r4 r8 d'8 ( ais fis ) |
  a8 ( d a gis ~ gis4. ) f,8 ~ |
  f2 b4 ( h8 gis8 ~ |
  gis8 ) d' gis, h r8 h4. |
  %\mark \markup { \tiny "FEVER" }
  
  \key es \major
  a4 r r2 |
  r8 f'4. es8 f c4 |
  c8 c r4 r2 |
  r8 b' ( \times 2/3 { g8 ges f } es8 c es c |
  c2. ) r4 |
  r8 a4. gis8 ( a4. ) |
  r8 f8 r4 f r8 g |
  r1 |
  r1 |
  r2 r8 c es fis, ~ |
  fis2. fis8 a ~ |
  a1 |
  
  r4 r8 g'8 ~ g4 r |
  r4 r8 es8 ( ~ es a, es' es ) |
  f4 ( c h c8 a ~ |
  a2. ) r4 |
  gis8 a ~ a2 gis8 a |
  r2 r4 r8 ges ~ |
  ges2 f4 ( c'8 a ~ |
  a ) es' a, c r8 des4. |
  
  \key f \major
  h4 r4 r2 |
  r8 f'4. d4 ( cis8 h ~ |
  h2. ) r4 |
  r8 c'8 ( \times 2/3 { a8 as g } f d f d ~ |
  d2. ) r4 |
  r8 h4. ais8 ( h4. ) |
  r8 cis8 r4 cis4 r8 h |
  r2 r4 a'\staccato |
  
  cis,8 d ~ d2 cis8 d |
  r2 r8 d8 ( f as, ~ |
  as2. as8 h ~ |
  h1 )
  
  ais8 h r f'8 ~ f4 r |
  r8 d'4. ( \times 2/3 { as8 g f } d as ~ |
  as2 g4 b8 h ~ |
  h2. ) r4 |
  
  r1 r8 a'4. ( \times 2/3 { as8 g f } d8 d ~ |
  d2. ) r4 |
  r1 |
  \crOn
  \repeat percent 7 { r4 c r c | }
  r1 |
}

tenorSaxTwo = \relative c'' {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \key d \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis}
  \repeat percent 7 { r4 cis r cis}
  r1 | \crOff
  r2 h'4 d,8 h ~ |
  h2 r8 h8 d e ~ | %\break
  e2. e8 h ~ |
  h4 \times 2/3 { h'8 ( a fis } f8 e d h )
  ais8 h r4 r2 |
  r4 r8 h8 ~ h gis h cis ~ |
  cis4 r4 r r8 h8 ( ~ |
  h4 e cis g8 h ~ |
  
  h2. ) r4 |
  R1*4 |
  r8 h ( \times 2/3 { d8 e fis } h8 d h ais ~ |
  ais2 ) cis,4 ( cis8 h ~ |
  
  h4 ) r r fis\staccato |
  g8 gis8 ~ gis2 g8 gis |
  r2 r8 h ( d e ~ |
  e2. e8 h8 ~ |
  
  h1 ) |
  ais8 h r h ~ h4 r |
  r r8 h8 ( ~ h fis h h ) |
  cis4 ( a cis g'8 fis ~ |
  fis2. ~ fis8 gis, ) |
  
  r2 r4 r8 h |
  r2 r4 r8 fis' |
  r1 |
  e4. fis8 ~ fis4. h,8 |
  
  r2 r4 r8 fis' |
  r2 r8 h,8 d e ~ |
  e2 cis4 g'8 fis ~ |
  fis2. r4 |
  ais,8 h ~ h2 ais8 h |
  r2 r4 r8 e ~ ( |
  e2. d8 h8 ~ |
  h4 ) \times 2/3 { eis8 ( fis h } \times 2/3 { f e d } e d )
  
  ais8 h r4 r8 d'8 ( ais fis ) |
  a8 ( d a gis ~ gis4. ) e8 ~ |
  e2 cis4 ( g8 h8 ~ |
  h8 ) fis' h, g r8 g4. |
  %\mark \markup { \tiny "FEVER" }
  
  \key es \major
  c4 r r2 |
  r8 f4. es8 f c4 |
  g8 g r4 r2 |
  r8 b' ( \times 2/3 { g8 ges f } es8 c es g, |
  g2. ) r4 |
  r8 c4. h8 ( c4. ) |
  r8 es8 r4 es r8 c |
  r1 |
  r1 |
  r2 r8 c es f ~ |
  f2. f8 c ~ |
  c1 |
  
  r4 r8 es8 ~ es4 r |
  r4 r8 c8 ( ~ c g c c ) |
  d4 ( b d a8 g ~ |
  g2. ) r4 |
  h8 c ~ c2 h8 c |
  r2 r4 r8 f ~ |
  f2 es4 ( a,8 c ~ |
  c ) g' g, as r8 a4. |
  
  \key f \major
  d4 r4 r2 |
  r8 d4. c4 ( b8 a ~ |
  a2. ) r4 |
  r8 c'8 ( \times 2/3 { a8 as g } f d f a, ~ |
  a2. ) r4 |
  r8 d4. cis8 ( d4. ) |
  r8 f8 r4 f4 r8 d |
  r2 r4 a\staccato |
  
  ais8 h ~ h2 ais8 h |
  r2 r8 d8 ( f g ~ |
  g2. g8 d ~ |
  d1 )
  
  cis8 d r d8 ~ d4 r |
  r8 d'4. ( \times 2/3 { as8 g f } d g ~ |
  g2 f4 g,8 a ~ |
  a2. ) r4 |
  
  r1 r8 a'4. ( \times 2/3 { as8 g f } d8 d ~ |
  d2. ) r4 |
  r1 |
  \crOn
  \repeat percent 7 { r4 c r c | }
  r1 |
}
baritoneSax = \relative c'' {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \key a \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis} %\break
  \repeat percent 7 { r4 cis r cis}
  r1 | \crOff

  r1 |
  r2 r8 fis,8 a d, ~ | %\break
  d2. d8 fis ~ |
  fis4 \times 2/3 { fis'8 ( e cis } c h a fis ) |
  eis8 fis r4 r2 |
  r4 r8 dis'8 ~ dis cis dis eis ~ |
  eis4 r4 r r8 fis,8 ~ | %\break

  fis4 d cis g'8 fis8 ~ |
  fis2. r4 |
  r1|
  r1|
  r1| %\break

  r1 |
  r1 |
  r2 eis'4 ( cis8 fis, ~ |
  fis4 ) r4 r cis' |
  eis,8 fis ~ fis2 eis8 fis | %\break

  r2 r8 fis8 ( a d, ~ |
  d2. d8 fis ~ |
  fis1 ) |
  eis8 fis r8 dis' ~ dis4 r | %\break

  r4 r8 dis8 ( ~ dis a, dis' dis ) |
  eis4 his cis g8 fis ~ |
  fis2. ~ fis8 fis8 |
  r2 r4 r8 fis | %\break

  r2 r4 r8 dis'8 |
  r1 |
  d,4. fis8 ~ fis4. fis8 |
  r2 r4 r8 dis' |
  r2 r8 fis, ( a d, ~ |
  d2 cis4 g'8 fis ~ |
  fis2. ) r4 |
  eis8 fis ~ fis2 eis8 fis | %\break

  r2 r4 r8 d8 ~ ( |
  d2. g8 fis ~ |
  fis4 ) \times 2/3 { his8 ( cis fis } \times 2/3 { c b a } h8 a ) |
  d8 dis r4 r2 | %\break

  %%%%%%%%%% %%%%%%%%%%

  e,4. dis8 ~ dis4. d8 ~ |
  d2 cis4 ( g'8 fis ~ |
  fis8 ) cis' fis, d r d4. | %\break
 
  \key b \major
  g4 r4 r2 | 
  r8 c'4. b8 c g4 |
  e8 e r4 r2 |
  r8 f ( \times 2/3 { d des c } b g b e | %\break

  es2. ) r4 |
  r8 g,4. fis8 ( g4. ) |
  r8 d r4 d r8 g |
  r1 | %\break

  r1 |
  r2 r8 g8 b es, ~ |
  es2. es8 g ~ |
  g1 | %\break
  
  r4 r8 g' ~ g4 r |
  r4 r8 e8 ~ ( e b e e ) |
  fis4 ( cis d as8 g ~ |
  g2. ) r4 | %\break
  
  fis8 g ~ g2 fis8 g |
  r2 r4 r8 es8 ~ |
  es2 d4 ( as'8 g ~ |
  g ) d' g, es r e4. | %\break
  
  \key c \major
  a4 r4 r2 |
  r8 fis'4. es4 ( d8 c ~ |
  c2. ) r4 |
  r8 g'8 ( \times 2/3 { e8 es d } c a c fis | %\break
  fis2. ) r4 |
  r8 a,4. gis8 ( a4. ) |
  r8 e r4 e r8 a |
  r2 r4 e'\staccato | %\break
  
  gis,8 a ~ a2 gis8 a |
  r2 r8 a8 ( c f, ~ |
  f2. f8 a ~ |
  a1 ) | %\break 
  
  gis8 a r8 fis' ~ fis4 r4 |
  r8 a4. ( \times 2/3 { es8 d c } a f ~ |
  f2 e4 b'8 a ~ |
  a2. ) r8 f ~ ( | %\break
  
  f2 e4 b'8 a ~ |
  a1 ) 
  R1*2 | %\break
  
  \crOn
  \repeat percent 7 { r4^\markup { \tiny "FINGER SNAP" } c r c }
  r1 |
}

trumpetOne = \relative c'' {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \key d \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis} %\break
  \repeat percent 7 { r4 cis r cis}
  r1 | \crOff %\break 
  
  r4^\markup { \tiny "HARMON MUTE" } fis2.\fp ~ |
  fis2. r4 |
  R1*2 | %\break
  
  r4 r8 fis8^\fp ~ fis2 ~ |
  fis2. r4 |
  r1^\markup { \tiny "OPEN" }
  r8 d\mf f d e d h h ~ | %\break
  
  h2. r4 |
  R1*6 |
  r2 r4 fis'4\staccato\f | %\break
  ais8 h ~ h2 ais8 h |
  R1*2 |
  r4 \times 2/3 { h,8\mf ( d e } f e d h ) | %\break
  
  eis8 fis r h\f ~ h4  r |
  R1*2 |
  r8 h, ( d e f e d h ) | %\break
  
  r2 r4 r8 fis' |
  r2 r4 r8 h |
  r1 |
  r8 h, ( d e \times 2/3 { d16 e d } h8 d fis ) | %\break
  
  r2 r4 r8 h8 |
  R1*2 |
  r8 h,\f ( d e f e d h ) | %\break
  
  eis8 fis ~ fis2 eis8 fis |
  r8 h4. ais8 h r4 |
  r8 f ( e d e d h h ~ |
  h2. ) r4 | %\break
  
  r4 r8 h' ~ h4 r4 |
  r2 r8 h,8 ( d e ~ |
  e d f d e d h h ~ |
  h4. ) g'8 r g4. | %\break
  
  \key es \major
  c4 r4 r2 |
  R1*6 |
  r2 r4 g,\staccato\mp | %\break
  
  d'8 es ~ es2\< fis8\mf g ~ |
  g4 r r2 |
  r1 |
  r8 g,4\staccato c8 ( d es d c ) | %\break 
  
  fis8 g r4 r2 |
  R1*2 |
  r8 g,8\f ( c d es d c es ) | %\break
  
  fis8 g ~ g2 fis8 g |
  r8 c4. h8 c r4 |
  r8 c,8 ( es ges f es c c ~ |
  c4. ) as'8 r a4. | %\break
  
  \key f \major
  d4 r4 r2 |
  R1*4 | %\break
  
  r8 d,4.\mf e8 ( f4. ) |
  r8 a r4 a r8 a |
  r2 r4 a4\staccato\f | %\break
  
  <cis gis>8 <d a> ~ <d a>2 <cis gis>8 <d a> |
  R1*2 |
  r8 a,8 ( d e f e d f ) | %\break
  
  gis8\tenuto a\staccato r <a d>8 ~ <a d>4 r |
  R1*2 |
  r8 a,8 ( \times 2/3 { as8 g f } d f a c ~ | %\break
  
  c2. ) r4 |
  R1*3 | %\break
  
    \crOn
  \repeat percent 7 { r4^\markup { \tiny "FINGER SNAP" } c r c }
  r1 |
}

trumpetTwo = \relative c'' {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \key d \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis} %\break
  \repeat percent 7 { r4 e r e}
  r1 | \crOff %\break 
  
  r4^\markup { \tiny "HARMON MUTE" } d2.\fp ~ |
  d2. r4 |
  R1*2 | %\break
  
  r4 r8 d8^\fp ~ d2 ~ |
  d2. r4 |
  r1^\markup { \tiny "OPEN" }
  r8 d\mf f d e d h h ~ | %\break
  
  h2. r4 |
  R1*6 |
  r2 r4 fis'4\staccato\f | %\break
  
  eis8 fis ~ fis2 eis8 fis |
  R1*2 |
  r4 \times 2/3 { h,8\mf ( d e } f e d h ) | %\break
  
  cis8 d r gis\f ~ gis4  r |
  R1*2 |
  r8 h, ( d e f e d h ) | %\break
  
  r2 r4 r8 d |
  r2 r4 r8 gis |
  r1 |
  r8 h, ( d e \times 2/3 { d16 e d } h8 d d ) | %\break
  
  r2 r4 r8 gis8 |
  R1*2 |
  r8 h,\f ( d e f e d h ) | %\break
  
  cis8 d ~ d2 cis8 d |
  r8 gis4. g8 gis r4 |
  r8 f ( e d e d h h ~ |
  h2. ) r4 | %\break
  
  r4 r8 gis' ~ gis4 r4 |
  r2 r8 h,8 ( d e ~ |
  e d f d e d h h ~ |
  h4. ) es8 r es4. | %\break
  
  \key es \major
  a4 r4 r2 |
  R1*6 |
  r2 r4 g,\staccato\mp | %\break
  
  h8 c ~ c2\< d8\mf es ~ |
  es4 r r2 |
  r1 |
  r8 g,4\staccato c8 ( d es d c ) | %\break 
  
  d8 es r4 r2 |
  R1*2 |
  r8 g,8\f ( c d es d c es ) | %\break
  
  d8 es ~ es2 d8 es |
  r8 a4. gis8 a r4 |
  r8 c,8 ( es ges f es c c ~ |
  c4. ) e8 r8 f4. | %\break
  
  \key f \major
  h4 r4 r2 |
  R1*4 | %\break
  
  r8 h,4.\mf cis8 ( d4. ) |
  r8 f r4 f r8 f |
  r2 r4 a4\staccato\f | %\break
  
  <e ais>8 <f h> ~ <f h>2 <e ais>8 <f h> |
  R1*2 |
  r8 a,8 ( d e f e d f ) | %\break
  
  e8\tenuto f\staccato r <f h>8 ~ <f h>4 r |
  R1*2 |
  r8 a,8 ( \times 2/3 { as8 g f } d f a c ~ | %\break
  
  c2. ) r4 |
  R1*3 | %\break
  
    \crOn
  \repeat percent 7 { r4^\markup { \tiny "FINGER SNAP" } c r c }
  r1 |
}

trumpetTree = \relative c'' {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \key d \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis} %\break
  \repeat percent 7 { r4 cis r cis}
  r1 | \crOff %\break 
  
  r4^\markup { \tiny "HARMON MUTE" } cis2.\fp ~ |
  cis2. r4 |
  R1*2 | %\break
  
  r4 r8 cis8^\fp ~ cis2 ~ |
  cis2. r4 |
  r1^\markup { \tiny "OPEN" }
  r8 d\mf f d e d h h ~ | %\break
  
  h2. r4 |
  R1*6 |
  r2 r4 fis'4\staccato\f | %\break
  
  cis8 d ~ d2 cis8 d |
  R1*2 |
  r4 \times 2/3 { h8\mf ( d e } f e d h ) | %\break
  
  g8 gis r d'\f ~ d4  r |
  R1*2 |
  r8 h ( d e f e d h ) | %\break
  
  r2 r4 r8 gis |
  r2 r4 r8 d' |
  r1 |
  r8 h ( d e \times 2/3 { d16 e d } h8 d gis, ) | %\break
  
  r2 r4 r8 d'8 |
  R1*2 |
  r8 h\f ( d e f e d h ) | %\break
  
  g8 gis ~ gis2 g8 gis |
  r8 d'4. cis8 d r4 |
  r8 f ( e d e d h h ~ |
  h2. ) r4 | %\break
  
  r4 r8 d ~ d4 r4 |
  r2 r8 h8 ( d e ~ |
  e d f d e d h h ~ |
  h4. ) h8 r h4. | %\break
  
  \key es \major
  es4 r4 r2 |
  R1*6 |
  r2 r4 g,\staccato\mp | %\break
  
  gis8 a ~ a2\< gis8\mf a ~ |
  a4 r r2 |
  r1 |
  r8 g4\staccato c8 ( d es d c ) | %\break 
  
  gis8 a r4 r2 |
  R1*2 |
  r8 g8\f ( c d es d c es ) | %\break
  
  gis,8 a ~ a2 gis8 a |
  r8 es'4. d8 es r4 |
  r8 c8 ( es ges f es c c ~ |
  c4. ) c8 r des4. | %\break
  
  \key f \major
  f4 r4 r2 |
  R1*4 | %\break
  
  r8 f,4.\mf ais8 ( h4. ) |
  r8 cis r4 cis r8 h |
  r2 r4 a'4\staccato\f | %\break
  
  <ais, e'>8 <h f'> ~ <h f'>2 <ais e'>8 <h f'> |
  R1*2 |
  r8 a8 ( d e f e d f ) | %\break
  
  ais,8\tenuto h\staccato r <h f'>8 ~ <h f'>4 r |
  R1*2 |
  r8 a8 ( \times 2/3 { as8 g f } d f a c ~ | %\break
  
  c2. ) r4 |
  R1*3 | %\break
  
    \crOn
  \repeat percent 7 { r4^\markup { \tiny "FINGER SNAP" } c r c }
  r1 |
}

trumpetFour = \relative c'' {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \key d \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis} %\break
  \repeat percent 7 { r4 cis r cis}
  r1 | \crOff %\break 
  
  r4^\markup { \tiny "HARMON MUTE" } fis,2.\fp ~ |
  fis2. r4 |
  R1*2 | %\break
  
  r4 r8 fis8^\fp ~ fis2 ~ |
  fis2. r4 |
  r1^\markup { \tiny "OPEN" }
  r8 d'\mf f d e d h h ~ | %\break
  
  h2. r4 |
  R1*6 |
  r2 r4 fis4\staccato\f | %\break
  
  ais8 h ~ h2 ais8 h |
  R1*2 |
  r4 \times 2/3 { h8\mf ( d e } f e d h ) | %\break
  
  ais8 h r h\f ~ h4  r |
  R1*2 |
  r8 h ( d e f e d h ) | %\break
  
  r2 r4 r8 h |
  r2 r4 r8 fis' |
  r1 |
  r8 h, ( d e \times 2/3 { d16 e d } h8 d h ) | %\break
  
  r2 r4 r8 fis'8 |
  R1*2 |
  r8 h,\f ( d e f e d h ) | %\break
  
  ais8 h ~ h2 ais8 h |
  r8 fis'4. eis8 fis r4 |
  r8 f ( e d e d h h ~ |
  h2. ) r4 | %\break
  
  r4 r8 fis' ~ fis4 r4 |
  r2 r8 h,8 ( d e ~ |
  e d f d e d h h ~ |
  h4. ) g8 r g4. | %\break
  
  \key es \major
  c4 r4 r2 |
  R1*6 |
  r2 r4 g\staccato\mp | %\break
  
  fis8 g ~ g2\< h8\mf c ~ |
  c4 r r2 |
  r1 |
  r8 g4\staccato c8 ( d es d c ) | %\break 
  
  h8 c r4 r2 |
  R1*2 |
  r8 g8\f ( c d es d c es ) | %\break
  
  h8 c ~ c2 h8 c |
  r8 g'4. fis8 g r4 |
  r8 c,8 ( es ges f es c c ~ |
  c4. ) as8 r a4. | %\break
  
  \key f \major
  d4 r4 r2 |
  R1*4 | %\break
  
  r8 a4.\mf gis8 ( a4. ) |
  r8 a r4 a r8 d |
  r2 r4 a4\staccato\f | %\break
  
  cis8 d ~ d2 cis8 d |
  R1*2 |
  r8 a8 ( d e f e d f ) | %\break
  
  cis8\tenuto d\staccato r d8 ~ d4 r |
  R1*2 |
  r8 a8 ( \times 2/3 { as8 g f } d f a c ~ | %\break
  
  c2. ) r4 |
  R1*3 | %\break
  
    \crOn
  \repeat percent 7 { r4^\markup { \tiny "FINGER SNAP" } c r c }
  r1 |
}

tromboneOne = \relative c {
  \global
  \clef bass
  \key c \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 e r e}
  \repeat percent 7 { r4 e r e}
  r1 %\break
  \repeat percent 7 { r4 e r e}
  r1 %\break
  \crOff
  
  r1 |
  r8 d'4. c8 d a4\staccato |
  c8\tenuto c\staccato r4 r2 |
  r8 es d c d c a c~ |
  c2. r4 |
  r1 |
  r2 d4( d8 c~ |
  c4) r4 r4 e4\staccato | %\break
  
  dis8 e~ e2 dis8 e |
  R1*3 | %\break
  
  dis8\tenuto e\staccato r8 e~ e4 r4 |
  R1*2 |
  r8 a,8( c d es d c e) | %\break
  
  r2 r4 r8 c |
  r2 r4 r8 e |
  r1 |
  c4. e8~ e4. c8 | %\break
  
  r2 r4 r8 e |
  R1*2 |
  r8 a,( c d es d c a) | %\break
  
  dis8 e~ e2 dis8 e |
  r8 e4. dis8 e r4 |
  r8 es( d c d c a a~ |
  a2.) r4 | %\break
  
  r4 r8 e'~ e4 r4 |
  e4. d8~ d4. d8~ |
  d2 e4( d8 c~ |
  c4.) f8 r8 f4. | %\break
  
  \key des \major
  des4 r4 r2 |
  R1*4 | %\break
  
  r8 des4. c8( des4.) |
  r8 des8 r4 des r8 des8 |
  r2 r4 f,4\staccato |
  c'8 des~ des2 e8 f~ | %\break
  
  f4 r4 r2 |
  R1*2 |
  c8\tenuto des\staccato r4 r2 | %\break
  
  R1*2 |
  r8 f,8( b8 c des c b des) |
  e8 f~ f2 e8 f | %\break
  
  r8 f4. e8 f r8 es~ |
  es2 f4( es8 des~ |
  des4.) d8 r8 es4. | %\break
  
  \key es \major
  es4 r4 r2 |
  R1*2 |
  r2 r4 r8 es~ | %\break
  
  es2. r4 | 
  r8 c4. d8( es4.) |
  r8 es8 r4 es4 r8 es8 |
  r2 r4 g,\staccato | %\break
  
  d'8 es~ es2 d8 es |
  r2 r4 r8 f8(~ |
  f2. f8 es~ |
  es1) | %\break
  
  d8\tenuto es\staccato r8 es8~ es4 r4 |
  r2 r4 r8 f8(~ |
  f2 es4 f8 es ~ |
  es2.) r8 c8(~ | %\break
  
  c2 es4 f8 es ~ |
  es1) |
  R1*2 | %\break
  \crOn
  \repeat percent 7 { r4 es, r es}
  \crOff
  r1 |
}

tromboneTwo = \relative c {
  \global
  \clef bass
  \key c \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 e r e}
  \repeat percent 7 { r4 e r e}
  r1 %\break
  \repeat percent 7 { r4 e r e}
  r1 %\break
  \crOff
  
  r1 |
  r8 d'4. c8 d a4\staccato |
  a8\tenuto a\staccato r4 r2 |
  r8 es' d c d c a a~ | %\break 

  a2. r4 |
  r1 |
  r2 gis4( gis8 a~ |
  a4) r4 r4 e'4\staccato | %\break
  
  h8 c~ c2 h8 c |
  R1*3 | %\break
  
  h8\tenuto c\staccato r8 c~ c4 r4 |
  R1*2 |
  r8 a8( c d es d c c) | %\break
  
  r2 r4 r8 a |
  r2 r4 r8 c |
  r1 |
  a4. c8~ c4. a8 | %\break
  
  r2 r4 r8 c |
  R1*2 |
  r8 a( c d es d c a) | %\break
  
  h8 c~ c2 h8 c |
  r8 c4. h8 c r4 |
  r8 es( d c d c a a~ |
  a2.) r4 | %\break
  
  r4 r8 c~ c4 r4 |
  c4. a8~ a4. a8~ |
  a2 d4( a8 a~ |
  a4.) des8 r8 des4. | %\break
  
  \key des \major
  b4 r4 r2 |
  R1*4 | %\break
  
  r8 b4. a8( b4.) |
  r8 a8 r4 a r8 b8 |
  r2 r4 f4\staccato |
  a8 b~ b2 c8 des~ | %\break
  
  des4 r4 r2 |
  R1*2 |
  a8\tenuto b\staccato r4 r2 | %\break
  
  R1*2 |
  r8 f8( b8 c des c b des) |
  c8 des~ des2 c8 des | %\break
  
  r8 des4. c8 des r8 b~ |
  b2 des4( b8 b~ |
  b4.) b8 r8 h4. | %\break
  
  \key es \major
  c4 r4 r2 |
  R1*2 |
  r2 r4 r8 c~ | %\break
  
  c2. r4 | 
  r8 a4. h8( c4.) |
  r8 h8 r4 h4 r8 c8 |
  r2 r4 g\staccato | %\break
  
  h8 c~ c2 h8 c |
  r2 r4 r8 c8(~ |
  c2. c8 c~ |
  c1) | %\break
  
  h8\tenuto c\staccato r8 c8~ c4 r4 |
  r2 r4 r8 c8(~ |
  c2 h4 c8 c ~ |
  c2.) r8 ges8(~ | %\break
  
  ges2 h4 c8 a ~ |
  a1) |
  R1*2 | %\break
  \crOn
  \repeat percent 7 { r4 es r es}
  \crOff
  r1 |
}

tromboneTree = \relative c {
  \global
  \clef bass
  \key c \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 e r e}
  \repeat percent 7 { r4 e r e}
  r1 %\break
  \repeat percent 7 { r4 e r e}
  r1 %\break
  \crOff
  
  r1 |
  r8 d'4. c8 d a4\staccato |
  fis8\tenuto fis\staccato r4 r2 |
  r8 es' d c d c a fis~ | %\break 

  fis2. r4 |
  r1 |
  r2 h4( h8 fis~ |
  fis4) r4 r4 e4\staccato | %\break
  
  gis8 a~ a2 gis8 a |
  R1*3 | %\break
  
  gis8\tenuto a\staccato r8 a~ a4 r4 |
  R1*2 |
  r8 a8( c d es d c a) | %\break
  
  r2 r4 r8 fis |
  r2 r4 r8 a |
  r1 |
  es4. fis8~ fis4. fis8 | %\break
  
  r2 r4 r8 a |
  R1*2 |
  r8 a( c d es d c a) | %\break
  
  gis8 a~ a2 gis8 a |
  r8 a4. gis8 a r4 |
  r8 es'( d c d c a a~ |
  a2.) r4 | %\break
  
  r4 r8 a~ a4 r4 |
  a4. fis8~ fis4. g8~ |
  g2 as4( f8 fis~ |
  fis4.) a8 r8 a4. | %\break
  
  \key des \major
  g4 r4 r2 |
  R1*4 | %\break
  
  r8 g4. fis8( g4.) |
  r8 f8 r4 f r8 g8 |
  r2 r4 f4\staccato |
  fis8 g~ g2 a8 b~ | %\break
  
  b4 r4 r2 |
  R1*2 |
  fis8\tenuto g\staccato r4 r2 | %\break
  
  R1*2 |
  r8 f8( b8 c des c b des) |
  a8 b~ b2 a8 b | %\break
  
  r8 b4. a8 b r8 as~ |
  as2 a4( ges8 g~ |
  g4.) e8 r8 f4. | %\break
  
  \key es \major
  a4 r4 r2 |
  R1*2 |
  r2 r4 r8 a~ | %\break
  
  a2. r4 | 
  r8 g4. gis8( a4.) |
  r8 g8 r4 g4 r8 a8 |
  r2 r4 g\staccato | %\break
  
  gis8 a~ a2 gis8 a |
  r2 r4 r8 b8(~ |
  b2. b8 a~ |
  a1) | %\break
  
  gis8\tenuto a\staccato r8 a8~ a4 r4 |
  r2 r4 r8 b8(~ |
  b2 g4 as8 a ~ |
  a2.) r8 b8(~ | %\break
  
  b2 g4 as8 c ~ |
  c1) |
  R1*2 | %\break
  \crOn
  \repeat percent 7 { r4 es, r es}
  \crOff
  r1 |
}

tromboneFour = \relative c {
  \global
  \clef bass
  \key c \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 e r e}
  \repeat percent 7 { r4 e r e}
  r1 %\break
  \repeat percent 7 { r4 e r e}
  r1 %\break
  \crOff
  
  r1 |
  r8 d'4. c8 d a4\staccato |
  e8\tenuto e\staccato r4 r2 |
  r8 es' d c d c a e~ | %\break

  e2. r4 |
  r1 |
  r2 e4( e8 e~ |
  e4) r4 r4 e4\staccato | %\break
  
  f8 fis~ fis2 f8 fis |
  R1*3 | %\break
  
  f8\tenuto fis\staccato r8 fis~ fis4 r4 |
  R1*2 |
  r8 a8( c d es d c fis,) | %\break
  
  r2 r4 r8 e |
  r2 r4 r8 fis |
  r1 |
  f,4. a8~ a4. a8 | %\break
  
  r2 r4 r8 fis' |
  R1*2 |
  r8 a( c d es d c a) | %\break
  
  f8 fis~ fis2 f8 fis |
  r8 fis4. f8 fis r4 |
  r8 es'( d c d c a a~ |
  a2.) r4 | %\break
  
  r4 r8 fis~ fis4 r4 |
  g4. d8~ d4. es8~ |
  es2 e4( b8 a~ |
  a4.) es'8 r8 es4. | %\break
  
  \key des \major
  f4 r4 r2 |
  R1*4 | %\break
  
  r8 f4. e8( f4.) |
  r8 es8 r4 es r8 f8 |
  r2 r4 f4\staccato |
  e8 f~ f2 fis8 g~ | %\break
  
  g4 r4 r2 |
  R1*2 |
  a,8\tenuto b\staccato r4 r2 | %\break
  
  R1*2 |
  r8 f'8( b8 c des c b des) |
  fis,8 g~ g2 fis8 g | %\break
  
  r8 g4. fis8 g r8 e~ |
  e2 es4( ces8 b~ |
  b4.) ges8 r8 g4. | %\break
  
  \key es \major
  c4 r4 r2 |
  R1*2 |
  r2 r4 r8 c~ | %\break
  
  c2. r4 | 
  r8 es4. fis8( g4.) |
  r8 f8 r4 f4 r8 g8 |
  r2 r4 g\staccato | %\break
  
  fis8 g~ g2 fis8 g |
  r2 r4 r8 ges8(~ |
  ges2. ges8 g~ |
  g1) | %\break
  
  fis8\tenuto g\staccato r8 g8~ g4 r4 |
  r2 r4 r8 ges8(~ |
  ges2 f4 f8 g ~ |
  g2.) r8 es8(~ | %\break
  
  es2 f4 f8 g ~ |
  g1) |
  R1*2 | %\break
  \crOn
  \repeat percent 7 { r4 es r es}
  \crOff
  r1 |
}

vocal = \relative c'' {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \key c \major
  r8^\markup { \tiny "FINGER SNAP" } \crOn
  \repeat percent 8 { r4 cis r cis} %\break
  r1 | \crOff %\break 
  
}

pianoR = \relative c'' {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \key c \major
  r8 |
  r1 |
  r1 |
  r1 |
  r1 | %\break
  
  r1 |
  r1 |
  r1 |
  r1 | %\break
  
  r1 |
  r1 |
  r1 | %\break
  
  r1 |
  r1 |
  r1 | %\break
  
  r1 |
  r1 |
  r4 <h c e>2. ~ | %\break
  
  <h c e>2. r8 <a, d g>8 ~ |
  <a d g>2. <a d g>8 <c e> ~ |
  <c e>1 | %\break

  <h dis>8 <c e> r <h' c e> ~ <h c e>2 ~ |
  <h c e>4. <c, e>8 ~ <c e>4. <d e>8 ~ |
  <d e>2. r8 <c e a> ~ | %\break

  <c e a>4 <a d g> <gis d' e> <a d f>8 <c e> ~ |
  <c e>1 |
  r2 r8^\markup { \tiny "LIGHTLY" } <fis c' e a>8 r4 | %\break

  <a, c>8 <a c> r4 r r8 <a c> ~ |
  <a c>2 <fis' c' e a>4\staccato r8 <a, c>8 ~ |
  <a c>1 | %\break

  r2 r8 <c e>4 <d h'>8 ~ |
  <d h'>2. r8 <c e a>8 |
  r2 r4 e\staccato | %\break

  <h dis gis>8 <c e a> ~ <c e a>2 <h dis gis>8 <c e a> |
  r2 r4 r8 <a d g>8 ~ |
  <a d g>2. r8 <c e> ~ | %\break

  <c e>1 |
  <h dis>8 <c e> r <c e a>8 ~ <c e a>2 |
  r4 r8 <c e> ~ <c e>2 | %\break

  <fis d gis,>4 <g d a> <e d gis,> <f d>8 <a e c> ~ |
  <a e c>2. ~ <a e c>8 <a e c> |
  r2 r4 r8 <e c> | %\break

  r2 r4 r8 <c'' e a>8 |
  r2 r8 <c, e> r4 |
  <a d g>4. <c e a>8 ~ <c e a>4. <c e>8 | %\break

  r2 r4 r8 <c, e a> | %45
  r2 <c e>4. <a d g>8 ~ |
  <a d g>2 <gis d' e>4 <d' f>8 <c e a>8 ~ | %\break

  <c e a>1 | %48
  <h dis>8 <c e>8 ~ <c e>2 <h dis>8 <c e> |
  r8 <c e a>4. <h dis gis>8 <c e a> r <a d g> ~ |
  <a d g>2. <d f>8 <c e a> ~ | %\break

  <c e a>1 | %52
  <h dis>8 <c e> r8 <c e a> ~ <c e a>4 <c e>4 |
  <c e>4. <a d a'>8 ~ <a d a'>4. <a d g>8 ~ |
  <a d g>2 <gis d' e>4  <a d f>8 <c e a> ~ | %\break

  <c e a>4. <a des f>8 r8 <a des f>4. | %56
  \key des \major
  <des f b>4 r4 r2 |
  r2 r8 <g des' f b>8 r4 | %\break

  <des f>8 <des f> r4 r4 r8 <des f>8 ~ | %59
  <des f>2 <g des' f b>4 r8 <des f>8 ~ |
  <des f>1 | %\break

  r8 <des f>4. <c e>8( <des f>4.) | %62
  r8 <a des f>8 r4 <a des f>4 r8 <des f b>8 |
  r2 r4 f4 | %\break

  <c e>8 <des f> ~ <des f>2 <c e a>8 <des f b> | %65
  r4 r8 <g des' f b>8 ~ <g des' f b>4. <b, es as>8 ~ |
  <b es as>2. r8 <des f> ~ |
  <des f>1 | %\break

  <c e a>8 <des f b> r4 r8 <g des' f b>8 r4 | %69
  r4 r8 <des f>8 ~ <des f>2 |
  <a es' g>4 <b es as> <a es' f> <es' ges>8 <des f b> ~ | %\break

  <des f b>1 | %72
  <c e>8 <des f> ~ <des f>2 <c e>8 <des f> |
  r8 <des f b>4. <c e a>8 <des f b> r8 <b es as>8 ~ |
  <b es as>2 <a des f>4 <es' ges>8 <des f> ~ | %\break

  <des f>4. <b d ges>8 r8 <h es g>4. | %76
  \key es \major
  <es g c>4 r4 r8 <a es' g c>8 r4 |
  r8 <es g c>4. <c f b>4 <h es as>8 <es g> ~ | %\break
  
  <es g>2. r8 <es g c>8 ~ | %79
  <es g c>2 <a es' g c>4 r8 <es g>8 ~ |
  <es g>1 | %\break

  r8 <es g>4. <d fis>8( <es g>4.) | %82
  r8 <h es g>8 r4 <h es g>4 r8 <es g>8 |
  r2 r4 g4 | %\break

  <d fis h>8 <es g c> ~ <es g c>2 <d fis h>8 <es g c> | %85
  r4 r8 <es g>8 ~ <es g>4. <c f b>8 ~ |
  <c f b>2. r8 <es g>8 ~ | %\break

  <es g>1 | %88
  <d fis>8 <es g> r8 <es g c>8 ~ <es g c>2 |
  r8 <a es' g c>8 ~ <a es' g c>2 r8 <c, f b>8 ~ | %\break

  <c f b>2 <h es g>4 <c f as>8 <es g> ~ | %91
  <es g>2. r8 <c f b>8 ~ |
  <c f b>2 <h es g>4 <c f as>8 <es g> ~ | %\break

  <es g>1 | %94
  <c f>2 r8 <h es>4 <c es>8 ~ |
  <c es>2. r4 | %\break 
  R1*8

}

pianoL = \relative c {
  \global
  %\override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \clef bass
  \key c \major
    e,8 |
  a,4 r c r |
  a4 r8 c ~ c4 a |
  e'4 r gis, r8 a ~ |
  a2 r8 e' e,4 |
  
  a4 r c r |
  a4 r8 c8 ~ c4 a |
  e'4 r gis, r8 a ~ |
  a8 r8 r4 r2 |
  
  a4 r c r |
  a4 r8 c ~ c4 e |
  a,4 r c r |
  a4 r8 c8 ~ c4 e |
  a,4 r c r |
  
  a4 r8 c8 ~ c4 a |
  e'4 r gis, r8 a8 ~ |
  a4 r r2 |
  a4 r c r |
  a4 r8 c8 ~ c4 e8 <f es'> |
  <f es'>2. <f es'>8 <a fis'> ~ |
  <a fis'>1 |

  <gis f'>8 <a fis'> r4 r2 |
  r4 r8 <a fis'> ~ <a fis'>4. <e' gis>8 ~ |
  <e gis>2. r8 <a, fis'>8 ~ | %\break

  <a f'>4 <f es'> <e e'> <b'>8 <a fis'> ~ |
  <a fis'>1 |
  r1 |

  <a fis'>8 <a fis'> r4 r r8 <a fis'> ~ |
  <a fis'>2 r4 r8 <a fis'> ~ |
  <a fis'>1 |

  r2 r8 <a fis'>4 <e' gis>8 ~ |
  <e gis>2. r8 <a, fis'>8 |
  r2 r4 e'4\staccato |

  <gis, f'>8 <a fis'> ~ <a fis'>2 <gis f'>8 <a fis'> |
  r2 r4 r8 <f es'> ~ |
  <f es'>2. r8 <a fis'> ~ |

  <a f'>1 |
  <gis f'>8 <a fis'> r <a fis'> ~ <a fis'>2 |
  r4 r8 <a fis'>8 ~ <a fis'>2 | %\break

  <e e'>4 <f es'> <e e'> <b' a'>8 <a fis'> ~ |
  <a fis'>2. ~ <a fis'>8 <a fis'> |
  r2 r4 r8 <a fis'> |

  r2 r4 r8 <a' fis'>8 |
  r2 r8 <a, fis'> r4 |
  <f es'>4. <a fis'>8 ~ <a fis'>4. <a fis'>8 | %\break
  
  r2 r4 r8 <a fis'> |
  r2 <a fis'>4. <f es'>8 ~ |
  <f es'>2 <e e'>4 <b' a'>8 <a fis'> ~ | %\break

  <a f'>1 |
  <gis eis'>8 <a fis'> ~ <a fis'>2 <gis eis'>8 <a fis'> |
  r8 <a fis'>4. <gis eis>8 <a fis'> r <f es'> ~ |
  <f es'>2. <b a'>8 <a fis'> ~ | %\break

  <a f'>1 |
  <gis eis'>8 <a fis'> r <a fis'>8 ~ <a fis'>4 <gis gis'> |
  <g g'>4. <fis fis'>8 ~ <fis fis'>4. <f es'>8 ~ |
  <f es'>2 <e e'>4 b'8 <a fis'> ~ | %\break

  <a f'>4. <f es'>8 r8 <f es'>4. | \key des \major
  <b g'>4 r r2 |
  r1 | %\break

  <b g'>8 <b g'> r4 r r8 <b g'> ~  |
  <b g'>2 r4 r8 <b g'>8 ~ |
  <b g'>1 | %\break

  r8 <b g'>4. <a fis'>8 ( <b g>4. ) |
  r8 <f es'> r4 <f es'> r8 <b g'> |
  r2 r4 <f'> | %\break

  <a, fis'>8 <b g'>~ <b g'>2 <a fis'>8 <b g'> |
  r2 r4 r8 <ges e'>8 ~ |
  <ges e'>2. r8 <b g'> ~ |
  <b g'>1 | %\break

  <a fis'>8 <b g'> r4 r2 |
  r4 r8 <b g'>8 ~ <b g'>2 |
  <f f'>4 <ges e'> <f f'> <ces' b'>8 <b g'> ~ | %\break

  <b g'>1 |
  <a fis'>8 <b g'> ~ <b g'>2 <a fis'>8 <b g'> |
  r8 <b g'>4. <a fis'>8 <b g'> r8 <ges e'>8 ~ |
  <ges e'>2 <f es'>4 <ces' b'>8 <b g'> ~ | %\break

  <b ges'>4. <ges e'>8 r <g f'>4. | \key es \major
  <c a'>4 r r2 |
  r8 <c a'>4. <as ges'>4 <g f'>8 <c a'> ~ | %\break

  <c a'>2. r8 <c a'>8 ~ |
  <c a'>2 r4 r8 <c a'>8 ~ |
  <c a'>1 | %\break

  r8  <c a'>4. <h gis'>8 (<c a'>4. ) |
  r8 <g f'> r4 <g f'> r8 <c a'> |
  r2 r4 <g'>\staccato | %\break

  <h, gis'>8 <c a'> ~ <c a'>2 <h gis'>8 <c a'> |
  r4 r8 <c a'>8 ~ <c a'>4. <as ges'>8 ~ |
  <as ges'>2. r8 <c a'> ~ | %\break

  <c as'>1 |
  <h gis'>8 <c a'> r <c a'> ~ <c a'>2 |
  r2 r4 r8 <as ges'> | %\break

  <as ges'>2 <g f'>4 des'8 <c a'> ~ |
  <c a'>2. r8 <as ges'> ~ |
  <as ges'>2 <g f'>4 des'8 <c a'> ~ | %\break

  <c a'>1 |
  <as ges'>2 r8 <g f'>4 <c a'>8 ~ |
  <c a'>2. r4 | %\break

  R1*8 |
}

%%showLastLength = R1*5
\score {
%  <<
%    %\new ChordNames { \guitarChords }
%    %\new GrandStaff <<
%    %>>
%    \new GrandStaff <<
%    \new Staff \with { instrumentName = "ALTO SAX 1" } { << \marks \naturalizeMusic \transpose a c' \altoSaxOne >> }
%    \new Staff \with { instrumentName = "ALTO SAX 2" } { << \naturalizeMusic \transpose a c' \altoSaxTwo >> }
%    \new Staff \with { instrumentName = "TENOR SAX 1" } { << \naturalizeMusic \transpose a c' \tenorSaxOne >> }
%    \new Staff \with { instrumentName = "TENOR SAX 2" } { << \naturalizeMusic \transpose a c' \tenorSaxTwo >> }
%    \new Staff \with { instrumentName = "BARITONE SAX" } { << \naturalizeMusic \transpose a c' \baritoneSax >> }
%    >>
%    \new GrandStaff <<
%    \new Staff \with { instrumentName = "TRUMPET 1" } { << \marks \naturalizeMusic \transpose a c \trumpetOne >> }
%    \new Staff \with { instrumentName = "TRUMPET 2" } { << \naturalizeMusic \transpose a c \trumpetTwo >> }
%    \new Staff \with { instrumentName = "TRUMPET 3" } { << \naturalizeMusic \transpose a c \trumpetTree >> }
%    \new Staff \with { instrumentName = "TRUMPET 4" } { << \naturalizeMusic \transpose a c \trumpetFour >> }
%    >>
%    \new GrandStaff <<
%    \new Staff \with { instrumentName = "TROMBONE 1" } { << \marks \naturalizeMusic \transpose a c \tromboneOne >> }
%    \new Staff \with { instrumentName = "TROMBONE 2" } { << \naturalizeMusic \transpose a c \tromboneTwo >> }  
%    \new Staff \with { instrumentName = "TROMBONE 3" } { << \naturalizeMusic \transpose a c \tromboneTree >> }  
%    \new Staff \with { instrumentName = "TROMBONE 4" } { << \naturalizeMusic \transpose a c \tromboneFour >> }  
%    >>
%    \new GrandStaff <<
<<
    \new ChordNames { \guitarChords }
    \new Staff \with { instrumentName = "GUITAR" } << \marks \guitar >>
>>
%    \new Staff \with { instrumentName = "PIANO R" } { << \naturalizeMusic \transpose a c \pianoR >> }
%    \new Staff \with { instrumentName = "PIANO L" } { << \naturalizeMusic \transpose a c \pianoL >> }
%    \new Staff \with { instrumentName = "BASS" } {\clef bass \naturalizeMusic \transpose a c \bass }
%    >>
%  >>
%  \layout {}
%  \midi {} 
}
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "ALTO SAX 1" } { << \marks \naturalizeMusic \transpose a c \altoSaxOne >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "ALTO SAX 2" } { << \marks \naturalizeMusic \transpose a c \altoSaxTwo >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TENOR SAX 1" } { << \marks \naturalizeMusic \transpose a c \tenorSaxOne >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TENOR SAX 2" } { << \marks \naturalizeMusic \transpose a c \tenorSaxTwo >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "BARITONE SAX" } { << \marks \naturalizeMusic \transpose a c \baritoneSax >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TRUMPET 1" } { << \marks \naturalizeMusic \transpose a c \trumpetOne >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TRUMPET 2" } { << \marks \naturalizeMusic \transpose a c \trumpetTwo >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TRUMPET 3" } { << \marks \naturalizeMusic \transpose a c \trumpetTree >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TRUMPET 4" } { << \marks \naturalizeMusic \transpose a c \trumpetFour >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TROMBONE 1" } { << \marks \naturalizeMusic \transpose a c \tromboneOne >> }
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TROMBONE 2" } { << \marks \naturalizeMusic \transpose a c \tromboneTwo >> }  
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TROMBONE 3" } { << \marks \naturalizeMusic \transpose a c \tromboneTree >> }  
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "TROMBONE 4" } { << \marks \naturalizeMusic \transpose a c \tromboneFour >> }  
%    }
%\pageBreak
%\score {
%<<
%    \new ChordNames { \guitarChords }
%    \new Staff \with { instrumentName = "GUITAR" } << \marks \guitar >>
%    >>
%    }
%\pageBreak
%\score {
%<<
%    \new Staff \with { instrumentName = "PIANO R" } { << \marks \naturalizeMusic \transpose a c \pianoR >> }
%    \new Staff \with { instrumentName = "PIANO L" } { << \naturalizeMusic \transpose a c \pianoL >> }
%    >>
%    }
%\pageBreak
%\score {
%    \new Staff \with { instrumentName = "BASS" } {\clef bass \naturalizeMusic \transpose a c \bass }
%}
