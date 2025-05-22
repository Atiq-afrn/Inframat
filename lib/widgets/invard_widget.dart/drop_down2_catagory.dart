import 'package:flutter/material.dart';
import 'package:inframat/models/sub_category_model.dart';
import 'package:inframat/provider/sub_category_provider.dart';
import 'package:provider/provider.dart';

class StoreMaterial {
  final String id;
  final String name;

  StoreMaterial({required this.id, required this.name});

  @override
  String toString() => name;
}

class DropDownCatagory extends StatefulWidget {
  final Function(StoreMaterial?)? onSelected;
  final String? id;

  const DropDownCatagory({super.key, required this.id, this.onSelected});

  @override
  State<DropDownCatagory> createState() => _DropDownCatagoryState();
}

class _DropDownCatagoryState extends State<DropDownCatagory> {
  List<StoreMaterial> dropdownList = [];
  StoreMaterial? selectedValue;
  bool isLoading = false;
  String? previousId;

  Future<void> _getSubCategories() async {
    if (widget.id == null || widget.id!.isEmpty || widget.id == "N/a") {
      setState(() {
        dropdownList = [];
        selectedValue = null;
        isLoading = false;
      });
      return;
    }

    setState(() => isLoading = true);
    final provider = Provider.of<SubCategoryProvider>(context, listen: false);
    final response = await provider.getSubCategory(id: widget.id!);

    if (response != null && response.data.isNotEmpty) {
      final items =
          response.data
              .map((e) => StoreMaterial(id: e.id.toString(), name: e.name))
              .toList();

      setState(() {
        dropdownList = items;
        selectedValue = null; // reset selection
        isLoading = false;
      });
    } else {
      setState(() {
        dropdownList = [];
        selectedValue = null;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    previousId = widget.id;
    _getSubCategories();
  }

  @override
  void didUpdateWidget(DropDownCatagory oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id) {
      previousId = widget.id;
      _getSubCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    return DropdownButton<StoreMaterial>(
      value: selectedValue,
      hint: const Text("Select Sub Category"),
      isExpanded: true,
      dropdownColor: Colors.white,
      items:
          dropdownList.map((item) {
            return DropdownMenuItem(value: item, child: Text(item.name));
          }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.onSelected?.call(value);
      },
    );
  }
}
