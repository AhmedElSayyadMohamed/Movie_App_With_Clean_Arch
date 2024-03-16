import 'package:equatable/equatable.dart';

class TrailerMovie extends Equatable {
  final String id;
  final String key;

  const TrailerMovie({required this.id,required this.key});

  @override
  List<Object> get props => [id, key];
}