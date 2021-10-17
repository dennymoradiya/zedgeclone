
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zedge/view/api/wall_model.dart';



class Childpage extends StatefulWidget {
  List<ImageResponse>? data;
   Childpage({Key? key, this.data}) : super(key: key);

  @override
  _ChildpageState createState() => _ChildpageState();
}

class _ChildpageState extends State<Childpage> {
  bool a=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.grey,),
        ),
        title: a?Container(
          height: 47,
          width: MediaQuery.of(context).size.width*.7,
          child: TextField(
            style: TextStyle(
              color: Colors.white
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                focusedBorder:  UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    )
                ),
              hintStyle: TextStyle(
                color: Colors.white
              )
            ),
          ),
        ):InkWell(
          onTap: (){
            setState(() {
              a=!a;
            });
          },
          child: Container(
            height: 47,
            width: MediaQuery.of(context).size.width*.7,
            child: TextField(
              decoration: InputDecoration(
                  enabled: false,
                  fillColor: Colors.grey[700],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Wallpapers",style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width*.24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey[600],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.image,size: 35,color:Colors.white),
                        Text("41236",style: TextStyle(color:Colors.white),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width*.24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey[800],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.image_outlined,size: 35,color:Colors.white),
                        Text("240",style: TextStyle(color:Colors.white),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width*.24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey[800],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.volume_up_sharp,size: 35,color:Colors.white),
                        Text("12190",style: TextStyle(color:Colors.white),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width*.24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey[800],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.notifications_rounded,size: 35,color:Colors.white),
                        Text("4625",style: TextStyle(color:Colors.white),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 0.55,
                children: List.generate(widget.data!.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(widget.data![index].urls!.thumb.toString()),
                            fit: BoxFit.fill,
                          ),
                        )
                    ),
                  );
                }
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}




