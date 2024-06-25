import 'dart:ui';

class Course {
  final String courseName;
  final String instructorName;
  final String instructorTitle;
  final String instructorImageUrl;
  final String about;
  final String startDate;
  final String duration;
  final int chapters;
  final int progress;
  final String price;
  final String fullPayment;
  final List<String> groups;
  final double courseRating;
  final Color color;
  final bool isStudying;

  Course({
    required this.courseName,
    required this.instructorName,
    required this.instructorTitle,
    required this.instructorImageUrl,
    required this.about,
    required this.startDate,
    required this.duration,
    required this.chapters,
    required this.progress,
    required this.price,
    required this.fullPayment,
    required this.groups,
    required this.courseRating,
    required this.color,
    required this.isStudying,
  });
}
