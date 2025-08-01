import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smartdocxtract/bloc/doc_event.dart';
import 'package:smartdocxtract/bloc/doc_state.dart';



class DocBloc extends Bloc<DocEvent, DocState> {
  DocBloc() : super(DocState()) {
    on<UpdateSearchQuery>((event, emit){
      emit(state.copyWith(searchQuery: event.query));
    });
  }
}
