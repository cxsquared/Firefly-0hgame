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

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var player:Firefly;
	private var jarCollection:FlxTypedGroup<Jar>;
	public static var score:Int = 0;
	private var txtScore:FlxText;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		score = 0;
		
		player = new Firefly(FlxG.width/2, FlxG.height/2);
		add(player);
		
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
		jarCollection.callAll("update");
		
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
}