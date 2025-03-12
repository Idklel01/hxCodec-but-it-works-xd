package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * This class allows you to play videos using sprites (FlxSprite).
 */
class VideoSprite extends FlxSprite
{
	public var bitmap:VideoHandler;
	public var openingCallback:Void->Void = null;
	public var finishCallback:Void->Void = null;

	public function new(X:Float = 0, Y:Float = 0)
	{
		super(X, Y);

		makeGraphic(1, 1, FlxColor.TRANSPARENT);

		bitmap = new VideoHandler();
		bitmap.canUseAutoResize = false;
		bitmap.alpha = 0;
		bitmap.openingCallback = function()
		{
			if (openingCallback != null)
				openingCallback();
		}
		bitmap.finishCallback = function()
		{
			if (finishCallback != null)
				finishCallback();

			kill();
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (bitmap.isPlaying && bitmap.isDisplaying && bitmap.bitmapData != null)
			pixels = bitmap.bitmapData;
	}

	public function load(Path:String, Loop:Bool = false, PauseMusic:Bool = false):Void
		bitmap.load(Path, Loop, PauseMusic);

	public function playVideo():Void
		bitmap.playVideo();
}
