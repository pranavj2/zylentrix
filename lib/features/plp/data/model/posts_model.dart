import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'posts_model.g.dart';

@JsonSerializable()
class PostsModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;


  const PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,

  });

  PostsModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body

  }) =>
      PostsModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,

      );
  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
