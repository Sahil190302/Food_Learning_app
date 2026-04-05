import 'package:flutter/material.dart';

class ReturnRefundScreen extends StatelessWidget {
  const ReturnRefundScreen({super.key});

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
        title: const Text("Return & Refund Policy"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionText(
              "This Return and Refund Policy describes the conditions under which users may request a return or refund for services or products offered within the application.",
            ),

            sectionTitle("1. Eligibility for Returns"),
            sectionText(
              "Returns are accepted only for eligible items or services within the specified return period. The item or service must not be used, modified, or altered beyond its intended purpose.",
            ),

            sectionTitle("2. Return Request Period"),
            sectionText(
              "Users must submit a return request within 7 days of purchase or service delivery. Requests submitted after the allowed period may not be approved.",
            ),

            sectionTitle("3. Non-Refundable Situations"),
            sectionText(
              "Refunds may not be issued in the following situations:\n"
              "• Services that have already been fully delivered\n"
              "• Digital content that has been accessed or downloaded\n"
              "• User errors during ordering or purchase\n"
              "• Violation of application terms and conditions",
            ),

            sectionTitle("4. Refund Processing"),
            sectionText(
              "Once a return request is approved, the refund will be processed within 5–10 business days. The amount will be credited to the original payment method used during the purchase.",
            ),

            sectionTitle("5. Partial Refunds"),
            sectionText(
              "In certain situations, partial refunds may be granted depending on the usage of the service or product.",
            ),

            sectionTitle("6. Cancellation Policy"),
            sectionText(
              "Orders or services may be cancelled before processing or confirmation. Once the order is confirmed or service has begun, cancellation may not be possible.",
            ),

            sectionTitle("7. Contact Support"),
            sectionText(
              "If you have any questions regarding this Return and Refund Policy or wish to request a refund, please contact the support team through the application's help or support section.",
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