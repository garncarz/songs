\version "2.14.2"

% A-Dur:
% a - h - cis ^ d - e - fis - gis ^ a

akordy = \chordmode {
	a1:7/g
	
	\repeat volta 2 {
		b4:m/fis b:m e2/gis' a2 d fis:m a
		a1:7/g b4:m/fis b:m e2/gis' a2 d fis:m a
		d':sus2/a e:sus4/a a1
	}
	\alternative { a1:7/g { } }
}

kytara = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	\tempo 4=130
	
	<a cis e g,>1
	
	\repeat volta 2 {
		<b d fis fis,>4 <b d fis fis,> <gis b e e,>2
		<e a cis e>4 <e a cis e> <fis a d fis>2
		<fis a cis fis>4 <fis a cis fis> <e a cis e>2
		<a cis e g,>4 <a cis e g,>8 <a cis e g,> <a cis e g,>4 <a cis e g,>8 <a cis e g,>
		<b d fis fis,>4 <b d fis fis,> <gis b e e,>2
		<e a cis e>4 <e a cis e> <fis a d fis>2
		<fis a cis fis>4 <fis a cis fis> <e a cis e>2
	
		<e a d e>4 <e a d e>8 <e a d e> <e gis b e>4 <e gis b e>8 <e gis b e>
		<e a cis>8 r <a cis e>4 <e a cis>8 r <a cis e>4
	}
	\alternative {
		{ <a cis e g,>4 <a cis e g,>8 <a cis e g,> <a cis e g,>4 <a cis e g,>8 <a cis e g,> }
		{ } }
}

basa = \relative a, {
	\clef bass
	\key a \major
	\time 4/4
	
	a2 cis
	
	\repeat volta 2 {
		b8 b fis' fis e2
		a,4 cis d2 fis8 r fis, r a2
		cis2 a b8 b fis' fis e2
		a,4 cis d2 fis8 r fis, r a2
	
		e8 a d4 e,8 gis b4
		e4 a,8 r e'4 a,8 r
	}
	\alternative { { cis2 a } { } }
}

melodie = \relative a' {
	\clef treble
	\key a \major
	\time 4/4
	\tempo 4=130
	
	r4 e fis2
	\repeat volta 2 {
		fis4 b8 fis gis2 a4 e fis4. cis'8 a4. cis2 r8
		a4 e fis2 fis4 b8 fis gis2 a4 e fis4. cis'8 a4. cis2 r8
		r1 r
	}
	\alternative { { r4 e, fis2 } { } }
}


\score {
	<<
		\new Staff {
			\set Staff.instrumentName = "Akordy "
			\set Staff.shortInstrumentName = "A. "
			\relative a' {
				\key a \major
				\akordy
			}
		}
		
		\new ChordNames \akordy
		\new Staff {
			\set Staff.instrumentName = "Kytara "
			\set Staff.shortInstrumentName = "K. "
			\kytara
		}
		
		\new Staff {
			\set Staff.instrumentName = "Basa "
			\set Staff.shortInstrumentName = "B. "
			\basa
		}
		
		\new Staff {
			\set Staff.instrumentName = "Melodie "
			\set Staff.shortInstrumentName = "M. "
			\melodie
		}
	>>

	\layout { }
}

\score {
	<<
		%{ \new Staff {
			\set Staff.midiInstrument = #"electric guitar (clean)"
			\unfoldRepeats \relative a' \akordy
		%}
		
		\new Staff {
			\set Staff.midiInstrument = #"acoustic guitar (nylon)"
			\set Staff.midiMinimumVolume = #0.4
			\set Staff.midiMaximumVolume = #0.5
			\unfoldRepeats \kytara
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"electric bass (pick)"
			\set Staff.midiMinimumVolume = #0.8
			\set Staff.midiMaximumVolume = #0.9
			\unfoldRepeats \basa
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"electric grand"
			\set Staff.midiMinimumVolume = #0.9
			\set Staff.midiMaximumVolume = #1.0
			\unfoldRepeats \melodie
		}
	>>

	\midi { }
}

