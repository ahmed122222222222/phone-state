
part of 'contact_cubit.dart';

@immutable
sealed class ContactState {}

final class ContactInitial extends ContactState {}
final class Contactload extends ContactState {}
// ignore: must_be_immutable
final class Contactsucess extends ContactState {
   List<Contact> contact;
   
   Contactsucess({required this.contact});
}
final class Contactfailuer extends ContactState {}
