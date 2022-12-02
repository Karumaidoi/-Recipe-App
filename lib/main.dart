import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/model.dart';
import 'package:recipe/network.dart';
import 'package:recipe/recipeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      title: 'Recipe',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.dark(),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<RecipesModel>> recipeData;

  @override
  void initState() {
    recipeData = ApiService.getRecipesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Recipe',
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: FutureBuilder<List<RecipesModel>>(
          future: recipeData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(snapshot.data![index].publisher),
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.yellow,
                      backgroundImage:
                          NetworkImage(snapshot.data![index].image),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (context) {
                            return RecipeView(
                              recipeId: snapshot.data![index].id,
                            );
                          }));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded)),
                  );
                });
          }),
    );
  }
}
