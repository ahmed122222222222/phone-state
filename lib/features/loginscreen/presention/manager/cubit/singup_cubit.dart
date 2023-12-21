import 'package:bloc/bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:silent/features/loginscreen/data/repoimp.dart';

part 'singup_state.dart';

class SingupCubit extends Cubit<SingupState> {
  SingupCubit({required this.singuprepoimp}) : super(SingupInitial());
  Singuprepoimp singuprepoimp ;
  // ignore: non_constant_identifier_names
  void Singup(email ,pass){
    try {
  emit(SingupLoading());
     var r= singuprepoimp.createUserAndSendVerificationCode(email, pass);
     emit(Singupsucess());
} on Exception catch (e) {
 emit(Singupfailer(errmas: e.toString()));
}
  
  }
}
