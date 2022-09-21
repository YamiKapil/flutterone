import 'package:flutter/material.dart';
import 'package:flutter_one/flutter_mvvm/user_list/views_models/user_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddUser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              onChanged: (val) async {
                userViewModel.addingUser.name = val;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (val) async {
                userViewModel.addingUser.email = val;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                bool userAdded = await userViewModel.addUser();
                if (!userAdded) {
                  return;
                }
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
