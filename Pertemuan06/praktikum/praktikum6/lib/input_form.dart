
import 'package:flutter/material.dart';

class MyInputForm extends StatefulWidget {
  const MyInputForm({super.key});

  @override
  State<MyInputForm> createState() => _MyInputFormState();
}

class _MyInputFormState extends State<MyInputForm> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  final TextEditingController _controllerEmail =
      TextEditingController();

  final TextEditingController _controllerNama =
      TextEditingController();

  final List<Map<String, String>> _myDataList = [];

  Map<String, String>? editedData;

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerNama.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';

    if (email.isEmpty) {
      return 'Email wajib diisi';
    }

    final emailRegex =
        RegExp(r'^[\w.+%-]+@[\w.-]+\.[A-Za-z]{2,}$');

    if (!emailRegex.hasMatch(email)) {
      return 'Tolong inputkan email yang valid!';
    }

    return null;
  }

  String? _validateNama(String? value) {
    final nama = value?.trim() ?? '';

    if (nama.length < 3) {
      return 'Masukkan setidaknya 3 karakter';
    }

    return null;
  }

  void _addData() {
    final name = _controllerNama.text.trim();
    final email = _controllerEmail.text.trim();

    setState(() {
      if (editedData != null) {
        editedData!['name'] = name;
        editedData!['email'] = email;
        editedData = null;
      } else {
        _myDataList.add({
          'name': name,
          'email': email,
        });
      }

      _controllerNama.clear();
      _controllerEmail.clear();
    });
  }

  void _editData(Map<String, String> data) {
    setState(() {
      _controllerEmail.text = data['email'] ?? '';
      _controllerNama.text = data['name'] ?? '';
      editedData = data;
    });
  }

  void _deleteData(Map<String, String> data) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete Data'),
          content: const Text(
            'Apakah Anda yakin ingin menghapus data ini?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _myDataList.remove(data);

                  if (identical(editedData, data)) {
                    editedData = null;
                    _controllerNama.clear();
                    _controllerEmail.clear();
                  }
                });

                Navigator.of(dialogContext).pop();
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextFormField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Write your email here...',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Color.fromARGB(
                          255, 222, 254, 255,
                        ),
                        filled: true,
                      ),
                      validator: _validateEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextFormField(
                      controller: _controllerNama,
                      decoration: const InputDecoration(
                        hintText: 'Write your name here...',
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Color.fromARGB(
                          255, 222, 254, 255,
                        ),
                        filled: true,
                      ),
                      validator: _validateNama,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addData();
                      }
                    },
                    child: Text(
                      editedData != null ? 'Update' : 'Submit',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'List Data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _myDataList.isEmpty
                  ? const Center(
                      child: Text('Belum ada data.'),
                    )
                  : ListView.builder(
                      itemCount: _myDataList.length,
                      itemBuilder: (context, index) {
                        final data = _myDataList[index];

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Text(
                                    'ULBI',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data['name'] ?? ''),
                                      Text(data['email'] ?? ''),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Edit',
                                  onPressed: () => _editData(data),
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  tooltip: 'Hapus',
                                  onPressed: () => _deleteData(data),
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}