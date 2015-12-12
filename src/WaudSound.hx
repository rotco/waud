@:expose @:keep class WaudSound implements ISound {

	var _snd:ISound;

	public function new(src:String, ?options:WaudSoundOptions = null) {
		if (Waud.isWebAudioSupported) _snd = new WebAudioAPISound(src, options);
		else if (Waud.isAudioSupported) _snd = new HTML5Sound(src, options);
		else trace("no audio support in this browser");
	}

	public function setVolume(val:Float) {
		_snd.setVolume(val);
	}

	public function getVolume():Float {
		return _snd.getVolume();
	}

	public function mute(val:Bool) {
		_snd.mute(val);
	}

	public function play(?loop:Bool = false) {
		_snd.play(loop);
	}

	public function loop(val:Bool) {
		_snd.loop(val);
	}

	public function stop() {
		_snd.stop();
	}
}