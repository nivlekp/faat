import abjad
import pang
from faat import library


def main():
    score = library.make_empty_score()
    scope = pang.Scope(voice_name="Piano.Music")
    sieve = abjad.Pattern(indices=[0, 1, 7], period=12)
    pitch_set = pang.gen_pitches_from_sieve(sieve)
    sound_points_generator = pang.GRWSoundPointsGenerator(
        arrival_rate=0.5,
        service_rate=0.7,
        pitch_set=pitch_set,
        standard_deviation=2,
        seed=1458276,
    )
    sequence = pang.Sequence(
        sound_points_generator=sound_points_generator, sequence_duration=10
    )
    command = pang.QuantizeSequenceCommand(sequence)
    metadata = pang.build.section(score, scope, command)
    pang.build.persist(score, metadata)


if __name__ == "__main__":
    main()
