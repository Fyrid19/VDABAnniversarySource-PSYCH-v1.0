package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;

class WarningState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

        var bg:FlxSprite = new FlxSprite();
		bg.loadGraphic(Paths.image('backgrounds/mantis'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		bg.color = 0xff3814d6;
		bg.setGraphicSize(Std.int(bg.width * 1));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);

		warnText = new FlxText(0, 50, FlxG.width,
			"Hey! \n
            This mod is unfinished and is just a demo. 
			There are various amount of missing content.
            Character Selection is unfinished so it isn't available right now. 
            There are also flashes and slight screen shaking in this mod 
			(Can be turned off in settings).
            This is a Dave and Bambi mod so expect some songs to be harder than usual. 
            Also some songs may crash your game on purpose. \n
            Press ENTER to continue.",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		//warnText.screenCenter(X);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT) {
			//FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxTween.tween(warnText, {y: 1500}, 1, {type:PERSIST, ease:FlxEase.backInOut,
				onComplete: function (twn:FlxTween) {
					MusicBeatState.switchState(new MainMenuState());
				}
            });
		}
		super.update(elapsed);
	}
}
