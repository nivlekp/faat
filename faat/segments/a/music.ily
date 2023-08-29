\version "2.24.2"
\language "english"
\context Score = "Score"
<<
    \context Staff = "Piano.Staff"
    {
        \context Voice = "Piano.Music"
        {
            {
                \times 8/11
                {
                    \tempo 4=60
                    \time 4/4
                    r16
                    g'32
                    ~
                    g'4
                    ~
                }
                g'4
                ~
                \times 8/11
                {
                    g'16.
                    g'16
                    ~
                    g'32
                    g'32
                    ~
                    g'8
                    ~
                }
                \times 4/7
                {
                    g'32
                    r16
                    r8
                }
                \times 4/5
                {
                    r16.
                    r32
                    g'32
                    ~
                }
            }
            {
                \times 4/7
                {
                    g'8.
                    c'8
                    ~
                    c'32
                    r16.
                }
                r8
                r32
                c'16.
                ~
                \times 2/3
                {
                    c'8
                    c'4
                    ~
                }
                \times 4/5
                {
                    c'8
                    c'16
                    ~
                    c'8
                    ~
                }
            }
            {
                \times 4/7
                {
                    c'8
                    g'16
                    ~
                    g'4
                    ~
                }
                g'8
                ~
                g'32
                c'32
                c'64
                c'32.
                ~
                \times 4/5
                {
                    c'16
                    cs'16
                    ~
                    \times 2/3
                    {
                        cs'32
                        cs'16
                        ~
                    }
                    \times 2/3
                    {
                        cs'16
                        g'32
                        ~
                    }
                    g'16
                    ~
                }
                \times 2/3
                {
                    g'4
                    ~
                    g'16
                    r16
                }
            }
        }
    }
>>