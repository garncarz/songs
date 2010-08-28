\version "2.10.33"

\header {
	title = "дятел"
	composer = "Ondřej Garncarz"
}

% inspirováno http://en.wikipedia.org/wiki/Russian_Woodpecker

% Des-dur:
% des - es - f ^ ges - as - b - c ^ des

head = {
	\clef treble
	\key des \major
	\time 6/8
	\tempo 8=600
}

постукиватьD = { d8 d d d d d }
постукиватьDE = { d8 e d e d e }
постукиватьDes = { des8 des des des des des }
постукиватьE = { e8 e e e e e }
постукиватьF = { f8 f f f f f }
постукиватьAsB = { as8 b as b as b }
постукиватьA = { a8 a a a a a }
постукиватьC = { c8 c c c c c }

дятелwoodblock = \relative des' {
	\head
	
	% 10 Hz
	
	\repeat unfold 5 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	\repeat unfold 5 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	d8\p d d d d d
	\repeat unfold 19 \постукиватьDes
	
	d8\f d d d d d
	\repeat unfold 19 \постукиватьDes
	
	% 16 Hz
	
	\repeat unfold 5 \постукиватьA
	r2.
	\repeat unfold 14 \постукиватьA
	
	\repeat unfold 20 \постукиватьA
}

дятелseashore = \relative des' {
	\head
	
	% 10 Hz
	
	\repeat unfold 10 \постукиватьDes
	\repeat unfold 10 \постукиватьF
	
	\repeat unfold 10 \постукиватьF
	\repeat unfold 10 \постукиватьDes
	
	\repeat unfold 20 \постукиватьDE
	
	\repeat unfold 10 \постукиватьDes
	\repeat unfold 10 \постукиватьF
	
	% 16 Hz
	
	\repeat unfold 20 \постукиватьAsB
	
	\repeat unfold 20 \постукиватьE
}

дятелfret = \relative des' {
	\head
	
	% 10 Hz
	
	\repeat unfold 9 \постукиватьDes
	\repeat unfold 6 \постукиватьE
	\repeat unfold 4 \постукиватьDes
	
	\repeat unfold 9 \постукиватьDes
	\repeat unfold 6 \постукиватьD
	\repeat unfold 4 \постукиватьDes
	
	\repeat unfold 5 \постукиватьDes
	\repeat unfold 10 \постукиватьE
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 5 \постукиватьDes
	\repeat unfold 10 \постукиватьD
	\repeat unfold 5 \постукиватьDes
	
	% 16 Hz
}

дятелmetallic = \relative des' {
	\head
	
	% 10 Hz
	
	\repeat unfold 14 \постукиватьDes
	r2.
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 12 \постукиватьDes
	\постукиватьE
	\repeat unfold 7 \постукиватьDes
	
	f8\p f f f f f
	\repeat unfold 10 \постукиватьF
	des8\mf des des des des des
	\repeat unfold 8 \постукиватьDes
	
	r2.
	\repeat unfold 11 \постукиватьDes
	\постукиватьE
	\repeat unfold 7 \постукиватьDes
	
	% 16 Hz
}

дятелcalliope = \relative des' {
	\head
	
	% 10 Hz
	
	\repeat unfold 19 \постукиватьDes
	r2.
	
	\repeat unfold 19 \постукиватьDes
	r2.
	
	s2.*20
	
	\repeat unfold 19 \постукиватьDes
	r2.
	
	% 16 Hz
	
	\постукиватьE \постукиватьE
	\постукиватьC \постукиватьC
	\постукиватьE \постукиватьE
	\постукиватьC \постукиватьC
	\relative des,
	\постукиватьE \постукиватьE
	\постукиватьC \постукиватьC
	\постукиватьE \постукиватьE
	\постукиватьC \постукиватьC
	\relative des'
	\постукиватьE \постукиватьE
	\постукиватьC \постукиватьC
	
	\постукиватьE \постукиватьE
	\постукиватьC \постукиватьC
	\relative des,
	\постукиватьE \постукиватьE
	\постукиватьC \постукиватьC
	\постукиватьE \постукиватьE
	\постукиватьC \постукиватьC
	\relative des'
	\постукиватьA \постукиватьC
	\постукиватьA \постукиватьC
}



писк = \relative des' {
	\head
	
	% 10 Hz
	
	as'8*9\mp r8*3
	as8*9 r8*3
	as8*9 r8*3
	s2.*14
	
	<<
		{ as8*9 r8*3
		as8*9 r8*3
		as8*9 r8*3 } \\
		{ s8*3 des8*3 s8*6 des8*3 }
	>>
	s2.*14
	
	as8*9 r8*3
	as8*9 r8*3
	as8*9 r8*3
	s2.*14
	
	as8*9 r8*3
	as8*3 a'8*3 bes'8*3 r8*3
	as,,8*9 r8*3
	s2.*14
	
	% 16 Hz
	\tempo 8=960
	
	e'8*9 r8*3
	e8*9 r8*3
	e8*9 r8*3
	s2.*14
}


бас = \relative des, {
	% 10 Hz

	des2.*20
	
	des2.*20
	
	des2.*20
	
	des2.*20
	
	% 16 Hz
	
	a2.*20
	
	a2.*20
}


\score {
	<<
		\new Staff \with { printPartCombineTexts = ##f } {
			\set Staff.instrumentName = "дятел "
			\set Staff.shortInstrumentName = "д. "
			\partcombine
				\partcombine \дятелwoodblock \дятелseashore
				\partcombine \дятелfret
					\partcombine \дятелmetallic \дятелcalliope
		}
		
		\new Staff {
			\set Staff.instrumentName = "писк "
			\set Staff.shortInstrumentName = "п. "
			\писк
		}
	>>
	
	\layout { }
}

\score {
	<<
		\new Staff {
			\set Staff.midiInstrument = #"seashore"
			\set Staff.midiMinimumVolume = #0.9
			\set Staff.midiMaximumVolume = #1
			\дятелseashore
		}
		\new Staff {
			\set Staff.midiInstrument = #"woodblock"
			\дятелwoodblock
		}
		\new Staff {
			\set Staff.midiInstrument = #"guitar fret noise"
			\дятелfret
		}
		\new Staff {
			\set Staff.midiInstrument = #"pad 6 (metallic)"
			\дятелmetallic
		}
		\new Staff {
			\set Staff.midiInstrument = #"lead 3 (calliope)"
			\дятелcalliope
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"lead 1 (square)"
			\set Staff.midiMinimumVolume = #0.3
			\set Staff.midiMaximumVolume = #0.5
			\писк
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"lead 4 (chiff)"
			\бас
		}
	>>
	
	\midi {	}
}

