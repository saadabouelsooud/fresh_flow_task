import 'package:flutter/material.dart';
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';

class DetailsPage extends StatefulWidget {
  final ItemEntity itemEntity;
  const DetailsPage({Key? key,required this.itemEntity}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  TextEditingController? _noteTextController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _noteTextController!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Item Details"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.itemEntity.url!),
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
              "${widget.itemEntity.name}",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
                "${widget.itemEntity.price}")
          ],
        ),
      ),
    );
  }
}
