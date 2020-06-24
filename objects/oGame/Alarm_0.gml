/// @description Restart BGM

audio_stop_all();
var pitch = choose(0.6, 0.85, 1.0, 1.15, 1.3, 1.5);
audio_sound_pitch(supertramp_rudy, pitch);
audio_play_sound(supertramp_rudy, 1000, true);

alarm[0] = 30*((6*60) + 28); // 6:24 song (4 second break)
//alarm[0] = 30*((2*60) + 15); // 6:24 song (1 second break)