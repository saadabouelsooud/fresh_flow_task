

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertakehometest/feature/presentation/cubit/item/item_cubit.dart';
import 'package:fluttertakehometest/feature/presentation/cubit/auth/auth_cubit.dart';

import '../../../app_const.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({Key? key,required this.uid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    BlocProvider.of<ItemCubit>(context).getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basket ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).loggedOut();
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: BlocBuilder<ItemCubit,ItemState>(
        builder: (context,itemState){

          if (itemState is ItemLoaded){
            return _bodyWidget(itemState);
          }


          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _noNotesWidget(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 80,
              child: Image.asset('assets/notebook.png')),
          SizedBox(
            height: 10,
          ),
          Text("No notes here yet"),
        ],
      ),
    );
  }

  Widget _bodyWidget(ItemLoaded itemLoadedState) {
    return Column(
      children: [
        Expanded(
          child: itemLoadedState.items.isEmpty?_noNotesWidget():GridView.builder(
            itemCount: itemLoadedState.items.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.2),
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, PageConst.DetailsPage,
                      arguments: itemLoadedState.items[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(itemLoadedState.items[index].url!),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: Offset(0, 1.5))
                      ]),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemLoadedState.items[index].name}",
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                          "${itemLoadedState.items[index].price}")
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
