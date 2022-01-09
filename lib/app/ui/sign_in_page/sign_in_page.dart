import 'package:flutter/material.dart';
import 'package:game_tv/app/ui/sign_in_page/widgets/common_text_field.dart';
import 'package:game_tv/core_utils/screenutil.dart';
import 'package:game_tv/core_utils/shared_preferences_util.dart';
import 'package:game_tv/services/navigation/locator.dart';
import 'package:game_tv/services/navigation/navigation_service.dart';
import 'package:game_tv/services/navigation/route_enum.dart';
import 'package:game_tv/utils/strings/app_translations.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   ValueNotifier<bool> isDisabled = ValueNotifier<bool>(true);

   void toggle(bool isValid)
   {
     if(isValid)
     isDisabled.value = false;
     else
     isDisabled.value = true;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image:AssetImage('assets/gameTV.png'),height: 50.toHeight,width: 50.toWidth,),
              CommonTextField(displayName: Translations.getInstance.text(Translations.kUserName)!, isObscure: false, labelText: Translations.getInstance.text(Translations.kUserName)!, controller: usernameController,callback: toggle,),
              CommonTextField(displayName: Translations.getInstance.text(Translations.kPassword)!, isObscure: true, labelText: Translations.getInstance.text(Translations.kPassword)!, controller: passwordController,callback: toggle),
               ValueListenableBuilder(
                 builder: (BuildContext context, value, Widget? child) { 
                   if(isDisabled.value)
                   {
                    return Stack(
                       alignment: Alignment.center,
                      children: [
                        RaisedButton(onPressed: (){},child: Text(Translations.getInstance.text(Translations.kSubmit)!,style: TextStyle(color: Colors.black.withOpacity(0.5)),)),
                         Container(
                          color: Colors.transparent,
                          width: 80.toWidth,
                          height: 80.toHeight,
                        ),
                        
                      ],
                    );
                   }else{
                   return RaisedButton(onPressed: (){
                   if((usernameController.text != '9898989898' && usernameController.text != '9876543210')||passwordController.text != 'password123'){
                       late String  errorText;
                       if(usernameController.text != '9898989898' && usernameController.text != '9876543210'){
                         errorText = Translations.getInstance.text(Translations.kUserNotExist)!;
                       }else{
                         errorText = Translations.getInstance.text(Translations.kIncorrectPassword)!;
                       
                       }
                            _showMyDialog(errorText); 
                   }
                   else{
                      locator<NavigationService>()
                      .popAndPush(EnumRoute.homePage);
                  SharePreferenceData().setLogin(value: true);
                   }
                   },child: Text(Translations.getInstance.text(Translations.kSubmit)!)); 
                 }
                 },
                 valueListenable: isDisabled,
                 ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _showMyDialog(String errorText) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(errorText),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: TextButton(
              child:  Text(Translations.getInstance.text(Translations.kOk)!),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
}