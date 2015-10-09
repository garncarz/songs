\version "2.12.2"

% určeno pro SoundFont MagicSFver2.sf2

\header {
	title = "Zpěv h-moll"
	composer = "Ondřej Garncarz"
}


% h-moll:
% h - cis ^ d - e - fis ^ g - a - h


nahore = \relative b' {
	\clef treble
	\key b \minor
	\time 2/4
	
	<fis b d>2
	<g b e>
	<fis a cis>
	<fis b d>
	<fis b d>
	<g b e>
	<fis a cis>
	<fis b d>
	
	<b d fis>
	<fis a d>
	<fis a cis>
	<fis b d>
	<fis b d>
	<a d fis>
	<fis a cis>
	<fis b d>
	
	<b d fis>
	<g b e>4 <g b b>
	<b b d> <a cis fis>
	<d fis b>2
	<b d fis>
	<g b e>4 <b b g>
	<b b d> <fis a cis>
	<fis b d>2
	
	
	<fis b d>2
	<g b e>
	<fis a cis>
	<fis b d>
	<fis b d>
	<g b e>
	<fis a cis>
	<fis b d>
	
	<b d fis>
	<fis a d>
	<fis a cis>
	<fis b d>
	<fis b d>
	<a d fis>
	<fis a cis>
	<fis b d>
	
	<b d fis>
	<g b e>4 <g b b>
	<b b d> <a cis fis>
	<d fis b>2
	<b d fis>
	<g b e>4 <b b g>
	<b b d> <fis a cis>
	<fis b d>2
	
	
	<fis b d>2
	<g b e>
	<fis a cis>
	<fis b d>
	<fis b d>
	<g b e>
	<fis a cis>
	<fis b d>
	
	<b d fis>
	<fis a d>
	<fis a cis>
	<fis b d>
	<fis b d>
	<a d fis>
	<fis a cis>
	<fis b d>
	
	<b d fis>
	<g b e>4 <g b b>
	<b b d> <a cis fis>
	<d fis b>2
	<b d fis>
	<g b e>4 <b b g>
	<b b d> <fis a cis>
	<d fis b>2
}


dole = <<
\relative b, {
	\clef bass
	\key b \minor
	\time 2/4
	
	b2
	e
	fis
	b,
	b
	e
	fis
	b,
	
	b
	d
	fis
	b,
	b'
	d,
	fis
	b,
	
	b
	e4 g
	g fis
	b,2
	b
	e4 g,
	g fis'
	b,2
	
	
	b2
	e
	fis
	b,
	b
	e
	fis
	b,
	
	b
	d
	fis
	b,
	b'
	d,
	fis
	b,
	
	b
	e4 g
	g fis
	b,2
	b
	e4 g,
	g fis'
	b,2
	
	
	b2
	e
	fis
	b,
	b
	e
	fis
	b,
	
	b
	d
	fis
	b,
	b'
	d,
	fis
	b,
	
	b
	e4 g
	g fis
	b,2
	b
	e4 g,
	g' fis
	b2
}
\addlyrics {
	T S D T T S D T
	T III D T T III D T
	T S "S6" VI D T T S "S6" VI D T
	
	T S D T T S D T
	T III D T T III D T
	T S "S6" VI D T T S "S6" VI D T
	
	T S D T T S D T
	T III D T T III D T
	T S "S6" VI D T T S "S6" VI D T
}
>>


bas = \relative b, {
	\clef bass
	\key b \minor
	\time 2/4
	
	b2
	e
	fis
	b,
	b
	e
	fis
	b,
	
	b
	d
	fis
	\times 2/3 {b,4 d fis}
	b2
	d,
	\times 2/3 {fis4 cis fis}
	b,2
	
	b
	e4 g
	~g fis
	b,2
	b
	e4 g,
	~g fis'
	b,2
	
	
	b2
	e
	fis
	b,
	b
	e
	fis
	b,
	
	b
	d
	fis
	\times 2/3 {b,4 d fis}
	b2
	d,
	\times 2/3 {fis4 cis fis}
	b,2
	
	b
	e4 g
	~g fis
	b,2
	b
	e4 g,
	~g fis'
	b,2
	
	
	b8 d fis b,
	e4 e,
	fis fis'
	b,2
	b'8 fis d b
	e4 e,
	fis fis'
	b,2
	
	b'8 b, fis' b,
	d2
	fis4 fis,
	\times 2/3 {b4 d fis}
	b8 b, fis' b,
	d2
	fis
	b,
	
	b
	e4 g
	~g fis
	b,2
	b
	e4 g,
	g' fis
	b4 b,
}


