\version "2.10.33"

\header {
	title = "Pop G-dur"
	composer = "Ondřej Garncarz"
}


% G-dur:
% g - a - h ^ c - d - e - fis ^ g


piano = \relative g' {
	\clef treble
	\key g \major
	\time 2/4
	
	<d g b>2
	<g b d>
	<fis a d>
	<d fis a>
	
	<e g b>2
	<g b e>
	<fis a d>
	<d fis a>
	
	r2
	
	g8. b16 g8. d16
	<g b>8. c16 <b d>8. c16
	<a d>8. g16 <fis a>8. g16
	<d fis>8. g16 <fis a>8. g16
	
	<g b>8. fis16 <e g>8. fis16
	<g b>8. d'16 <b e>8. d16
	<fis, a d>8 <fis a d>4.
	<d fis a>2
	
	<g b>8. e16 <d g>8. e16
	<g b>8. c16 <b d>8. c16
	<a d>8. g16 <fis a>8. g16
	<d fis>8. g16 <fis a>8. g16
	
	<g b>8. fis16 <e g>8. fis16
	<g b>8. d'16 <b e>8. d16
	<fis, a d>8 <fis a d>4.
	<d fis a>2
	
	<g b>8. e16 <d g>8. e16
	<g b>8. c16 <b d>8. c16
	<a d>8. g16 <fis a>8. g16
	<d fis>8. g16 <fis a>8. g16
	
	<g b>8. \< fis16 <e g>8. fis16
	<g b>8. d'16 <b e>8. d16 \!
	<fis, a d>8 <fis a d>4.
	<d fis a>2
	
	g8. b16 g8. d16
	<g b>8. c16 <b d>8. c16
	<a d>8. g16 <fis a>8. g16
	<d fis>8. g16 <fis a>8. g16
	
	<g b>8. fis16 <e g>8. fis16
	<g b>8. d'16 <b e>8. d16
	<fis, a d>8 <fis a d>4.
	<d fis a>2
	
	<g b>8. e16 <d g>8. e16
	<g b>8. c16 <b d>8. c16
	<a d>8. g16 <fis a>8. g16
	<d fis>8. g16 <fis a>8. g16
	
	<g b>8. fis16 <e g>8. fis16
	<g b>8. d'16 <b e>8. d16
	<fis, a d>8 <fis a d>4.
	<d fis a>2
	
	R2*33
	
	g8. b16 g8. d16
	<g b>8. c16 <b d>8. c16
	<a d>8. g16 <fis a>8. g16
	<d fis>8. g16 <fis a>8. g16
	
	<g b>8. fis16 <e g>8. fis16
	<g b>8. d'16 <b e>8. d16
	<fis, a d>8 <fis a d>4.
	<d fis a>2
	
	<g b>8. e16 <d g>8. e16
	<g b>8. c16 <b d>8. c16
	<a d>8. g16 <fis a>8. g16
	<d fis>8. g16 <fis a>8. g16
	
	<g b>8. fis16 <e g>8. fis16
	<g b>8. d'16 <b e>8. d16
	<fis, a d>8 <fis a d>4.
	<d fis a>2
	
	<d g b>
}


saxofon = \relative g {
	\clef "treble_8"
	\key g \major
	\time 2/4
	
	R2*9
	
	r2
	b8 b4.
	a8 a4.
	fis8 fis4.
	
	g2
	b
	a
	a4 d
	
	g2
	c,8. b16 ~b4
	g8. a16 ~a4
	g8. fis16 ~fis4
	
	g8 r b4
	g8 r e4
	d2
	d'
	
	g2
	R2*7
	
	r2
	b,8 b4.
	a8 a4.
	fis8 fis4.
	
	g2
	b
	a
	a4 d
	
	g2
	c,8. b16 ~b4
	g8. a16 ~a4
	g8. fis16 ~fis4
	
	g8 r b4
	g8 r e4
	d2
	d'
	
	g2
	~g
	R2*7
	
	r2
	b,8 b4.
	a8 a4.
	fis8 fis4.
	
	g2
	b
	a
	a4 d
	
	g2
	c,8. b16 ~b4
	g8. a16 ~a4
	g8. fis16 ~fis4
	
	g8 r b4
	g8 r e4
	d2
	d'
	
	g2
	R2*7
	
	r2
	b,8 b4.
	a8 a4.
	fis8 fis4.
	
	g2
	b
	a
	a4 d
	
	g2
	c,8. b16 ~b4
	g8. a16 ~a4
	g8. fis16 ~fis4
	
	g8 r b4
	g8 r e4
	d2
	d'
	
	g,2
}


