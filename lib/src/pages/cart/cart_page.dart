import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geeklib/src/pages/cart/cart_bloc.dart';
import 'package:geeklib/src/pages/cart/components/buy_now_button.dart';
import 'package:geeklib/src/pages/cart/components/empty_wishlist.dart';
import 'package:geeklib/src/shared/components/MovieTile/movie_tile_widget.dart';
import 'package:geeklib/src/shared/components/cartMenu/cart_menu_widget.dart';
import 'package:geeklib/src/shared/models/query.dart';

import '../../app_module.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartBloc bloc = AppModule.to.bloc<CartBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  CartMenuWidget(),
                  StreamBuilder<List<Doc>>(
                      stream: bloc.cartListStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.isEmpty) {
                            return EmptyWishlist();
                          } else {
                            return SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:30.0),
                                    child: Column( 
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical:15.0),
                                          child: (Slidable(
                                            delegate: SlidableDrawerDelegate(),
                                            secondaryActions: <Widget>[
                                              SlideAction(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    bloc.addLastDeletedItem(
                                                        snapshot.data[i]);
                                                    bloc.removeItem(i);
                                                    Scaffold.of(context)
                                                        .hideCurrentSnackBar();
                                                    showSnackBar(context, i);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: Colors.red,
                                                            width: 2)),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                            key: ObjectKey(snapshot.data[i]),
                                            child:
                                                MovieTileWidget(snapshot.data[i]),
                                          )),
                                        ),
                                        snapshot.data.length != i + 1
                                            ? //only have divider if not the last item
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30, left: 30),
                                                child: Divider(
                                                  color: Colors.black87,
                                                ),
                                              )
                                            : Text(""),
                                      ],
                                    ),
                                  );
                                },
                                childCount: snapshot.data.length,
                              ),
                            );
                          }
                        } else {
                          return SliverFillRemaining(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 10),
                    child: Text(
                      "Total     \$ 75",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ),
                  BuyNowButton(),
                ],
              ),
            )
          ],
        ));
  }

  showSnackBar(BuildContext context, int i) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.yellow,
      duration: Duration(days: 1),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "\"${bloc.lastDeletedItem.title}\" removed.",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                color: Colors.black,
                onPressed: () {
                  bloc.addItem(bloc.lastDeletedItem, i);
                  Scaffold.of(context).hideCurrentSnackBar();
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.undo,
                      ),
                    ),
                    Text("Undo"),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.black,
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
                child: Text("Close"),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
