class ChatParticipant {
  String name;
  final String avatarUrl;
  final bool owner;
  final bool online;

  ChatParticipant({
    required this.name,
    required this.owner,
    required this.avatarUrl,
    this.online = false,
  });
}

class Message {
  ChatParticipant sender;
  List<String> text;

  Message(this.sender, this.text);

  // list of message from sender
  static List<Message> messages = [];
}

class ChatModel {
  List<Message> messages = [];

  void sendMessage(ChatParticipant sender, List<String> text) {
    var message = Message(sender, text);
    messages.add(message);
  }
}