kytara = \relative g' {
	\clef treble
	\key g \major
	\time 2/4
	
	R2*50
	
	<d g b>4 \mp <d g b>
	<g b d> <g b d>
	<fis a d> <fis a d>
	<d fis a> <d fis a>
	
	<e g b>4 <e g b>
	<g b e> <g b e>
	<fis a d> <fis a d>
	<d fis a> <d fis a>
	
	<d g b>8 <d g b> <d g b> <d g b>
	<g b d> <g b d> <g b d> <g b d>
	<fis a d> <fis a d> <fis a d> <fis a d>
	<d fis a> <d fis a> <d fis a> <d fis a>
	
	<e g b>8 <e g b> <e g b> <e g b>
	<g b e> <g b e> <g b e> <g b e>
	<fis a d>8 \f <fis a d>4.
	<d fis a>2
	
	<d g b>8 \mp <d g b> <d g b> <d g b>
	<g b d> <g b d> <g b d> <g b d>
	<fis a d> <fis a d> <fis a d> <fis a d>
	<d fis a> <d fis a> <d fis a> <d fis a>
	
	<e g b>8 <e g b> <e g b> <e g b>
	<g b e> <g b e> <g b e> <g b e>
	<fis a d>8 \f <fis a d>4.
	<d fis a>2
	
	<d g b>8 \mp d <d g b> d
	<g b d> g <g b d> g
	<fis a d> fis <fis a d> fis
	<d fis a> d <d fis a> d
	
	<e g b>8 \< b' <e, g b> b'
	<g b e> e' <g, b e> e' \!
	<fis, a d> \> d' <fis, a d> d'
	<d, fis a> a' <d, fis a> a' \!
	
	<d, g b>8 <d g b> <d g b> <d g b>
	<g b d> <g b d> <g b d> <g b d>
	<fis a d> <fis a d> <fis a d> <fis a d>
	<d fis a> <d fis a> <d fis a> <d fis a>
	
	<e g b>8 <e g b> <e g b> <e g b>
	<g b e> <g b e> <g b e> <g b e>
	<fis a d>8 \f <fis a d>4.
	<d fis a>2
	
	<d g b>8 \mp <d g b> <d g b> <d g b>
	<g b d> <g b d> <g b d> <g b d>
	<fis a d> <fis a d> <fis a d> <fis a d>
	<d fis a> <d fis a> <d fis a> <d fis a>
	
	<e g b>8 <e g b> <e g b> <e g b>
	<g b e> <g b e> <g b e> <g b e>
	<fis a d>8 \f <fis a d>4.
	<d fis a>2
	
	<d g b>4 \mp <d g b>
}


bas = \relative g, {
	\clef bass
	\key g \major
	\time 2/4
	
	R2*9
	
	r2
	g
	d
	d
	
	e
	e
	d
	d
	
	g
	g
	d
	d
	
	e
	e
	d
	d
	
	g
	g
	d
	d
	
	e
	e
	d
	d
	
	r2
	g
	d
	d
	
	e
	e
	d
	d
	
	g
	g
	d
	d
	
	e
	e
	d
	d
	
	R2*9
	
	r2
	g
	d
	d
	
	e
	e
	d
	d
	
	g
	g
	d
	d
	
	e
	e
	d
	d
	
	g
	g
	d
	d
	
	e
	e
	d
	d
	
	r2
	g
	d
	d
	
	e
	e
	d
	d
	
	g
	g
	d
	d
	
	e
	e
	d
	d
	
	g
}


