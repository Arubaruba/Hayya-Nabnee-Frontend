part of app;

@Controller(selector: '[sign-up]', publishAs: 'ctrl')
class SignUp {

  String username, email, password, repeatPassword;
  
  JsonLoader jsonLoader;
  
  SignUp(this.jsonLoader);

  void submit() {
    jsonLoader.load('/backend/sign_up?' + [username, email, password, repeatPassword].join('&')).then((dynamic result) {
      print(result);
    });
  }
}
