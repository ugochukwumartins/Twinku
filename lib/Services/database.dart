// ignore_for_file: non_constant_identifier_names

import 'package:twinku/Models/Create_post.dart';
import 'package:twinku/Services/FirestoreServices.dart';
import 'package:twinku/Services/api_path.dart';

abstract class Database {
  Future<void> createpost(CreatePost Post);
  Future<void> deletepost(CreatePost Post);
  //Stream<List<CreatePost>> readPostsStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDataBase implements Database {
  FirestoreDataBase({required this.Uid}) : assert(Uid != null);
  final String Uid;
  final _service = FirestoreService.instance;

  @override
  Future<void> createpost(CreatePost Post) => _service.setData(
        path: ApiPath.Post(Uid, Post.id),
        data: Post.toMap(),
      );
  @override
  Future<void> deletepost(CreatePost Post) => _service.deledata(
        path: ApiPath.Post(Uid, Post.id),
      );

  // @override
  // Stream<List<CreatePost>> readPostsStream() {
  //   Stream<List<CreatePost>>? h;
  //   return h;
  // }
}
