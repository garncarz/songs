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
	
	<es g bes>4\mf <es g bes>\p \grace { f16 } <es g bes>4 <es g bes>
	<es as c>4\mf <es as c>\p \grace { bes'16 } <es, as c>4 <es as c>
	<f bes d>4\mf <f bes d>8\p <f bes d> <f bes d>4 <f bes d>8 <f bes d>
	<< { es'2\mf es, } \\ { <g bes>4\mf <f as>\p <g bes>\mf <f as>\p } >>
	
	<es g>16\mf <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
	<es g>16\mf <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mf <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
	<es as>16\mf <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <d f>1\mf \\ { bes'32\mf c\p bes c bes c bes c bes c bes c bes8
		bes32\mf c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>1\mf
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <c as' bes>1\mf \\ { r2 d\f } >>
	<bes es g>1\mf
}


kytara = \relative es {
	\clef "treble_8"
	\key es \major
	\time 4/4
		
	<es g bes>16\mp <g bes es>\p <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es>
		<es g bes>\mp <g bes es>\p <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es>
	<es as c>16\mp <as c es>\p <es as c> <as c es> <es as c> <as c es> <es as c> <as c es>
		<es as c>\mp <as c es>\p <es as c> <as c es> <es as c> <as c es> <es as c> <as c es>
	<f bes d>16\mp <bes d f>\p <f bes d> <bes d f> <f bes d>4
		<f bes d>16\mp <bes d f>\p <f bes d> <bes d f> <f bes d>4
	<g bes es>8\mp <g bes es>\p <f as es'>\mp <f as es'>\p
		<es g bes>\mp <es g bes>\p <es f as>\mp <es f as>\p
		
	<es g>16\mp <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mp <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mp <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mp <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <d f>1\mp \\ { bes'32\mp c\p bes c bes c bes c bes c bes c bes8
		bes32\mp c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>1\mp
	
	<< bes'8\mp \\ { es,16\mp f\p } >>
		<< <es g>8\p \\ { bes'16 es } >>
		<< es,8 \\ { bes'16 bes } >>
		<< <bes es>8 \\ { es,16 g } >>
		<< bes8 \\ { es,16 f } >>
		<< <es g>8 \\ { bes'16 es } >>
		<< es,8 \\ { bes'16 bes } >>
		<< <bes es>8 \\ { es,16 g } >>
	<< c8\mp \\ { es,16\mp f\p } >>
		<< <es as>8\p \\ { c'16 es } >>
		<< es,8 \\ { c'16 c } >>
		<< <c es>8 \\ { es,16 as } >>
		<< c8 \\ { es,16 f } >>
		<< <es as>8 \\ { c'16 es } >>
		<< es,8 \\ { c'16 c } >>
		<< <c es>8 \\ { es,16 as } >>
	<bes, d bes'>8\mp <c d as'>\p <bes d bes'>\mp <c d as'>\p
		<bes d bes'>\mp <c d as'>\p <bes d bes'>\mp <c d as'>\p
	<bes es g>1\mp
}
kytaraCh = \chordmode {
	% r1 as bes g:9
	% es as bes g:9
}


basa = \relative es, {
	\clef "bass_8"
	\key es \major
	\time 4/4
	
	f16\mp es\p es8 f16\mp es8\p r16 f\mp es\p es8 f16\mp es\p es8
	bes16\mp as\p as8 bes16\mp as8\p r16 bes\mp as\p as8\mp bes16\p as as8
	g16\mp bes\p bes8 g16\mp bes8\p r16 g\mp bes\p bes8 g16\mp bes\p bes8
	g'16\mp es\p es8 g16\mp es8\p r16 g\mp es\p es8 g16\mp es\p es8
	
	es4\mp \grace { g16 } es4 es \grace { g16 } es4
	f,4\mp \grace { as16[ c] } f,4 f \grace { as16 } f4
	bes4\mp \grace { f'16 } bes,4 bes \grace { f'16 } bes,4
	<< g1\mp \\ { r2 \grace { bes16\p[ es] } g2\mf } >>
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	es,1\mp
	
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

