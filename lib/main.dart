import 'package:flutter/material.dart';

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
  static const muted = Color(0xFF5E4A4C);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vitez – Privacy Policy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.maroon,
          primary: AppColors.maroon,
          secondary: AppColors.gold,
        ),
        scaffoldBackgroundColor: AppColors.cream,
      ),
      home: const PrivacyPolicyPage(),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
                                _DeleteDataSection(),
                                SizedBox(height: 20),
                                _LinksSection(),
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
          colors: [
            AppColors.maroonLight,
            AppColors.maroon,
            AppColors.maroonDark,
          ],
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
          const SizedBox(height: 20),
          Text(
            'Vitez',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: isWide ? 22 : 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Privacy policy',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.gold,
              fontSize: isWide ? 40 : 30,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.gold.withValues(alpha: 0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.update_rounded,
                  size: 16,
                  color: AppColors.gold,
                ),
                const SizedBox(width: 8),
                Text(
                  'Last updated: August 26, 2025',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 14,
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

// ---------------------------------------------------------------------------
// Sections
// ---------------------------------------------------------------------------

class _IntroCard extends StatelessWidget {
  const _IntroCard();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Paragraph(
            'This Privacy Policy describes Our policies and procedures on the '
            'collection, use and disclosure of Your information when You use '
            'the Service and tells You about Your privacy rights and how the '
            'law protects You.',
          ),
          SizedBox(height: 16),
          _Highlight(
            icon: Icons.verified_user_outlined,
            text: 'We do not store any personal data or information from our users.',
          ),
        ],
      ),
    );
  }
}

class _DeleteDataSection extends StatelessWidget {
  const _DeleteDataSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.delete_outline_rounded,
            title: 'Delete Your Personal Data',
          ),
          SizedBox(height: 16),
          _Paragraph(
            'You have the right to delete or request that We assist in deleting '
            'the Personal Data that We have collected about You.',
          ),
          _Gap(),
          _Paragraph(
            'Our Service may give You the ability to delete certain information '
            'about You from within the Service.',
          ),
          _Gap(),
          _Paragraph(
            'You may update, amend, or delete Your information at any time by '
            'signing in to Your Account, if you have one, and visiting the '
            'account settings section that allows you to manage Your personal '
            'information. You may also contact Us to request access to, '
            'correct, or delete any personal information that You have '
            'provided to Us.',
          ),
          _Gap(),
          _Note(
            'Please note, however, that We may need to retain certain '
            'information when we have a legal obligation or lawful basis to do so.',
          ),
        ],
      ),
    );
  }
}

class _LinksSection extends StatelessWidget {
  const _LinksSection();

  @override
  Widget build(BuildContext context) {
    return const _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: Icons.link_rounded,
            title: 'Links to Other Websites',
          ),
          SizedBox(height: 16),
          _Paragraph(
            "Our Service may contain links to other websites that are not "
            "operated by Us. If You click on a third party link, You will be "
            "directed to that third party's site. We strongly advise You to "
            "review the Privacy Policy of every site You visit.",
          ),
          _Gap(),
          _Paragraph(
            'We have no control over and assume no responsibility for the '
            'content, privacy policies or practices of any third party sites '
            'or services.',
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
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.7),
          fontSize: 13,
        ),
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
  const _SectionTitle({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.gold.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.maroon, size: 22),
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

class _Paragraph extends StatelessWidget {
  const _Paragraph(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: const TextStyle(fontSize: 16, height: 1.7, color: AppColors.muted),
    );
  }
}

class _Gap extends StatelessWidget {
  const _Gap();

  @override
  Widget build(BuildContext context) => const SizedBox(height: 14);
}

class _Highlight extends StatelessWidget {
  const _Highlight({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.maroon,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold, size: 26),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Note extends StatelessWidget {
  const _Note(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Icon(
            Icons.info_outline_rounded,
            color: AppColors.maroonLight,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
