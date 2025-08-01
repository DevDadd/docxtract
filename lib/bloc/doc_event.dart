
 import 'package:equatable/equatable.dart';

class DocEvent extends Equatable {
  const DocEvent();

  @override
  List<Object> get props => [];
}

class UpdateSearchQuery extends DocEvent {
  final String query;
  const UpdateSearchQuery(this.query);
}