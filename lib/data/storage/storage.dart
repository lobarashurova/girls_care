import 'package:girls_care/common/base/base_storage.dart';
import 'package:girls_care/data/api_model/tokens/tokens.dart';
import 'package:girls_care/presentation/auth/plan/girl_mode.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Storage {
  Storage(this._box);

  final Box _box;

  @FactoryMethod(preResolve: true)
  static Future<Storage> create() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TokensImplAdapter());

    final box = await Hive.openBox('storage');
    return Storage(box);
  }

  BaseStorage<bool> get showOnboard => BaseStorage(_box, 'showOnboard');

  BaseStorage<Tokens> get tokens => BaseStorage(_box, 'token');

  BaseStorage<int> get status => BaseStorage(_box, 'status');

  BaseStorage<String> get phone => BaseStorage(_box, 'phone');

  BaseStorage<String> get password => BaseStorage(_box, 'password');

  BaseStorage<String> get name => BaseStorage(_box, 'name');

  BaseStorage<int> get age => BaseStorage(_box, 'age');

  BaseStorage<bool> get enabled => BaseStorage(_box, 'enabled');

  BaseStorage<GirlMode> get mode => BaseStorage(_box, 'mode');
  BaseStorage<int> get avarageSikl => BaseStorage(_box, 'avarage_sikl');
  BaseStorage<int> get avarageHayz => BaseStorage(_box, 'avarage_hayz');
  BaseStorage<String> get lastDay => BaseStorage(_box, 'last_day');

}
