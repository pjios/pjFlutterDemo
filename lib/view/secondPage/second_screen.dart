import 'package:pj_demoflutterapp/view_model/second_screen_viewmodel.dart';
import 'package:pj_demoflutterapp/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pj_demoflutterapp/models/IPODetails.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  SecondScreenViewModel ipoDetailsViewModel = SecondScreenViewModel();
  @override
  void initState() {
    ipoDetailsViewModel.fetchIPODetailsListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
          //Navigator.of(context).pop(),
          Navigator.of(context, rootNavigator: true).pop(context),
        ),
        title: Text(
          'Second Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // actions: [
        //
        //   IconButton(onPressed: () => {
        //
        //   },
        //       icon: Icon(Icons.navigate_next_outlined)),
        //
        // ],
      ),
      body:
        ChangeNotifierProvider<SecondScreenViewModel>(
            create: (BuildContext context) => ipoDetailsViewModel,
            child: Consumer<SecondScreenViewModel>(builder: (context, value, _) {
              switch (value.ipoDetailsList.status) {
                case Status.LOADING:
                  return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case Status.ERROR:
                  return Text(value.ipoDetailsList.toString());
                case Status.COMPLETED:
                  return
              ListView.builder(
              itemCount: value.ipoDetailsList.data!.activeIpoList!.length,
              itemBuilder: (BuildContext context, int index) {
              return Card(
              child: ListTile(
              title: Text('IPO Detail Name: ${value.ipoDetailsList.data!.activeIpoList![index].name}'),
              subtitle: Text("IPO ID: ${value.ipoDetailsList.data!.activeIpoList![index].ipoid}"),
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

  Widget _popularIPOList( SecondScreenViewModel value, ) {
    return ListView.builder(
          itemCount: value.ipoDetailsList.data!.activeIpoList!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  title: Text(value.ipoDetailsList.data!.activeIpoList![index].name ?? ""),
                  subtitle: Text(value.ipoDetailsList.data!.activeIpoList![index].ipoCategoryName ?? ""),
                  //isThreeLine: true,
                ));
          }
    );
  }

}