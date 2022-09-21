import 'package:flutter/material.dart';
import 'package:flutter_one/note_app/provider/note_provider.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../pages/note_detail.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var noteData = Provider.of<NoteProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 1 * SizeConfig.heightMultiplier!,
        horizontal: 2 * SizeConfig.widthMultiplier!,
      ),
      child: (noteData.noteDataList.values.isNotEmpty)
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3 * SizeConfig.widthMultiplier!),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.deleteAll),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(AppLocalizations.of(context)!
                                  .deleteAllMessage),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.cancel),
                                ),
                                TextButton(
                                  onPressed: () {
                                    noteData.deleteAllNoteData(
                                        noteData.noteDataList.keys);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: noteData.noteDataList.keys.length,
                    itemBuilder: (context, index) {
                      var key = noteData.noteDataList.keys.toList()[index];
                      // var noteDataa = noteData.noteBox.getAt(key);
                      var noteDataa =
                          noteData.noteDataList.values.toList()[index];
                      // var noteDataa = data[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoteDetail(
                                  noteTitle: key,
                                  noteDescription: noteDataa,
                                  title:
                                      AppLocalizations.of(context)!.editNote),
                            ),
                          );
                        },
                        child: Dismissible(
                          confirmDismiss: (c) => showDialog(
                              context: context,
                              builder: (c) => AlertDialog(
                                    title: Text(AppLocalizations.of(context)!
                                        .deleteOneMessage),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .cancel),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          noteData.deleteNoteData(index);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  )),
                          background: Container(
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: 2 * SizeConfig.widthMultiplier!),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    size: 10 * SizeConfig.imageSizeMultiplier!,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          direction: DismissDirection.endToStart,

                          key: Key(key),
                          // onDismissed: (context) {
                          //   // noteData.deleteNoteData(index);
                          //   noteData.deleteNoteData(index);
                          // },
                          child: Card(
                            child: ListTile(
                              title: Text(key),
                              subtitle: Text(noteDataa),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: Text(AppLocalizations.of(context)!.noData),
            ),
    );
  }
}
