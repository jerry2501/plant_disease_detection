import 'dart:io';

import 'package:emojis/emoji.dart';
import 'package:fbutton/fbutton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:url_launcher/url_launcher.dart';

class Tensorflow extends StatefulWidget {
  File _image;
  Tensorflow(this._image);
  @override
  _TensorflowState createState() => _TensorflowState();
}

class _TensorflowState extends State<Tensorflow> {
  List _outputs;

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _loading = true;
    });
    //pickImage();
    loadModel().then((value) {
      classifyImage(widget._image).then((value) {
        setState(() {
          _loading = false;
        });
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/tflite/model_unquant.tflite",
      labels: "assets/tflite/labels.txt",
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    print(output);
    setState(() {
      _outputs = output;
      _loading = false;
    });
    print(_outputs);
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  // pickImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);
  //   if (image == null) return null;
  //   setState(() {
  //     _loading = true;
  //     widget._image = image;
  //   });
  //   //classifyImage(_image);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Plant Disease Detection",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff00600f),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(children: [
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .5,
                              child: Card(
                                  color: Colors.transparent,
                                  elevation: 8,
                                  shadowColor: Colors.purpleAccent[300],
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        widget._image,
                                        fit: BoxFit.fill,
                                      ))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _outputs.length != 0
                              ? Column(
                                  children: [
                                    Text(
                                      "Detection Result:",
                                      style: TextStyle(
                                          color: Color(0xff00600f),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _outputs[0]["label"],
                                      style: TextStyle(
                                        color: Color(0xff00600f),
                                        fontSize: 18,
                                      ),
                                    ),
                                    if (_outputs[0]['label']
                                            .toString()
                                            .contains('healthy') &&
                                        !_loading)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Yayy! Plant is Healthy!! \u{2618}',
                                            style: TextStyle(
                                                color: Color(0xff00600f),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                  ],
                                )
                              : Container(child: Text(""))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ),
              (_loading == false)
                  ? (!_outputs[0]['label'].toString().contains('healthy'))
                      ? Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.01,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FButton(
                                  padding: EdgeInsets.all(5),
                                  width: 200,
                                  text: "See how to Cure",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    stops: [0.05, 0.1, 1],
                                    colors: [
                                      Color(0xff00600f),
                                      Color(0xff097913),
                                      Color(0xff664fb3),
                                    ],
                                  ),
                                  onPressed: () {
                                    _openBrowser();
                                  },
                                  clickEffect: true,
                                  corner: FCorner.all(20),
                                  image: Icon(
                                    Icons.local_hospital,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  highlightColor:
                                      Color(0xff42a355).withOpacity(0.20),
                                  hoverColor:
                                      Color(0xff42a355).withOpacity(0.16),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox()
                  : SizedBox(),
            ]),
    );
  }

  Future _openBrowser() async {
    String url = "https://www.google.com/search?q=how+to+cure+" +
        "${_outputs[0]['label']}";
    if (await canLaunch(url))
      await launch(url);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }
}
