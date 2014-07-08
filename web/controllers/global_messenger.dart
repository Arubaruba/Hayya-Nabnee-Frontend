part of app;

@Controller(selector: '[global_messenger]', publishAs: 'ctrl1')
class GlobalMessenger {

  final Duration messageDuration = new Duration(seconds: 4);

  String message = 'a';
  //If a message expires it will check if it was the last message
  int messagesDisplayed = 0;
  bool messageVisible = true;
  
  RootScope rootScope;
  
  GlobalMessenger(this.rootScope);

  showMessage(String _message) {
    message = _message;
    messagesDisplayed++;
    messageVisible = true;
    int messageIndex = messagesDisplayed;
    new Timer(messageDuration, () {
      if (messageIndex == messagesDisplayed) {
        messageVisible = false;
      }
    });
  }
}
