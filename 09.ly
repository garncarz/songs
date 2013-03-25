\version "2.16.2"

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
}

harmonie = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	
	\partial 2 r2 |
	r1 |
	% T2 S8->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T II VI T D
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% D T
	<gis b e>4 <a cis e>2 r4 |
	
	% T2 S8->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T II VI T D
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% T2 S8->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T II VI T D
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% D T
	<gis b e>4 <a cis e>2 r4 |
	
	% T2 S8->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T II VI T D
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% T2 S8->T2
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T II VI T D
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% D T
	<gis b e>4 <a cis e>2 r4 |
}


bas = \relative a, {
	\clef bass
	\key a \major
	\time 4/4
	
	\partial 2 r2 |
	R1*3 |
	r2 a4 \pp d8 cis |
	
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 |
	r2 a4 d8 cis |
	
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 |
}


trubky = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	
	\partial 2 r2 |
	R1*9 |
	
	a4 d8 cis r2 |
	e8\staccato e\staccato d\staccato r8 r2 |
	
	% T2 S8->T2
	% <a cis>4 \grace{<cis e>8} <a cis>4 \grace{<a d>8} <a cis>4 <a cis> |
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
			\set Staff.midiInstrument = #"muted trumpet"
			\trubky
		}
	>>
	
	\midi { }
}

