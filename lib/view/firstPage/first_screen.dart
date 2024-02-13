import 'package:pj_demoflutterapp/view_model/first_screen_viewmodel.dart';
import 'package:pj_demoflutterapp/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pj_demoflutterapp/utils/routes/routes_name.dart';
import 'package:pj_demoflutterapp/view/secondPage/second_screen.dart';
import 'package:pj_demoflutterapp/models/IPOList.dart';

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
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
      backgroundColor: Colors.orange,
    leading: IconButton(
    icon: Icon(Icons.account_circle_sharp, color: Colors.white),
    onPressed: () =>
    //Navigator.of(context, rootNavigator: true).pop(context),
      Navigator.of(context).pushNamed(RoutesName.secondPage),
    ),
    title: Text(
    'First Screen',
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
                ListView.builder(
                    itemCount: value.ipoList.data!.activeIpoList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: ListTile(
                            title: Text('IPO Name: ${value.ipoList.data!.activeIpoList![index].ipoName}'),
                            subtitle: Text("IPO ID: ${value.ipoList.data!.activeIpoList![index].ipoid}"),
                            //isThreeLine: true,
                          ));
                    }
                );

          //   ]);
            default:
              return const Text("hello");
          }
        })),
    );

  }
}