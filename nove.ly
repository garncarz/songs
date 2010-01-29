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
	<d f bes>
	<es bes' es>
	
	<es g bes>
	<es as c>
	<d as' c>
	<es g bes>
	
	<es g bes>
	<es as c>
	<d as' c>
	<es g bes>
	
	<es g bes>
	<es as c>
	<d f bes>
	<es bes' es>
	
	<es g bes>
	<es as c>
	<d f bes>
	<es bes' es>
	
	<es g bes>
	<es as c>
	<d as' c>
	<es g bes>
	
	<es g bes>
	<es as c>
	<d as' c>
	<es g bes>
	
	<es g bes>
	<es as c>
	<f bes d>
	<g bes es>
	
	<es g bes>
	<es as c>
	<f bes d>
	<g bes es>
	
	<es g bes>
	<es as c>
	<d as' c>
	<es g bes>
	
	<es g bes>
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
	as
	bes,
	g'
	
	es
	f,
	bes
	g
	
	es'
	f,
	bes
	g
	
	es'
	as,
	bes
	es
	
	es
	as,
	bes
	es
	
	es
	f,
	bes
	g
	
	es'
	f,
	bes
	g
	
	es'
	as,
	bes
	es
	
	es
	as,
	bes
	es
	
	es
	as
	bes,
	g'
	
	es
	as
	bes,
	g'
	
	es
	as,
	bes
	es
	
	es
	as,
	bes
	es
	
	es
	as,
	bes
	es
}
\addlyrics {
	T S D "T6"
	T "II7" D "T6"
	T "II7" D "T6"
	T S "D9/7" T
	T S "D9/7" T
	T "II7" D "T6"
	T "II7" D "T6"
	T S "D9/7" T
	T S "D9/7" T
	T S D "T6"
	T S D "T6"
	T S "D9/7" T
	T S "D9/7" T
	T S "D9/7" T
}
>>


