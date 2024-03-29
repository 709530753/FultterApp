
class MessageEntity {

int resultCode;
String message;
List<Data> data;

MessageEntity({this.resultCode, this.message, this.data});

MessageEntity.fromJson(Map<String, dynamic> json) {
resultCode = json['resultCode'];
message = json['message'];
if (json['data'] != null) {
data = new List<Data>();
json['data'].forEach((v) {
data.add(new Data.fromJson(v));
});
}
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['resultCode'] = this.resultCode;
  data['message'] = this.message;
  if (this.data != null) {
    data['data'] = this.data.map((v) => v.toJson()).toList();
  }
  return data;
}
}

class Data {
  int id;
  String title;
  String content;

  Data({this.id, this.title, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}