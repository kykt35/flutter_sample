import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  double _textScale = 1.0;
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: _textScale,
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blueAccent.withOpacity(0.3),
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 180,
              toolbarHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("記事カテゴリー"),
                background: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.yellow,
                      child: Image.network(
                          'https://images.pexels.com/photos/267392/pexels-photo-267392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          fit: BoxFit.cover),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: const [
                            0.5,
                            1,
                          ],
                              colors: [
                            Colors.grey.withOpacity(0),
                            Colors.black38
                          ])),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('文字を大きく'),
                            Switch(
                                value: _isLarge, onChanged: _toggleLargeFont),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Sept. 29 2020",
                                style: GoogleFonts.lato(),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Colors.blueAccent,
                              ),
                            )
                          ],
                        ),
                        const Text("記事タイトル"),
                        const Divider(
                          height: 30,
                          thickness: 1,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: const NetworkImage(
                                  'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              radius: 26,
                              backgroundColor: Colors.grey[200],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [Text('山田 太郎'), Text('ジャーナリスト')],
                            ),
                            const Expanded(
                              child: SizedBox(
                                width: 0,
                              ),
                            ),
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.blueAccent,
                            ),
                            const SizedBox(width: 5.0),
                            const Text("350"),
                            const SizedBox(width: 16.0),
                            const Icon(Icons.comment, color: Colors.blueAccent),
                            const SizedBox(width: 5.0),
                            const Text('25')
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                            '記事テキスト記事テキスト記事テキスト記事テキスト記事テキスト記事テキスト記事テキスト記事テキスト記事テキスト記事テキスト')
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  void _toggleLargeFont(bool isLarge) {
    isLarge ? _textScale = 1.2 : _textScale = 1.0;
    setState(() {
      _isLarge = isLarge;
    });
  }
}
