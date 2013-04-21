\version "2.16.2"

% určeno pro MagicSFver2.sf2

\include "articulate.ly"

% A-Dur:
% a - b - cis ^ d - e - fis - gis ^ a

melodie = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	
	\partial 2 a4 d8 cis |
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 \bar "||"
	
	r2 a4 d8 cis |
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 \bar "||"
	
	r2 a4 d8 cis |
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 \bar "||"
	
	r2 a4 d8 cis |
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 \bar "||"
}

harmonie = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	
	\partial 2 r2 |
	r1 |
	% T2 S->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T4 II4 VI->T4 D4
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% D4 T2
	<gis b e>4 <a cis e>2 r4 |
	
	% T2 S->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T4 II4 VI->T4 D4
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% T2 S->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T4 II4 VI->T4 D4
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% D4 T2
	<gis b e>4 <a cis e>2 r4 |
	
	% T2 S->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T4 II4 VI->T4 D4
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% T2 S->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T4 II4 VI->T4 D4
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% D4 T2
	<gis b e>4 <a cis e>2 r4 |
	
	% T2 S->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T4 II4 VI->T4 D4
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% T2 S->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T4 II4 VI->T4 D4
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% D4 T2
	<gis b e>4 <a cis e>2 r4 |
}


bas = \relative a, {
	\clef bass
	\key a \major
	\time 4/4
	
	\partial 2 r2 |
	R1*3 |
	r2 a4 \pp d8 cis |  % \pp kvůli MagicSFver2.sf2
	
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 |
	r2 a4 d8 cis |
	
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 |
	r1 |
	
	\clef "bass_8"
	% T2 S->T2
	a,4 a' \grace{d8} a4 a, |
	% T4 II4 VI->T4 D4
	a4 b8 d a'4 e8 b |
	% T2 S->T2
	a4 a' \grace{fis8} a4 a, |
	% T4 II4 VI->T4 D4
	\afterGrace a4 {a'8} b8 d, a'4 e8 b |
	% D4 T2
	e8 b a2 r4 |
}


trubky = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	
	\partial 2 r2 |
	R1*9 |
	
	a4-> d8 cis r2 |
	e8-. e-. d-. r8 r2 |
	
	% T2 S->T2
	<a cis>4-^ \grace{<cis e>8} <a cis>4-^ \grace{<a d>8} <a cis>4-^ <a cis>-^ |
	% T4 II4 VI->T4 D4
	r2 <a cis>16-^ <a cis>-^ <a cis>-^ <a d>-^ <b e>-^ <b e>-^ <b e>-^ <b d>-^ |
	% D4 T2
	<b cis>-^ <gis b>-^ <gis b>-^ <gis b>-^ r4 <a cis>2 |
	
	% T2 S->T2
	<a cis>8 <a cis>16-^ <a d>-^ <cis e>8 <cis e>16-^ <b e>-^
		<a d>8-| <a cis>16-^ <a cis>-^ <a d>8 <a cis> |
	% T4 II4 VI->T4 D4
	r2 <a cis>16-^ <a cis>-^ <a cis>-^ <a d>-^ <b e>-^ <b e>-^ <b e>-^ <b d>-^ |
	% T2 S->T2
	<a cis>8 <a cis>16-^ <a d>-^ <cis e>8 <cis e>16-^ <b e>-^
		<a d>8-| <a cis>16-^ <a cis>-^ <a d>8 <a cis> |
	% T4 II4 VI->T4 D4
	r2 <a cis>16-^ <a cis>-^ <a cis>-^ <a d>-^ <b e>-^ <b e>-^ <b e>-^ <b d>-^ |
	% D4 T2
	<b cis>-^ <gis b>-^ <gis b>-^ <gis b>-^ <a cis>2. |
}

\score {
	<<
		\new Staff {
			\set Staff.instrumentName = "Melodie "
			\set Staff.shortInstrumentName = "M. "
			\melodie
		}
		
		\new Staff {
			\set Staff.instrumentName = "Harmonie "
			\set Staff.shortInstrumentName = "H. "
			\harmonie
		}
		
		\new Staff {
			\set Staff.instrumentName = "Bas "
			\set Staff.shortInstrumentName = "B. "
			\bas
		}
		
		\new Staff {
			\set Staff.instrumentName = "Trubky "
			\set Staff.shortInstrumentName = "T. "
			\trubky
		}
	>>
	
	\layout { }
}

\score {
	\unfoldRepeats \articulate
	<<
		\new Staff {
			\set Staff.midiInstrument = #"harpsichord"
			\melodie
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"bright acoustic"
			\harmonie
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"contrabass"
			\bas
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"trumpet"
			\trubky
		}
	>>
	
	\midi { }
}

