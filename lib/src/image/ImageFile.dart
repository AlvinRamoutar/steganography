
import 'dart:io';

import 'dart:typed_data';

import 'package:image/image.dart';


class ImageFile {

  File _file;
  String _name;
  Uri _uri;
  Image _image;


  ImageFile(String uri) {
    _uri = Uri.parse(uri);
    _name = _uri.pathSegments.last;
    _file = File.fromUri(_uri);
  }

  Image load() {
    _image = decodeImage(bytes);
    return _image;
  }


  /// Getters and setters
  File get file => _file;
  String get name => _name;
  Uri get uri => _uri;
  Image get image => _image;

  int get length => _image.length;
  int get width => _image.width;
  int get height => _image.height;

  Uint8List get bytes => _file.readAsBytesSync();
  Future<Uint8List> get bytesAsync async => await _file.readAsBytes();

}