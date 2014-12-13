#(define (adjust-note mus key currkey)
 (cond ((eq? (ly:music-property mus 'name) 'NoteEvent)
         (ly:music-transpose mus (car currkey)))
       ((and
          (eq? (ly:music-property mus 'name) 'PropertySet)
          (eq? (ly:music-property mus 'symbol) 'instrumentTransposition))
         (set-car! currkey (ly:music-property mus 'value))
         (ly:music-set-property! mus 'value (ly:make-pitch 0 0 0))
         mus)
       (else mus)))

normalizeTransposition =
#(define-music-function (parser location key music) (ly:pitch? ly:music?)
 (ly:music-transpose
   (let ((currkey (list (ly:make-pitch 0 0 0))))
     (music-map (lambda (x) (adjust-note x key currkey)) music))
   (ly:pitch-negate key)))
