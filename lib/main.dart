import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Brand colors taken from the Protiva app (protiva/lib/src/core/gen/colors.gen.dart).
class AppColors {
  static const brandDark = Color(0xFF7A0D12);
  static const brandEdge = Color(0xFF9C1218);
  static const brand = Color(0xFFEB2027);
  static const brandLight = Color(0xFFF2545A);
  static const brandTint = Color(0xFFFDECEC);
  static const surface = Color(0xFFF7F7F7);
  static const ink = Color(0xFF272D36);
  static const muted = Color(0xFF52575E);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Protiva – Privacy Policy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.brand,
          primary: AppColors.brand,
          secondary: AppColors.brandEdge,
        ),
        scaffoldBackgroundColor: AppColors.surface,
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
            AppColors.brandLight,
            AppColors.brand,
            AppColors.brandEdge,
          ],
          stops: [0, 0.45, 1],
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
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
            'Protiva',
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
              color: Colors.white,
              fontSize: isWide ? 40 : 30,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.update_rounded,
                  size: 16,
                  color: Colors.white,
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
      color: AppColors.brandDark,
      child: Text(
        '© ${DateTime.now().year} Nextive Solution · Protiva',
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
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.brand.withValues(alpha: 0.15)),
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
            color: AppColors.brandTint,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.brand, size: 22),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
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
        color: AppColors.brand,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 26),
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
        color: AppColors.brandTint,
        borderRadius: BorderRadius.circular(14),
        border: const Border(
          left: BorderSide(color: AppColors.brand, width: 4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: AppColors.brandEdge,
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
