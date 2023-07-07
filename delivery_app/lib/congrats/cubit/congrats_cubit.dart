import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'congrats_state.dart';

class CongratsCubit extends Cubit<CongratsState> {
  CongratsCubit() : super(const CongratsState());
}
