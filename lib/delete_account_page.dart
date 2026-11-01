import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _appName = 'Shikkhangon';
const _supportEmail = 'Shikkhangon15@gmail.com';

const _textDark = Color(0xFF0F172A);
const _textBody = Color(0xFF334155);
const _danger = Color(0xFF8B0A14);
const _link = Color(0xFFD70A2E);

/// Static demo page explaining how to delete a Shikkhangon account.
/// The confirm flow only shows a success message; no request is sent.
class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final narrow = width < 600;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: narrow ? 12 : 24,
          vertical: narrow ? 16 : 40,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: narrow ? 20 : 56,
                vertical: narrow ? 28 : 48,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE5E7EB)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F0F172A),
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: const _PageContent(),
            ),
          ),
        ),
      ),
    );
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 64,
            semanticLabel: _appName,
          ),
        ),
        const SizedBox(height: 28),
        const Center(
          child: Text(
            'Delete Your Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Request permanent deletion of your $_appName account and the '
            'data linked to it.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, height: 1.5, color: _textBody),
          ),
        ),
        const _Heading('What happens when you delete your account'),
        const _Paragraph(
          'Deleting your account is permanent and cannot be undone. The '
          'following will be removed:',
        ),
        const _BulletList([
          'Your profile and personal information',
          'Purchased courses and your access to them',
          'Exam history, results and rankings',
          'Content you created, such as notes and flashcards',
        ]),
        const _Paragraph(
          'Some payment records may be kept where we are required to for '
          'legal and accounting reasons.',
        ),
        const _Heading('Before you delete'),
        const _BulletList([
          'Save any notes or information you want to keep.',
          'Settle any pending payments or orders.',
          'Purchased courses are not refunded, and you lose access to them '
              'immediately.',
        ]),
        const _Heading('How to delete your account'),
        const _BulletList(numbered: true, [
          'Sign in to your $_appName account.',
          'Open this page and click the Delete Account button below.',
          'Confirm your decision by typing DELETE in the popup.',
          'Your request is submitted and your account is deleted within '
              '24 hours.',
        ]),
        const _Heading('Deletion timeline'),
        const _BulletList([
          'Deletion takes effect 24 hours after you submit the request.',
          'During these 24 hours your account is deactivated but not '
              'erased. To cancel the request, contact support.',
        ]),
        const _Heading('Need help?'),
        const _HelpText(),
        const SizedBox(height: 28),
        FilledButton(
          onPressed: () => _showConfirmDialog(context),
          style: FilledButton.styleFrom(
            backgroundColor: _danger,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          child: const Text('Delete Account'),
        ),
      ],
    );
  }

  Future<void> _showConfirmDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => const _ConfirmDeleteDialog(),
    );
    if (confirmed != true || !context.mounted) return;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          'Request submitted',
          style: TextStyle(fontWeight: FontWeight.w700, color: _textDark),
        ),
        content: const Text(
          'Your account deletion request has been received. Your account is '
          'now deactivated and will be permanently deleted within 24 hours.',
          style: TextStyle(height: 1.5, color: _textBody),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _ConfirmDeleteDialog extends StatefulWidget {
  const _ConfirmDeleteDialog();

  @override
  State<_ConfirmDeleteDialog> createState() => _ConfirmDeleteDialogState();
}

class _ConfirmDeleteDialogState extends State<_ConfirmDeleteDialog> {
  final _controller = TextEditingController();

  bool get _canDelete => _controller.text.trim() == 'DELETE';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 448),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delete your account?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'This action is permanent. All of your data — including '
                'courses, exam history, and purchases — will be removed. '
                'This cannot be undone.',
                style: TextStyle(fontSize: 14, height: 1.5, color: _textBody),
              ),
              const SizedBox(height: 18),
              const Text.rich(
                TextSpan(
                  text: 'Type ',
                  children: [
                    TextSpan(
                      text: 'DELETE',
                      style: TextStyle(
                        color: _link,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(text: ' to confirm:'),
                  ],
                ),
                style: TextStyle(fontSize: 14, color: _textBody),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _controller,
                autofocus: true,
                onChanged: (_) => setState(() {}),
                onSubmitted: (_) {
                  if (_canDelete) Navigator.of(context).pop(true);
                },
                decoration: InputDecoration(
                  hintText: 'DELETE',
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFEEF1F6),
                        foregroundColor: _textDark,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: _canDelete
                          ? () => Navigator.of(context).pop(true)
                          : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: _link,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: const Color(0xFFF19AA7),
                        disabledForegroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Delete Account'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HelpText extends StatelessWidget {
  const _HelpText();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:
            'If you would rather fix a problem than delete your account, '
            'write to ',
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () =>
                    launchUrl(Uri(scheme: 'mailto', path: _supportEmail)),
                child: const Text(
                  _supportEmail,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: _link,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: _link,
                  ),
                ),
              ),
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
      style: const TextStyle(fontSize: 16, height: 1.6, color: _textBody),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: _textDark,
        ),
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  const _Paragraph(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, height: 1.6, color: _textBody),
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList(this.items, {this.numbered = false});

  final List<String> items;
  final bool numbered;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 16, height: 1.6, color: _textBody);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < items.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    child: Text(numbered ? '${i + 1}.' : '•', style: style),
                  ),
                  Expanded(child: Text(items[i], style: style)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
