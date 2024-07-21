import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:girls_care/common/base/base_state.dart';

class BaseBuilder<
    CUBIT extends StateStreamable<BaseState<BUILDABLE, LISTENABLE>>,
    BUILDABLE,
    LISTENABLE> extends StatelessWidget {
  final List<dynamic> Function(BUILDABLE) properties;
  final bool Function(BUILDABLE)? buildWhen;
  final Widget Function(BuildContext context, BUILDABLE buildable) builder;

  BaseBuilder({
    super.key,
    List<dynamic> Function(BUILDABLE)? properties,
    required this.builder,
    this.buildWhen,
  }) : properties = properties ?? ((state) => [state]);

  final Function equals = const DeepCollectionEquality().equals;

  @override
  Widget build(BuildContext context) {
    List<Object?>? built;
    return BlocBuilder<CUBIT, BaseState<BUILDABLE, LISTENABLE>>(
      buildWhen: (_, current) {
        if (current.buildable == null) return false;
        return !equals(built, properties(current.buildable as BUILDABLE)) &&
            (buildWhen == null || buildWhen!(current as BUILDABLE));
      },
      builder: (context, state) {
        built = properties(state.buildable as BUILDABLE);
        return builder(context, state.buildable as BUILDABLE);
      },
    );
  }
}
