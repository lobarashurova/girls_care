import 'display_message.dart';

abstract class Display {
  void setOnDisplayListener(void Function(DisplayMessage message) onDisplay);

  void error(Object description, [String? title]);

  void warning(String description, [String? title]);

  void info(String description, [String? title]);

  void success(String description, [String? title]);
}
