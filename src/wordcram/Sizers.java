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

public class Sizers {
	public static WordSizer byWeight(final int minSize, final int maxSize) {
		final int diff = maxSize - minSize;
		return new WordSizer() {
			public float sizeFor(Word word, int wordRank, int wordCount) {
				return (float)(word.weight * diff) + minSize;
			}
		};
	}
	
	public static WordSizer byRank(final int minSize, final int maxSize) {
		final int diff = maxSize - minSize;
		return new WordSizer() {
			public float sizeFor(Word word, int wordRank, int wordCount) {
				float multiple = (wordCount-wordRank)/(float)wordCount;
				return (multiple * diff) + minSize;
			}
		};
	}
	
	// TODO try exponent scales, rather than linear.
}
