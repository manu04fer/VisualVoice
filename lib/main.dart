import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:VisualVoice/Utils/Image_cropper_page.dart';
import 'package:VisualVoice/Utils/Image_picker_class.dart';
import 'package:VisualVoice/Widgets/Modal_Dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'Screen/Recognization_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'VisualVoice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: 403,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1.0),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(1.0),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black.withOpacity(1.0),
                              ),
                            ),
                            child: const Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                'VisualVoice',
                                style: TextStyle(
                                      fontFamily: 'Roboto Mono',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(1.0),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.withOpacity(1.0),
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Funcion\n',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(1.0),
                                        //fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'En este prototipo te da la oportunidad de probar una tecnologia capaz de reconocer el texto de imagenes y fotografias, con la capacidad de reproducir el texto en audio.\n\n',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(1.0),
                                        //fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Caracteristicas\n',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(1.0),
                                        //fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' - Reconocimiento de imagen \n - Sintesis de voz',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(1.0),
                                        //fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(1.0),
                                    fontFamily: 'Readex Pro',
                                  ),
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding:
                               const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(1.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white, 
                                        minimumSize: const Size(120, 80),
                                        padding: const EdgeInsets.all(30),
                                        backgroundColor:Colors.grey.withOpacity(1.0),
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          fontFamily: 'Readex Pro',
                                        ),
                                        elevation: 3,
                                        alignment: const Alignment(0, 0),
                                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),),
                                      ),
                                      child: const Text('Cámara'),
                                      onPressed: () async {
                                          log("Camera");
                                          pickImage(source: ImageSource.camera).then((value) {
                                            if (value != '') {
                                              imageCropperView(value, context).then((value) {
                                                if (value != '') {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                      builder: (_) => RecognizePage(
                                                        path: value,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              });
                                            }
                                          });
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white, 
                                        minimumSize: const Size(120, 80),
                                        padding: const EdgeInsets.all(30),
                                        backgroundColor:Colors.grey.withOpacity(1.0),
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          fontFamily: 'Readex Pro',
                                        ),
                                        elevation: 3,
                                        alignment: const Alignment(0, 0),
                                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),),
                                      ),
                                      child: const Text('Galería'),
                                      onPressed: () async {
                                          log("Gallery");
                                          pickImage(source: ImageSource.gallery).then((value) {
                                            if (value != '') {
                                              imageCropperView(value, context).then((value) {
                                                if (value != '') {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                      builder: (_) => RecognizePage(
                                                        path: value,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              });
                                              }
                                          });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      
      
      
      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.yellow.withOpacity(1.0),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withOpacity(1.0),
                        ),
                      ),
                      child: const Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Text(
                        'VisualVoice',
                        style: TextStyle(
                              fontFamily: 'Roboto Mono',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                ),
              ),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(1.0),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black.withOpacity(1.0),
                ),
              ),
              child: Align(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: RichText(
                    textScaleFactor: MediaQuery.textScaleFactorOf(context),
                    text: TextSpan(
                      children: [
                          TextSpan(
                            text: 'Funcion\n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(1.0),
                              //fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'En este prototipo te da la oportunidad de probar una tecnologia capaz de reconocer el texto de imagenes y fotografias, con la capacidad de reproducir el texto en audio.\n\n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(1.0),
                              //fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: 'Caracteristicas\n',
                            style: TextStyle(
                              color: Colors.black.withOpacity(1.0),
                              //fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' - Reconocimiento de imagen \n - Sintesis de voz',
                            style: TextStyle(
                              color: Colors.black.withOpacity(1.0),
                              //fontSize: 14,
                              fontWeight: FontWeight.normal,
                          )
                        ),
                      ],
                      style: TextStyle(
                            color: Colors.black.withOpacity(1.0),
                          ),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            )
            Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                      color: Colors.black.withOpacity(1.0),),
                      child:Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final selectedMedia = await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia
                                    .every((m) => validateFileFormat(m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile = selectedUploadedFiles.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }
                          },
                          text: 'Cámara ',
                          options: FFButtonOptions(
                            width: 120,
                            height: 80,
                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Button',
                          options: FFButtonOptions(
                            width: 120,
                            height: 80,
                            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                            ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
*/
     /* floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          imagePickerModal(context, 
          onCameraTap: () {
            log("Camera");
            pickImage(source: ImageSource.camera).then((value) {
              if (value != '') {
                imageCropperView(value, context).then((value) {
                  if (value != '') {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => RecognizePage(
                          path: value,
                        ),
                      ),
                    );
                  }
                });
              }
            });
          }, onGalleryTap: () {
            log("Gallery");
            pickImage(source: ImageSource.gallery).then((value) {
              if (value != '') {
                imageCropperView(value, context).then((value) {
                  if (value != '') {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => RecognizePage(
                          path: value,
                        ),
                      ),
                    );
                  }
                });
                }
            });
          });
        },
        tooltip: 'Increment',
        label: const Text("Scan photo"),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
