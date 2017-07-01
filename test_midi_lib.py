from midi_lib import *


def test_c_minor():
    assert c_minor[0] == 60
    assert c_minor[1] == 62
    assert c_minor[3] == 65
    assert c_minor[7] == 72
    assert c_minor[-1] == 58
    assert c_minor[-8] == 46