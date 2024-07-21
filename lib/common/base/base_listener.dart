import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:girls_care/common/base/base_state.dart';

class BaseListener<
    CUBIT extends StateStreamable<BaseState<BUILDABLE, LISTENABLE>>,
    BUILDABLE,
    LISTENABLE> extends StatelessWidget {
  const BaseListener({
    super.key,
    required this.listener,
    this.child,
  });

  final Function(LISTENABLE) listener;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CUBIT, BaseState<BUILDABLE, LISTENABLE>>(
      listenWhen: (previous, current) {
        return current.listenable != null;
      },
      listener: (context, state) {
        listener(state.listenable as LISTENABLE);
      },
      child: child,
    );
  }
}
