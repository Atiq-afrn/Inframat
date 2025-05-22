import 'package:flutter/material.dart';
import 'package:inframat/provider/catagory_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem {
  final int id;
  final String name;

  CategoryItem({required this.id, required this.name});
}

class DropDown1Catagory extends StatefulWidget {
  const DropDown1Catagory({super.key, this.initialValue, this.onSelected});

  final CategoryItem? initialValue;
  final Function(CategoryItem?)? onSelected;

  @override
  State<DropDown1Catagory> createState() => _DropDown1CatagoryState();
}

class _DropDown1CatagoryState extends State<DropDown1Catagory> {
  CategoryItem? selectedCategory;
  final List<CategoryItem> dropdownItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCategory();
  }

  Future<void> _fetchCategory() async {
    final provider = Provider.of<CatagoryProvider>(context, listen: false);
    final response = await provider.getCatagory();

    if (response != null && response.data.isNotEmpty) {
      setState(() {
        dropdownItems.clear();

        dropdownItems.add(CategoryItem(id: 0, name: 'Select Category'));

        dropdownItems.addAll(
          response.data.map((e) => CategoryItem(id: e.id, name: e.name)),
        );

        // Use initial value if provided, else select the placeholder
        selectedCategory = widget.initialValue ?? dropdownItems.first;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    return DropdownButton<CategoryItem>(
      value: selectedCategory,
      isExpanded: true,
      dropdownColor: Colors.white,
      items:
          dropdownItems.map((category) {
            return DropdownMenuItem<CategoryItem>(
              value: category,
              child: Text(category.name),
            );
          }).toList(),
      onChanged: (CategoryItem? value) {
        if (value?.id == 0) return;

        setState(() {
          selectedCategory = value;
        });
        widget.onSelected?.call(value);
      },
    );
  }
}
