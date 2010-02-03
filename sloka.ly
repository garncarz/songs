\version "2.10.33"


% Es-Dur:
% es - f - g ^ as - b - c - d ^ es


harmonieNahore = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	<es g bes>1
	<es as c>
	<d f bes>
	<es bes' es>
}


harmonieDole = <<
\relative es {
	\clef bass
	\key es \major
	\time 4/4
	
	es'1
	f,
	bes
	g
}
\addlyrics {
	T "II7" D "T6"
}
>>


zpev = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	f16\mp es\p es8 f16\mp es8\p r16 f\mp es\p es8 f16\mp es\p es8
	bes16\mp as\p as8 bes16\mp as8\p r16 bes\mp as\p as8\mp bes16\p as as8
	bes'16\mp g\p g8 bes32\mp bes\p g16 g8 bes16\mp g\p g8 bes16\mp g8.\p
	g16\mp es\p es8 r4 es16\mp es g\mf es4\f ~es16
}


piano = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	<es g>16\mf <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mf <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mf <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mf <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <f f'>1\mf \\ { bes32\mf c\p bes c bes c bes c bes c bes c bes8
		bes32\mf c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>4\mf <es bes' es>4\pp es16\mf bes' es <es, bes' es>4\f ~<es bes' es>16
}


kytara = \relative es {
	\clef "treble_8"
	\key es \major
	\time 4/4
		
	<es g>16\mp <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mp <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mp <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mp <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <d f>1\mp \\ { bes'32\mp c\p bes c bes c bes c bes c bes c bes8
		bes32\mp c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>4\mp <es bes' es>4\pp <es bes' es>16\mp
		<es bes' es> <es bes' es>\mf <es bes' es>4\f ~<es bes' es>16
}
kytaraCh = \chordmode {
	es f:m7 bes es
}


basa = \relative es, {
	\clef "bass_8"
	\key es \major
	\time 4/4
	
	es4\mp \grace { g16 } es4 es \grace { g16 } es4
	f,4\mp \grace { as16[ c] } f,4 f \grace { as16 } f4
	bes4\mp \grace { f'16 } bes,4 bes \grace { f'16 } bes,4
	<< { g4\mp g2.\pp } \\ { r2 \grace { bes16\mf[ es] } g4 g } >>
	
	r1
}


kopak = \drummode {
	\time 4/4

	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
}


bubny = \drummode {
	\time 4/4
	
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timh16 timh timh timh timh timh timh32 timh timh timh
		timh16 timh timh timh timh timh timh32 timh timh timh
	ssl4 ssl toml16 toml toml toml4 ~toml16
}


cinely = \drummode {
	\time 4/4
	
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh4 hh cymc16 cymc cymc cymc4 ~cymc16
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
		
		\new Staff {
			\set Staff.instrumentName = "Zpěv "
			\set Staff.shortInstrumentName = "Z. "
			\zpev
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
		
		\new DrumStaff <<
			\set Staff.instrumentName = "Perkuse "
			\set Staff.shortInstrumentName = "Pk. "
			\new DrumVoice { \voiceOne \cinely }
			\new DrumVoice { \voiceTwo \bubny }
			\new DrumVoice { \voiceThree \kopak }
		>>
	>>
	
	\layout { }
}


\score {
	<<
		\new Staff {
			\set Staff.midiInstrument = #"banjo"
			\set Staff.midiMinimumVolume = #0.5
			\set Staff.midiMaximumVolume = #0.7
			\zpev
		}
	
		\new Staff {
			\set Staff.midiInstrument = #"acoustic grand"
			\piano
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"overdriven guitar"
			\kytara
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"electric bass (pick)"
			\basa
		}
		
		\new DrumStaff <<
			\cinely
			\bubny
			\kopak
		>>
	>>
	
	\midi { }
}

