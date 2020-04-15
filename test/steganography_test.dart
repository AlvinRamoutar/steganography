import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:steganography/src/image/ImageFile.dart';

import 'package:steganography/steganography.dart';


void main() {

  test('Create ImageFile', () {

    final ImageFile imageFile = new ImageFile('assets/test/22155338.png');
    imageFile.load();

    print("Width: ${imageFile.width}, Height: ${imageFile.height}, Bytes: ${imageFile.length}");

    for(int i = 0; i < imageFile.width; i++) {
      print("Pixel @ ($i x $i): ${imageFile.image.getPixel(i, i)}");
    }
  });
  
  test('Random Seed Test', () {

    const int _max = 2147483646;
    const int _seed = 22155338;
    
    Random rand01 = new Random(_seed);
    Random rand02 = new Random(_seed);
    
    for(int i = 0; i < 100; i++) {
      expect(rand01.nextInt(_max), equals(rand02.nextInt(_max)));
    }
  });

}
