import 'package:bloc/bloc.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/game_tile_state.dart';

class GameTileCubit extends Cubit<GameTileState> {
  GameTileCubit() : super(GameTileState(gametiles: 3));
  void puzzle2x2() => emit(GameTileState(gametiles: state.gametiles = 2));
  void puzzle3x3() => emit(GameTileState(gametiles: state.gametiles = 3));
  void puzzle4x4() => emit(GameTileState(gametiles: state.gametiles = 4));
  void puzzle5x5() => emit(GameTileState(gametiles: state.gametiles = 5));
}
