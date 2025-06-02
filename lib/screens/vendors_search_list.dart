import 'package:flutter/material.dart';
import 'package:inframat/const/color.dart';
import 'package:inframat/provider/vendors_list_provider.dart';
import 'package:provider/provider.dart';

// Vendor model to hold name and ID
class Vendor {
  final int vendorId;
  final String vendorName;

  Vendor({required this.vendorId, required this.vendorName});
}

class VendorsSearchDropdown extends StatefulWidget {
  VendorsSearchDropdown({Key? key,this.onVendorSelected}) 
  ;
  final Function(int vendorId, String vendorName)? onVendorSelected;
  @override
  _VendorsSearchDropdownState createState() => _VendorsSearchDropdownState();
}

class _VendorsSearchDropdownState extends State<VendorsSearchDropdown> {
  final TextEditingController vendorsNameController1 = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<Vendor> allItems = [];
  List<Vendor> filteredItems = [];
  bool showDropdown = false;

  @override
  void initState() {
    super.initState();

    // Fetch vendors list
    Provider.of<VendorsListProvider>(
      context,
      listen: false,
    ).gettingVendorsList().then((value) {
      if (value != null) {
        setState(() {
          allItems =
              value.data
                  .map<Vendor>(
                    (vendor) => Vendor(
                      vendorId: vendor.id,
                      vendorName: vendor.vendorName,
                    ),
                  )
                  .toList();
          filteredItems = List.from(allItems);
        });
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load vendor names')));
      }
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() => showDropdown = true);
      }
    });

    vendorsNameController1.addListener(() {
      String input = vendorsNameController1.text.toLowerCase();
      setState(() {
        filteredItems =
            allItems
                .where(
                  (vendor) => vendor.vendorName.toLowerCase().contains(input),
                )
                .toList();
      });
    });
  }

  void _addNewItem(String newItem) {
    final newVendor = Vendor(
      vendorId: -1,
      vendorName: newItem,
    ); // -1 means new/unknown
    setState(() {
      allItems.add(newVendor);
      filteredItems = List.from(allItems);
      vendorsNameController1.text = newItem;
      showDropdown = false;
    });
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    vendorsNameController1.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Box
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width * .85,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Appcolor.greycolor)),
              color: Appcolor.lightgrey2,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: TextField(
                  controller: vendorsNameController1,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search vendor name",
                    hintStyle: TextStyle(color: Appcolor.greycolor),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Drop-down list
        if (showDropdown)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child:
                filteredItems.isNotEmpty
                    ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final vendor = filteredItems[index];
                        return ListTile(
                          title: Text(vendor.vendorName),
                          ///subtitle: Text("ID: ${vendor.vendorId}"),
                          onTap: () {
                            setState(() {
                              vendorsNameController1.text = vendor.vendorName;
                              showDropdown = false;
                            });
                            FocusScope.of(context).unfocus();

                            // If you want to pass vendor.vendorId somewhere, you can handle it here
                          },
                        );
                      },
                    )
                    : ListTile(
                      title: TextButton.icon(
                        icon: Icon(Icons.add),
                        label: Text('Add "${vendorsNameController1.text}"'),
                        onPressed:
                            () => _addNewItem(vendorsNameController1.text),
                      ),
                    ),
          ),
      ],
    );
  }
}
