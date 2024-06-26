import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}




class _LoginPageState extends State<LoginPage> with MessageViewMixin{
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _controller = Injector.get<LoginController>();

  @override
  void initState() {
    super.initState();
    messageListener(_controller);
    effect(() {
      if(_controller.logged){
        Navigator.of(context).pushReplacementNamed("/home");
      }
    });
    _emailController.text = "allan@dentalsoft.com.br";
    _senhaController.text = "123123";
  }


  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
          minHeight: sizeOf.height,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background_login.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            constraints: BoxConstraints(maxWidth: sizeOf.width * .8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Login",
                    style: LabClinicasTheme.titleStyle,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(label: Text("Email")),
                    validator: Validatorless.multiple([
                      Validatorless.required("Digite o email"),
                      Validatorless.email("Email inválido")
                    ]),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Watch(
                    (_) {
                      return TextFormField(
                        controller: _senhaController,
                        obscureText: _controller.obscurePassword,
                        validator: Validatorless.required("Digite a senha"),
                        decoration: InputDecoration(
                          label: const Text("Senha"),
                          suffixIcon: IconButton(
                              onPressed: () => _controller.togglePassword(),
                              icon: _controller.obscurePassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)
                          )
                        ),
                      );
                    }
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: sizeOf.width * .8,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () {
                          final valid = _formKey.currentState?.validate() ?? false;
                          if (valid) {
                            _controller.login(_emailController.text, _senhaController.text);                            
                          }
                        },
                        child: const Text("ENTRAR")),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
