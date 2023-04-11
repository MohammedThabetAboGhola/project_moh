import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_moh/config/MyColors.dart';

class SelectedSpecialties extends StatefulWidget {
  final List data;
  const SelectedSpecialties({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SelectedSpecialties> createState() => _SelectedSpecialtiesState();
}

class _SelectedSpecialtiesState extends State<SelectedSpecialties> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.blue,
          title: const Text(
            "التخصصات المتاحة",
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(
                    "${widget.data[index]["specialization"]}",
                    style: const TextStyle(
                        fontSize: 17,
                        color: MyColors.blue,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                      "معدل القبول:${widget.data[index]['average']}%",
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: MyColors.orange
                    ),
                  ),
                  trailing: Text(
                    "سعر الساعة:${widget.data[index]['price']}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: MyColors.orange
                    ),
                  ));
            }),
      ),
    );
  }
}
