\version "2.12.3"

\header {
	title = "дятел"
	composer = "Ondřej Garncarz"
}

% inspirováno http://en.wikipedia.org/wiki/Russian_Woodpecker

% Des-dur:
% des - es - f ^ ges - as - b - c ^ des

tukaniDes = { des8\mf des des des des des }

дятел = \relative des' {
	\clef treble
	\key des \major
	\time 6/8
	\tempo 8=600

	\repeat unfold 10 \tukaniDes
}

дятелwoodblock = \relative des' {
	\clef treble
	\key des \major

	\repeat unfold 5 \tukaniDes
	r2.
	\repeat unfold 4 \tukaniDes
}


писк = \relative des'' {
	\clef treble
	\key des \major
	
	as'8*9\mp r8*3
	as8*9 r8*3
	as8*9 r8*3
}

бас = \relative des, {
	\clef bass
	\key des \major

	des2.*10
}


\score {
	<<
		\new Staff {
			\set Staff.instrumentName = "писк "
			\set Staff.shortInstrumentName = "п. "
			\дятел
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
			\дятел
		}
		\new Staff {
			\set Staff.midiInstrument = #"woodblock"
			\дятелwoodblock
		}
		\new Staff {
			\set Staff.midiInstrument = #"guitar fret noise"
			\дятел
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

