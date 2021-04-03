//собирается из джосона, падение при неправильном джсоне

import 'package:bookworm/datamodels/user.dart';
import 'package:bookworm/repositories/user_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/test.dart';


Future<void> main() async {
  await Hive.initFlutter();
   Hive
    ..registerAdapter(UserModelAdapter());

  test('save/restore user', () async {
    final userRep = UserRepository();
    final user = UserModel.fromJson(<String, dynamic>{
      'email':'test email',
      'password':'test pass',
      'token':'test token',  
    });
    await userRep.saveUser(user);
    final restoredUser = await userRep.getUser();

    expect(user.email, restoredUser.email);
    expect(user.password, restoredUser.password );
    expect(user.token, restoredUser.token);
  });

  test('clear', () async {
    final userRep = UserRepository();
    final user = UserModel.fromJson(<String, dynamic>{
      'email':'test email',
      'password':'test pass',
      'token':'test token',  
    });
    await userRep.saveUser(user);
    
    await userRep.clear();
    final restoredUser = await userRep.getUser();
    final defaultModel = UserModel(email: "", password: "", token: "");

    expect(restoredUser.email, defaultModel.email);
    expect(restoredUser.password, defaultModel.password);
    expect(restoredUser.token, defaultModel.token);
  });

}



