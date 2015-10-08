\version "2.18.2"

\header {
    title = "E major"
    composer = "Ondřej Garncarz"
}


piano = \relative e' {
    \clef treble
    \key e \major
    \time 4/4
    \tempo 4 = 120

    % T
    e4 << b' \\ { r8 gis } >> << e'2 \\ { e,4 a8 gis } >> |

    \repeat volta 2 {
        % T (II) Tsus4
        <e e'>4 fis << e'2 \\ { \tuplet 6/8 { a,16 gis a gis a gis } } >> |

        % S (II) Ssus2
        a4 fis << e'2 \\ { \tuplet 6/8 { b16 cis b cis b cis } } >> |

        % T (II) Tsus4
        <e, e'>4 fis << e'2 \\ { \tuplet 6/8 { a,16 gis a gis a gis } } >> |

        % D (III) Dsus2
        b4 gis << fis'2 \\ { \tuplet 6/8 { cis16 dis cis dis cis dis } } >> |
    }

    % T (II) Tsus4
    <e, e'>4 fis << e'2 \\ { \tuplet 6/8 { a,16 gis a gis a gis } } >> |

    % S (II) Ssus2
    a4 fis << e'2 \\ { \tuplet 6/8 { b16 cis b cis b cis } } >> |

    % T (II) Tsus4
    <e, e'>4 fis << e'2 \\ { \tuplet 6/8 { a,16 gis a gis a gis } } >> |

    % D (III) Dsus2
    b4 gis << fis'2 \\ { \tuplet 6/8 { cis16 dis cis dis cis dis } } >> |

    % T
    r4 e,

    \bar "|."
}


bass = \relative e, {
    \clef bass
    \key e \major
    \time 4/4

    r1 |

    \repeat volta 2 {
        e4-. e'-. a,-. e'-. |
        \grace cis16 a4 \grace e'16 a4 b,-. a-. |
        \grace gis16 e4 \grace b'16 e4 a,-. e'-. |
        b4-. b'-. cis,-. b'-. |
    }

    e,,8 e e' e a, a e' e |
    \grace cis16 a8 a \grace e'16 a8 a b, b a a |
    \grace gis16 e8 e \grace b'16 e8 e a, a e' e |
    b8 b b' b cis, cis b' b |

    r4 e,,8
}


guitar = \relative e' {
    \clef treble
    \key e \major
    \time 4/4

    r1 |

    \repeat volta 2 {
        r2 \tuplet 6/8 { a16 gis a gis a gis } |
        r2 \tuplet 6/8 { b16 cis b cis b cis } |
        r2 \tuplet 6/8 { a16 gis a gis a gis } |
        r2 \tuplet 6/8 { dis'16 dis dis dis dis dis } |
    }

    \tuplet 6/8 { a16 gis a gis a gis } a4 e |
    \tuplet 6/8 { b'16 cis b cis b cis } b,4 a' |
    \tuplet 6/8 { a16 gis a gis a gis } a4 e |
    cis'-. cis-. dis-. dis-. |

    <e, gis b e>2
}


\score {
    <<
        \new Staff {
            \set Staff.instrumentName = "Piano "
            \set Staff.shortInstrumentName = "P. "
            \set Staff.midiInstrument = #"electric grand"
            \piano
        }

        \new Staff {
            \set Staff.instrumentName = "Bass "
            \set Staff.shortInstrumentName = "B. "
            \set Staff.midiInstrument = #"electric bass (finger)"
            \bass
        }

        \new Staff {
            \set Staff.instrumentName = "Guitar "
            \set Staff.shortInstrumentName = "G. "
            \set Staff.midiInstrument = #"electric guitar (jazz)"
            \guitar
        }
    >>

    \layout { }
    \midi { }
}
