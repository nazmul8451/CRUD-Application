class PostModel {
  final String userId;
  final String id;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.body,
    required this.title,
  });

//Json to model object এ রূপান্তর করা
  factory PostModel.fromJson (Map<String, dynamic> jsonData){
    return PostModel(
      userId: jsonData['userId'].toString(),
        id: jsonData['id'].toString(),
        body: jsonData['body'].toString(),
        title: jsonData['title'].toString(),
    );
  }


}
