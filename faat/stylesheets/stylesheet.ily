\version "2.20.0"
\language "english"

%#(set-default-paper-size "11x17landscape")
#(set-default-paper-size "a4landscape")
%#(set-default-paper-size "a4")
#(set-global-staff-size 16)

%{
The flat-brackets code is adapted from David Nalesnik on the LilyPond mailing
list:
http://lilypond.1069038.n5.nabble.com/Horizontal-TupletBrackets-td158413.html#a158452
%}
#(define flat-brackets
   (lambda (grob)
     (let* ((pos (ly:tuplet-bracket::calc-positions grob))
             (dir (ly:grob-property grob 'direction))
             (y (if (= UP dir)
                    (max (car pos) (cdr pos))
                    (min (car pos) (cdr pos)))))
       (cons y y))))

pang-signature = {
    \once \override Score.RehearsalMark.direction = #down
    \once \override Score.RehearsalMark.padding = 4
    \mark \markup {
        \with-dimensions-from \null
        \fontsize #-2
        "Keysborough, Victoria (September 2020 - February 2021)."
    }
}

\header {
  composer = \markup {
    %\override #'(font-name . "CMU Serif")
    %\fontsize #3 "Tsz Kiu Pang"
    "Tsz Kiu Pang"
  }
  tagline = ##f
  title = "47"
  instrument = "For solo flute"
}

\layout {
  indent = 0\cm
  ragged-last = ##t
  \accidentalStyle forget
  \context {
    \Score
    %\override SpacingSpanner.strict-note-spacing = ##t
    %\override SpacingSpanner.strict-grace-spacing = ##t
    \override SpacingSpanner.uniform-stretching = ##t
    proportionalNotationDuration = #(ly:make-moment 1 24)
    \override StaffGrouper.staff-staff-spacing.padding = #8
    \override StaffGrouper.staff-staff-spacing.basic-distance = #8
  }
  \context {
    \Staff
    %\override TupletNumber.text = #tuplet-number::calc-fraction-text
    \override Beam.damping = #+inf.0
    \override Beam.details.damping-direction-penalty = #0
    \override Beam.details.round-to-zero-slope = #0
    \override Flag.stencil = #modern-straight-flag
    % \override Stem.length = #15
    % \override Beam.positions = #flat-beams
    \override TupletBracket.positions = #flat-brackets
    tupletFullLength = ##t
    % \override TupletBracket.breakable = ##f
    % \override TupletBracket.full-length-to-extent = ##t
    % \override TupletBracket.X-positions = #(lambda (grob)
    %   (let ((xpos (ly:tuplet-bracket::calc-x-positions grob)))
    %     (if (> (car xpos) (cdr xpos))
    %       (let ((mid (/ (+ (car xpos) (cdr xpos)) 2)))
    %         (format #t "\nwarning: Fixing invalid X-positions ~a" xpos)
    %         (cons mid mid))
    %       xpos)))
    % tupletFullLengthNote = ##t
    %\override TupletBracket.break-overshoot = #'(-0.25 . 0)
    %\override TupletBracket.full-length-padding = #0.2
  }
  \context {
    \Dynamics
    % \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #0
    % \override VerticalAxisGroup.staff-staff-spacing.padding = #0
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #10
    \override DynamicText #'extra-offset = #'(1 . 0)
  }
}

\paper {
  % system-sytem-spacing.basic-distance = #8
  % score-system-spacing =
  %   #'((basic-distance . 100)
  %      (minimum-distance . 100)
  %      (padding . 100)
  %      (stretchability . 100))
  system-system-spacing.padding = #8
  oddHeaderMarkup = \markup ""
  evenHeaderMarkup = \markup ""

  oddFooterMarkup = \markup \fill-line {
    \concat {
      "--"
      \fromproperty #'page:page-number-string
      "--"
    }
  }

  evenFooterMarkup = \markup \fill-line {
    \concat {
      "--"
      \fromproperty #'page:page-number-string
      "--"
    }
  }
}
