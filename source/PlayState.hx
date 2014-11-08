package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil;
import openfl.display.BlendMode;
import flixel.addons.display.FlxStarField.FlxStarField2D;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player:Firefly;
	private var jarCollection:FlxTypedGroup<Jar>;
	public static var score:Int = 0;
	private var txtScore:FlxText;
	private var darkness:FlxSprite;
	private var light:Light;
	private var background:FlxSprite;
	private var star:FlxStarField2D;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		score = 0;
		
		background = new FlxSprite(0, 0, AssetPaths.background__png);
		add(background);
		
		player = new Firefly(FlxG.width/2, FlxG.height/2, AssetPaths.firefly__png);
		add(player);
		
		darkness = new FlxSprite(0, 0);
		darkness.makeGraphic(FlxG.width, FlxG.height, 0xEE000000);
		darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
		darkness.blend = BlendMode.MULTIPLY;
		
		light = new Light(Std.int(player.x), Std.int(player.y), darkness);
		
		add(light);
		add(darkness);
		
		jarCollection = new FlxTypedGroup<Jar>();
		add(jarCollection);
		
		txtScore = new FlxText(FlxG.width/2, 10, 100);
		txtScore.text = Std.string(score);
		add(txtScore);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		player.update();
		light.x = player.x + player.width/2;
		light.y = player.y + player.height/2;
		jarCollection.callAll("update");
		
		//trace(FlxG.game.ticks);
		
		txtScore.text = Std.string(score);

		if (FlxRandom.chanceRoll(5)) {
			jarCollection.add(new Jar());
		}
		
		FlxG.collide(jarCollection, player, playerHit);
	}
	
	private function playerHit(jar:FlxObject, player:FlxObject):Void {
		player.kill();
		FlxG.switchState(new MenuState());
	}
	
	override public function draw():Void {
		FlxSpriteUtil.fill(darkness, 0xEE000000);
		super.draw();
	}
}