tenor = \relative b' {
	\clef treble
	\key b \minor
	\time 2/4
	
	fis2
	g
	fis
	~fis
	fis
	g
	fis
	~fis
	
	b
	fis
	~fis
	fis
	fis
	a
	fis
	fis
	
	b
	g4 g
	b a
	d2
	b
	g
	b4 fis
	~fis2
	
	
	\times 2/3 {fis4 e fis}
	\times 2/3 {g fis g}
	fis2
	~fis
	\times 2/3 {fis4 e fis}
	\times 2/3 {g fis g}
	e8 fis4.
	fis2
	
	b
	fis
	~fis
	fis
	fis
	a
	fis
	fis
	
	b4. g8
	g4 g
	b a
	d2
	b
	g
	b4 fis
	~fis2
	
	
	fis2
	g
	fis
	~fis
	d8 fis4.
	e8 g4.
	fis2
	~fis
	
	b4. a8
	fis4 g
	fis e
	fis2
	fis4 g8 a
	a4 g8 fis
	fis4 e
	fis2
	
	b
	g4 g
	b a
	d2
	b
	g
	b4 fis
	d2
}


alt = \relative b' {
	\clef treble
	\key b \minor
	\time 2/4
	
	b2
	b
	a
	b
	b
	b
	a
	b
	
	d
	a
	a
	b
	b
	d
	a
	b
	
	d
	b4 b
	~b cis
	fis2
	d
	b4 b
	~b a
	b2
	
	
	b2
	b
	a
	b
	b
	b
	a
	b
	
	\times 2/3 {d4 cis d}
	\times 2/3 {a b a}
	a2
	b
	\times 2/3 {b4 cis b}
	\times 2/3 {d cis d}
	cis8 a4.
	b2
	
	d4. b8
	b4 b
	~b cis
	fis2
	d
	b4 b
	~b a
	b2
	
	
	d8 b4.
	e8 b4.
	a2
	b
	fis8 b4.
	g8 b4.
	a2
	b
	
	d4. cis8
	a4 g
	a2
	b
	b4 cis8 d
	d4 cis8 a
	a2
	b
	
	d
	b8 cis b4
	b cis
	fis2
	d
	b4 b
	~b a
	fis2
}


sopran = \relative b' {
	\clef treble
	\key b \minor
	\time 2/4
	
	d2
	e
	cis
	d
	d
	e
	cis
	d
	
	fis
	d
	cis
	d
	d
	fis
	cis
	d
	
	fis
	e4 b
	d fis
	b2
	fis
	e4 b
	d cis
	d2
	
	
	\times 2/3 {d4 e d}
	\times 2/3 {e fis e}
	cis2
	d
	\times 2/3 {d4 e d}
	\times 2/3 {e fis e}
	d8 cis4.
	d2
	
	fis
	d
	cis
	d
	d
	fis
	cis
	d
	
	fis4. e8
	e4 b
	d fis
	b2
	fis
	e4 b
	d cis
	d2
	
	
	fis8 d4.  
	g8 e4.
	cis2
	d
	d
	e
	cis
	d
	
	e8 fis4 e8
	d2
	cis4 d
	d2
	d4 e8 fis
	fis4 e8 cis
	cis4 d
	d2
	
	fis
	e4 b8 d
	d4 fis
	b2
	fis
	e4 b
	d cis
	b2
}


\score {
	<<
		\new PianoStaff <<
			\set PianoStaff.instrumentName = "Harmonie "
			\set PianoStaff.shortInstrumentName = "H. "
			\new Staff \nahore
			\new Staff \dole
		>>
		
		\new Staff {
			\set Staff.instrumentName = "Bas "
			\set Staff.shortInstrumentName = "B. "
			\bas
		}
		\new Staff {
			\set Staff.instrumentName = "Tenor "
			\set Staff.shortInstrumentName = "T. "
			\tenor
		}
		\new Staff {
			\set Staff.instrumentName = "Alt "
			\set Staff.shortInstrumentName = "A. "
			\alt
		}
		\new Staff {
			\set Staff.instrumentName = "Soprán "
			\set Staff.shortInstrumentName = "S. "
			\sopran
		}
	>>

	\layout { }
}


% evropská verze:
\score {
	<<
		\new Staff {
			\set Staff.midiInstrument = #"church organ"
			\bas
		}
		\new Staff {
			\set Staff.midiInstrument = #"cello"
			\tenor
		}
		\new Staff {
			\set Staff.midiInstrument = #"violin"
			\alt
		}
		\new Staff {
			\set Staff.midiInstrument = #"piccolo"
			\sopran
		}
	>>

	\midi { }
}


% asijská verze:
\score {
	<<
		\new Staff {
			\set Staff.midiInstrument = #"koto"
			\bas
		}
		\new Staff {
			\set Staff.midiInstrument = #"shamisen"
			\tenor
		}
		\new Staff {
			\set Staff.midiInstrument = #"banjo"
			\alt
		}
		\new Staff {
			\set Staff.midiInstrument = #"sitar"
			\sopran
		}
	>>

	\midi { }
}


%{
% harmonie:
\score {
	<<
		\new PianoStaff <<
			\nahore
			\dole
		>>
	>>

	\midi { }
}
%}
