import  'package:flutter/material.dart';
import 'package:myblog/Authentication.dart';
import 'package:myblog/Diaglogbox.dart';
class LoginRegisterPage extends StatefulWidget {
  final AuthImplementation auth;
  final VoidCallback onSignedIn;
  LoginRegisterPage(
  {
    this.auth,
    this.onSignedIn
   });
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();


}
enum FormType{
  login,
  register
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
 DialogBox _dialogBox = new DialogBox();
  final _formkey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email="";
  String _password="";

  bool validateAndSave() {
    final form =_formkey.currentState;
    if(form.validate())
      {
        form.save();
        return true;
      }
    return false;
  }
void validateAndSubmit() async{
    if(validateAndSave()){
      try{
        if(_formType==FormType.login){
          String  userId = await widget.auth.SignIn(_email, _password);
          _dialogBox.information(context,"Congratulation","Login Successfully");

          print("login userId =" + userId);
        }
        else{
          String  userId = await widget.auth.SignUp(_email, _password);
          _dialogBox.information(context,"Congratulations","Your account is created Successfully");

          print("login userId =" + userId);

        }
        widget.onSignedIn();
      }catch(e){
        _dialogBox.information(context,"Error = ",e.toString());
        print("Error"+e.toString());
      }
    }
}
  void moveToRegister() {
     _formkey.currentState.reset(); // to erase the data from form field
    setState(() {
      _formType=FormType.register;
    });
  }
  void moveToLogin() {
    _formkey.currentState.reset(); // to erase the data from form field
    setState(() {
      _formType=FormType.login;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Flutter Blog App"),
        ),
        body: new SingleChildScrollView(
            // margin: EdgeInsets.all(35.0),
          padding: EdgeInsets.all(35.0),
            child: new Form(
              key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: createInput() + createButtons(),

                ))
        )

    );
  }

  List<Widget> createInput() {
    return [
      SizedBox(height: 10.0,),
      logo(),
      SizedBox(height: 20.0,),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
          validator: (value){
          return value.isEmpty? "Email is required" : null;
          },
        onSaved: (value){
          return _email=value;
        },
      ),
      SizedBox(height: 10.0,),
      new TextFormField(
        obscureText: true,
        decoration: new InputDecoration(labelText: 'Password'),
        validator: (value){
          return value.isEmpty? "Password is required" : null;
        },
        onSaved: (value){
          return _password=value;
        },
      ),
      SizedBox(height: 20.0,),
    ];
  }

  Widget logo() {
    return new Hero(
        tag: 'hero',
        child: new CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 110.0,
            child: Image.asset('images/app_logo.png')
        ));
  }


  List<Widget> createButtons() {
   if(_formType == FormType.login)
     {
       return [
         new RaisedButton(
             child: Text("Login",
               style: new TextStyle(
                 fontSize: 20.0,),
             ),
             textColor: Colors.white,
             color: Colors.pink,
             onPressed: validateAndSubmit
         ),
         new FlatButton(
             child: Text("Not have an Account?",
               style: new TextStyle(
                 fontSize: 10.0,),
             ),
             textColor: Colors.red,

             onPressed: moveToRegister
         )
       ];
     }
   else{
     return [
       new RaisedButton(
           child: Text("Create Account",
             style: new TextStyle(
               fontSize: 20.0,),
           ),
           textColor: Colors.white,
           color: Colors.pink,
           onPressed: validateAndSubmit
       ),
       new FlatButton(
           child: Text("Already have an Account?Login",
             style: new TextStyle(
               fontSize: 10.0,),
           ),
           textColor: Colors.red,

           onPressed: moveToLogin
       )
     ];
   }
  }
}