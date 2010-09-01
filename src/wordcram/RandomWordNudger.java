package wordcram;

/*
Copyright 2010 Daniel Bernier

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import java.util.Random;

import processing.core.PVector;

public class RandomWordNudger implements WordNudger {

	private Random r = new Random();
	
	@Override
	public PVector nudgeFor(Word w, int attempt) {
		return new PVector(next(attempt), next(attempt));
	}
	
	private float next(int attempt) {
		return (float)r.nextGaussian() * attempt * 0.075f;  // TODO make that a ctor parameter
	}

}
