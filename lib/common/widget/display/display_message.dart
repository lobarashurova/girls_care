import 'display_type.dart';

class DisplayMessage {
  final DisplayType type;
  final String description;
  final String? title;

  DisplayMessage(this.type, this.description, [this.title]);
}
