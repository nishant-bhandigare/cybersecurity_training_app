import 'package:cybersecurity_training_app/pages/course_information.dart';
import 'package:cybersecurity_training_app/pages/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cybersecurity_training_app/models/course_model.dart';
import 'package:cybersecurity_training_app/data/course_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> topics = [
      "SQL Injection",
      "Basics of Web Security",
      "Basic Prevention Techniques",
      "Security Testing Tools",
      "Database Hardening",
      "Regular Security Audits",
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.maxFinite,
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(FontAwesomeIcons.barsStaggered),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationCenterScreen(),
                        ),
                      );
                    },
                    child: const FaIcon(FontAwesomeIcons.bell),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.maxFinite,
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hello, Andrew!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      Text(
                        "What do you wanna learn today?",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.maxFinite,
            // height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    children: [
                    Text(
                    "Boost Your Cybersecurity Skills -",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                      Text(
                        "Join our free simulation challenge and tackle cyber threats head-on.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(),
                    // ),
                    child: Image.asset("assets/images/student1.jpg",
                        width: MediaQuery.of(context).size.width * 0.45)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Topics",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text("See All", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 20),
              ...topics.map((topicName) => Topic(topicName: topicName)),
            ]),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Courses",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text("See All", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 20),
              ...courses_data_list
                  .map((courseItem) => CourseWidget(course: courseItem)),
            ]),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Courses",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text("See All", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...courses_data_list.map((courseItem) {
            if (courseItem.isStudying == true) {
              return MyCourse(course: courseItem);
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }
}

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseInformationPage(
              course: course,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.2,
        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: course.color,
          // border: Border.all(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    course.courseName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const FaIcon(Icons.star_half_outlined, size: 15, color: Colors.orange),
                Text(
                  "${course.courseRating.toString()}/5",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            Text(
              course.instructorName,
              style: const TextStyle(fontSize: 12),
            ),
            const Spacer(),
            Text(
              course.duration,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              course.groups[0],
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCourse extends StatelessWidget {
  const MyCourse({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.2,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(course.courseName,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          Text(course.instructorName, style: const TextStyle(fontSize: 12)),
          const Spacer(),
          Row(
            children: [
              const FaIcon(Icons.star_half_outlined, size: 15, color: Colors.orange),
              Text(
                "${course.courseRating.toString()}/5",
                style: const TextStyle(fontSize: 12),
              ),
              const Spacer(),
              Text(
                course.progress.toString(),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: LinearProgressIndicator(
                  value: course.progress / course.chapters,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                course.chapters.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Topic extends StatelessWidget {
  const Topic({super.key, required this.topicName});

  final String topicName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Text(topicName,
              style:
                  const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
