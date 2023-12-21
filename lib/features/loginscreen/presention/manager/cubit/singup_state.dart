part of 'singup_cubit.dart';

@immutable
sealed class SingupState {}

final class SingupInitial extends SingupState {}
final class SingupLoading extends SingupState {}
final class Singupsucess extends SingupState {}
// ignore: must_be_immutable
final class Singupfailer extends SingupState {
  String errmas;
  Singupfailer({required this.errmas});
}
