import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx/stores/login_store.dart';
import 'package:todo_mobx/widgets/custom_icon_button.dart';
import 'package:todo_mobx/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //LoginStore loginStore = LoginStore();
  late LoginStore loginStore;

  late ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // autorun((_){
    //   if(loginStore.loggedIn) {
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const ListScreen())
    //     );
    //   }
    // });

    loginStore = Provider.of<LoginStore>(context);

    disposer = reaction(
      (_) => loginStore.loggedIn, 
      (loggedIn) {
        if(loginStore.loggedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ListScreen())
          );
        }
      }
    );

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return Focus(
                          onFocusChange: (focus) {
                            focus ? loginStore.setEmailFieldColor(Colors.deepPurpleAccent)
                              : loginStore.setEmailFieldColor(Colors.grey);
                          },
                          child: CustomTextField(
                            hint: 'E-mail',
                            prefix: Icon(
                              Icons.account_circle,
                              color: loginStore.emailFieldColorToApply,
                            ),
                            textInputType: TextInputType.emailAddress,
                            onChanged: loginStore.setEmail,
                            enabled: !loginStore.loading,
                          ),
                        );
                      }
                    ),
                    const SizedBox(height: 16,),
                    Observer(
                      builder: (_) {
                        return Focus(
                          onFocusChange: (focus) {
                            focus ? loginStore.setPasswordFieldColor(Colors.deepPurpleAccent)
                              : loginStore.setPasswordFieldColor(Colors.grey);
                          },
                          child: CustomTextField(
                            hint: 'Senha',
                            prefix: Icon(
                              Icons.lock, 
                              color: loginStore.passwordFieldColorToApply
                            ),
                            obscure: !loginStore.passwordVisible,
                            onChanged: loginStore.setPassword,
                            enabled: !loginStore.loading,
                            suffix: CustomIconButton(
                              radius: 32,
                              iconData: loginStore.passwordVisible ? Icons.visibility_off : Icons.visibility,
                              onTap: loginStore.tooglePasswordVisibillity,
                              color: loginStore.passwordFieldColorToApply,
                            ),
                          ),
                        );
                      }
                    ),
                    const SizedBox(height: 16,),
                    Observer(
                      builder: (_) {
                        return SizedBox(
                          height: 44,
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              primary: Colors.deepPurpleAccent,
                              onPrimary: Colors.white,
                              onSurface: Theme.of(context).primaryColor.withAlpha(100),
                            ),
                            onPressed: loginStore.loginPressed,
                            //child: loginStore.buttonWidgetValue,
                            child: loginStore.loading ? 
                              const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              )
                              : const Text('Login'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
