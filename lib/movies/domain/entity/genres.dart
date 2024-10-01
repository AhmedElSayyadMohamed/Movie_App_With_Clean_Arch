
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Genres extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });
  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
    id: json['id'],
    name: json['name'],
  );
  @override
  List<Object> get props => [id, name];
}
