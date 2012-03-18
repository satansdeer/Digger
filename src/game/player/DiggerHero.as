/**
 * Created by : Dmitry
 * Date: 3/8/12
 * Time: 10:31 AM
 */
package game.player {
import core.ViewController;

import effect.SmokeParticleEffect;

import flash.display.Sprite;

import game.IShifting;

import game.playtime.PlayTimeModel;

public class DiggerHero extends ViewController implements IShifting {
	private var _model:DiggerModel;
	private var _rotationModel:DiggerRotationModel;

	private var _cabin:CabinView;
	private var _hero:HeroView;
	private var _drill:AllDrillsView;
	private var _rightSmoke:SmokeParticleEffect;
	private var _leftSmoke:SmokeParticleEffect;
	private var _leftParticles:ParticlesView;
	private var _rightParticles:ParticlesView;

	private var _playTimeModel:PlayTimeModel;

	public function DiggerHero(model:DiggerModel):void {
		super(new Sprite());
		_model = model;
		_rotationModel = new DiggerRotationModel(_model);
		initView();
	}

	public function get model():DiggerModel { return _model; }

	public function addPlayTimeModel(playTimeModel:PlayTimeModel):void {
		_playTimeModel = playTimeModel;
	}

	public function setPosition(x:Number, y:Number):void {
		_model.setPosition(x, y);
		view.x = x;
		view.y = y;
	}

	public function tick():void {
		_model.tick();
		_rotationModel.tick();
		view.x = _model.x;
		view.y = _model.y;
		view.rotation = _rotationModel.rotation;
		if (_playTimeModel && _playTimeModel.totalPlayTime - _playTimeModel.currentTime < _playTimeModel.totalPlayTime/10) {
			view.alpha = _playTimeModel.totalPlayTime/20;
		}
	}

	public function moveToX(x:Number):void {
		_model.setTargetX(x);
	}

	/* Internal functions */

	private function initView():void {
		_drill = new AllDrillsView();
		_drill.stop();
		_drill.x = -_drill.width/2;
		_drill.y = 81;

		_cabin = new CabinView();
		_cabin.stop();
		_cabin.x = -_cabin.width/2-6;
		_cabin.y = 5;

		_hero = new HeroView();
		_hero.x = -_hero.width/2-6;
		_hero.y = 7;

		_leftSmoke = SmokeParticleEffect.createParticleEffect(0,-5,0);
		_leftSmoke.x = 66;
		_leftSmoke.y = 77;
		_rightSmoke = SmokeParticleEffect.createParticleEffect(0,-5,0);
		_rightSmoke.x = 25;
		_rightSmoke.y = 77;
		_rightSmoke.scaleX = -1;

		_rightParticles = new ParticlesView();
		_leftParticles = new ParticlesView();
		_rightParticles.x = _drill.width/2;
		_rightParticles.y = 77;
		_leftParticles.x = -_drill.width/2;
		_leftParticles.y = 77;
		_leftParticles.scaleX = -1;

		view.addChild(_drill);
		view.addChild(_hero);
		view.addChild(_cabin);
		view.addChild(_leftSmoke);
		view.addChild(_rightSmoke);
		view.addChild(_rightParticles);
		view.addChild(_leftParticles);
	}
}
}
