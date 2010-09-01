\version "2.10.33"

\header {
	title = "Дятел"
	composer = "Ondřej Garncarz"
}

% inspirováno http://en.wikipedia.org/wiki/Russian_Woodpecker

% Des-dur:
% des - es - f ^ ges - as - b - c ^ des

head = {
	\clef treble
	\key des \major
	\time 6/8
}

постукиватьCD = { c8 d c d c d }
постукиватьDes = { des8 des des des des des }
постукиватьD = { d8 d d d d d }
постукиватьE = { e8 e e e e e }
постукиватьEFis = { e8 fis e fis e fis }
постукиватьF = { f8 f f f f f }
постукиватьGA = { g8 a g a g a }
постукиватьAs = { as8 as as as as as }
постукиватьAsBes = { as8 bes as bes as bes }
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
	\repeat unfold 4 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	d8\f d d d d d
	\repeat unfold 4 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	% 16 Hz
	
	\repeat unfold 5 \постукиватьA
	r2.
	\repeat unfold 14 \постукиватьA
	
	\repeat unfold 20 \постукиватьA
	
	% 10 Hz
	
	\repeat unfold 5 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	\repeat unfold 5 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	d8\p d d d d d
	\repeat unfold 4 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	d8\f d d d d d
	\repeat unfold 4 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	% 20 Hz
	
	des'8 des des des des des
	\repeat unfold 4 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	\repeat unfold 20 \постукиватьDes
	
	\repeat unfold 20 \постукиватьDes
}

дятелseashore = \relative des' {
	\head
	
	% 10 Hz
	
	\repeat unfold 10 \постукиватьDes
	\repeat unfold 10 \постукиватьF
	
	\repeat unfold 10 \постукиватьF
	\repeat unfold 10 \постукиватьDes
	
	\repeat unfold 10 {
		d8\mf e d e d e
		d8\p e d e d e }
	
	\repeat unfold 10 \постукиватьDes
	\repeat unfold 10 \постукиватьF
	
	% 16 Hz
	
	\repeat unfold 20 \постукиватьAsBes
	
	\repeat unfold 20 \постукиватьE
	
	% 10 Hz
	
	des,8 des des des des des
	\repeat unfold 9 \постукиватьDes
	\repeat unfold 10 \постукиватьF
	
	\repeat unfold 10 \постукиватьF
	\repeat unfold 10 \постукиватьDes
	
	\repeat unfold 10 {
		d8\mf e d e d e
		d8\p e d e d e }
	
	\repeat unfold 10 \постукиватьDes
	\repeat unfold 10 \постукиватьF
	
	% 20 Hz
	
	\repeat unfold 20 \постукиватьCD
	
	\repeat unfold 20 \постукиватьEFis
	
	\repeat unfold 20 \постукиватьGA
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
	
	\repeat unfold 4 {
		\repeat unfold 3 \постукиватьA
		\repeat unfold 3 \постукиватьC
		\repeat unfold 3 \постукиватьE }
	\repeat unfold 3 \постукиватьA
	\постукиватьC
	
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
	
	% 20 Hz
	
	\repeat unfold 6 {
		\repeat unfold 3 \постукиватьDes
		\repeat unfold 3 \постукиватьF
		\repeat unfold 3 \постукиватьAs }
	\repeat unfold 3 \постукиватьDes
	\repeat unfold 3 \постукиватьF
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
	\repeat unfold 7 \постукиватьF
	des8\mf des des des des des
	\repeat unfold 11 \постукиватьDes
	
	r2.
	\repeat unfold 11 \постукиватьDes
	\постукиватьE
	\repeat unfold 7 \постукиватьDes
	
	% 16 Hz
	
	\постукиватьA
	\repeat unfold 3 \постукиватьC
	\repeat unfold 4 {
		\repeat unfold 3 \постукиватьE
		\repeat unfold 3 \постукиватьA
		\repeat unfold 3 \постукиватьC }
	
	% 10 Hz
	
	\repeat unfold 14 \постукиватьDes
	r2.
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 12 \постукиватьDes
	\постукиватьE
	\repeat unfold 7 \постукиватьDes
	
	f8\p f f f f f
	\repeat unfold 7 \постукиватьF
	des8\mf des des des des des
	\repeat unfold 11 \постукиватьDes
	
	r2.
	\repeat unfold 11 \постукиватьDes
	\постукиватьE
	\repeat unfold 7 \постукиватьDes
	
	% 20 Hz
	
	\постукиватьDes
	\repeat unfold 3 \постукиватьF
	\repeat unfold 6 {
		\repeat unfold 3 \постукиватьAs
		\repeat unfold 3 \постукиватьDes
		\repeat unfold 3 \постукиватьF }
	\постукиватьAs \постукиватьAs
}

