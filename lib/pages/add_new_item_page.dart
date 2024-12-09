
import 'package:flutter/material.dart';
import '../http/file_http.dart';

class AddNewItemPage extends StatefulWidget {
  const AddNewItemPage({super.key});

  @override
  State<AddNewItemPage> createState() => _AddNewItemPageState();
}

class _AddNewItemPageState extends State<AddNewItemPage> {
  final _formKey = GlobalKey<FormState>();

  late String nome;
  late String descricao;
  late String imagem;
  final FileHttp fileHttp = FileHttp();
  bool isLoading = false;
  String? errorMessage;

  // void pickFileAndUpload() async {
  //   final FileUploaduploadInput =
  //   html.FileUploadInputElement();
  //   uploadInput.accept = 'image/*';
  //   uploadInput.click();
  //
  //   uploadInput.onChange.listen((e) async {
  //     final files = uploadInput.files;
  //     if (files!.isEmpty) return;
  //
  //     final file = files[0];
  //     setState(() {
  //       isLoading = true;
  //       errorMessage = null;
  //     });
  //
  //     try {
  //       final reader = html.FileReader();
  //       reader.readAsArrayBuffer(file);
  //
  //       reader.onLoadEnd.listen((e) async {
  //         final fileBytes = reader.result as Uint8List;
  //         await fileHttp.uploadFileFromBytes(fileBytes as List<int>, file.name);
  //       });
  //
  //       reader.onError.listen((e) {
  //         setState(() {
  //           errorMessage = "Failed to read the file.";
  //         });
  //       });
  //     } catch (e) {
  //       setState(() {
  //         errorMessage = e.toString();
  //       });
  //     } finally {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   });
  // }

  void handleSignup() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (descricao.split('@').length != 2) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('E-mail inválido')),
        );
        return;
      }

      // if (user == null) {
      //   widget.addUser(User(
      //     person: Person(name: name),
      //     descricao: descricao,
      //     password: confirmedPassword,
      //     objects: [],
      //   ));
      //   Navigator.of(context).pop();
      //   const SnackBar(content: Text('Usuário criado!'));
      // } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Já existe algum usuário com esse e-mail.')),
      );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: Text(
          "Cadastro de Item",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Cadastre um novo item e comece a rastreá-lo",
                style: TextStyle(
                  color: Color.fromARGB(255, 114, 114, 114),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Nome',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Ex.: Notebook Lenovo',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 114, 114, 114),
                              fontWeight: FontWeight.w300),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          labelStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          nome = value ?? '';
                        },
                      ),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Descrição',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Adicione descrição',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 114, 114, 114),
                              fontWeight: FontWeight.w300),
                          filled: true,
                          fillColor: const Color(0xFFFFFFFF),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          labelStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (value.split('@').length != 2) {
                            return 'E-mail inválido';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          descricao = value ?? '';
                        },
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Imagem',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {

                            // pickFileAndUpload;
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.black,
                                width: 0.2,
                              ),
                            ),
                            backgroundColor: const Color(0xFEFEFEFE),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload,
                                  color: Color(0xFF00B4D8), size: 16),
                              SizedBox(width: 10),
                              const Text(
                                'Adicionar Imagem',
                                style: TextStyle(
                                    color: Color(0xFF00B4D8), fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            handleSignup();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xFF00B4D8),
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

