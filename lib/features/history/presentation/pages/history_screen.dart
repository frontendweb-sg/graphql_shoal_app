import 'package:flutter/material.dart';
import 'package:graphql_shoal_app/shared/widgets/button.dart';
import 'package:graphql_shoal_app/shared/widgets/calender.dart';
import 'package:graphql_shoal_app/shared/widgets/dropdown.dart';
import 'package:graphql_shoal_app/shared/widgets/switchbutton.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  bool checkBoxValue = true;
  int radioBtnValue = 2;
  bool switchButtonValue = true;  

  final _formKey = GlobalKey<FormState>();
    final Map<String, dynamic> formelements = {"Gender": false, "SelectedGender": 1, "Terms": true, "title": "Amit"};

  void onSubmit() async {
    print(formelements);
  }

  String defultDropDownValue =  "Amit";
  
  final dropDownItems = [
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

 

  TextEditingController _textEditingController = TextEditingController();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
              children: [
              
              CheckboxListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("Male"),
                  value: formelements['Gender'],
                  onChanged: (value) {
                    setState(() {
                      formelements['checkBoxValue'] = value!;
                    });
                  }),
              
              const SizedBox(height: 30.0),
              
              Row(children: [
                Expanded(
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Male"),
                    value: 1,
                    groupValue: formelements['SelectedGender'],
                    onChanged: (value) {
                      setState(() {
                        formelements['radioBtnValue'] = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text("Female"),
                    value: 2,
                    groupValue: formelements['SelectedGender'],
                    onChanged: (value) {
                      setState(() {
                        formelements['radioBtnValue'] = value!;
                      });
                    },
                  ),
                ),
              ]),


              const SizedBox(height: 30.0),              
                switchButton(
                  context, 
                  title: "Terms",
                  value: formelements['Terms'], 
                  onChanged: (value){
                    setState(() {
                      formelements['switchButtonValue'] = value;
                    });
                  }),
              
              const SizedBox(height: 30.0),
              
              // DropdownButtonHideUnderline(
              //         child: DropdownButton<Object>(
              //           isExpanded: true,
              //           isDense: true,
              //           menuMaxHeight: 350,
              //           value: formelements['title'],
              //           items:dropDownItems.map((data) {
              //             return DropdownMenuItem(
              //               value: data['value'],
              //               child: Text(data['title']),
              //             );
              //           }).toList(),
              //           onChanged:(selectedValue) {
              //             setState(() {
              //               selectedValue = value!;
              //             });
              //           }                       
              //         ),
              //       ),
              
              const SizedBox(height: 30.0),
              
              calendar(
                context,
                labelText: "DOB", 
                controller: _textEditingController,
                ),
              
            
              
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

                const SizedBox(height: 30.0),

                    button(
                      context,
                      label: "Submit",
                      onPressed: onSubmit,                    
                    ),

                        ],
                      ),
            )),
      ),
    );
  }
}
