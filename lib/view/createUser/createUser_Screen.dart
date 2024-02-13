import 'package:pj_demoflutterapp/view_model/first_screen_viewmodel.dart';
import 'package:pj_demoflutterapp/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pj_demoflutterapp/utils/routes/routes_name.dart';
import 'package:pj_demoflutterapp/view/secondPage/second_screen.dart';
import 'package:pj_demoflutterapp/models/IPOList.dart';
import 'package:pj_demoflutterapp/view/firstPage/first_screen.dart';

class CreateUserScrren extends StatefulWidget {
  const CreateUserScrren({Key? key}) : super(key: key);

  @override
  State<CreateUserScrren> createState() => _CreateUserScrrenState();
}

class _CreateUserScrrenState extends State<CreateUserScrren> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirstScreenViewModel ipoListViewModel = FirstScreenViewModel();
  @override
  void initState() {
    ipoListViewModel.fetchIPOListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () =>
            Navigator.of(context).pushNamed(RoutesName.firstPage),
        ),
        title: Text(
          'Authenticate Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context).pushNamed(RoutesName.secondPage),
            },
            icon: Icon(Icons.navigate_next_outlined), color: Colors.white,),
        ],
      ),
      body:
      ChangeNotifierProvider<FirstScreenViewModel>(
          create: (BuildContext context) => ipoListViewModel,
          child: Consumer<FirstScreenViewModel>(builder: (context, value, _) {
            switch (value.ipoList.status) {
              case Status.LOADING:
                return SizedBox(
                  height: height,
                  child: const Center(child: CircularProgressIndicator()),
                );
              case Status.ERROR:
                return Text(value.ipoList.toString());
              case Status.COMPLETED:
                return
            Form(
            key: _formKey,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Email"),
            validator: (value) {
            if (value == null || value.isEmpty) {
            return 'Please enter your email';
            }
            return null;
            },
            ),
            ),
            Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Password"),
            validator: (value) {
            if (value == null || value.isEmpty) {
            return 'Please enter your password';
            }
            return null;
            },
            ),
            ),
            Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
            child: Center(
            child: ElevatedButton(
            onPressed: () {
            if (_formKey.currentState!.validate()) {
            // Navigate the user to the Home page
            } else {
            ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill input')),
            );
            }
            },
            child: const Text('Submit'),
            ),
            ),
            ),
            ],
            ),
            ),
            );

            //   ]);
              default:
                return const Text("hello");
            }
          })),
    );

  }
}