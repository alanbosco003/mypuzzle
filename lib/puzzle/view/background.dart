import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/bg_theam_cubit.dart';
import 'package:very_good_slide_puzzle/puzzle/bloc/bg_theam_state.dart';

class ParallaxBackground extends StatelessWidget {
  const ParallaxBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BgCubit, Bgstate>(
      builder: (BuildContext context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: ParallaxStack(
            // height: MediaQuery.of(context).size.height * 1,
            // width: MediaQuery.of(context).size.width * 1,
            // color: Colors.amber,
            layers: [
              ParallaxLayer(
                  yRotation: 0.0,
                  xOffset: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 5,
                    width: MediaQuery.of(context).size.width * 5,
                    decoration: BoxDecoration(
                      // color: Colors.yellow
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/' + state.bg + '/layer_01.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              ParallaxLayer(
                  // yRotation: 0.35,
                  xOffset: 130,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 5,
                    width: MediaQuery.of(context).size.width * 5,
                    decoration: BoxDecoration(
                      // color: Colors.yellow
                      image: DecorationImage(
                        image:
                            AssetImage('assets/' + state.bg + '/layer_02.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              ParallaxLayer(
                  // yRotation: 0.40,
                  xOffset: 80,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 5,
                    width: MediaQuery.of(context).size.width * 5,
                    decoration: BoxDecoration(
                      // color: Colors.yellow
                      image: DecorationImage(
                        image:
                            AssetImage('assets/' + state.bg + '/layer_03.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              ParallaxLayer(
                  // yRotation: 0.80,
                  xOffset: 100,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 5,
                    width: MediaQuery.of(context).size.width * 5,
                    decoration: BoxDecoration(
                      // color: Colors.yellow
                      image: DecorationImage(
                        image:
                            AssetImage('assets/' + state.bg + '/layer_04.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              ParallaxLayer(
                  // yRotation: 0.70,
                  xOffset: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 5,
                    width: MediaQuery.of(context).size.width * 5,
                    decoration: BoxDecoration(
                      // color: Colors.yellow
                      image: DecorationImage(
                        image:
                            AssetImage('assets/' + state.bg + '/layer_05.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
