part of 'hello_bloc.dart';

@immutable
sealed class HelloEvent {}

final class AddCounterEvent extends HelloEvent {}
