import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smartdocxtract/bloc/doc_event.dart';
import 'package:smartdocxtract/bloc/doc_state.dart';



class DocBloc extends Bloc<DocEvent, DocState> {
  DocBloc() : super(DocState()) {
    on<UpdateSearchQuery>((event, emit){
      emit(state.copyWith(searchQuery: event.query));
    });
    on<PickFile>(_pickFile);
    on<DeleteFile>(_deleteFile);
  }
  Future<void> _pickFile(PickFile event, Emitter<DocState> emit) async {
    final res = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png','doc'],
    );
    if (res != null) {
      emit(state.copyWith(file: res.files.first, isUploaded: false));
    }
  }

  Future<void> _deleteFile(DeleteFile event , Emitter<DocState> emit) async {
    emit(state.copyWith(clearFile: true, isUploaded: false));
  }
}


