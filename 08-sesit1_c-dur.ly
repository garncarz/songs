\version "2.14.2"

\header {
	title = "Sešit č. 1 (C-dur)"
	composer = "Ondřej Garncarz"
}


hlavni = \relative c' {
	\clef treble
	\key c \major
	\time 4/4

	% T D
	<c e g c>4 a'8 <g c> <d g b d>4 c'8 <b d> |
	% VI T
	<c, a' c e>4 a'8 <c e> <c, e g c>2 |

	\repeat volta 2 {
		% II D6
		<< { <a' d f>2 <b d g> }  \\ { d,8 f d f d f d f } >> |
		% T T/VI
		<< <g c e>4 \\ { c,8 e } >> <c g' c e>4
		<< <c' e>2 \\ { <c, e>8 <c f> <e g> <e a> } >> |
	}

	\repeat volta 2 {
		% III VI
		<e g b g'>4 c'8 <b g'> <c, a' c e>4 a'8 <c e> |
	} \alternative { {
		% S T
		<f, a c f>4 d'8 <c f>
		\grace { e16 f } <c e g>4 \grace { e,16 f } <c e g>4 |
	} {
		% S T
		<f a c f>4 <g d'>8 <f a c f> <c e g c>2
	} }

	\bar "|."
}


\score {
	\new PianoStaff <<
		\set PianoStaff.instrumentName = "Piano "
		\set PianoStaff.shortInstrumentName = "P. "
		\new Staff \hlavni
	>>
		
	\layout { }
}

\score {
	\unfoldRepeats \hlavni
	\midi { }
}

