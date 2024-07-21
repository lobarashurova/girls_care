import 'package:equatable/equatable.dart';

class BaseState<BUILDABLE, LISTENABLE> implements Equatable {
  final BUILDABLE? buildable;
  final LISTENABLE? listenable;

  BaseState({this.buildable, this.listenable});

  @override
  List<Object?> get props => [buildable, listenable];

  @override
  bool? get stringify => true;
}