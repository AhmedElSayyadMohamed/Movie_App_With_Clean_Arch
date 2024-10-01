import 'package:movie_app_with_clean_arch/movies/domain/entity/actor.dart';

class ActorModel extends Actor {
  const ActorModel({
    required super.photo,
    required super.name,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
        photo: json['profile_path']??'',
        name: json['name']??'Hunter',
      );
}
