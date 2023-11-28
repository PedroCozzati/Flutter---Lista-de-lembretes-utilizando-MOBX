import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyLink extends StatelessWidget {
  final String text;

  PrivacyPolicyLink({required this.text});

  final Uri toLaunch =
  Uri(scheme: 'https', host: 'www.google.com');

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _launchInBrowser(toLaunch);
      },
      child: Text(text),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }


  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri(path:url ))) {
      await launchUrl(Uri(path:url));
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }
}