kopak = \drummode {
	\time 2/4
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	r2
	
	r2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	r2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	r2
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	r2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	r2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
	
	bda2
	bda
	bda
	bda
}


bubny = \drummode {
	\time 2/4
	
	R2*4
	
	ssl8 r ssl ssl
	ssl r ssl ssl
	ssl r ssl ssl
	ssl r ssl ssl
	
	r2
	
	r2
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 mar8 mar
	r4 mar8 mar
	r4 mar8 mar
	r4 mar8 mar
	
	r4 mar8 mar
	r4 mar8 mar
	r4 mar8 mar
	r4 ssl8 ssl
	
	r2
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	R2*8
	r4 ssl8 ssl
	
	r2
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 mar8 mar
	r4 mar8 mar
	r4 mar8 mar
	r4 mar8 mar
	
	r4 mar8 mar
	r4 mar8 mar
	r4 mar8 mar
	r4 ssl8 ssl
	
	r2
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
	r4 ssl8 ssl
}


cinely = \drummode {
	\time 2/4
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	r2
	
	r2
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	r2
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	r2
	
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	
	r2
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	ridecymbal8 ridecymbal r4
	
	r2
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
	
	hh8 hh hh hh
	hh hh hh hh
	hh hh hh hh
	hh hh hh hh
}


#(define BassDrumTable '(
	(acousticbassdrum default #f 0)
))

#(define DrumsTable '(
	(losidestick default #f -1)
	(maracas default #f 1)
))

#(define CymbalsTable '(
	(ridecymbal default #f -1)
	(hihat default #f 1)
))


oneLineStaff = {
	\override Staff.StaffSymbol #'line-positions = #'(0)
	\override Staff.BarLine #'bar-size = #3
}

twoLineStaff = {
	\override Staff.StaffSymbol #'line-positions = #'(-1 1)
	\override Staff.BarLine #'bar-size = #3
}


\score {
	<<
		\new Staff {
			\set Staff.instrumentName = "Piano "
			\set Staff.shortInstrumentName = "P. "
			\piano
		}
		
		\new Staff {
			\set Staff.instrumentName = "Saxofon "
			\set Staff.shortInstrumentName = "S. "
			\saxofon
		}
		
		\new Staff {
			\set Staff.instrumentName = "Kytara el. "
			\set Staff.shortInstrumentName = "K. "
			\kytara
		}
		
		\new Staff {
			\set Staff.instrumentName = "Bas "
			\set Staff.shortInstrumentName = "B. "
			\bas
		}
		
		\new DrumStaff {
			\oneLineStaff
			\set DrumStaff.drumStyleTable = #(alist->hash-table BassDrumTable)
			\set Staff.instrumentName = #"Kopák "
			\set Staff.shortInstrumentName = #"K. "
			
			\kopak
		}
		
		\new DrumStaff {
			\twoLineStaff
			\set DrumStaff.drumStyleTable = #(alist->hash-table DrumsTable)
			\set Staff.instrumentName = #"Bubny "
			\set Staff.shortInstrumentName = #"B. "
			
			\bubny
		}
		
		\new DrumStaff {
			\twoLineStaff
			\set DrumStaff.drumStyleTable = #(alist->hash-table CymbalsTable)
			\set Staff.instrumentName = #"Činely "
			\set Staff.shortInstrumentName = #"Č. "
			
			\cinely
		}
	>>
	
	\layout { }
}


\score {
	<<
		\new Staff {
			\set Staff.midiInstrument = #"bright acoustic"
			\piano
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"baritone sax"
			\saxofon
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"electric guitar (clean)"
			\kytara
		}
		
		\new Staff {
			\set Staff.midiInstrument = #"acoustic bass"
			\bas
		}
		
		\new DrumStaff <<
			\kopak
			\bubny
			\cinely
		>>
	>>
	
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 160 4)
		}
	}
}
