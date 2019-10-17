import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:geeklib/src/pages/bookView/book_view_page.dart';
import 'package:geeklib/src/shared/models/query.dart';
import 'package:rxdart/rxdart.dart';

class MovieTileWidget extends StatefulWidget {
  final Doc book;

  MovieTileWidget(this.book);

  @override
  _MovieTileWidgetState createState() => _MovieTileWidgetState();
}

class _MovieTileWidgetState extends State<MovieTileWidget> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (params) => BookViewPage(widget.book)));
      },
      child: Container(
        color: Colors.transparent,
        child: Row(children: <Widget>[
          Image.network(
              // "https://images-na.ssl-images-amazon.com/images/I/71rNJQ2g-EL._SY606_.jpg",
              "http://covers.openlibrary.org/b/id/" +
                  widget.book.coverI.toString() +
                  "-L.jpg?default=false",
              width: 80),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.book.title.length > 50
                        ? widget.book.title.substring(0, 47) + "..."
                        : widget.book.title,
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        widget.book.authorName == null
                            ? "Unknown Author"
                            : widget.book.authorName[0],
                        softWrap: true,
                        style: TextStyle(fontSize: 19, color: Colors.black38),
                      )),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.grey[350],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 18.0),
                //   child: Text("\$17",
                //       style: TextStyle(
                //           fontSize: 25, fontWeight: FontWeight.w400)),
                // ),
                IconButton(
                  onPressed: () {
                    if (isBookmarked == false) {
                      BehaviorSubject<bool> isChecked$ =
                          BehaviorSubject<bool>.seeded(true);
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              children: <Widget>[
                                AddCollectionButtonWidget(),
                                Expanded(
                                  child: ListView(
                                    children: <Widget>[
                                      StreamBuilder<bool>(
                                          stream: isChecked$,
                                          initialData: isChecked$.value,
                                          builder: (context, snapshot) {
                                            return CheckboxListTile(
                                              value: snapshot.data,
                                              onChanged: isChecked$.add,
                                              checkColor: Colors.black,
                                              // leading: Icon(Icons.check_box_outline_blank),
                                              title: Text("Videos"),
                                            );
                                          }),StreamBuilder<bool>(
                                          stream: isChecked$,
                                          initialData: isChecked$.value,
                                          builder: (context, snapshot) {
                                            return CheckboxListTile(
                                              value: snapshot.data,
                                              onChanged: isChecked$.add,
                                              checkColor: Colors.black,
                                              // leading: Icon(Icons.check_box_outline_blank),
                                              title: Text("Videos"),
                                            );
                                          }),StreamBuilder<bool>(
                                          stream: isChecked$,
                                          initialData: isChecked$.value,
                                          builder: (context, snapshot) {
                                            return CheckboxListTile(
                                              value: snapshot.data,
                                              onChanged: isChecked$.add,
                                              checkColor: Colors.black,
                                              // leading: Icon(Icons.check_box_outline_blank),
                                              title: Text("Videos"),
                                            );
                                          }),StreamBuilder<bool>(
                                          stream: isChecked$,
                                          initialData: isChecked$.value,
                                          builder: (context, snapshot) {
                                            return CheckboxListTile(
                                              value: snapshot.data,
                                              onChanged: isChecked$.add,
                                              checkColor: Colors.black,
                                              // leading: Icon(Icons.check_box_outline_blank),
                                              title: Text("Videos"),
                                            );
                                          }),StreamBuilder<bool>(
                                          stream: isChecked$,
                                          initialData: isChecked$.value,
                                          builder: (context, snapshot) {
                                            return CheckboxListTile(
                                              value: snapshot.data,
                                              onChanged: isChecked$.add,
                                              checkColor: Colors.black,
                                              // leading: Icon(Icons.check_box_outline_blank),
                                              title: Text("Videos"),
                                            );
                                          }),StreamBuilder<bool>(
                                          stream: isChecked$,
                                          initialData: isChecked$.value,
                                          builder: (context, snapshot) {
                                            return CheckboxListTile(
                                              value: snapshot.data,
                                              onChanged: isChecked$.add,
                                              checkColor: Colors.black,
                                              // leading: Icon(Icons.check_box_outline_blank),
                                              title: Text("Videos"),
                                            );
                                          }),StreamBuilder<bool>(
                                          stream: isChecked$,
                                          initialData: isChecked$.value,
                                          builder: (context, snapshot) {
                                            return CheckboxListTile(
                                              value: snapshot.data,
                                              onChanged: isChecked$.add,
                                              checkColor: Colors.black,
                                              // leading: Icon(Icons.check_box_outline_blank),
                                              title: Text("Videos"),
                                            );
                                          }),StreamBuilder<bool>(
                                          stream: isChecked$,
                                          initialData: isChecked$.value,
                                          builder: (context, snapshot) {
                                            return CheckboxListTile(
                                              value: snapshot.data,
                                              onChanged: isChecked$.add,
                                              checkColor: Colors.black,
                                              // leading: Icon(Icons.check_box_outline_blank),
                                              title: Text("Videos"),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                      alignment: Alignment.bottomRight,
                                  child: FlatButton(
                                    color: Colors.grey,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Confirm"),
                                  ),
                                )
                              ],
                            );
                          }).then((e) {
                        setState(() {
                          isChecked$.close();
                          isBookmarked = true;
                        });
                      });
                    } else {
                      setState(() {
                        PersistentBottomSheetController sheet = showBottomSheet(
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.all(30),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Removed from collection.",
                                  style: TextStyle(fontSize: 19),
                                ),
                              );
                            },
                            context: context);

                        Observable.timer(1, Duration(seconds: 1)).listen((e) {
                          sheet.close();
                        });
                        isBookmarked = false;
                      });
                    }
                  },
                  icon: isBookmarked
                      ? Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffffcd33),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                        )
                      : Icon(
                          Icons.bookmark,
                          color: Color(0xffffcd33),
                        ),
                ),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}

class AddCollectionButtonWidget extends StatelessWidget {
  const AddCollectionButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 40,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return Material(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Name"),
                      TextField(
                        decoration: InputDecoration(
                            border:
                                UnderlineInputBorder(),
                            hintText:
                                "jaoalves@gmail.com.br",
                            hintStyle: TextStyle(
                                color:
                                    Colors.grey)),
                      ),
                      DropdownButton(
                        onChanged: (e) {},
                        value: [
                          DropdownMenuItem(
                            child: Text("hi"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      icon: Icon(Icons.add_circle),
    );
  }
}

class SelectedCollectionTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}