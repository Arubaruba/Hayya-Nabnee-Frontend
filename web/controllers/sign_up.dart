part of app;

@Controller(selector:'[sign-up]', publishAs: 'ctrl')
class SignUp {

  String username, email, password, repeatPassword;

  void submit(){
    print(loadJson('/backend/sign_up?' + [username, email, password, repeatPassword].join('&')));
  }
}
