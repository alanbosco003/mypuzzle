import 'package:bloc/bloc.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/bg_theam_state.dart';

class BgCubit extends Cubit<Bgstate> {
  BgCubit() : super(Bgstate(bg: "mountainview"));

  void mountainview() => emit(Bgstate(bg: "mountainview"));
  void sunshine() => emit(Bgstate(bg: "sunshine"));
  void darknight() => emit(Bgstate(bg: "darknight"));
}
