part of '../login/login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class Loginload extends LoginState {}
final class Loginsucess extends LoginState {}
// ignore: must_be_immutable
final class Loginfailuer extends LoginState {
  String errmass;
  Loginfailuer({required this.errmass});
}
