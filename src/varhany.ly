\version "2.10.33"


% a-moll:
% a - h ^ c - d - e ^ f - g - a


varhany = \relative a' {
	\clef treble
	\key a \minor
	\time 2/4
	
	a2
	r4 a16 e' c r
	<< a2 \\ { <c e>4 <e c> } >>
	r4 e16 c a r
	
	<< d2 \\ { r4 f } >>
	r4 d16 a' f r
	<< f2 \\ { <d a'>4 <a d> } >>
	r4 d16 a f' r
	
	<< e2 \\ { r4 e, } >>
	r4 e16 b' e r
	<< <e, e' g>2 \\ { b'4. c8 } >>
	<< a'2 \\ { <e c>4. <d b>8 } >>
	
	<< { a'4 ~a8. } \\ { <a, c e>4 <a c e>8. } >> r16
	a2
	
}


\score {
	<<
		\new Staff {
			\set Staff.midiInstrument = #"church organ"
			\varhany
		}
	>>

	\layout { }
	\midi { }
}

