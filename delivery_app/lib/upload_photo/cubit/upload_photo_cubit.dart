import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_photo_state.dart';

class UploadPhotoCubit extends Cubit<UploadPhotoState> {
  UploadPhotoCubit() : super(const UploadPhotoState());
}
