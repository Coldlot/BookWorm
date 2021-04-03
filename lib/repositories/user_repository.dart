import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/user.dart';
import 'package:hive/hive.dart';

class UserRepository {
  static const userBoxKey = "userBox";
  static const _accessKey = "userAccessKey";

  Future<UserModel> getUser() async {
    final box = await Hive.openBox<UserModel>(userBoxKey);
    final UserModel favorites = box.get(_accessKey, defaultValue: UserModel(email: "", password: "", token: ""));
    await box.close();
    return favorites;
  }

  Future<void> saveUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(userBoxKey);
    await box.put(_accessKey, user);
    logger.i("User has been added at box");
    await box.close();
  }

  Future<void> clear() async {
    final box = await Hive.openBox<UserModel>(userBoxKey);
    await box.clear();
    await box.close();
  }
}