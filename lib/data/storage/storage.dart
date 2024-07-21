import 'package:girls_care/common/base/base_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Storage {
  Storage(this._box);

  final Box _box;

  @FactoryMethod(preResolve: true)
  static Future<Storage> create() async {
    await Hive.initFlutter();

    // Hive.registerAdapter(TokensImplAdapter());

    final box = await Hive.openBox('storage');
    return Storage(box);
  }

  BaseStorage<bool> get showOnboard => BaseStorage(_box, 'showOnboard');


  BaseStorage<int> get status => BaseStorage(_box, 'status');

  BaseStorage<String> get phone => BaseStorage(_box, 'phone');

  BaseStorage<String> get username => BaseStorage(_box, 'username');

  BaseStorage<bool> get enabled => BaseStorage(_box, 'enabled');
}
