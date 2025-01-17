import 'package:flutter_examples/data/api/user_api.dart';
import '../data/model/user_model.dart';

class UserRepository {
  Future<List<UserModel>> getUsers() async => UserApiService().fetchUsers();
}
