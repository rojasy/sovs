import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/election_controller.dart';
import '../utils/constants.dart';
import 'add_candidate_screen.dart';

class UpdateElectionScreen extends StatefulWidget {
  String title;
  String uniqueId;
  String category;
  String description;
  String year;
  UpdateElectionScreen({required this.uniqueId,required this.title,
    required this.category,required this.description,required this.year,super.key});

  @override
  State<UpdateElectionScreen> createState() => _UpdateElectionScreenState();
}

class _UpdateElectionScreenState extends State<UpdateElectionScreen> {

  String categoryValue = "";

  TextEditingController searchController = TextEditingController();
  // TextEditingController titleController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  // TextEditingController yearController = TextEditingController();

  ScrollController scrollController = ScrollController();

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController yearController;
  // late TextEditingController emailController;
  // late TextEditingController phoneController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    yearController = TextEditingController(text: widget.year);
    categoryValue = widget.category;

  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    yearController.dispose();
    super.dispose();
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text("Updating Screen!!")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Election",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 25,),
            _buildDropdownElectionCategoryButton(ElectionCategory.values),
            SizedBox(height: 20,),
            TextFormField(
              controller: titleController,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "title",
                  isDense: true,
                  filled: true,
                  fillColor: primaryColor.withOpacity(0.3),
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  )
              ),
              onChanged: (value) {
                setState(() {
                  widget.title = value;
                });
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: descriptionController,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Description",
                  isDense: true,
                  filled: true,
                  fillColor: primaryColor.withOpacity(0.3),
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  )
              ),
              onChanged: (value) {
                setState(() {
                  widget.description = value;
                });
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: yearController,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Year",
                  isDense: true,
                  filled: true,
                  fillColor: primaryColor.withOpacity(0.3),
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  )
              ),
              onChanged: (value) {
                setState(() {
                  widget.year = value;
                });
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.all(10),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                ),
                onPressed: ()async{

                  showLoaderDialog(context);

                  Map<String,dynamic>? output = await Provider.of<GetAllElectionController>(context, listen: false).
                  updateElection(context, categoryValue, descriptionController.text, titleController.text, int.parse(yearController.text), widget.uniqueId);

                  String message = output?['updateElection']['message'];
                  bool error = output?['updateElection']['error'];


                  if(error == false){
                    Navigator.pop(context);
                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(
                        SnackBar(content: Text(message)));
                    Navigator.of(
                        context)
                        .pop();

                  }else{
                    Navigator.pop(context);

                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(
                        SnackBar(content: Text(message),backgroundColor: errorColor,));
                    Navigator.of(
                        context)
                        .pop();
                  }

                }, child: Text("Update Election",style: TextStyle(color: whiteColor),))
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownElectionCategoryButton(List<ElectionCategory> items) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
            hintText: "Select Category",
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            fillColor: primaryColor.withOpacity(0.3),
            filled: true,
            // Add more decoration..
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            )),
        hint: Text("Select Category"),
        value: categoryValue.isNotEmpty ? categoryValue : null,
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item.name,
          child: Text(item.name,
            style: const TextStyle(color: Colors.black),
          ),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Category needed";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            categoryValue = value!;
            // dropdownValue = value;
          });
          //_controller.getFinancialHighLeastProjectConsumingRateGraph(selectedValue);
          //Do something when selected item is changed.
        },
        onSaved: (value) {
          setState(() {
            categoryValue = value.toString();
          });
          // dropdownValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

}

enum ElectionCategory{
  COBA_PARLIAMENT,
  COET_PARLIAMENT,
  PRESIDENT
}
