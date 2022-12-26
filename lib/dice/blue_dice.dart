import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dice_model.dart';

class BlueDice extends StatelessWidget {
  const BlueDice({super.key});

  void updateDices(DiceModel dice) {
    for (int i = 0; i < 6; i++) {
      var duration = 200 + i * 200;
      Future.delayed(Duration(milliseconds: duration), () {
        dice.generateDiceTwo();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> diceOneImages = [
      "assets/images/1.png",
      "assets/images/2.png",
      "assets/images/3.png",
      "assets/images/4.png",
      "assets/images/5.png",
      "assets/images/6.png",
    ];
    final dice = Provider.of<DiceModel>(context);
    final c = dice.diceTwo;
    var img = Image.asset(
      diceOneImages[c - 1],
      gaplessPlayback: true,
      fit: BoxFit.fill,
    );
    return Card(
      elevation: 10,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => updateDices(dice),
                    child: img,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}