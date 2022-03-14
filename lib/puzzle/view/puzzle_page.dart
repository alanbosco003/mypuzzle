import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_slide_puzzle/layout/layout.dart';
import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/bg_theam_cubit.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/game_tile_cubit.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/game_tile_state.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';
import 'package:very_good_slide_puzzle/puzzle/view/background.dart';
import 'package:very_good_slide_puzzle/puzzle/view/drawer.dart';
import 'package:very_good_slide_puzzle/theme/theme.dart';
import 'package:very_good_slide_puzzle/timer/timer.dart';

/// {@template puzzle_page}
/// The root page of the puzzle UI.
///
/// Builds the puzzle based on the current [PuzzleTheme]
/// from [ThemeBloc].
/// {@endtemplate}
class PuzzlePage extends StatelessWidget {
  /// {@macro puzzle_page}
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameTileCubit>(create: (context) => GameTileCubit()),
        BlocProvider<BgCubit>(
          create: (context) => BgCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(
            themes: const [
              SimpleTheme(),
            ],
          ),
        )
      ],
      child: PuzzleView(),
    );
  }
}

/// {@template puzzle_view}
/// Displays the content for the [PuzzlePage].
/// {@endtemplate}
class PuzzleView extends StatelessWidget {
  /// {@macro puzzle_view}
  PuzzleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    /// Shuffle only if the current theme is Simple.
    final shufflePuzzle = theme is SimpleTheme;

    return BlocBuilder<GameTileCubit, GameTileState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: Colors.yellow[200],
          // theme.backgroundColor,
          body: BlocProvider(
            create: (context) => TimerBloc(
              ticker: const Ticker(),
            ),  
            child: BlocProvider(
              create: (context) => PuzzleBloc(state.gametiles)
                ..add(
                  PuzzleInitialized(
                    shufflePuzzle: shufflePuzzle,
                  ),
                ),
              child: const _Puzzle(
                key: Key('puzzle_view_puzzle'),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Puzzle extends StatelessWidget {
  const _Puzzle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey =
        new GlobalKey<ScaffoldState>();
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          drawer: GameDrawer(),
          key: _scaffoldkey,
          body: Stack(
            children: [
              // ParallaxBackground(),
              theme.layoutDelegate.backgroundBuilder(state),
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Stack(children: [
                    ParallaxBackground(),
                    Column(
                      children: const [
                        // _PuzzleHeader(
                        //   key: Key('puzzle_header'),
                        // ),
                        _PuzzleSections(
                          key: Key('puzzle_sections'),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 32,
                  ),
                  onPressed: () {
                    _scaffoldkey.currentState!.openDrawer();
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _PuzzleHeader extends StatelessWidget {
  const _PuzzleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ResponsiveLayoutBuilder(
        small: (context, child) => const Center(),
        medium: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
        ),
        large: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
        ),
      ),
    );
  }
}

class _PuzzleSections extends StatelessWidget {
  const _PuzzleSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return ResponsiveLayoutBuilder(
      small: (context, child) => Column(
        children: [
          SizedBox(
            height: 50,
          ),
          theme.layoutDelegate.startSectionBuilder(state),
          const PuzzleBoard(),
          theme.layoutDelegate.endSectionBuilder(state),
        ],
      ),
      medium: (context, child) => Column(
        children: [
          theme.layoutDelegate.startSectionBuilder(state),
          const PuzzleBoard(),
          theme.layoutDelegate.endSectionBuilder(state),
        ],
      ),
      large: (context, child) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: theme.layoutDelegate.startSectionBuilder(state),
          ),
          const PuzzleBoard(),
          Expanded(
            child: theme.layoutDelegate.endSectionBuilder(state),
          ),
        ],
      ),
    );
  }
}

/// {@template puzzle_board}
/// Displays the board of the puzzle.
/// {@endtemplate}
class PuzzleBoard extends StatelessWidget {
  /// {@macro puzzle_board}
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final puzzle = context.select((PuzzleBloc bloc) => bloc.state.puzzle);

    final size = puzzle.getDimension();
    if (size == 0) return const CircularProgressIndicator();

    return BlocListener<PuzzleBloc, PuzzleState>(
      listener: (context, state) {
        if (theme.hasTimer && state.puzzleStatus == PuzzleStatus.complete) {
          context.read<TimerBloc>().add(const TimerStopped());
        }
      },
      child: theme.layoutDelegate.boardBuilder(
        size,
        puzzle.tiles
            .map(
              (tile) => _PuzzleTile(
                key: Key('puzzle_tile_${tile.value.toString()}'),
                tile: tile,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _PuzzleTile extends StatelessWidget {
  const _PuzzleTile({
    Key? key,
    required this.tile,
  }) : super(key: key);

  /// The tile to be displayed.
  final Tile tile;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return tile.isWhitespace
        ? theme.layoutDelegate.whitespaceTileBuilder()
        : theme.layoutDelegate.tileBuilder(tile, state);
  }
}
