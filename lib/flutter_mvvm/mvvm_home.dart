import 'package:flutter/material.dart';
import 'package:flutter_one/flutter_mvvm/components/app_error.dart';
import 'package:flutter_one/flutter_mvvm/user_list/models/user_list_model.dart';
import 'package:flutter_one/flutter_mvvm/user_list/views_models/user_view_model.dart';
import 'package:provider/provider.dart';

import 'components/app_loadig.dart';
import 'mvvm_utils/navigation_utils.dart';

class MvvmHome extends StatelessWidget {
  const MvvmHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: () {
              openAddUser(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
          child: Container(
        child: Column(
          children: [
            _ui(userViewModel),
          ],
        ),
      )),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return Center(
        child: AppLoading(),
      );
    }
    if (userViewModel.userError.message != null) {
      // return Container(
      //   child: Text(userViewModel.userError.message.toString()),
      // );
      return AppError(
        errorText: userViewModel.userError.message.toString(),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserListModel userListModel = userViewModel.userListModel[index];
          return InkWell(
            onTap: () async {
              userViewModel.setSelectedUser(userListModel);
              openUserDetails(context);
            },
            child: Column(
              children: [
                Text(
                  userListModel.name ?? 'yo',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  userListModel.email ?? 'yo',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: userViewModel.userListModel.length,
      ),
    );
  }
}
