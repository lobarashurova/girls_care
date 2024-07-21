import 'package:girls_care/common/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/storage/storage.dart';
import 'splash_state.dart';

@injectable
class SplashCubit extends BaseCubit<SplashBuildable, SplashListenable> {
  SplashCubit(this._storage) : super(const SplashBuildable());

  final Storage _storage;

  Future<void> changeStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = _storage.enabled.call();
    final onboard = _storage.showOnboard.call() ?? true;
    print(
        "22222222222222222222222222222222222--------------------------------------");
    if (onboard) {
      print("33333333333333333333333--------------------------------------");
      invoke(const SplashListenable(SplashEffect.onboard));
      return;
    }
    if (token == null) {
      invoke(const SplashListenable(SplashEffect.login));
      return;
    }
    invoke(const SplashListenable(SplashEffect.home));
    return;
  }
}
