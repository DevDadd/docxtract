
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

class PickFile extends DocEvent {}

class LoadFile extends DocEvent {}

class DeleteFile extends DocEvent {}
