import 'package:flutter/material.dart';
import 'reciepe_download_screen.dart';
class RecipeDetailScreen extends StatelessWidget {
  final String title;
  final String image;

  const RecipeDetailScreen({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final recipe = _getRecipeData(title);

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1B),
     appBar: AppBar(
  title: Text(title),
  backgroundColor: Colors.transparent,
  elevation: 0,
  actions: [
  Padding(
    padding: const EdgeInsets.only(right: 12),
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
      icon: const Icon(Icons.download_rounded, size: 20),
      label: const Text(
        "PDF",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        final recipe = _getRecipeData(title);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipePdfDownloadScreen(
              title: title,
              ingredients: recipe["ingredients"],
              steps: recipe["steps"],
            ),
          ),
        );
      },
    ),
  )
],
),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(image),
            ),

            const SizedBox(height: 20),

            _sectionTitle(Icons.restaurant_menu, "सामग्री"),

            ...recipe["ingredients"]
                .map<Widget>((e) => _ingredient(e))
                .toList(),

            const SizedBox(height: 25),

            _sectionTitle(Icons.menu_book, "बनाने की विधि"),

            ...recipe["steps"]
                .map<Widget>((e) => _step(e))
                .toList(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getRecipeData(String title) {

    switch (title) {

      case "Poha":
        return {
          "ingredients": [
            "पोहा – 2 कप",
            "प्याज – 1 बारीक कटा हुआ",
            "हरी मिर्च – 2",
            "हल्दी – 1/2 चम्मच",
            "राई – 1 चम्मच",
            "मूंगफली – 2 चम्मच",
            "नमक – स्वाद अनुसार",
            "नींबू – 1",
            "हरा धनिया – सजाने के लिए"
          ],
          "steps": [
            "1. पोहा को पानी से धोकर 5 मिनट के लिए रखें",
            "2. कढ़ाई में तेल गरम करें और राई डालें",
            "3. मूंगफली डालकर हल्का भूनें",
            "4. प्याज और हरी मिर्च डालकर पकाएं",
            "5. हल्दी और नमक मिलाएं",
            "6. पोहा डालकर अच्छे से मिलाएं",
            "7. 2 मिनट धीमी आंच पर पकाएं",
            "8. नींबू और हरा धनिया डालकर परोसें"
          ]
        };

      case "Chilli Paneer":
        return {
          "ingredients": [
            "पनीर – 200 ग्राम",
            "शिमला मिर्च – 1",
            "प्याज – 1",
            "हरी मिर्च – 2",
            "सोया सॉस – 1 चम्मच",
            "टमाटर सॉस – 1 चम्मच",
            "कॉर्न फ्लोर – 2 चम्मच",
            "नमक – स्वाद अनुसार",
            "तेल – तलने के लिए"
          ],
          "steps": [
            "1. पनीर को चौकोर टुकड़ों में काटें",
            "2. कॉर्न फ्लोर में लपेटकर हल्का फ्राई करें",
            "3. कढ़ाई में तेल गरम करें",
            "4. प्याज, शिमला मिर्च और हरी मिर्च डालकर भूनें",
            "5. सोया सॉस और टमाटर सॉस डालें",
            "6. फ्राई किया हुआ पनीर डालें",
            "7. हल्का मिलाकर 2 मिनट पकाएं",
            "8. गर्मागर्म परोसें"
          ]
        };

      case "Masala Dosa":
        return {
          "ingredients": [
            "डोसा बैटर – 2 कप",
            "उबले आलू – 3",
            "प्याज – 1",
            "हरी मिर्च – 2",
            "राई – 1 चम्मच",
            "करी पत्ता – 8",
            "हल्दी – 1/2 चम्मच",
            "नमक – स्वाद अनुसार"
          ],
          "steps": [
            "1. कढ़ाई में तेल गरम करें",
            "2. राई और करी पत्ता डालें",
            "3. प्याज और हरी मिर्च भूनें",
            "4. आलू मैश करके डालें",
            "5. हल्दी और नमक मिलाएं",
            "6. तवा गरम कर डोसा बैटर फैलाएं",
            "7. अंदर आलू मसाला रखें",
            "8. डोसा मोड़कर परोसें"
          ]
        };

      case "Paneer Butter Masala":
        return {
          "ingredients": [
            "पनीर – 200 ग्राम",
            "टमाटर – 3",
            "काजू – 10",
            "मक्खन – 2 चम्मच",
            "क्रीम – 3 चम्मच",
            "लाल मिर्च पाउडर – 1 चम्मच",
            "गरम मसाला – 1/2 चम्मच",
            "नमक – स्वाद अनुसार"
          ],
          "steps": [
            "1. टमाटर और काजू को उबालकर पेस्ट बना लें",
            "2. कढ़ाई में मक्खन गरम करें",
            "3. टमाटर काजू पेस्ट डालें",
            "4. लाल मिर्च और नमक डालें",
            "5. पनीर के टुकड़े डालें",
            "6. 5 मिनट धीमी आंच पर पकाएं",
            "7. क्रीम और गरम मसाला डालें",
            "8. हरा धनिया डालकर परोसें"
          ]
        };

      default:
        return {"ingredients": [], "steps": []};
    }
  }

  Widget _sectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _ingredient(String text) {
    return ListTile(
      leading: const Icon(Icons.check_circle, color: Colors.green),
      title: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _step(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_right, color: Colors.orange),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}