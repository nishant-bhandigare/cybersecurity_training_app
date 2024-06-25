import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatelessWidget {
  const Profile(
      {super.key,
      required this.name,
      required this.username,
      required this.followers,
      required this.following,
      required this.streak,
      required this.totalXp,
      required this.league});

  final String name;
  final String username;
  final String followers;
  final String following;
  final int streak;
  final int totalXp;
  final String league;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(
              followers: followers,
              following: following,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                name,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                username,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Statistics",
                style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Statistic(
                      icon: FontAwesomeIcons.fire,
                      title: "60",
                      subTitle: "Day Streak"),
                  SizedBox(width: 15),
                  Statistic(
                      icon: FontAwesomeIcons.bolt,
                      title: "5430",
                      subTitle: "Total XP"),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Badges",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  Text("See All", style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Badge(badgePath: "assets/icons/badges_iconpack_1/achievement.png"),
                  Badge(badgePath: "assets/icons/badges_iconpack_1/cup.png"),
                  Badge(badgePath: "assets/icons/badges_iconpack_1/finish.png"),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection(
      {super.key, required this.followers, required this.following});

  final String followers;
  final String following;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(height: 70),
          const CircleAvatar(
            radius: 105,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 100,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    followers,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Followers",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Text(
                    following,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Following",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class Statistic extends StatelessWidget {
  const Statistic(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});

  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaIcon(icon),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({super.key, required this.badgePath});

  final String badgePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Image.asset(badgePath, width: MediaQuery.of(context).size.width * 0.25,),
      ),
    );
  }
}
