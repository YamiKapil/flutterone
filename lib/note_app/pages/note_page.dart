import 'package:flutter/material.dart';
import 'package:flutter_one/main.dart';
import 'package:flutter_one/note_app/pages/note_detail.dart';
import 'package:flutter_one/note_app/provider/language_provider.dart';
import 'package:flutter_one/note_app/provider/note_provider.dart';
import 'package:flutter_one/note_app/widgets/note_card.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:flutter_one/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    // final noteTextData = Provider.of<NoteProvider>(context);
    final appLanguage = Provider.of<AppLanguageProvider>(context);
    final themeEditor = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
        actions: [
          Row(
            children: [
              (themeEditor.isDarkMode == true)
                  ? const Icon(Icons.brightness_2)
                  : const Icon(Icons.brightness_7),
              Switch.adaptive(
                value: themeEditor.isDarkMode,
                onChanged: (value) {
                  themeEditor.setTheme();
                },
              ),
            ],
          ),
          // Row(
          //   children: [
          //     TextButton(
          //       onPressed: () {
          //         // context.read<AppLanguageProvider>().changeLanguage('ne');
          //         appLanguage.changeLanguage('ne');
          //       },
          //       child: Text(
          //         'नेपाली',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {
          //         appLanguage.changeLanguage('en');
          //         // context.read<AppLanguageProvider>().changeLanguage('en');
          //       },
          //       child: Text(
          //         'En',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: (noteTextData.noteData.isNotEmpty)
      //         ? Column(
      //             children: [
      //               Padding(
      //                 padding: EdgeInsets.symmetric(
      //                   // vertical: 2 * SizeConfig.heightMultiplier!,
      //                   horizontal: 2 * SizeConfig.widthMultiplier!,
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     const Text('Delete All Data'),
      //                     IconButton(
      //                         onPressed: () {
      //                           noteTextData
      //                               .deleteAllData(noteTextData.box.values);
      //                         },
      //                         icon: const Icon(Icons.delete_forever)),
      //                   ],
      //                 ),
      //               ),
      //               Expanded(
      //                 child: ListView.builder(
      //                   itemCount: noteTextData.box.length,
      //                   itemBuilder: (context, index) {
      //                     var data = noteTextData.box.values.toList();
      //                     return Padding(
      //                       padding: EdgeInsets.symmetric(
      //                         horizontal: 3 * SizeConfig.widthMultiplier!,
      //                         vertical: 1 * SizeConfig.heightMultiplier!,
      //                       ),
      //                       child: Container(
      //                         child: Column(
      //                           children: [
      //                             Row(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Text(data[index]),
      //                                 IconButton(
      //                                   onPressed: () {
      //                                     noteTextData.deleteData();
      //                                   },
      //                                   icon: const Icon(
      //                                     Icons.delete,
      //                                     color: Colors.red,
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     );
      //                   },
      //                 ),
      //               ),
      //             ],
      //           )
      //         : const Text('Please start adding note'),
      //   ),
      // ),
      body: const NoteCard(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _dialogBox();
          //  NoteDetail();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NoteDetail(title: AppLocalizations.of(context)!.addNote)),
          );
        },
        child: const Icon(Icons.note_add),
      ),
    );
  }

  // _dialogBox() {
  //   String noteText = "";
  //   // TextEditingController? _noteController;
  //   final noteTextData = Provider.of<NoteProvider>(context, listen: false);
  //   final _noteController = TextEditingController();

  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         // insetPadding: EdgeInsets.symmetric(
  //         //   vertical: 20 * SizeConfig.heightMultiplier!,
  //         //   horizontal: 10 * SizeConfig.widthMultiplier!,
  //         // ),
  //         child: SizedBox(
  //           height: 25 * SizeConfig.heightMultiplier!,
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(
  //               vertical: 2 * SizeConfig.heightMultiplier!,
  //               horizontal: 1 * SizeConfig.widthMultiplier!,
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Text('Enter Your Note'),
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: 2 * SizeConfig.widthMultiplier!,
  //                   ),
  //                   child: TextField(
  //                     controller: _noteController,
  //                     // onChanged: (value) {
  //                     //   noteText = _noteController.text;
  //                     // },
  //                     onSubmitted: (value) {
  //                       noteText = _noteController.text;
  //                       noteTextData.setData(noteText);
  //                       _noteController.clear();
  //                       Navigator.of(context).pop();
  //                     },
  //                   ),
  //                 ),
  //                 Row(
  //                   // crossAxisAlignment: CrossAxisAlignment.end,
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     TextButton(
  //                         onPressed: () {
  //                           Navigator.of(context).pop();
  //                         },
  //                         child: const Text('Cancel')),
  //                     TextButton(
  //                         onPressed: () {
  //                           noteText = _noteController.text;
  //                           noteTextData.setData(noteText);
  //                           _noteController.clear();
  //                           Navigator.of(context).pop();
  //                         },
  //                         child: const Text('Submit')),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
