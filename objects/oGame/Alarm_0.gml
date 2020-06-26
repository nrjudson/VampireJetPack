/// @description Restart BGM

audio_stop_all();
var pitch = choose(0.6, 0.85, 1.0, 1.15, 1.3, 1.45, 1.6);
audio_sound_pitch(supertramp_rudy, pitch);
audio_play_sound(supertramp_rudy, 1000, false);

alarm[0] = (1/pitch) *60*((6*60) + 28); // 6:24 song (4 second break)
