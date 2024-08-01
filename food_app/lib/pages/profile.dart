import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      appBar: AppBar(
        title: Center(child: Text('Account')),
        backgroundColor: Colors.amber,
      
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              //Adding textformfields and elevated button
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                   border: UnderlineInputBorder(),
                   labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent
                   ),
                  labelText: 'First Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent
                   ),
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent
                   ),
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
              TextFormField(               
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent
                   ),
                  labelText: 'Phone number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0,),
              ElevatedButton(
                onPressed: () {
                  //validate returns true if the form is valid or false if the form is invalid
                  if (_formKey.currentState?.validate() == true) {
                    //process data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')));
                    
                  }
                },
                child: const Text('Submit'),
                )
            ],),
          ),
        )),

    );
    
  }
}