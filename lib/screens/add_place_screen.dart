import 'package:flutter/material.dart';
import 'package:mtms/models/list.dart';
import 'package:provider/provider.dart';
import '../widgets/image_input.dart';
import 'dart:io';
import '../providers/great_places.dart';
import '../widgets/location_input.dart';
import '../models/place.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  String _territoryName;

  File _pickedImage;
  PlaceLocation _pickedLocation;

  void _selectedImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = PlaceLocation(latitude: lat, longitude: lng);
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    }
    Provider.of<GreatPlaces>(context).addPlace(
        _titleController.text, _territoryName, _pickedImage, _pickedLocation);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('User Inputs...'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: DropdownButton<String>(
                        iconSize: 30,
                        icon: Icon(Icons.add),
                        items: <String>[
                          for (int i = 0; i < territorylist.length; i++)
                            territorylist[i]['region'].toString(),
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                          
                            value: value,
                            child: Text(value),
                            
                          );
                        }).toList(),
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            _territoryName = value;
                          });               
                        },
                        value: _territoryName,     
                        hint: Text('선택', style: TextStyle(color: Colors.black),),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectedImage),
                    SizedBox(
                      height: 10.0,
                    ),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
