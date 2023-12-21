import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:silent/features/loginscreen/data/Loginrepo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginrepo}) : super(LoginInitial());
  Loginrepo loginrepo;
  void Singin(email ,pass)
{
  try {
  emit(Loginload());
  loginrepo.login(email, pass);
  emit(Loginsucess());
} on Exception catch (e) {
  emit(Loginfailuer(errmass: e.toString()));
}
}
}
