﻿/*
Copyright (c) 2007 Danny Chapman 
http://www.rowlhouse.co.uk

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.
Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:
1. The origin of this software must not be misrepresented; you must not
claim that you wrote the original software. If you use this software
in a product, an acknowledgment in the product documentation would be
appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
misrepresented as being the original software.
3. This notice may not be removed or altered from any source
distribution.
 */

/**
 * @author Muzer(muzerly@gmail.com)
 * @link http://code.google.com/p/jiglibflash
 */

package jiglib.vehicles {
	
	
	import jiglib.math.JNumber3D;
	import jiglib.physics.PhysicsSystem;
	import jiglib.plugin.ISkin3D;

	public class JCar {
		
		private var _maxSteerAngle:Number;
		private var _steerRate:Number;
		private var _driveTorque:Number;
        
		private var _destSteering:Number;
		private var _destAccelerate:Number;
        
		private var _steering:Number;
		private var _accelerate:Number;
		private var _HBrake:Number;
		 
		private var _chassis:JChassis;
		private var _wheels:Array;
		private var _steerWheels:Array;
		
		public function JCar(skin:ISkin3D):void {
			_chassis = new JChassis(this, skin);
			_wheels = [];
			_steerWheels = [];
			_destSteering = _destAccelerate = _steering = _accelerate = _HBrake = 0;
			setCar();
		}
		 
		public function setCar(maxSteerAngle:Number = 45, steerRate:Number = 4, driveTorque:Number = 500):void {
			_maxSteerAngle = maxSteerAngle;
			_steerRate = steerRate;
			_driveTorque = driveTorque;
		}
		 
		public function setupWheel(_name:String, pos:JNumber3D, 
		                           wheelSideFriction:Number = 2, wheelFwdFriction:Number = 2, 
								   wheelTravel:Number = 3, wheelRadius:Number = 10, 
								   wheelRestingFrac:Number = 0.5, wheelDampingFrac:Number = 0.5, 
								   wheelNumRays:int = 1):void
		{
			var mass:Number = _chassis.mass;
			var mass4:Number = mass / _steerRate;
			var axis:JNumber3D = JNumber3D.UP;
			var gravity:Number = PhysicsSystem.getInstance().gravity.modulo;
			var spring:Number = mass4 * gravity / (wheelRestingFrac * wheelTravel);
			var inertia:Number = 0.5 * wheelRadius * wheelRadius * mass;
			var damping:Number = 2 * Math.sqrt(spring * mass);
			damping /= _steerRate;
			damping *= wheelDampingFrac;
			
			_wheels[_name] = new JWheel(this);
			_wheels[_name].setup(pos, axis, spring, wheelTravel, inertia, 
			                     wheelRadius, wheelSideFriction, wheelFwdFriction,
								 damping, wheelNumRays);
		}
		
		public function get chassis():JChassis {
			return _chassis;
		}
		
		public function get wheels():Array {
			return _wheels;
		}
		
		public function setAccelerate(val:Number):void {
			_destAccelerate = val;
		}
		
		public function setSteer(wheels:Vector.<JWheel>,val:Number):void {
			_destSteering = val;
			_steerWheels = [];
			for each(var wheel:JWheel in wheels) {
				if (findWheel(wheel)) {
					_steerWheels[wheel] = _wheels[wheel];
				}
			}
		}
		
		private function findWheel(wheel:JWheel):Boolean {
			for each(var _wheel:JWheel in _wheels) {
				if (wheel == _wheel) {
					return true;
				}
			}
			return false;
		}
		
		public function setHBrake(val:Number):void {
			_HBrake = val;
		}
		
		public function addExternalForces(dt:Number):void {
			for each (var wheel:JWheel in wheels) {
				wheel.addForcesToCar(dt);
			}
		}
		
		public function postPhysics(dt:Number):void {
			var wheel:JWheel;
			for each (wheel in wheels) {
				wheel.update(dt);
			}
			
			var deltaAccelerate:Number = dt * _steerRate;
			var deltaSteering:Number = dt * _steerRate;
			var dAccelerate:Number = _destAccelerate - _accelerate;
			if (dAccelerate < -deltaAccelerate) {
				dAccelerate = -deltaAccelerate;
			} else if (dAccelerate > deltaAccelerate) {
				dAccelerate = deltaAccelerate;
			}
			_accelerate += dAccelerate;
			 
			var dSteering:Number = _destSteering - _steering;
			if (dSteering < -deltaSteering) {
				dSteering = -deltaSteering;
			} else if (dSteering > deltaSteering) {
				dSteering = deltaSteering;
			}
			_steering += dSteering;
			 
			for each (wheel in wheels) {
				wheel.addTorque(_driveTorque * _accelerate);
				wheel.setLock(_HBrake > 0.5);
			}
			
			var alpha:Number = Math.abs(_maxSteerAngle * _steering);
			var angleSgn:Number = (_steering > 0) ? 1 : -1;
			for each (var _steerWheel:JWheel in _steerWheels) {
				_steerWheel.setSteerAngle(angleSgn * alpha);
			}
		}
		
		public function getNumWheelsOnFloor():int {
			var count:int = 0;
			for each (var wheel:JWheel in wheels) {
				if (wheel.getOnFloor()) {
					count++;
				}
			}
			return count;
		}
	}
	
}
