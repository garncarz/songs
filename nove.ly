\version "2.10.33"


% Es-Dur:
% es - f - g ^ as - b - c - d ^ es


harmonieNahore = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	<es g bes>1
	<es as c>
	<f bes d>
	<g bes es>
	
	<es g bes>
	<es as c>
	<d f bes>
	<es bes' es>
	
	<es g bes>
	<es as c>
	<c d as'>
	<bes es g>
}


harmonieDole = <<
\relative es {
	\clef bass
	\key es \major
	\time 4/4

	es1
	as
	bes,
	g'
	
	es
	f,
	bes
	g
	
	es'
	as,
	bes
	es
}
\addlyrics {
	T S D "T6"
	T "II7" D "T6"
	T S "D9/7" T
}
>>


piano = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	r1
}


kytara = \relative es {
	\clef "treble_8"
	\key es \major
	\time 4/4
	
	r1
	<es as c>16 <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es>
	<f bes d> <bes d f> <f bes d> <bes d f> <f bes d> <bes d f> <f bes d> <bes d f> <f bes d> <bes d f> <f bes d> <bes d f> <f bes d> <bes d f> <f bes d> <bes d f>
	<g bes es>16 <es g bes> <g bes es>8 <g bes es>16 <es g bes> <es g bes>8 <g bes es>16 <es g bes> <g bes es>8 <g bes es>16 <es g bes> <es g bes>8
}
kytaraCh = \chordmode {
	r1 as bes g:9
}


basa = \relative es, {
	\clef "bass_8"
	\key es \major
	\time 4/4
	
	es16 es es8 es16 es8 r16 es es es8 es16 es es8
	as,16 c c8 as16 c8 r16 as c c8 as16 c c8
	bes16 f f8 bes16 f8 r16 bes f f8 bes16 f f8
	g'16 es es8 g16 es8 r16 g es es8 g16 es es8
	
	r1
}


bici = \drummode {
	\time 4/4
	
	r1
}


\score {
	<<
		\new PianoStaff <<
			\set PianoStaff.instrumentName = "Harmonie "
			\set PianoStaff.shortInstrumentName = "H. "
			\new Staff \harmonieNahore
			\new Staff \harmonieDole
		>>
		
		\new Staff {
			\set Staff.instrumentName = "Piano "
			\set Staff.shortInstrumentName = "P. "
			\piano
		}
		
		\new ChordNames \kytaraCh
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
		
		\new DrumStaff {
			\set Staff.instrumentName = "Perkuse "
			\set Staff.shortInstrumentName = "Pk. "
			\bici
		}
	>>
	
	\layout { }
}


\score {
	<<
		\new Staff {
			\set Staff.midiInstrument = #"acoustic grand"
			% \piano
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"overdriven guitar"
			\kytara
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"electric bass (pick)"
			\basa
		}
		
		\new DrumStaff {
			% \bici
		}
	>>
	
	\midi { }
}


