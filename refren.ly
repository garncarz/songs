\version "2.10.33"


% Es-Dur:
% es - f - g ^ as - b - c - d ^ es


harmonieNahore = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	<es g bes>1
	<es as c>
	<d as' c>
	<es g bes>
	
	<es g bes>
	<es as c>
	<d as' c>
	<es g bes>
}


harmonieDole = <<
\relative es {
	\clef bass
	\key es \major
	\time 4/4

	es1
	as,
	bes
	es
	
	es1
	as,
	bes
	es
}
\addlyrics {
	T S "D9/7" T
	T S "D9/7" T
}
>>


idiofTri = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	es4 g bes es,
	c' as es as
	c,8 f16 f as8 bes c bes16 bes as8 f8
	es4 bes' g bes
	
	<es, bes'>4 g <g bes> es
	<es c'> as <es c'> as
	c, bes'32 c bes c bes c bes c bes'32 c bes c bes c bes c bes'32 c bes c bes c bes c
}


idiofDva = \relative es' {
	\clef treble
	\key es \major
	\time 4/4

	es2 g16 as bes r es4
	as2 f16 es c r as4
	bes,8 bes' bes, bes' f bes bes, bes'
	<es, g>4 es' <es, g> es'
	
	es,4. f8 <g g'>16 <as as'> <bes bes'> r es4
	as4. g8 <f f,>16 <es es,> <c c,> r as4
	bes,16 es32 f es f bes16 bes,16 es32 f es f bes16 bes,16 f' f bes16 bes,16 es32 f es f bes16
	es,8 es es es es es es es
}


idiof = \relative es' {
	\clef treble
	\key es \major
	\time 4/4

	es8 f16 g es4 g8 as16 bes g4
	as8 bes16 c as4 c8 bes16 as c4
	r1
	r
	
	es,8 << es'4. \\ { f,16 g es4 } >> g8 << es'4. \\ { as,16 bes g4 } >>
	as8 << as'4. \\ { bes,16 c as4 } >> c8 << as'4. \\ { bes,16 as c4 } >>
	f,4 ~f16 c' bes c r4 r16 c bes c
	c,128 d e f g a b c r16 r8 c,128 d e f g a b c r16 r8 c,128 d e f g a b c r16 r8
		c,128 d e f g a b c c,128 d e f g a b c c,128 d e f g a b c c,128 d e f g a b c
}


piano = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <as c>1\mf \\ { bes,2 bes\f } >>
	% <es g bes>1\mf
	<es g bes>4\mf <bes g' es'>\p <es g bes>4\mf <bes g' es'>\p
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <as c>1\mf \\ { bes,2 bes\f } >>
	<es g bes>1\mf
}


kytara = \relative es {
	\clef "treble_8"
	\key es \major
	\time 4/4
	
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
	<d, as' c>8\mp <d f as>\p <d as' c>8\mp <d f as>\p
		<d as' c>\mp <d f as>\p <d as' c>8\mp <d f as>\p
	% <bes es g>1\mp
	<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
	
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
	<d, as' c>8\mp <d f as>\p <d as' c>8\mp <d f as>\p
		<d as' c>\mp <d f as>\p <d as' c>8\mp <d f as>\p
	<bes es g>1\mp
}
kytaraCh = \chordmode {
	es as bes:9 es
	es as bes:9 es
}


basa = \relative es, {
	\clef "bass_8"
	\key es \major
	\time 4/4
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	% es1\mp
	<< { es4\mp es,\p es'\mp es,\p } \\ { r8 g'16 bes r8 g,16 bes r8 g'16 bes r8 g,16 bes } >>
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	es1\mp
	
	r1
}


kopak = \drummode {
	\time 4/4

	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	% bda1
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda1
}


bubny = \drummode {
	\time 4/4
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	% ssl1
	toml16 tamb toml tamb toml tamb toml32 toml toml toml
		toml16 tamb toml tamb toml tamb toml32 toml toml toml
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	ssl1
}


cinely = \drummode {
	\time 4/4
	
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	tamb8. tamb32 tamb tamb16 tamb tamb tamb tamb8. tamb32 tamb tamb16 tamb tamb tamb
	% cymc1
	cymc8. hho32 hho cymc8. hho32 hho cymc8. hho32 hho cymc4
	
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	tamb8. tamb32 tamb tamb16 tamb tamb tamb tamb8. tamb32 tamb tamb16 tamb tamb tamb
	cymc1
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
			\set Staff.instrumentName = "Idiofon "
			\set Staff.shortInstrumentName = "I. "
			\idiof
		}
		
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
			\set Staff.midiInstrument = #"glockenspiel"
			\set Staff.midiMinimumVolume = #0.7
			\set Staff.midiMaximumVolume = #0.8
			\idiof
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

