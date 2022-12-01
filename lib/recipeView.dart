import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/model.dart';
import 'package:recipe/network.dart';
import 'package:recipe/web_view.dart';

class RecipeView extends StatefulWidget {
  final String recipeId;
  const RecipeView({super.key, required this.recipeId});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late Future<RecipeModel> recipeData;

  @override
  void initState() {
    recipeData = ApiService.getRecipeData(widget.recipeId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'RecipeView',
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: FutureBuilder<RecipeModel>(
          future: recipeData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(snapshot.data!.image),
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: snapshot.data!.ingredients
                        .map((e) => Text(e.toString()))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'How to Cook Recipe',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return WebViewPage(webView: snapshot.data!.sourceUrl);
                    }));
                  },
                  child: const Text('Learn More'),
                )
              ],
            );
          }),
    );
  }
}
