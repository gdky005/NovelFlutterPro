class NovelListDataEntity {
  List<NovelListDataResult> result;
  int total;
  int code;
  String message;

  NovelListDataEntity({this.result, this.total, this.code, this.message});

  NovelListDataEntity.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<NovelListDataResult>();
      (json['result'] as List).forEach((v) {
        result.add(new NovelListDataResult.fromJson(v));
      });
    }
    total = json['total'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class NovelListDataResult {
  String sourceUrl;
  String name;
  int pid;
  int id;
  String url;

  NovelListDataResult({this.sourceUrl, this.name, this.pid, this.id, this.url});

  NovelListDataResult.fromJson(Map<String, dynamic> json) {
    sourceUrl = json['sourceUrl'];
    name = json['name'];
    pid = json['pid'];
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourceUrl'] = this.sourceUrl;
    data['name'] = this.name;
    data['pid'] = this.pid;
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
