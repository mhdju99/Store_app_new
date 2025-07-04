// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class dropDown extends StatelessWidget {
  String? name;
  List<String?> genderItems;
  void Function(String?)? onSave;
  dropDown({
    Key? key,
    required this.name,
    required this.genderItems,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      
      decoration: InputDecoration(
        fillColor: Colors.grey[300],
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18)),
        // Add more decoration..
      ),
      
      hint: Row(
        children: [
          
          Text(
            name!,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
      items: genderItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select ';
        }
        return null;
      },
      onChanged: (value) {
        //Do something when selected item is changed.
      },
      
      onSaved: onSave,
      iconStyleData: const IconStyleData(

        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
