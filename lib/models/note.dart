import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Note {
  Note({
    required this.title,
    required this.note,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final String note;
}
