import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/cpd_movies.txt');
  }

  Future<String> readMovies() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents.toString();
    } catch (e) {
      print('ERROR: readMovies: $e');
      return '';
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}
