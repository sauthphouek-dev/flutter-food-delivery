import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bio_state.dart';

class BioCubit extends Cubit<BioState> {
  BioCubit() : super(const BioState());
}
