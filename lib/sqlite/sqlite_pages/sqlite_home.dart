import 'package:flutter/material.dart';
import 'package:flutter_one/sqlite/sqlite_database/sqlite_database.dart';
import 'package:flutter_one/sqlite/sqlite_model/sqlite_model.dart';

class SqliteHome extends StatefulWidget {
  const SqliteHome({Key? key}) : super(key: key);

  @override
  State<SqliteHome> createState() => _SqliteHomeState();
}

class _SqliteHomeState extends State<SqliteHome> {
  DBHelper? dbHelper;
  late Future<List<SqliteNoteModel>> notesList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() {
    notesList = dbHelper!.showList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLITE Database Flutter'),
      ),
      body: FutureBuilder(
        future: notesList,
        builder: (context, AsyncSnapshot<List<SqliteNoteModel>> snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        dbHelper!.updateData(
                          SqliteNoteModel(
                            id: snapshot.data![index].id,
                            title: 'New title',
                            age: 22,
                            description: 'New description',
                            email: 'new@email.com',
                          ),
                        );
                        setState(() {
                          notesList = dbHelper!.showList();
                        });
                      },
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          child: const Icon(Icons.delete_rounded),
                        ),
                        key: ValueKey<int?>(snapshot.data![index].id!),
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            dbHelper!.deleteData(snapshot.data![index].id!);
                            notesList = dbHelper!.showList();
                            snapshot.data!.remove(snapshot.data![index]);
                          });
                        },
                        child: Card(
                          child: ListTile(
                            leading: Text(snapshot.data![index].id.toString()),
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(snapshot.data![index].description),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text('No data'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper!
              .insert(
                SqliteNoteModel(
                  title: 'First Note',
                  age: 22,
                  description: 'This is first note',
                  email: 'email@email.com',
                ),
              )
              .then((value) => print('Data added successfully'))
              .onError(
                (error, stackTrace) => print(error.toString()),
              );
          setState(() {
            notesList = dbHelper!.showList();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
