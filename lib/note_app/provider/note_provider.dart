import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class NoteProvider extends ChangeNotifier {
  String text = '';
  var box = Hive.box('note_box');
  // List<Box> noteBox = [];
  var noteBox = Hive.box('note_box1');
  String noteTitle = '';
  String noteDescription = '';

  //first try...
  get noteData {
    return box;
  }

  deleteData() {}

  setData(String data) {
    text = data;
    box.add(text);
    notifyListeners();
  }

  deleteAllData(values) {
    box.deleteAll(values);
  }

  //Second note with title and description..
  Box get noteDataList {
    return noteBox;
  }

  setNoteData(String noteTitle, String noteDescription) {
    noteTitle = noteTitle;
    noteDescription = noteDescription;
    // box.add(noteTitle);
    noteBox.put(noteTitle, noteDescription);
    notifyListeners();
  }

  deleteNoteData(value) {
    noteBox.deleteAt(value);
    notifyListeners();
  }

  deleteAllNoteData(value) {
    noteBox.deleteAll(value);
    notifyListeners();
  }
}
