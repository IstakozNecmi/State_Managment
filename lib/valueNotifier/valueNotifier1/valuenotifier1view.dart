import 'package:flutter/material.dart';

class ValueNotifier1class extends StatelessWidget {
  ValueNotifier<bool> _textHasErrorNotifier = ValueNotifier(false);

  _updateErrorText(String text) {
    var result = (text == null || text.length<5);
    _textHasErrorNotifier.value = result;
  }

  Widget _getPrefixText() {
    return Icon(Icons.ac_unit);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(24.0),
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: _textHasErrorNotifier,
              //_textHasErrorNotifier hasError'a dönüşüyor
              builder: (BuildContext context,bool hasError,Widget? child){
                return TextField(
                     onChanged: _updateErrorText,
                      decoration: InputDecoration(
                        //prefix: child,
                        prefix: Icon(Icons.add,color: Colors.red,),
                        fillColor: Colors.grey[100],
                        filled: true,
                        errorText: hasError ? 'Invalid value entered...' : null,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 0.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 0.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 0.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    );
              }
              ),
          )
        )
      );
    
  }
}