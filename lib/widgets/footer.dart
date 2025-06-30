// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Footer extends StatelessWidget {
//   const Footer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).primaryColor,
//       padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//       child: Column(
//         children: [
//           const Text(
//             '© 2025 Karim Tamer. Built with Flutter.',
//             style: TextStyle(color: Colors.white),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
//                 onPressed: () => _launchUrl('https://github.com/KarimTamer74'),
//               ),
//               const SizedBox(width: 16),
//               IconButton(
//                 icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
//                 onPressed: () => _launchUrl('https://linkedin.com/in/karim-tamer74'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _launchUrl(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri)) {
//       throw 'Could not launch $url';
//     }
//   }
// }