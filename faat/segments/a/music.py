import pathlib

import abjad
import pang
from faat import library


def main():
    score = library.make_empty_score()
    scope = pang.Scope(voice_name="Piano.Music")
    sieve = abjad.Pattern(indices=[0, 1, 7], period=12)
    pitch_set = pang.gen_pitches_from_sieve(sieve)
    sound_points_generator = pang.GRWSoundPointsGenerator(
        arrival_rate=1.5,
        service_rate=1.7,
        pitch_set=pitch_set,
        standard_deviation=2,
        seed=928374,
    )
    sequence = pang.Sequence(
        sound_points_generator=sound_points_generator, sequence_duration=10
    )
    command = pang.QuantizeSequenceCommand(sequence)
    pang.build.section(score, scope, command)
    lilypond_file_path = pathlib.Path(__file__).parent / "music.ly"
    lilypond_file = pang.build.make_lilypond_file(score)
    pang.build.persist(lilypond_file, lilypond_file_path)


if __name__ == "__main__":
    main()