дятелcalliope = \relative des' {
	\head
	
	% 10 Hz
	
	\repeat unfold 19 \постукиватьDes
	r2.
	
	\repeat unfold 19 \постукиватьDes
	r2.
	
	s2.*15
	des8\mp des des des des des
	s2.
	\постукиватьDes \постукиватьDes
	des8\mf des des des des des

	\repeat unfold 7 \постукиватьDes
	\постукиватьE
	\repeat unfold 7 \постукиватьDes
	\постукиватьE
	\repeat unfold 3 \постукиватьDes
	r2.
	
	% 16 Hz
	
	\repeat unfold 5 {
		\постукиватьE \постукиватьE
		\постукиватьC \постукиватьC }

	\repeat unfold 3 {
		\постукиватьE \постукиватьE
		\постукиватьC \постукиватьC }
	\repeat unfold 4 {
		\постукиватьA \постукиватьC }
	
	% 10 Hz
	
	\repeat unfold 19 \постукиватьDes
	r2.
	
	\repeat unfold 19 \постукиватьDes
	r2.
	
	s2.*15
	des8\mp des des des des des
	s2.
	\постукиватьDes \постукиватьDes
	des8\mf des des des des des

	\repeat unfold 7 \постукиватьDes
	\постукиватьE
	\repeat unfold 7 \постукиватьDes
	\постукиватьE
	\repeat unfold 3 \постукиватьDes
	r2.
	
	% 20 Hz
	
	\repeat unfold 5 {
		\постукиватьAs \постукиватьAs
		\постукиватьF \постукиватьF }

	\repeat unfold 3 {
		\постукиватьAs \постукиватьAs
		\постукиватьF \постукиватьF }
	\repeat unfold 4 {
		\постукиватьDes \постукиватьF }
	
	\repeat unfold 5 {
		\постукиватьAs \постукиватьAs
		\постукиватьF \постукиватьF }
}



пищать = \relative des' {
	\head
	
	% 10 Hz
	
	\tempo 8=600
	
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
	as8*3 a'8*3 as'8*3 r8*3
	as,,8*9 r8*3
	s2.*14
	
	% 16 Hz
	
	\tempo 8=960
	
	e'8*9 r8*3
	e8*9 r8*3
	e8*9 r8*3
	s2.*14
	
	e8*9 r8*3
	<c e a>8*9 r8*3
	<a c e a c>8*9 r8*3
	s2.*14
	
	% 10 Hz
	
	\tempo 8=600
	
	as8*9\mp r8*3
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
	as8*3 a'8*3 as'8*3 r8*3
	as,,8*9 r8*3
	s2.*14
	
	% 20 Hz
	
	\tempo 8=1200
	
	<<
		{ \repeat unfold 102 { des16 s } } \\
		{ s2. \repeat unfold 48 { f16 s s8  } } \\
		{ s2.*2 \repeat unfold 30 { as16 s s4 } } \\
		{ s2.*4 f'2. r4 as bes des2.
			r2. des2 des4 as2.
			r2. as2 as4 f2.
			r2. f2 f4 des2. ~des
			des,2. r2. r2. }
	>>
	
	as'2. <f as des> <des f as des f>
	<des f as des f>2 r4 <des f as des f>2 r4 <des f as des f>2 r4
	<< { <des f as>2. ~<des f as> ~<des f as> ~<des f as> s2. } \\
		{ s4 des'2 s4 c2 s4 des2 ~des2. ~des2. } >>
	<< { <as, des f>2. ~<as des f> ~<as des f> ~<as des f> s2. } \\
		{ s4 des'2 s4 c2 s4 as2 ~as2. ~ as2. } >>
	bes2 r4
	<des, f bes>2. ~<des f bes>2. <des f as des>2. ~<des f as des>2.
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
	
	% 10 Hz

	des2.*20
	
	des2.*20
	
	des2.*20
	
	des2.*20
	
	% 20 Hz
	
	des2.*20
	
	des2.*20
	
	des2.*20
}


\score {
	<<
		\new Staff \with { printPartCombineTexts = ##f } {
			\set Staff.instrumentName = "Дятел "
			\set Staff.shortInstrumentName = "Д. "
			\partcombine
				\partcombine \дятелwoodblock \дятелseashore
				\partcombine \дятелfret
					\partcombine \дятелmetallic \дятелcalliope
		}
		
		\new Staff {
			\set Staff.instrumentName = "Пищать "
			\set Staff.shortInstrumentName = "П. "
			\пищать
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
			\пищать
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"lead 4 (chiff)"
			\бас
		}
	>>
	
	\midi {	}
}

