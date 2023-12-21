part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}
final class FavLoad extends FavState {}
// ignore: must_be_immutable
final class FavSucess extends FavState {
 List<ContactsList> contact;
  FavSucess({required  this.contact});
}
final class FavFailuer extends FavState {}

