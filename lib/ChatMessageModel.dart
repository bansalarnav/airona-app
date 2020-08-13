import 'dart:convert';

ChatMessageModel chatMessageModelFromJson(String str) => ChatMessageModel.fromJson(json.decode(str));

String chatMessageModelToJson(ChatMessageModel data) => json.encode(data.toJson());

class ChatMessageModel {
    ChatMessageModel({
        this.chatId,
        this.to,
        this.from,
        this.message,
        this.chatType,
    });

    int chatId;
    int to;
    int from;
    String message;
    String chatType;

    factory ChatMessageModel.fromJson(Map<String, dynamic> json) => ChatMessageModel(
        chatId: json["chat_id"],
        to: json["to"],
        from: json["from"],
        message: json["message"],
        chatType: json["chat_type"],
    );

    Map<String, dynamic> toJson() => {
        "chat_id": chatId,
        "to": to,
        "from": from,
        "message": message,
        "chat_type": chatType,
    };
}