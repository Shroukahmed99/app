// import 'package:flutter/material.dart';

// class CustomLanguageSelectionDialog extends StatelessWidget {
//   final Function(String) onLanguageSelected;

//   const CustomLanguageSelectionDialog({super.key, required this.onLanguageSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "Choose Language",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             ListTile(
//               title: Text("Arabic"),
//               onTap: () {
//                 onLanguageSelected("Arabic");
//                 Navigator.pop(context); 
//               },
//             ),
//             ListTile(
//               title: Text("English"),
//               onTap: () {
//                 onLanguageSelected("English");
//                 Navigator.pop(context); 
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
