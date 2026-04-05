import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
        title: const Text("Terms and Conditions"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionText(
              "These Terms and Conditions govern the use of this application. "
              "By accessing or using the application, users agree to comply with these terms.",
            ),

            sectionTitle("1. Acceptance of Terms"),
            sectionText(
              "By using this application, you confirm that you have read, understood, "
              "and agreed to be bound by these Terms and Conditions.",
            ),

            sectionTitle("2. Use of the Application"),
            sectionText(
              "Users agree to use the application only for lawful purposes. "
              "Any misuse, unauthorized access, or attempt to disrupt the application "
              "may result in termination of access.",
            ),

            sectionTitle("3. User Responsibilities"),
            sectionText(
              "Users are responsible for maintaining the confidentiality of their "
              "account information and for all activities that occur under their account.",
            ),

            sectionTitle("4. Intellectual Property"),
            sectionText(
              "All content within the application including design, text, images, "
              "and software is the property of the application owner and is protected "
              "by applicable intellectual property laws.",
            ),

            sectionTitle("5. Limitation of Liability"),
            sectionText(
              "The application is provided on an 'as-is' basis. The developers are not "
              "responsible for any direct, indirect, or incidental damages arising from "
              "the use of the application.",
            ),

            sectionTitle("6. Termination"),
            sectionText(
              "We reserve the right to suspend or terminate access to the application "
              "at any time if users violate these terms.",
            ),

            sectionTitle("7. Changes to Terms"),
            sectionText(
              "These Terms and Conditions may be updated from time to time. "
              "Continued use of the application after changes indicates acceptance "
              "of the revised terms.",
            ),

            sectionTitle("8. Contact Information"),
            sectionText(
              "If you have any questions regarding these Terms and Conditions, "
              "please contact the application's support team.",
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