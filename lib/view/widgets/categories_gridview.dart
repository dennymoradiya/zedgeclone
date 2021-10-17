import 'package:flutter/material.dart';

class Categoriesgrid extends StatefulWidget {
  const Categoriesgrid({Key? key}) : super(key: key);

  @override
  _CategoriesgridState createState() => _CategoriesgridState();
}

class _CategoriesgridState extends State<Categoriesgrid> {
  @override
  Widget build(BuildContext context) {
    List name = [
      "Animals",
      "Animation",
      "Bollywood",
      "Logos",
      "Cars",
      "Design",
      "Drawings",
      "Entertainment",
      "Funny",
      "Games",
      "Hollyday",
      "Nature",
      "News",
      "Others"
    ];
   
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              name[index],
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                     "https://source.unsplash.com/1600x900/?${name[index]}"
                    //  "https://source.unsplash.com/1600x900/?nature"
                    ),
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
                ),
          );
        },
        childCount: name.length,
      ),
    );
  }
}
