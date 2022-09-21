import 'package:flutter/cupertino.dart';
import 'package:flutter_one/flutter_mvvm/user_list/models/user_list_model.dart';
import 'package:flutter_one/flutter_mvvm/user_list/repo/api_status.dart';
import 'package:flutter_one/flutter_mvvm/user_list/repo/user_service.dart';

import '../models/user_error.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = true;
  List<UserListModel> _userListModel = [];
  UserError _userError = UserError();
  late UserListModel _selectedUser;
  UserListModel _addingUser = UserListModel();

  bool get loading => _loading;
  List<UserListModel> get userListModel => _userListModel;
  UserError get userError => _userError;

  UserListModel get selectedUser => _selectedUser;
  UserListModel get addingUser => _addingUser;

  UserViewModel() {
    getUser();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserListModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserListModel userModel) {
    _selectedUser = userModel;
  }

  addUser() async {
    if (!isValid()) {
      return;
    }
    _userListModel.add(addingUser);
    _addingUser = UserListModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name == null || addingUser.name!.isEmpty) {
      return false;
    }
    if (addingUser.email == null || addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUser() async {
    setLoading(true);
    var response = await UserServices.getUser();
    // print(response);
    if (response is Success) {
      setUserListModel(response.resposne as List<UserListModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
