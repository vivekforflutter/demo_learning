// import 'package:flutter/material.dart';
//
// import 'package:theme_test/session_manager/session_manager.dart';
//
// import '../../main.dart';
// import '../localization_helper.dart';
//
// class ChooseLanguage extends StatefulWidget {
//   const ChooseLanguage({super.key});
//
//   @override
//   State<ChooseLanguage> createState() => _ChooseLanguageState();
// }
//
// class _ChooseLanguageState extends State<ChooseLanguage> {
//   var selectedLanguage;
//   var langvalue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Choose Location"), centerTitle: true),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () async {
//                     setState(() {
//                       selectedLanguage = "en";
//                       langvalue = "en";
//                     });
//                     await SessionManager()
//                         .setString(SessionManager.LANGUAGE, "en");
//                     MyApp.setLocale(context, Locale("en","US"));
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(7),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 2,
//                             // color: widget.selectedLanguage  == "en" ? ColorClass.color_16ADE4 : Colors.transparent
//                           ),
//                           borderRadius: BorderRadius.circular(78),
//                         ),
//                         child: Container(
//                           width: 78,
//                           height: 78,
//                           decoration: const BoxDecoration(),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(getTranslatedValues("english"))
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     setState(() {
//                       selectedLanguage = "th";
//                       langvalue = "th";
//                     });
//                     await SessionManager()
//                         .setString(SessionManager.LANGUAGE, "th");
//                     // MyApp.setLocale(Get.context, Locale("th",""));
//
//                     /* Navigator.pushAndRemoveUntil(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                         builder: (context) => MenuScreen(),
//                                                       ),
//                                                           (val) => true,
//                                                     )*/
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(7),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 2,
//                             // color: widget.selectedLanguage == "th"   ? ColorClass.color_16ADE4 : Colors.transparent
//                           ),
//                           borderRadius: BorderRadius.circular(78),
//                         ),
//                         child: Container(
//                           width: 78,
//                           height: 78,
//                           decoration: const BoxDecoration(),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Text(
//                        "Thai"
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
