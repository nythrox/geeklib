import 'package:flutter/material.dart';
import 'package:geeklib/src/pages/bookView/book_view_bloc.dart';
import 'package:geeklib/src/pages/cart/cart_page.dart';
import 'package:geeklib/src/shared/models/book_view.dart';
import 'package:geeklib/src/shared/models/query.dart';

class BookViewPage extends StatelessWidget {
  final Doc book;
  final bloc = BookViewBloc();

  BookViewPage(this.book) {
    bloc.addBookKey(book.key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          StreamBuilder<BookViewModel>(
              stream: bloc.bookStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView(
                    children: <Widget>[
                      BookCoverWidget(book: book),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BookMetadataWidget(
                                book: book, bookViewModel: snapshot.data),
                            SubjectsWidget(subjects: snapshot.data.subjects),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                snapshot.data.description == null
                                    ? "No description."
                                    : snapshot.data.description.value,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(50, 50, 50, 0.9),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.bookmark,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: RaisedButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 12),
                                        color: Colors.black,
                                        onPressed: () {
                                          print("tapped");
                                        },
                                        elevation: 0,
                                        splashColor: Colors.yellow,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          "Buy Now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top + 5,
                right: 16,
                left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_basket,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (params) => CartPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectsWidget extends StatelessWidget {
  final List<String> subjects;

  const SubjectsWidget({Key key, this.subjects}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (subjects != null) {
      for (int i = 0; i < subjects.length && i < 4; i++) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Color.fromRGBO(230, 230, 230, 1.0),
              child: Text(
                subjects[i],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }
    }    
    return Wrap(
      children: widgets,
    );
  }
}

class BookMetadataWidget extends StatelessWidget {
  const BookMetadataWidget(
      {Key key, @required this.book, @required this.bookViewModel})
      : super(key: key);

  final Doc book;
  final BookViewModel bookViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("${book.title}",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
              SizedBox(
                width: 20,
                height: 8,
              ),
              Text(
                book.authorName != null ? book.authorName[0] : "Unknown Author",
                style: TextStyle(fontSize: 19, color: Colors.black38),
              ),
              SizedBox(
                width: 20,
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.grey),
                ],
              ),
              SizedBox(
                width: 20,
                height: 15,
              ),
            ],
          ),
        ),
        // Container(
        //   width: 90,
        //   alignment: Alignment.topCenter,
        //   child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //       decoration: BoxDecoration(
        //           color: Color.fromRGBO(230, 230, 230, 1.0),
        //           borderRadius: BorderRadius.circular(100)),
        //       child: Text(
        //         "\$ 19",
        //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //       )),
        // ),
      ],
    );
  }
}

class BookCoverWidget extends StatelessWidget {
  const BookCoverWidget({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Doc book;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 60, bottom: 50, left: 30, right: 30),
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 1.0),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
        ),
        child: Column(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(100, 100, 100, 0.25),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      spreadRadius: 5)
                ],
                borderRadius: BorderRadius.circular(6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                    "http://covers.openlibrary.org/b/id/" +
                        book.coverI.toString() +
                        "-L.jpg?default=false",
                    width: 200),
              ))
        ]));
  }
}
