\version "2.16.2"

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
	~gis4 a2 r4 |
	
	r2 a4 d8 cis |
	r4 b e8 fis ~fis e |
	cis16 gis a fis \grace{gis8} a4 r \grace{gis8} a4 |
	cis16 gis a fis d'16 a b gis a4 gis
	~gis4 a2 r4 |
}

harmonie = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	
	\partial 2 r2 |
	r1 |
	% T S T
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T II VI T D
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% D T
	<gis b e>4 <a cis e>2 r4 |
	
	% T S T
	<e a cis>2 \grace{<fis a d>8} <e a cis>2 |
	% T II VI T D
	<a cis e>4 <fis b d> \grace{<fis a cis>8} <e a cis>4 <e gis b> |
	% T S T
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
}


\score {
	<<
		\new Staff {
			\set Staff.instrumentName = "Melodie "
			\set Staff.shortInstrumentName = "M. "
			\set Staff.midiInstrument = #"harpsichord"
			\melodie
		}
		
		\new Staff {
			\set Staff.instrumentName = "Harmonie "
			\set Staff.shortInstrumentName = "H. "
			\set Staff.midiInstrument = #"bright acoustic"
			\harmonie
		}
		
		\new Staff {
			\set Staff.instrumentName = "Bas "
			\set Staff.shortInstrumentName = "B. "
			\set Staff.midiInstrument = #"contrabass"
			\bas
		}
	>>
		
	\layout { }
	\midi { }
}