piano = \relative es' {
	\clef treble
	\key es \major
	\time 4/4
	
	<es g bes>4\mf <es g bes>\p \grace { g16 } <es g bes>4 <es g bes>
	<es as c>4\mf <es as c>\p \grace { as16 } <es as c>4 <es as c>
	<f bes f'>4\mf <f bes f'>8\p <f bes f'> <f bes f'>4 <f bes f'>8 <f bes f'>
	<< { es'2\mf es, } \\ { <g bes>4\mf <f as>\p <g bes>\mf <f as>\p } >>
	
	<es g>16\mf <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mf <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mf <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mf <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <f f'>1\mf \\ { bes32\mf c\p bes c bes c bes c bes c bes c bes8
		bes32\mf c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>8\mf <es g bes>16\p <es g bes> <es bes' es>8.\mf <es g bes>16\p <es bes' es>8\mf <es g bes>16\p <es g bes> <es bes' es>8.\mf <es g bes>16\p
	
	<es g>16\mf <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mf <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mf <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mf <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <f f'>1\mf \\ { bes32\mf c\p bes c bes c bes c bes c bes c bes8
		bes32\mf c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>1\mf
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <as c>1\mf \\ { bes,2 bes\f } >>
	<es g bes>4\mf <bes g' es'>\p <es g bes>4\mf <bes g' es'>\p
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <as c>1\mf \\ { bes,2 bes\f } >>
	<es g bes>4\mf <bes g' es'>\p <es g bes>4\mf <bes g' es'>\p
	
	<es g>16\mf <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mf <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mf <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mf <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <f f'>1\mf \\ { bes32\mf c\p bes c bes c bes c bes c bes c bes8
		bes32\mf c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>8\mf <es g bes>16\p <es g bes> <es bes' es>8.\mf <es g bes>16\p <es bes' es>8\mf <es g bes>16\p <es g bes> <es bes' es>8.\mf <es g bes>16\p
	
	<es g>16\mf <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mf <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mf <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mf <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <f f'>1\mf \\ { bes32\mf c\p bes c bes c bes c bes c bes c bes8
		bes32\mf c\p bes c bes c bes c bes c bes c bes c bes c } >>
	<es, bes' es>1\mf
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <as c>1\mf \\ { bes,2 bes\f } >>
	<es g bes>4\mf <bes g' es'>\p <es g bes>4\mf <bes g' es'>\p
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <as c>1\mf \\ { bes,2 bes\f } >>
	<es g bes>4\mf <bes g' es'>\p <es g bes>4\mf <bes g' es'>\p
	
	<es g bes>4\mf <es g bes>\p \grace { g16 } <es g bes>4 <es g bes>
	<es as c>4\mf <es as c>\p \grace { as16 } <es as c>4 <es as c>
	<f bes f'>4\mf <f bes f'>8\p <f bes f'> <f bes f'>4 <f bes f'>8 <f bes f'>
	<< { es'2\mf es, } \\ { <g bes>4\mf <f as>\p <g bes>\mf <f as>\p } >>
	
	<es g bes>4\mf <es g bes>\p \grace { g16 } <es g bes>4 <es g bes>
	<es as c>4\mf <es as c>\p \grace { as16 } <es as c>4 <es as c>
	<f bes f'>4\mf <f bes f'>8\p <f bes f'> <f bes f'>4 <f bes f'>8 <f bes f'>
	<< { es'2\mf es, } \\ { <g bes>4\mf <f as>\p <g bes>\mf <f as>\p } >>
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <as c>1\mf \\ { bes,2 bes\f } >>
	<es g bes>4\mf <bes g' es'>\p <es g bes>4\mf <bes g' es'>\p
	
	<es g bes>2\mf <es g bes>8\p <es g bes>\mf <es g bes>4\f
	<es as c>2\mf <es as c>8\p <es as c>\mf <es as c>4\f
	<< <as c>1\mf \\ { bes,2 bes\f } >>
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
	es,32\mf f es f <bes es>8\mp bes32\mf c bes c <es, es'>8\mp es32\mf f es f <bes es>8\mp bes32\mf c bes c <es, es'>8\mp
	
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
	<d, as' c>8\mp <d f as>\p <d as' c>8\mp <d f as>\p
		<d as' c>\mp <d f as>\p <d as' c>8\mp <d f as>\p
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
	<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
	
	<es g>16\mp <es bes>\p <g bes> <es es'> <es es'> <g bes> <es bes> <es g>
		<es g>16\mp <bes bes'>\p <g' es'> <es bes'> <es bes'> <g es'> <bes, bes'> <es g>
	<es as>16\mp <es c>\p <as c> <es es'> <es es'> <as c> <es c> <es as>
		<es as>16\mp <c c'>\p <as' es'> <es c'> <es c'> <as es'> <c, c'> <es as>
	<< <d f>1\mp \\ { bes'32\mp c\p bes c bes c bes c bes c bes c bes8
		bes32\mp c\p bes c bes c bes c bes c bes c bes c bes c } >>
	es,32\mf f es f <bes es>8\mp bes32\mf c bes c <es, es'>8\mp es32\mf f es f <bes es>8\mp bes32\mf c bes c <es, es'>8\mp
	
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
	<d, as' c>8\mp <d f as>\p <d as' c>8\mp <d f as>\p
		<d as' c>\mp <d f as>\p <d as' c>8\mp <d f as>\p
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
	<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
		<< es'8\mp \\ { <bes, es g>16 <bes es g>\p } >>
		<< g''8\mp \\ { <bes,, es g>16 <bes es g>\p } >>
	
	<es g bes>16\mp <g bes es>\p <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es>
		<es g bes>\mp <g bes es>\p <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es>
	<es as c>16\mp <as c es>\p <es as c> <as c es> <es as c> <as c es> <es as c> <as c es>
		<es as c>\mp <as c es>\p <es as c> <as c es> <es as c> <as c es> <es as c> <as c es>
	<f bes d>16\mp <bes d f>\p <f bes d> <bes d f> <f bes d>4
		<f bes d>16\mp <bes d f>\p <f bes d> <bes d f> <f bes d>4
	<g bes es>8\mp <g bes es>\p <f as es'>\mp <f as es'>\p
		<es g bes>\mp <es g bes>\p <es f as>\mp <es f as>\p
	
	<es g bes>16\mp <g bes es>\p <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es>
		<es g bes>\mp <g bes es>\p <es g bes> <g bes es> <es g bes> <g bes es> <es g bes> <g bes es>
	<es as c>16\mp <as c es>\p <es as c> <as c es> <es as c> <as c es> <es as c> <as c es>
		<es as c>\mp <as c es>\p <es as c> <as c es> <es as c> <as c es> <es as c> <as c es>
	<f bes d>16\mp <bes d f>\p <f bes d> <bes d f> <f bes d>4
		<f bes d>16\mp <bes d f>\p <f bes d> <bes d f> <f bes d>4
	<g bes es>8\mp <g bes es>\p <f as es'>\mp <f as es'>\p
		<es g bes>\mp <es g bes>\p <es f as>\mp <es f as>\p
	
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
	es as bes es
	es f:m7 bes es
	es f:m7 bes es
	es as bes:9 es
	es as bes:9 es
	es f:m7 bes es
	es f:m7 bes es
	es as bes:9 es
	es as bes:9 es
	es as bes es
	es as bes es
	es as bes:9 es
	es as bes:9 es
	es as bes:9 es
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
	
	es4\mp \grace { g16 } es4 es \grace { g16 } es4
	f,4\mp \grace { as16[ c] } f,4 f \grace { as16 } f4
	bes4\mp \grace { f'16 } bes,4 bes \grace { f'16 } bes,4
	<< g1\mp \\ { r2 \grace { bes16\p[ es] } g2\mf } >>
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	<< { es4\mp es,\p es'\mp es,\p } \\ { r8 g'16 bes r8 g,16 bes r8 g'16 bes r8 g,16 bes } >>
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	<< { es4\mp es,\p es'\mp es,\p } \\ { r8 g'16 bes r8 g,16 bes r8 g'16 bes r8 g,16 bes } >>
	
	es4\mp \grace { g16 } es4 es \grace { g16 } es4
	f,4\mp \grace { as16[ c] } f,4 f \grace { as16 } f4
	bes4\mp \grace { f'16 } bes,4 bes \grace { f'16 } bes,4
	<< g1\mp \\ { r2 \grace { bes16\p[ es] } g2\mf } >>
	
	es4\mp \grace { g16 } es4 es \grace { g16 } es4
	f,4\mp \grace { as16[ c] } f,4 f \grace { as16 } f4
	bes4\mp \grace { f'16 } bes,4 bes \grace { f'16 } bes,4
	<< g1\mp \\ { r2 \grace { bes16\p[ es] } g2\mf } >>
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	<< { es4\mp es,\p es'\mp es,\p } \\ { r8 g'16 bes r8 g,16 bes r8 g'16 bes r8 g,16 bes } >>
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	<< { es4\mp es,\p es'\mp es,\p } \\ { r8 g'16 bes r8 g,16 bes r8 g'16 bes r8 g,16 bes } >>
	
	f'16\mp es\p es8 f16\mp es8\p r16 f\mp es\p es8 f16\mp es\p es8
	bes16\mp as\p as8 bes16\mp as8\p r16 bes\mp as\p as8\mp bes16\p as as8
	g16\mp bes\p bes8 g16\mp bes8\p r16 g\mp bes\p bes8 g16\mp bes\p bes8
	g'16\mp es\p es8 g16\mp es8\p r16 g\mp es\p es8 g16\mp es\p es8
	
	f16\mp es\p es8 f16\mp es8\p r16 f\mp es\p es8 f16\mp es\p es8
	bes16\mp as\p as8 bes16\mp as8\p r16 bes\mp as\p as8\mp bes16\p as as8
	g16\mp bes\p bes8 g16\mp bes8\p r16 g\mp bes\p bes8 g16\mp bes\p bes8
	g'16\mp es\p es8 g16\mp es8\p r16 g\mp es\p es8 g16\mp es\p es8
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	<< { es4\mp es,\p es'\mp es,\p } \\ { r8 g'16 bes r8 g,16 bes r8 g'16 bes r8 g,16 bes } >>
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	<< { es4\mp es,\p es'\mp es,\p } \\ { r8 g'16 bes r8 g,16 bes r8 g'16 bes r8 g,16 bes } >>
	
	<< es1\mp \\ { r16 g\p[ bes g bes\mp g\p bes g bes\mp] r bes\p r bes\mp r bes\p r } >>
	<< as,1\mp \\ { r16 c\p[ es c es\mp c\p es c es\mp] r es\p r es\mp r es\p r } >>
	<< bes1\mp \\ { f'16\mp r f\p r f\mp r f\p r f\mp r f\p r f\mp r f\p r } >>
	es1\mp
	
	r1
}


kopak = \drummode {
	\time 4/4
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda2 bda16 bda8. r4

	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda2 bda16 bda8. r4

	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	bda4 bda bda16 bda8. bda4
	
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda32 bda16. r8 bda32 bda16. r8 bda4 bda32 bda16. r8
	bda1
}


bubny = \drummode {
	\time 4/4
	
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timh16 timh timh timh timh timh timh32 timh timh timh
		timh16 timh timh timh timh timh timh32 timh timh timh
	timl16 timl ssl ssl ssl32 ssl r16 timl16 timl timl16 timl ssl ssl ssl32 ssl r16 timl16 timl
	
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timh16 timh timh timh timh timh timh32 timh timh timh
		timh16 timh timh timh timh timh timh32 timh timh timh
	ssl1
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	toml16 tamb toml tamb toml tamb toml32 toml toml toml
		toml16 tamb toml tamb toml tamb toml32 toml toml toml
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	toml16 tamb toml tamb toml tamb toml32 toml toml toml
		toml16 tamb toml tamb toml tamb toml32 toml toml toml
	
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timh16 timh timh timh timh timh timh32 timh timh timh
		timh16 timh timh timh timh timh timh32 timh timh timh
	timl16 timl ssl ssl ssl32 ssl r16 timl16 timl timl16 timl ssl ssl ssl32 ssl r16 timl16 timl
	
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
		timl32 timl timl16 timl32 timl timl16 timl32 timl timl timl timl16 timl
	timh16 timh timh timh timh timh timh32 timh timh timh
		timh16 timh timh timh timh timh timh32 timh timh timh
	ssl1
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	toml16 tamb toml tamb toml tamb toml32 toml toml toml
		toml16 tamb toml tamb toml tamb toml32 toml toml toml
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	toml16 tamb toml tamb toml tamb toml32 toml toml toml
		toml16 tamb toml tamb toml tamb toml32 toml toml toml
	
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl timl8 timl16 timl
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	toml16 tamb toml tamb toml tamb toml32 toml toml toml
		toml16 tamb toml tamb toml tamb toml32 toml toml toml
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	toml16 tamb toml tamb toml tamb toml32 toml toml toml
		toml16 tamb toml tamb toml tamb toml32 toml toml toml
	
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml tomml8 toml16 toml
	ssl1
}


cinely = \drummode {
	\time 4/4
	
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh4 hh16 hh hh hh hh4 hh16 hh hh hh
	
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	cymc4 cymr32 cymr cymr cymr cymc8 cymc4 cymr32 cymr cymr cymr cymc8
	
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	r1
	
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	tamb8. tamb32 tamb tamb16 tamb tamb tamb tamb8. tamb32 tamb tamb16 tamb tamb tamb
	cymc8. hho32 hho cymc8. hho32 hho cymc8. hho32 hho cymc4
	
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	tamb8. tamb32 tamb tamb16 tamb tamb tamb tamb8. tamb32 tamb tamb16 tamb tamb tamb
	cymc8. hho32 hho cymc8. hho32 hho cymc8. hho32 hho cymc4
	
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	cymc4 cymr32 cymr cymr cymr cymc8 cymc4 cymr32 cymr cymr cymr cymc8
	
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	hh16 cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr hh cymr
	r1
	
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	tamb8. tamb32 tamb tamb16 tamb tamb tamb tamb8. tamb32 tamb tamb16 tamb tamb tamb
	cymc8. hho32 hho cymc8. hho32 hho cymc8. hho32 hho cymc4
	
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	tamb8. tamb32 tamb tamb16 tamb tamb tamb tamb8. tamb32 tamb tamb16 tamb tamb tamb
	cymc8. hho32 hho cymc8. hho32 hho cymc8. hho32 hho cymc4
	
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh4 hh16 hh hh hh hh4 hh16 hh hh hh
	
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh8. hh32 hh hh16 hh hh hh hh8. hh32 hh hh16 hh hh hh
	hh4 hh16 hh hh hh hh4 hh16 hh hh hh
	
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	tamb8. tamb32 tamb tamb16 tamb tamb tamb tamb8. tamb32 tamb tamb16 tamb tamb tamb
	cymc8. hho32 hho cymc8. hho32 hho cymc8. hho32 hho cymc4
	
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	cymc8. hho32 hho hho16 hho hho hho cymc8. hho32 hho hho16 hho hho hho
	tamb8. tamb32 tamb tamb16 tamb tamb tamb tamb8. tamb32 tamb tamb16 tamb tamb tamb
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

