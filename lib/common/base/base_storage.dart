import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

class BaseStorage<T> {
  final Box box;

  final String? key;

  String get _key => key ?? T.runtimeType.toString();

  BaseStorage(this.box, this.key);

  T? call() => box.get(_key);

  Future<void> set(T? value) => box.put(_key, value);

  Future<void> delete() => box.delete(_key);

  Stream<T?> watch() async* {
    final initial = call();
    yield* box
        .watch(key: _key)
        .map((event) => event.value as T?)
        .startWith(initial);
  }
}
