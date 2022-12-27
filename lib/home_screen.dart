import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController chatTextController = TextEditingController();

  /*
  * 3行の幅をキーボードが見えてるときと見えてないときでExpandedのflexの値を調整
  *   （flutter_keyboard_visibilityパッケージ）
  * ・キーボード見えてない時〜 => 4 : 1 : 3
  * ・キーボード見えてる時〜 => 4 : 1 : 1
  *   => これで１行目（ShogiBoardのある行）はキーボードを出したときでも大きさほぼ変えずにイケるんちゃう？
  *   （flexの値はよしなに調整してちょ）
  * */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return Column(
              children: [
                Expanded(
                  //キーボード表示・非表示で高さ調整
                  flex: isKeyboardVisible ? 4 : 4,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: double.infinity,
                          child: Container(
                            color: Colors.redAccent,
                            child: Text("Game Buttons"),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: double.infinity,
                          child: Container(
                            color: Colors.blueAccent,
                            child: Text("Shogi Board"),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: double.infinity,
                          child: Container(
                            color: Colors.yellowAccent,
                            child: Text("Member List"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  //キーボード表示・非表示で高さ調整
                  flex: isKeyboardVisible ? 1 : 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.greenAccent,
                      child: Text("Kifu Buttons"),
                    ),
                  ),
                ),
                Expanded(
                  //キーボード表示・非表示で高さ調整
                  flex: isKeyboardVisible ? 1 : 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: Colors.blueGrey,
                      child: TextField(
                        controller: chatTextController,
                        decoration:
                            InputDecoration(hintText: "Chat:押したらキーボード出てくるで"),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
