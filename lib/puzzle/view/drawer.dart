import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/bg_theam_cubit.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/bg_theam_state.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/game_tile_cubit.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/game_tile_state.dart';

import '../bloc/puzzle_bloc.dart';

class GameDrawer extends StatelessWidget {
  const GameDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: BlocBuilder<BgCubit, Bgstate>(
        builder: (BuildContext context, state) {
          return ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    // image: DecorationImage(
                    //   image: AssetImage(
                    //     'assets/images/puzzlebackground.jpg',
                    //   ),
                    //   fit: BoxFit.fill,
                    // ),
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Flying Tiles',
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 0, 0, 0),
                              letterSpacing: .5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    // Text(
                    //   'Select differnt puzzle',
                    //   style: GoogleFonts.sacramento(
                    //     textStyle: TextStyle(
                    //         fontSize: 26,
                    //         color: Color.fromARGB(255, 0, 0, 0),
                    //         letterSpacing: .5,
                    //         fontWeight: FontWeight.w500),
                    //   ),
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.002,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    )
                  ],
                ),
              ),
              // BlocBuilder<GameTileCubit, GameTileState>(
              //   builder: (BuildContext context, state) {
              //     return Padding(
              //       padding: const EdgeInsets.all(20.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           GestureDetector(
              //             onTap: () {
              //               BlocProvider.of<GameTileCubit>(context).puzzle2x2();

              //               // context.read<PuzzleBloc>().add(const PuzzleReset());
              //             },
              //             child: Container(
              //               width: MediaQuery.of(context).size.width * 0.12,
              //               height: MediaQuery.of(context).size.width * 0.12,
              //               decoration: BoxDecoration(
              //                   color: Colors.black,
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(4))),
              //               child: Center(
              //                 child: Text(
              //                   '2 X 2',
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Container(
              //             width: MediaQuery.of(context).size.width * 0.12,
              //             height: MediaQuery.of(context).size.width * 0.12,
              //             decoration: BoxDecoration(
              //                 color: Colors.black,
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(4))),
              //             child: Center(
              //               child: Text(
              //                 '3 X 3',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ),
              //           ),
              //           Container(
              //             width: MediaQuery.of(context).size.width * 0.12,
              //             height: MediaQuery.of(context).size.width * 0.12,
              //             decoration: BoxDecoration(
              //                 color: Colors.black,
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(4))),
              //             child: Center(
              //               child: Text(
              //                 '4 X 4',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ),
              //           ),
              //           Container(
              //             width: MediaQuery.of(context).size.width * 0.12,
              //             height: MediaQuery.of(context).size.width * 0.12,
              //             decoration: BoxDecoration(
              //                 color: Colors.black,
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(4))),
              //             child: Center(
              //               child: Text(
              //                 '5 X 5',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //     );
              //   },
              // ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Select your favourite theam',
                      style: GoogleFonts.sacramento(
                        textStyle: TextStyle(
                            fontSize: 26,
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: .5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.002,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<BgCubit>(context).mountainview();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/mountainview/bg.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<BgCubit>(context).darknight();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/darknight/bg.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<BgCubit>(context).sunshine();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/sunshine/bg.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
