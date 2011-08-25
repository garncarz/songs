\version "2.14.1"

% A-Dur:
% a - h - cis ^ d - e - fis - gis ^ a

akordy = \chordmode {
	\repeat unfold 2 {
		a1:7/g b4:m/fis b:m e2/gis'
		a2 d fis:m a }
}

kytara = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	\tempo 4=130
	
	\repeat unfold 2 {
		<a cis e g,>1 <b d fis fis,>4 <b d fis fis,> <gis b e e,>2
		<e a cis e> <fis a d fis> <fis a cis fis> <e a cis e> }
}

basa = \relative a, {
	\clef bass
	\key a \major
	\time 4/4
	
	a2 cis b8 b fis' fis e2
	a,4 cis d2 fis8 r fis, r a2
	cis2 a b8 b fis' fis e2
	a,4 cis d2 fis8 r fis, r a2
}

melodie = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	\tempo 4=130
	
	r4 e fis2 fis4 b8 fis gis2 a4 e fis4. cis'8 a4. cis2 r8
	a4 e fis2 fis4 b8 fis gis2 a4 e fis4. cis'8 a4. cis2 r8
}


\score {
	<<
		\new ChordNames \akordy
		\new Staff {
			\set Staff.instrumentName = "Akordy "
			\set Staff.shortInstrumentName = "A. "
			\set Staff.midiInstrument = #"electric guitar (clean)"
			\relative a' {
				\key a \major
				\akordy
			}
		}
		
		\new Staff {
			\set Staff.instrumentName = "Kytara "
			\set Staff.shortInstrumentName = "K. "
			\set Staff.midiInstrument = #"electric guitar (clean)"
			\kytara
		}
		
		\new Staff {
			\set Staff.instrumentName = "Basa "
			\set Staff.shortInstrumentName = "B. "
			\set Staff.midiInstrument = #"electric bass (finger)"
			\basa
		}
		
		\new Staff {
			\set Staff.instrumentName = "Melodie "
			\set Staff.shortInstrumentName = "M. "
			\set Staff.midiInstrument = #"electric grand"
			\melodie
		}
	>>

	\layout { }
	\midi { }
}

