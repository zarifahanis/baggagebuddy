
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Import application design from file app_design.dart
import 'app_design.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Github URL
  static const String githubLink =
      'https://github.com/zarifahanis/baggagebuddy';

  // function nak panggil GitHub browser
  Future<void> openGitHub(BuildContext context) async {
    final Uri url = Uri.parse(githubLink);

    try {
      // open github using browser
      bool success = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      // error if link cannot open
      if (!success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to open GitHub URL.'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to open GitHub URL.'),
          ),
        );
      }
    }
  }

  // about page
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appbar + back arrow to homepage
      appBar: AppBar(
        title: const Text('About BaggageBuddy'),
        backgroundColor: appNavy,
        foregroundColor: appWhite,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            // app logo
            Container(
              width: 110,
              height: 110,

              decoration: const BoxDecoration(
                color: appWhite,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Padding(
                padding: const EdgeInsets.all(12),

                child: ClipOval(
                  child: Image.asset(
                    'assets/images/luggage.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // app name
            const Text(
              'BaggageBuddy',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: appNavy,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'YOUR BAGGAGE TRAVEL COMPANION',
              textAlign: TextAlign.center,
              style: labelStyle,
            ),

            const SizedBox(height: 15),

            // description
            const Text(
              'BaggageBuddy helps passengers calculate '
              'excess baggage fees based on baggage weight, '
              'ticket class and service tax.',
              textAlign: TextAlign.center,
              style: descriptionStyle,
            ),

            const SizedBox(height: 30),

            // info
            SizedBox(
              width: double.infinity,

              child: Card(
                color: appWhite,
                elevation: 2,
                shape: appCardShape,

                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Row(
                        children: [
                          Icon(
                            Icons.badge_outlined,
                            color: appNavy,
                          ),

                          SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              'Developer Information',
                              style: cardTitleStyle,
                            ),
                          ),
                        ],
                      ),

                      const Divider(height: 30),

                      // developer name
                      const Text(
                        'DEVELOPER NAME',
                        style: labelStyle,
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        'NUR ZARIFAH HANIS BINTI MOHADZIR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // student id / matric number
                      const Text(
                        'STUDENT ID / MATRIC NUMBER',
                        style: labelStyle,
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        '2024667126',
                        style: TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 20),

                      // course info
                      const Text(
                        'COURSE',
                        style: labelStyle,
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        'ICT602 - MOBILE TECHNOLOGY DEVELOPMENT',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // github
            SizedBox(
              width: double.infinity,

              child: Card(
                color: appWhite,
                elevation: 2,
                shape: appCardShape,

                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Row(
                        children: [
                          Icon(Icons.code, color: appNavy),
                          SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              'GitHub Repository',
                              style: cardTitleStyle,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'View the application source code on GitHub.',
                        style: descriptionStyle,
                      ),

                      const SizedBox(height: 12),

                      // Clickable GitHub URL
                      TextButton(
                        onPressed: () => openGitHub(context),

                        child: const Text(
                          githubLink,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // copyright
            const Text(
              '© 2026 BaggageBuddy\n'
              'All Rights Reserved.',
              textAlign: TextAlign.center,
              style: descriptionStyle,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
