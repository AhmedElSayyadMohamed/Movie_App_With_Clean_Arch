import 'package:equatable/equatable.dart';

class TrailerMovie extends Equatable {
  final String id;
  final String key;
  final String name;

  const TrailerMovie({required this.name,required this.id,required this.key});

  @override
  List<Object> get props => [id, key,name];
}