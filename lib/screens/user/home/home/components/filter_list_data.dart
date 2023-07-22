import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  final List<String>? type;
  final List<String>? region;
  final List<String>? age;
  final List<String>? color;
  final List<String>? casuality;
  final List<String>? originality;

  MyListView({
    this.type,
    this.region,
    this.age,
    this.color,
    this.casuality,
    this.originality,
  });

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCheckboxList(widget.type, 'Type'),
        _buildCheckboxList(widget.region, 'Region'),
        _buildCheckboxList(widget.age, 'Age'),
        _buildCheckboxList(widget.color, 'Color'),
        _buildCheckboxList(widget.casuality, 'Casuality'),
        _buildCheckboxList(widget.originality, 'Originality'),
      ],
    );
  }

  Widget _buildCheckboxList(List<String>? dataList, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: dataList?.length ?? 0,
          itemBuilder: (context, index) {
            String value = dataList![index];
            bool isChecked = selectedValues.contains(value);

            return CheckboxListTile(
              title: Text(value),
              value: isChecked,
              onChanged: (checked) {
                setState(() {
                  if (checked!) {
                    selectedValues.add(value);
                  } else {
                    selectedValues.remove(value);
                  }
                });
              },
            );
          },
        ),
      ],
    );
  }
}
