import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget sectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          height: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionText(
              "This Privacy Policy explains how the application collects, uses, and protects user information when using the services provided within the app.",
            ),

            sectionTitle("1. Information We Collect"),
            sectionText(
              "The application may collect certain information when users interact with the platform. This may include:\n"
              "• Basic account information\n"
              "• Device information\n"
              "• Usage activity within the application\n"
              "• Feedback or support messages submitted by users",
            ),

            sectionTitle("2. How We Use Information"),
            sectionText(
              "Collected information is used to improve the functionality of the application, provide better services, maintain security, and enhance the overall user experience.",
            ),

            sectionTitle("3. Data Security"),
            sectionText(
              "We implement appropriate security measures to protect user data from unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet is completely secure.",
            ),

            sectionTitle("4. Third-Party Services"),
            sectionText(
              "The application may use third-party services such as analytics tools, cloud storage, or authentication services. These services may collect certain information according to their own privacy policies.",
            ),

            sectionTitle("5. User Data Protection"),
            sectionText(
              "User data is handled responsibly and used only for the intended purposes of improving and maintaining the application services.",
            ),

            sectionTitle("6. Changes to This Policy"),
            sectionText(
              "The privacy policy may be updated from time to time. Users are advised to review this page periodically to stay informed about how their information is being protected.",
            ),

            sectionTitle("7. Contact"),
            sectionText(
              "If you have any questions or concerns regarding this Privacy Policy, you may contact the support team through the application's support section.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Last Updated: April 2026",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}