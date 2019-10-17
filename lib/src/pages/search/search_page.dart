import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geeklib/src/shared/blocs/search_bloc.dart';
import 'package:geeklib/src/shared/components/MovieTile/movie_tile_widget.dart';
import '../../app_module.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc bloc = AppModule.to.bloc<SearchBloc>();
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SearchViewModel>(
        stream: bloc.searchViewModel,
        initialData: SearchViewModel('', null),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            if (snapshot.data.query.isEmpty) {
              return Center(
                child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 70),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text("Search for books and authors",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      Image.asset("assets/images/pilot.png"),
                    ],
                  ),
                ),
              );
            } else if (snapshot.data.results != null) {if (snapshot.data.results.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
              "No results found. Try again with a different title?",
              style: TextStyle(fontSize: 25),
                ),
              );
            }
            else {
            return ListView.separated(
                separatorBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      color: Colors.black38,
                    ),
                  );
                },
                padding: const EdgeInsets.only(right: 30, left: 30),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: MovieTileWidget(snapshot.data.results[i]),
                  );
                },
                itemCount: snapshot.data.results.length);
            }

            }
          }
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()],
            ),
          );
        });
  }
}
