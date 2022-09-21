import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class NoteClass {
  NoteClass({required this.noteText, required this.noteTitle});

  @HiveField(0)
  String? noteTitle;

  @HiveField(1)
  String? noteText;
}
