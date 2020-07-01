/// @description Asylum BGM

audio_stop_all();

var pitch = choose(0.6, 0.7, 0.85, 1.0, 1.15, 1.3, 1.45, 1.6);
var music = choose(supertramp_asylum);
audio_sound_pitch(music, pitch);
audio_play_sound(music, 1000, false);

var nextSongNum = choose(0, 2);
alarm[nextSongNum] = (1/pitch) * 60*((6*60) + 46); // 6:44 song (2 second break) (Asylum)	