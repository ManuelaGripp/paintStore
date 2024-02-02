import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:paint_store/app/components/input_paint_store.dart';
import 'package:paint_store/app/utils/validators.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final _formSingInKey = GlobalKey<FormState>();
  final _formSingUpKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(80, 95, 80, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(120),
              SvgPicture.asset(
                'assets/logo.svg',
                width: 100,
                height: 100,
              ),
              const Gap(50),
              TabBar(
                controller: _tabController,
                dividerColor: const Color.fromRGBO(80, 95, 80, 1),
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorWeight: 0.2,
                labelPadding: const EdgeInsets.only(bottom: 10),
                unselectedLabelColor: Colors.white,
                overlayColor: MaterialStateProperty.all(
                    const Color.fromRGBO(80, 95, 80, 1)),
                tabs: const [
                  Text('Entrar'),
                  Text('Registrar'),
                ],
                onTap: (index) {
                  emailController = TextEditingController();
                  passwordController = TextEditingController();
                  userNameController = TextEditingController();
                },
              ),
              const Gap(56),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bem vindo',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    Text(
                      'Entre ou se cadastre para aproveitar o app!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                width: double.infinity,
                height: 300,
                child: TabBarView(controller: _tabController, children: [
                  PaintStoreForm(true, _formSingInKey),
                  PaintStoreForm(false, _formSingUpKey),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget PaintStoreForm(bool singIn, GlobalKey<FormState> formKey) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Visibility(
            visible: !singIn,
            child: Column(
              children: [
                InputPaintStore(
                  controller: passwordController,
                  hintText: 'Nome',
                  validators: Validator.required(),
                ),
                const Gap(20),
              ],
            ),
          ),
          InputPaintStore(
            controller: emailController,
            hintText: 'E-mail',
            validators: Validator.required(),
          ),
          const Gap(20),
          InputPaintStore(
            controller: passwordController,
            hintText: 'Senha',
            validators: Validator.required(),
          ),
          const Gap(45),
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(2)),
            child: InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  print('Entrou');
                  // Navigator.of(context).pushReplacementNamed('/home');
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 50,
                ),
                child: Text(
                  singIn ? 'Entrar' : 'Registrar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
