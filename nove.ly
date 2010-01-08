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
	
	<es g bes>4 <es g bes> \grace { f16 } <es g bes>4 <es g bes>
	<es as c>4 <es as c> \grace { bes'16 } <es, as c>4 <es as c>
	<f bes d>4 <f bes d>8 <f bes d> <f bes d>4 <f bes d>8 <f bes d>
	<< { es'2 es, } \\ { <g bes>4 <f as> <g bes> <f as> } >>
	
	<es g>16 <es bes> <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
	<es g>16 <bes bes'> <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16 <es c> <as c> <es es'> <es es'> <as c> <es c> <es as>
	<es as>16 <c c'> <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <d f>1 \\ { bes'32 c bes c bes c bes c bes c bes c bes8
		~bes32 c bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>1
	
	<es g bes>2 <es g bes>8 <es g bes> <es g bes>4
	<es as c>2 <es as c>8 <es as c> <es as c>4
	<< <c as' bes>1 \\ { r2 d } >>
	<bes es g>1
}


kytara = \relative es {
	\clef "treble_8"
	\key es \major
	\time 4/4
		
	<es g bes>16 <g bes es> <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es>
	<es as c>16 <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es> <es as c> <as c es>
	<f bes d>16 <bes d f> <f bes d> <bes d f> <f bes d>4 <f bes d>16 <bes d f> <f bes d> <bes d f> <f bes d>4
	<g bes es>8 <g bes es> <f as es'> <f as es'> <es g bes> <es g bes> <es f as> <es f as>
		
	<es g>16 <es bes> <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
	<es g>16 <bes bes'> <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16 <es c> <as c> <es es'> <es es'> <as c> <es c> <es as>
	<es as>16 <c c'> <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <d f>1 \\ { bes'32 c bes c bes c bes c bes c bes c bes8
		~bes32 c bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>1
	
	<< bes'8 \\ { es,16 f } >>
		<< <es g>8 \\ { bes'16 es } >>
		<< es,8 \\ { bes'16 bes } >>
		<< <bes es>8 \\ { es,16 g } >>
		<< bes8 \\ { es,16 f } >>
		<< <es g>8 \\ { bes'16 es } >>
		<< es,8 \\ { bes'16 bes } >>
		<< <bes es>8 \\ { es,16 g } >>
	<< c8 \\ { es,16 f } >>
		<< <es as>8 \\ { c'16 es } >>
		<< es,8 \\ { c'16 c } >>
		<< <c es>8 \\ { es,16 as } >>
		<< c8 \\ { es,16 f } >>
		<< <es as>8 \\ { c'16 es } >>
		<< es,8 \\ { c'16 c } >>
		<< <c es>8 \\ { es,16 as } >>
	% <c, d as'>1
	<bes, d bes'>8 <c d as'> <bes d bes'> <c d as'> <bes d bes'> <c d as'> <bes d bes'> <c d as'>
	<bes es g>1
}
kytaraCh = \chordmode {
	% r1 as bes g:9
	% es as bes g:9
}


basa = \relative es, {
	\clef "bass_8"
	\key es \major
	\time 4/4
	
	f16 es es8 f16 es8 r16 f es es8 f16 es es8
	bes16 as as8 bes16 as8 r16 bes as as8 bes16 as as8
	g16 bes bes8 g16 bes8 r16 g bes bes8 g16 bes bes8
	g'16 es es8 g16 es8 r16 g es es8 g16 es es8
	
	es4 \grace { g16 } es4 es \grace { g16 } es4
	f,4 \grace { as16[ c] } f,4 f \grace { as16 } f4
	bes4 \grace { f'16 } bes,4 bes \grace { f'16 } bes,4
	<< g1 \\ { r2 \grace { bes16[ es] } g2 } >>
	
	<< es1 \\ { r16 g[ bes g bes g bes g bes] r bes r bes r bes r } >>
	<< as,1 \\ { r16 c[ es c es c es c es] r es r es r es r } >>
	<< bes1 \\ { r16 f' r f r f r f r f r f r f r f } >>
	es,1
	
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
		
		%{
		\new DrumStaff {
			\set Staff.instrumentName = "Perkuse "
			\set Staff.shortInstrumentName = "Pk. "
			\bici
		}
		%}
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
		
		\new DrumStaff {
			% \bici
		}
	>>
	
	\midi { }
}

