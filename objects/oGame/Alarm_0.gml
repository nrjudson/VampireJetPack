/// @description Rudy BGM

audio_stop_all();

var pitch = choose(0.6, 0.7, 0.85, 1.0, 1.15, 1.3, 1.45, 1.6);
var music = choose(supertramp_rudy);
audio_sound_pitch(music, pitch);
audio_play_sound(music, 1000, false);

var nextSongNum = choose(1, 2);
alarm[nextSongNum] = (1/pitch) * 60*((6*60) + 26); // 6:24 song (2 second break) (Rudy)