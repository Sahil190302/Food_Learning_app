import 'dart:ui';
import 'package:ed_tech_app/configs/videourls.dart';
import 'package:ed_tech_app/screen/youtube_player_screen.dart';
import 'package:flutter/material.dart';

class IndianContinental extends StatelessWidget {
  const IndianContinental ({super.key});

  Widget _buildFooterText() {
    return Column(
      children: [
        Divider(
          color: Colors.white.withOpacity(0.15),
          thickness: 1,
          indent: 40,
          endIndent: 40,
        ),
        const SizedBox(height: 12),
        Text(
          'Stay Tuned, The List will be updated soon🍨',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            height: 1.6,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.65),
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      _DessertItem(
        'Grilled Chicken',
        'assets/continental/grilled_chicken.jpg',
        VideoUrls.grilledchicken,
      ),
      _DessertItem(
        'Sautéed Vegetables',
        'assets/continental/sauteed_vege.jpg',
        VideoUrls.Sauteed_vege,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1B),
      appBar: AppBar(
        title: const Text(
          'Desserts',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 🔹 Grid
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  return _GlassDessertCard(item: items[index]);
                },
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Footer
            _buildFooterText(),
          ],
        ),
      ),
    );
  }
}

/* ---------------------------------------------------------- */
/* ------------------- GLASS DESSERT CARD -------------------- */
/* ---------------------------------------------------------- */

class _GlassDessertCard extends StatelessWidget {
  final _DessertItem item;
  const _GlassDessertCard({required this.item});

  void _showActionDialog(BuildContext context, _DessertItem item) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.25),
                    width: 1.2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🔹 Title
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 📖 Read Recipe
                    _dialogOption(
                      icon: Icons.menu_book_rounded,
                      emoji: '📖',
                      text: 'Read Recipe',
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: Navigate to recipe screen
                      },
                    ),

                    const SizedBox(height: 14),

                    // 🎬 Watch Video
                    _dialogOption(
                      icon: Icons.play_circle_fill_rounded,
                      emoji: '🎬',
                      text: 'Watch Video',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => YoutubePlayerScreen(
                              title: item.name,
                              videoUrl: item.videoUrl,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _dialogOption({
    required IconData icon,
    required String emoji,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.25), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 14),
            Text(
              '$emoji  $text',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.white.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showActionDialog(context, item),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Image (clear)
            Positioned.fill(child: Image.asset(item.image, fit: BoxFit.cover)),

            // Dark overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
            ),

            // Glass overlay (no blur)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.25),
                    width: 1.2,
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.icecream,
                        size: 14,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Indian Dessert',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------------------------------------------------- */
/* ---------------------- MODEL ------------------------------ */
/* ---------------------------------------------------------- */

class _DessertItem {
  final String name;
  final String image;
  final String videoUrl;

  _DessertItem(this.name, this.image, this.videoUrl);
}
