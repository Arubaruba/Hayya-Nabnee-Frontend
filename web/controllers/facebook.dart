part of app;

@Controller(selector:'[facebook]', publishAs: 'ctrl')
class Facebook {
  String facebookLogin = 'https://www.facebook.com/dialog/oauth/?client_id=' +
  config['facebook']['appId'] + '&redirect_uri=' +
  config['basepath'] + config['facebook']['afterFacebookLogin'] +
  '&state=TEST_TOKEN&scope=email';

  logIn() {
    HttpRequest.request(facebookLogin).then((HttpRequest httpRequest) {
      switch(httpRequest.status) {
        case 200:
        case 201:
          print('success!');
          break;
          
        default:
          print('fail');
      }
    });
  }
}
