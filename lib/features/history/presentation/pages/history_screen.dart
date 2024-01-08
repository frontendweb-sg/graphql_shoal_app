import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/shared/widgets/calender.dart';
import 'package:graphql_shoal_app/shared/widgets/dropdown.dart';
import 'package:graphql_shoal_app/shared/widgets/switchbutton.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool checkBoxValue = false;
  String radioBtnValue = "male";
  String defultDropDownValue =  "Amit";
  List<Map<String, dynamic>> dropDownItems = [
    {"title": "Amit", "value": "1"},
    {"title": "Vinay", "value": "2"},
    {"title": "Pradeep", "value": "3"},
    ];

   static const List<String> _fruitOptions = <String>[ 
    'apple', 
    'banana', 
    'orange', 
    'mango', 
    'grapes', 
    'watermelon', 
    'kiwi', 
    'strawberry', 
    'sugarcane', 
  ];  

    String dropdownvalue = 'Item 1';
    var dropitems = [     
    'Item 1', 
    'Item 2', 
    'Item 3', 
    'Item 4', 
    'Item 5', 
  ];

  bool switchButtonValue = false;  

  TextEditingController _textEditingController = TextEditingController();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [

            CheckboxListTile(
                contentPadding: const EdgeInsets.all(0.0),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Male"),
                value: checkBoxValue,
                onChanged: (value) {
                  setState(() {
                    checkBoxValue = value!;
                  });
                }),

            const SizedBox(height: 30.0),

            Row(children: [
              Expanded(
                child: RadioListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Male"),
                  value: "Male",
                  groupValue: radioBtnValue,
                  onChanged: (value) {
                    setState(() {
                      radioBtnValue = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Female"),
                  value: "Female",
                  groupValue: radioBtnValue,
                  onChanged: (value) {
                    setState(() {
                      radioBtnValue = value!;
                    });
                  },
                ),
              ),
            ]),

            const SizedBox(height: 30.0),

            dropDownList(
              context,
              items: dropDownItems,
              value: defultDropDownValue,
              onChanged: (title) {
                setState(() {
                  defultDropDownValue = title.toString();
                });
              },              
              ),

            const SizedBox(height: 30.0),

            calendar(
              context,
              labelText: "DOB", 
              controller: _textEditingController,
              ),

             const SizedBox(height: 30.0),

              switchButton(
                context, 
                title: "Male",
                value: switchButtonValue, 
                onChanged: (value){
                  setState(() {
                    switchButtonValue = value;
                  });
                }),

             const SizedBox(height: 30.0),   

              Autocomplete<String>(              
                optionsBuilder: (TextEditingValue fruitTextEditingValue) { 
                  if (fruitTextEditingValue.text == '') { 
                    return const Iterable<String>.empty(); 
                  } 
                  return _fruitOptions.where((String option) { 
                    return option 
                        .contains(fruitTextEditingValue.text.toLowerCase()); 
                  }); 
                }, 
                  onSelected: (String value) { 
                    debugPrint('You just selected $value'); 
                  }, 
                ), 

                const SizedBox(height: 30.0),  

                DropdownButton( 
                
                  value: dropdownvalue, 
                  icon: const Icon(Icons.keyboard_arrow_down),     
                  items: dropitems.map((String items) { 
                    return DropdownMenuItem( 
                      value: items, 
                      child: Text(items), 
                    ); 
                  }).toList(), 

                    onChanged: (String? newValue) {  
                      setState(() { 
                        dropdownvalue = newValue!; 
                      }); 
                    }, 
            ), 
          ],
        )),
      ),
    );
  }
}
