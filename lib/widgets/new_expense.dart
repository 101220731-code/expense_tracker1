import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  String expenseTitle = ' ';
  void _saveExpenseTitle(String input) {
    expenseTitle = input;
  }

  final _titleController = TextEditingController();
  final _amountcontroller = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

void showDatePicker () async{
  var now = DateTime.now();
  var firstDate = Datetime(now.year-1, now.month, now.day);
  var pickedDate= await showDatePicker(
  context =context,
  initialDate: now,
  firstDate: firstDate,
  lastDate: now,);
  setState(() {
    _selectedDate = pickedDate;
  });
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(20)),
        TextField(
          controller: _titleController,
          onChanged: _saveExpenseTitle,
          maxLength: 50,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(label: Text("Expense title")),
        ), Row(  children: [
        TextField( 
          controller: _amountcontroller,
          onChanged: _saveExpenseTitle,
          maxLength: 50,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(label: Text("amount"), prefixText: '\$'),
          
        ), SizedBox( height: 16), Expanded(child: Row(
          children: [Text("selected date")
          IconButton(onPressed:_showDatePicker, icon: Icon(Icons.calendar_month),
         ],
        )) 
        ],  
        ),

        Row(
          children: [
            ElevatedButton(
              child: Text("Save Expense"),
              onPressed: () {
                print("title: ${_titleController.text}");
                print("amount: ${_amountcontroller.text}");
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("cancel"),
            ),
          ],
        ),
      ],
    );
  }
}
