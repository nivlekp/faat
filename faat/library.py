import abjad


def make_empty_score():
    """
    >>> from faat import library
    >>> library.make_empty_score()
    Score('{ { } }', name='Score', simultaneous=True)
    """
    piano_music_voice = abjad.Voice(name="Piano.Music")
    piano_music_staff = abjad.Staff([piano_music_voice], name="Piano.Staff")
    score = abjad.Score([piano_music_staff], name="Score")
    return score
