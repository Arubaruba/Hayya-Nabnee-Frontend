part of app;

@Controller(selector: '[project-list]', publishAs: 'ctrl')
class ProjectList {
  ProjectList() {

    HttpRequest.getString('fake_accounts.json')
      .then((String response) {
        JsonDecoder decoder = new JsonDecoder();
        print(decoder.convert(response).last['name']);
      }).catchError((Error error) {
        print(error.toString());
      });
  }
}
