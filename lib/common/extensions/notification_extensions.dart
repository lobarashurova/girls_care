import 'package:flutter/material.dart';
import 'package:elegant_notification/elegant_notification.dart';

extension ElegantNotificationExtension on BuildContext {
  void showElegantNotification({
    required String title,
    required String description,
    required NotificationType type,
  }) {
    switch (type) {
      case NotificationType.info:
        ElegantNotification.info(
          title: Text(title),
          description: Text(description),
        ).show(this);
        break;
      case NotificationType.success:
        ElegantNotification.success(
          title: Text(title),
          description: Text(description),
        ).show(this);
        break;
      case NotificationType.error:
        ElegantNotification.error(
          title: Text(title),
          description: Text(description),
        ).show(this);
        break;
    }
  }
}

enum NotificationType {
  info,
  success,
  error,
}
