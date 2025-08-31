
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Center(
                  child: SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Get started.',
                            style: GoogleFonts.inter(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          _buildSocialButton(
                            context,
                            text: 'Continue with Google',
                            // Using a reliable PNG URL for the Google logo
                            iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',
                          ),
                          const SizedBox(height: 10),
                          _buildSocialButton(
                            context,
                            text: 'Continue with Apple',
                            isApple: true,
                          ),
                          const SizedBox(height: 20),
                          _buildDivider(),
                          const SizedBox(height: 20),
                          _buildCreateAccountButton(context),
                          const SizedBox(height: 20),
                          _buildSignInLink(context),
                          const SizedBox(height: 40),
                          _buildFooter(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, {required String text, String? iconUrl, bool isApple = false}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size.fromHeight(52),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {},
      icon: isApple
          ? const Icon(Icons.apple, color: Colors.black, size: 24)
          : Image.network(
              iconUrl!,
              height: 24, 
              width: 24,
              // Add an error builder to show an icon if the image fails to load
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error_outline, color: Colors.red, size: 24);
              },
            ),
      label: Text(text),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFF333333))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or',
            style: GoogleFonts.inter(color: const Color(0xFF777777)),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFF333333))),
      ],
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: const Color(0xFF0A84FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        minimumSize: const Size.fromHeight(52),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: () {},
      child: const Text('Create an account'),
    );
  }

  Widget _buildSignInLink(BuildContext context) {
    return Column(
      children: [
        Text(
          'Already have an account?',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 15.2,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xFF0A84FF), backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {},
          child: const Text('Sign in'),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'By creating an account, you agree to the ',
        style: GoogleFonts.inter(color: const Color(0xFF888888), fontSize: 12.8),
        children: [
          TextSpan(
            text: 'Terms of Service',
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              // Handle terms of service link tap
            },
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              // Handle privacy policy link tap
            },
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
