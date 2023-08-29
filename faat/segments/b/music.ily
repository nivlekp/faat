\version "2.24.2"
\language "english"
\context Score = "Score"
<<
    \context Staff = "Piano.Staff"
    {
        \context Voice = "Piano.Music"
        {
            {
                \tempo 4=60
                \time 4/4
                r1
            }
            {
                \times 4/5
                {
                    r16.
                    g'16.
                    ~
                    g'8
                    ~
                }
                g'2
                ~
                g'8
                \times 4/7
                {
                    r16.
                    c'8
                    ~
                }
            }
            {
                \times 8/13
                {
                    c'16.
                    r16
                    g'4
                    ~
                }
                g'2.
                ~
            }
            {
                g'2
                ~
                g'8
                c'8
                ~
                c'4
                ~
            }
            {
                c'4
                ~
                \times 4/7
                {
                    c'8
                    ~
                    c'32
                    c'32
                    ~
                    c'4
                    ~
                }
                \times 8/11
                {
                    c'16.
                    r4
                }
                r4
            }
        }
    }
>>