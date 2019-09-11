class NovelDetailEntity {
  NovelDetailResult result;
  int code;
  String message;

  NovelDetailEntity({this.result, this.code, this.message});

  NovelDetailEntity.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? new NovelDetailResult.fromJson(json['result'])
        : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class NovelDetailResult {
  String sourceUrl;
  String author;
  String name;
  int pid;
  int id;
  String content;
  String url;

  NovelDetailResult(
      {this.sourceUrl,
      this.author,
      this.name,
      this.pid,
      this.id,
      this.content,
      this.url});

  NovelDetailResult.fromJson(Map<String, dynamic> json) {
    sourceUrl = json['sourceUrl'];
    author = json['author'];
    name = json['name'];
    pid = json['pid'];
    id = json['id'];
    content = json['content'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourceUrl'] = this.sourceUrl;
    data['author'] = this.author;
    data['name'] = this.name;
    data['pid'] = this.pid;
    data['id'] = this.id;
    data['content'] = this.content;
    data['url'] = this.url;
    return data;
  }
}
