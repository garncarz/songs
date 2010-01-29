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
	
	es1
	f,
	bes
	g
	
	es'1
	f,
	bes
	g
}
\addlyrics {
	T "II7" D "T6"
	T "II7" D "T6"
}
>>


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
	<es, bes' es>1\mf
	
	<es g>16\mf <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mf <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mf <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mf <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <f f'>1\mf \\ { bes32\mf c\p bes c bes c bes c bes c bes c bes8
		bes32\mf c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>1\mf
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
	<es, bes' es>1\mp
	
	<es g>16\mp <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mp <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mp <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mp <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <d f>1\mp \\ { bes'32\mp c\p bes c bes c bes c bes c bes c bes8
		bes32\mp c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>1\mp
}
kytaraCh = \chordmode {
	es f:m7 bes es
	es f:m7 bes es
}


basa = \relative es, {
	\clef "bass_8"
	\key es \major
	\time 4/4
	
	es4\mp \grace { g16 } es4 es \grace { g16 } es4
	f,4\mp \grace { as16[ c] } f,4 f \grace { as16 } f4
	bes4\mp \grace { f'16 } bes,4 bes \grace { f'16 } bes,4
	<< g1\mp \\ { r2 \grace { bes16\p[ es] } g2\mf } >>
	
	es4\mp \grace { g16 } es4 es \grace { g16 } es4
	f,4\mp \grace { as16[ c] } f,4 f \grace { as16 } f4
	bes4\mp \grace { f'16 } bes,4 bes \grace { f'16 } bes,4
	<< g1\mp \\ { r2 \grace { bes16\p[ es] } g2\mf } >>
	
	r1
}


kopak = \drummode {
	\time 4/4
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda2 bda16 bda8. r4
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda2 bda16 bda8. r4
}


bubny = \drummode {
	\time 4/4
	
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timh16 timh timh timh timh timh timh32 timh timh timh
		timh16 timh timh timh timh timh timh32 timh timh timh
	ssl1
	
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timh16 timh timh timh timh timh timh32 timh timh timh
		timh16 timh timh timh timh timh timh32 timh timh timh
	ssl1
}


cinely = \drummode {
	\time 4/4
	
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	r1
	
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
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

