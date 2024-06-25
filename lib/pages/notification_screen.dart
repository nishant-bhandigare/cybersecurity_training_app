import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationCenterScreen extends StatelessWidget {
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: 'New Course Available',
      message: 'Check out the new course on Flutter development.',
      dateTime: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    NotificationModel(
      title: 'Assignment Due',
      message: 'Your assignment on AI is due tomorrow.',
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
    ),
    // Add more notifications here
  ];

  NotificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Slidable(
            key: ValueKey(notification.dateTime),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {
                // Handle dismiss
              }),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Handle delete
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (context) {
                    // Handle share
                  },
                  backgroundColor: const Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: (context) {
                    // Handle archive
                  },
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Archive',
                ),
                SlidableAction(
                  onPressed: (context) {
                    // Handle save
                  },
                  backgroundColor: const Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.save,
                  label: 'Save',
                ),
              ],
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.blue),
              title: Text(notification.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(notification.message),
              trailing: Text(
                _formatDateTime(notification.dateTime),
                style: const TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Handle notification tap
              },
            ),
          );
        },
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

class NotificationModel {
  final String title;
  final String message;
  final DateTime dateTime;

  NotificationModel({
    required this.title,
    required this.message,
    required this.dateTime,
  });
}

