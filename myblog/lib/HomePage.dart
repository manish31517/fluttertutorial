import 'package:flutter/material.dart';
import 'package:myblog/Authentication.dart';
import 'package:myblog/PhotoUpload.dart';
import 'package:myblog/Posts.dart';
import 'package:firebase_database/firebase_database.dart';
class Homepage extends StatefulWidget {
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  Homepage({
    this.auth,
    this.onSignedOut
});
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   List<Posts> postList =[];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference postRef= FirebaseDatabase.instance.reference().child("Posts");
    postRef.once().then((DataSnapshot snap){
       var KEYS = snap.value.keys;
       var DATA =snap.value;
       postList.clear();

       for(var individualkey in KEYS){
         Posts post= new Posts(
           DATA[individualkey]['image'],
           DATA[individualkey]['description'],
           DATA[individualkey]['data'], // data==date
           DATA[individualkey]['time']);
         postList.add(post);
       }
       setState(() {
         print("Length $postList.length");
       });
    });

  }
  void _logoutUser() async{
  try{
    await widget.auth.signOut();
    widget.onSignedOut();
  }catch(e){
   print("Error"+e.toString());
  }
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar:new AppBar(
        title: new Text("Home"),
      ) ,
      body: new Container(

               child: postList.length==0?new Text("No Blog Post Available"): new ListView.builder(
                   itemCount: postList.length,
                   itemBuilder:(_,index){
                     return PostsUI(postList[index].image, postList[index].description, postList[index].data, postList[index].time);
                   }),

      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.pink,
        child: new Container(
        margin: const EdgeInsets.only(left: 70.0 ,right: 70.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new IconButton(
                icon: Icon(Icons.local_car_wash),
                iconSize: 50,
                color: Colors.white,
                onPressed:_logoutUser,
              ),
              new IconButton(
                icon: Icon(Icons.add_a_photo),
                iconSize: 40,
                color: Colors.white,
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context){
                    return new UploadPhotoPage();
                  }));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget PostsUI(String image,String description, String date,String time){
     return new Card(
       elevation: 10.0,
       margin: EdgeInsets.all(15.0),
       child: new Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             new Text(
               date,
               style: Theme.of(context).textTheme.subtitle2,
               textAlign: TextAlign.center,
             ),
             new Text(
               time,
               style: Theme.of(context).textTheme.subtitle2,
               textAlign: TextAlign.center,
             )
           ],
         ),
           SizedBox(height: 10.0,),
           new Image.network(image,fit: BoxFit.cover,),
           SizedBox(height: 10.0,),
           new Text(
             description,
             style: Theme.of(context).textTheme.subtitle1 ,
           )
           
         ],
       ),
     );
  }
}
