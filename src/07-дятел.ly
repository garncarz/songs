\version "2.12.3"

\header {
	title = "Дятел"
	composer = "Ondřej Garncarz"
}

% inspirováno http://en.wikipedia.org/wiki/Russian_Woodpecker
% audio na konci: http://en.wikipedia.org/wiki/File:Woodpecker.ogg

% Des-dur:
% des - es - f ^ ges - as - b - c ^ des

заголовок = {
	\clef treble
	\key des \major
	\time 6/8
}

постукиватьC = { c8 c c c c c }
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

дятелwoodblock = \relative des' {
	\заголовок
	
	% 10 Гц
	
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
	
	% 16 Гц
	
	\repeat unfold 5 \постукиватьA
	r2.
	\repeat unfold 14 \постукиватьA
	
	\repeat unfold 20 \постукиватьA
	
	% 10 Гц
	
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
	
	% 20 Гц
	
	\repeat unfold 5 \постукиватьDes
	r2.
	\repeat unfold 14 \постукиватьDes
	
	\repeat unfold 20 \постукиватьDes
	
	\repeat unfold 20 \постукиватьDes
}

дятелseashore = \relative des' {
	\заголовок
	
	% 10 Гц
	
	\repeat unfold 10 \постукиватьDes
	\repeat unfold 10 \постукиватьF
	
	\repeat unfold 10 \постукиватьF
	\repeat unfold 10 \постукиватьDes
	
	\repeat unfold 10 {
		d8\mf e d e d e
		d8\p e d e d e }
	
	\repeat unfold 10 \постукиватьDes
	\repeat unfold 10 \постукиватьF
	
	% 16 Гц
	
	\repeat unfold 20 \постукиватьAsBes
	
	\repeat unfold 20 \постукиватьE
	
	% 10 Гц
	
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
	
	% 20 Гц
	
	\repeat unfold 20 \постукиватьCD
	
	\repeat unfold 20 \постукиватьEFis
	
	\repeat unfold 20 \постукиватьGA
}

дятелfret = \relative des' {
	\заголовок
	
	% 10 Гц
	
	\repeat unfold 9 \постукиватьDes
	\repeat unfold 6 \постукиватьE
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 9 \постукиватьDes
	\repeat unfold 6 \постукиватьD
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 5 \постукиватьDes
	\repeat unfold 10 \постукиватьE
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 5 \постукиватьDes
	\repeat unfold 10 \постукиватьD
	\repeat unfold 5 \постукиватьDes
	
	% 16 Гц
	
	\repeat unfold 4 {
		\repeat unfold 3 \постукиватьA
		\repeat unfold 3 \постукиватьC
		\repeat unfold 3 \постукиватьE }
	\repeat unfold 3 \постукиватьA
	\постукиватьC
	
	% 10 Гц
	
	\repeat unfold 9 \постукиватьDes
	\repeat unfold 6 \постукиватьE
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 9 \постукиватьDes
	\repeat unfold 6 \постукиватьD
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 5 \постукиватьDes
	\repeat unfold 10 \постукиватьE
	\repeat unfold 5 \постукиватьDes
	
	\repeat unfold 5 \постукиватьDes
	\repeat unfold 10 \постукиватьD
	\repeat unfold 5 \постукиватьDes
	
	% 20 Гц
	
	des,8 des des des des des
	\repeat unfold 2 \постукиватьDes
	\repeat unfold 3 \постукиватьF
	\repeat unfold 3 \постукиватьAs
	\repeat unfold 5 {
		\repeat unfold 3 \постукиватьDes
		\repeat unfold 3 \постукиватьF
		\repeat unfold 3 \постукиватьAs }
	\repeat unfold 3 \постукиватьDes
	\repeat unfold 3 \постукиватьF
}

дятелmetallic = \relative des' {
	\заголовок
	
	% 10 Гц
	
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
	
	% 16 Гц
	
	\постукиватьA
	\repeat unfold 3 \постукиватьC
	\repeat unfold 4 {
		\repeat unfold 3 \постукиватьE
		\repeat unfold 3 \постукиватьA
		\repeat unfold 3 \постукиватьC }
	
	% 10 Гц
	
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
	
	% 20 Гц
	
	des,8 des des des des des
	\repeat unfold 3 \постукиватьF
	\repeat unfold 6 {
		\repeat unfold 3 \постукиватьAs
		\repeat unfold 3 \постукиватьDes
		\repeat unfold 3 \постукиватьF }
	\постукиватьAs \постукиватьAs
}

дятелcalliope = \relative des' {
	\заголовок
	
	% 10 Гц
	
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
	
	% 16 Гц
	
	\repeat unfold 5 {
		\постукиватьE \постукиватьE
		\постукиватьC \постукиватьC }

	\repeat unfold 3 {
		\постукиватьE \постукиватьE
		\постукиватьC \постукиватьC }
	\repeat unfold 4 {
		\постукиватьA \постукиватьC }
	
	% 10 Гц
	
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
	
	% 20 Гц
	
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
	\заголовок
	
	% 10 Гц
	
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
	as8*3 as'8*3 as'8*3 r8*3
	as,,8*9 r8*3
	s2.*14
	
	% 16 Гц
	
	\tempo 8=960
	
	e'8*9 r8*3
	e8*9 r8*3
	e8*9 r8*3
	s2.*14
	
	e8*9 r8*3
	<c e a>8*9 r8*3
	<a c e a c>8*9 r8*3
	s2.*14
	
	% 10 Гц
	
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
	as8*3 as'8*3 as'8*3 r8*3
	as,,8*9 r8*3
	s2.*14
	
	% 20 Гц
	
	\tempo 8=1200
	
	as8*9\mp r8*3
	<des, fes>4. ges es es
	\repeat unfold 3 { <des fes>4. ges es es }
	es2. d
	\repeat unfold 3 { <des fes>4 r8 ges4 r8 es4 r8 es4 r8 }
	es2. d
	
	<<
	{ \repeat unfold 54 { des16 s } } \\
		{ \repeat unfold 27 { fes16 s s8  } } \\
		{ \repeat unfold 18 { as16 s s4 } }
	>>
	es2. d
	<<
	{ \repeat unfold 54 { des16 s } } \\
		{ \repeat unfold 27 { fes16 s s8  } } \\
		{ \repeat unfold 18 { as16 s s4 } }
	>>
	
	<des, fes>4 r8 ges4 r8 es4 r8 es4 r8
	\repeat unfold 2 { <des fes>4 r8 ges4 r8 es4 r8 es4 r8 }
	es2. d
	<<
	{ \repeat unfold 54 { des16 s } } \\
		{ \repeat unfold 27 { fes16 s s8  } } \\
		{ \repeat unfold 18 { as16 s s4 } }
	>>
	es2. d
}


бас = \relative des, {
	% 10 Гц

	des2.*20
	
	des2.*20
	
	des2.*20
	
	des2.*20
	
	% 16 Гц
	
	a2.*20
	
	a2.*20
	
	% 10 Гц

	des2.*20
	
	des2.*20
	
	des2.*20
	
	des2.*20
	
	% 20 Гц
	
	des2.*20
	
	des2.*20
	
	des2.*20
}


%{
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
%}


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

