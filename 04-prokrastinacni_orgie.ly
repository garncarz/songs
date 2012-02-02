\version "2.10.33"

\header {
	title = "Prokrastinační orgie"
	composer = "Ondřej Garncarz"
}


% F-Dur:
% f - g - a ^ b - c - d - e ^ f

% f-moll:
% f - g ^ as - b - c ^ des - es - f

% c-moll:
% c - d ^ es - f - g ^ as - b - c

% g-moll:
% g - a ^ b - c - d ^ es - f - g


linka = \relative f, {
	\clef bass
	\key f \major
	\time 4/4
	
	\tempo 4=180
	f4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	c2 \key f \minor des,
	
	f4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	\key c \minor g,2 c
	g4 c g c
	\key g \minor d2 g,
	g4 d' g, d'
	\key f \major c2 f
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	f,4 c' f, c'
	f, c' f, c'
	d, d' d, d'
	d, d' d, d'
	
	c2 \key f \minor des,
	
	f4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	f,4 c' f, c'
	f,4 c' f, c'
	des, des' des, des'
	des, des' des, des'
	
	es,4 bes' es, bes'
	es,4 bes' es, bes'
	c, c' c, c'
	c, c' c, c'
	
	des,4 as' des, as'
	des,4 as' des, as'
	bes, \> bes' bes, bes'
	bes, bes' bes, bes' \!
}


pianoNahore = \relative f' {
	\clef treble
	\key f \major
	\time 4/4
	
	R1 * 4
	
	<f a c>1
	\grace{c8} <a' c f>1
	\grace{d,8} <a' d f>1
	<f a d>
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>
	<f a d>
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <bes d f>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <bes d f>2.
	<f a d>1
	
	<f a c>4 <c e g>2 <c e g>4
	\grace{f'8} <f, a c>1
	<a d f>4 <f bes d>2 <f bes d>4
	\grace{d8} <f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <bes d f>2.
	<f a d>1
	
	<g c e>2 \key f \minor <f as f'>
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <f bes des>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <bes des f>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <f bes des>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <f bes des>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <bes des f>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <f bes des>2.
	<f as des>1
	
	\key c \minor <bes d g>2 <g c es>
	<bes d g>4 <g c es>2.
	\key g \minor <f a d>2 \grace{c'8} <g bes d>2
	<f a d>4 \grace{c'8} <g bes d>2.
	\key f \major <e g c>2 <f a c>4 <f bes d>
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <bes d f>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <bes d f>2.
	<f a d>1
	
	<f a c>4 <c e g>2 <c e g>4
	\grace{f'8} <f, a c>1
	<a d f>4 <f bes d>2 <f bes d>4
	\grace{d8} <f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <f bes d>2.
	<f a d>1
	
	<f a c>4 <c e g>2.
	<f a c>1
	<a d f>4 <bes d f>2.
	<f a d>1
	
	<g c e>2 \key f \minor <f as f'>
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <f bes des>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <bes des f>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <f bes des>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <f bes des>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <bes des f>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <f bes des>2.
	<f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	\grace{f8 as c} <f, as c>1
	<as des f>4 <f bes des>2.
	\grace{des'8 as f} <f as des>1
	
	<f as c>4 \grace{bes8} <e, g c>2.
	<f as c>1
	<as des f>4 <bes des f>2.
	<f as des>1
	
	<es g bes>4 \grace{as8} <des, f bes>2.
	<es g bes>1
	<g c es>4 <as c es>2.
	<es g c>1
	
	<des f as>4 \grace{g8} <c, es as>2.
	<des f as>1
	<f bes des>4 \> <g bes des>2.
	<des f bes >1 s \!
}


zpev = \relative f' {
	\clef treble
	\key f \major
	\time 4/4
	
	R1 * 20
	
	f4 g c g
	f a c a
	d,2 bes'
	f4 d a'2
	
	f4 g c g
	f a c a
	d,2 bes'
	f4 d a'2
	
	c,2 e
	f c'4 c
	d2 bes4 bes
	f g c g
	
	R1 * 4
	
	f4 g c g
	f a c a
	d,2 bes'
	f4 d a'2
	
	f4 g c g
	f a c a
	d,2 bes'
	f4 d a'2
	
	c,2 e
	f c'4 c
	d2 bes4 bes
	f g c g
	
	R1 * 5
	
	\key f \minor
	c1
	r
	as4 des f2
	r1
	
	c1
	f,
	as2 bes4 f
	des'1
	
	c1
	r
	as4 des f2
	r1
	
	c1
	f,
	as2 bes4 f
	des'1
	
	R1 * 13
	
	\key f \major
	f,4 g c g
	f a c a
	d,2 bes'
	f4 d a'2
	
	f4 g c g
	f a c a
	d,2 bes'
	f4 d a'2
	
	c,2 e
	f c'4 c
	d2 bes4 bes
	f g c g
	
	R1 * 4
	
	f4 g c g
	f a c a
	d,2 bes'
	f4 d a'2
	
	f4 g c g
	f a c a
	d,2 bes'
	f4 d a'2
	
	c,2 e
	f c'4 c
	d2 bes4 bes
	f g c g
	
	R1 * 5
	
	\key f \minor
	c1
	r
	as4 des f2
	r1
	
	c1
	f,
	as2 bes4 f
	des'1
	
	c1
	r
	as4 des f2
	r1
	
	c1
	f,
	as2 bes4 f
	des'1
}


\score {
	<<
		\new Staff {
			\set Staff.instrumentName = "Bas "
			\set Staff.shortInstrumentName = "B. "
			\set Staff.midiInstrument = #"acoustic grand"
			\linka
		}
		
		\new Staff {
			\set Staff.instrumentName = "Piano "
			\set Staff.shortInstrumentName = "P. "
			\set Staff.midiInstrument = #"bright acoustic"
			\pianoNahore
		}
		
		\new Staff {
			\set Staff.instrumentName = "Zpěv "
			\set Staff.shortInstrumentName = "Z. "
			\set Staff.midiInstrument = #"violin"
			\zpev
		}
	>>
	
	\layout { }
	
	\midi {	}
}

