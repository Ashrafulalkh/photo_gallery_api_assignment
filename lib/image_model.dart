class ImageModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnail;

  ImageModel({this.albumId, this.id, this.title, this.url, this.thumbnail});

  ImageModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnail = json['thumbnailUrl'];
  }

}