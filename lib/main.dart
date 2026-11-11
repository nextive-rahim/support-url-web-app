import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

/// Brand colors taken from the Vitez app logo.
class AppColors {
  static const maroonDark = Color(0xFF2A0008);
  static const maroon = Color(0xFF5A0012);
  static const maroonLight = Color(0xFF8B1A2B);
  static const gold = Color(0xFFF2C14E);
  static const goldDeep = Color(0xFFC8902A);
  static const cream = Color(0xFFFFF8EC);
  static const ink = Color(0xFF2B1A1C);
  static const muted = Color(0xFF6E5A5C);
}

const _email = 'rahim.nextive@gmail.com';
const _phone = '+8801718663032';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vitez Support',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.maroon,
          primary: AppColors.maroon,
          secondary: AppColors.gold,
        ),
        scaffoldBackgroundColor: AppColors.cream,
      ),
      home: const SupportPage(),
    );
  }
}

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, viewport) => SingleChildScrollView(
          child: ConstrainedBox(
            // Keeps the footer pinned to the bottom on tall screens.
            constraints: BoxConstraints(minHeight: viewport.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const _Hero(),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 860),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                          child: Transform.translate(
                            offset: const Offset(0, -40),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _IntroCard(),
                                SizedBox(height: 20),
                                _TroubleshootingSection(),
                                SizedBox(height: 20),
                                _ContactSection(),
                                SizedBox(height: 20),
                                _FaqSection(),
                                SizedBox(height: 20),
                                _DeveloperCard(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const _Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Hero
// ---------------------------------------------------------------------------

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 600;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, isWide ? 56 : 40, 16, isWide ? 96 : 80),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.4),
          radius: 1.4,
          colors: [AppColors.maroonLight, AppColors.maroon, AppColors.maroonDark],
          stops: [0, 0.45, 1],
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gold.withValues(alpha: 0.35),
                  blurRadius: 40,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/images/logo.png',
                width: isWide ? 140 : 112,
                height: isWide ? 140 : 112,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Support – Vitez App',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.gold,
              fontSize: isWide ? 38 : 28,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Welcome to the Vitez Support Page',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: isWide ? 18 : 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sections
// ---------------------------------------------------------------------------

class _IntroCard extends StatelessWidget {
  const _IntroCard();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Text(
        'We’re here to help you with any questions or issues related to the '
        'Vitez app. Below you’ll find resources and contact information for '
        'quick assistance.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, height: 1.6, color: AppColors.ink),
      ),
    );
  }
}

class _TroubleshootingSection extends StatelessWidget {
  const _TroubleshootingSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(emoji: '🔧', title: 'Common Troubleshooting'),
          SizedBox(height: 16),
          _QaTile(
            icon: Icons.phone_android_rounded,
            question: 'App Not Opening',
            answer: 'Make sure your app is updated to the latest version.',
          ),
          _QaTile(
            icon: Icons.lock_outline_rounded,
            question: 'Login Issues',
            answer:
                'Reset your password from the login screen or contact us if you still face issues.',
          ),
          _QaTile(
            icon: Icons.play_circle_outline_rounded,
            question: 'Video Not Playing',
            answer:
                'Ensure you have a stable internet connection and try restarting the app.',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(emoji: '📩', title: 'Contact Us'),
          const SizedBox(height: 8),
          const Text(
            'If you didn’t find your answer, feel free to contact us:',
            style: TextStyle(fontSize: 15, height: 1.5, color: AppColors.muted),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _ContactButton(
                icon: Icons.email_outlined,
                label: 'Email',
                value: _email,
                uri: Uri(scheme: 'mailto', path: _email),
              ),
              _ContactButton(
                icon: Icons.phone_outlined,
                label: 'Phone',
                value: _phone,
                uri: Uri(scheme: 'tel', path: _phone),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FaqSection extends StatelessWidget {
  const _FaqSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(emoji: '📚', title: 'FAQs'),
          SizedBox(height: 8),
          _FaqTile(
            question: 'Is the app free to use?',
            answer: 'Yes, the Vitez app is completely free.',
          ),
          _FaqTile(
            question: 'Can I use the app offline?',
            answer:
                'Currently, an internet connection is required to access most features.',
          ),
          _FaqTile(
            question: 'Where can I give feedback?',
            answer: 'Email us at $_email',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _DeveloperCard extends StatelessWidget {
  const _DeveloperCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.maroon, AppColors.maroonDark],
        ),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.6)),
      ),
      child: Wrap(
        spacing: 32,
        runSpacing: 20,
        children: [
          const _InfoBlock(
            items: [
              ('Name', 'Abdul Rahim'),
              ('Company', 'Nextive Solution'),
            ],
          ),
          _InfoBlock(
            heading: 'Contact :',
            items: const [
              ('phone', _phone),
              ('Email', _email),
            ],
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: AppColors.maroonDark,
      child: Text(
        '© ${DateTime.now().year} Nextive Solution · Vitez',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 13),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Building blocks
// ---------------------------------------------------------------------------

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.maroon.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.gold.withValues(alpha: 0.35)),
        ),
        child: Padding(padding: const EdgeInsets.all(24), child: child),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.emoji, required this.title});

  final String emoji;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.gold.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(emoji, style: const TextStyle(fontSize: 20)),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: AppColors.maroon,
            ),
          ),
        ),
      ],
    );
  }
}

class _QaTile extends StatelessWidget {
  const _QaTile({
    required this.icon,
    required this.question,
    required this.answer,
    this.isLast = false,
  });

  final IconData icon;
  final String question;
  final String answer;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(14),
        border: const Border(
          left: BorderSide(color: AppColors.goldDeep, width: 4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.maroonLight, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({
    required this.question,
    required this.answer,
    this.isLast = false,
  });

  final String question;
  final String answer;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            initiallyExpanded: true,
            tilePadding: EdgeInsets.zero,
            childrenPadding: const EdgeInsets.only(bottom: 12),
            expandedAlignment: Alignment.centerLeft,
            iconColor: AppColors.maroon,
            collapsedIconColor: AppColors.muted,
            title: Text(
              question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            children: [
              Text(
                answer,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
          if (!isLast)
            Divider(height: 1, color: AppColors.gold.withValues(alpha: 0.35)),
        ],
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.icon,
    required this.label,
    required this.value,
    required this.uri,
  });

  final IconData icon;
  final String label;
  final String value;
  final Uri uri;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.maroon,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => launchUrl(uri),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.gold, size: 22),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$label:',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({this.heading, required this.items});

  final String? heading;
  final List<(String, String)> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (heading != null) ...[
          Text(
            heading!,
            style: const TextStyle(
              color: AppColors.gold,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
        ],
        for (final (label, value) in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                  ),
                  TextSpan(
                    text: value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              style: const TextStyle(fontSize: 15),
            ),
          ),
      ],
    );
  }
}
