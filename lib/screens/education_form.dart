import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _institution = "";
  String _degree = "Sarjana (S1)"; 
  String _fieldOfStudy = "";
  int? _startYear;
  int? _endYear;
  String _description = "";

  final List<String> _degreeOptions = [
    'SMA / SMK / Sederajat',
    'Diploma (D3 / D4)',
    'Sarjana (S1)',
    'Magister (S2)',
    'Doktor (S3)',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Edukasi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // Drawer navigasi samping
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === Nama Institusi ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Universitas Indonesia",
                      labelText: "Nama Institusi / Universitas",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _institution = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Nama institusi tidak boleh kosong!";
                      }
                      if (value.trim().length < 3) {
                        return "Nama institusi minimal terdiri dari 3 karakter!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Jenjang Pendidikan ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Jenjang / Gelar",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    initialValue: _degree,
                    items: _degreeOptions.map((String degree) {
                      return DropdownMenuItem<String>(
                        value: degree,
                        child: Text(degree),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _degree = newValue!;
                      });
                    },
                  ),
                ),

                // === Bidang Studi / Jurusan ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Ilmu Komputer",
                      labelText: "Bidang Studi / Jurusan",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _fieldOfStudy = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Bidang studi tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Tahun Mulai & Tahun Selesai ===
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 4.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Contoh: 2024",
                            labelText: "Tahun Mulai",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _startYear = int.tryParse(value!);
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Wajib diisi!";
                            }
                            final parsed = int.tryParse(value);
                            if (parsed == null || parsed < 1900 || parsed > 2100) {
                              return "Tahun tidak valid!";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 4.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Contoh: 2028",
                            labelText: "Tahun Lulus",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _endYear = int.tryParse(value!);
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Wajib diisi!";
                            }
                            final parsed = int.tryParse(value);
                            if (parsed == null || parsed < 1900 || parsed > 2100) {
                              return "Tahun tidak valid!";
                            }
                            if (_startYear != null && parsed < _startYear!) {
                              return "Tahun lulus tidak boleh lebih kecil!";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                // === Deskripsi ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Tuliskan fokus studi, pencapaian, atau IPK...",
                      labelText: "Deskripsi / Aktivitas Tambahan (Opsional)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 16.0),

                // === Tombol Simpan dengan Validasi & Dialog ===
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36.0,
                        vertical: 12.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edukasi Berhasil Ditambahkan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Institusi: $_institution'),
                                    const SizedBox(height: 4.0),
                                    Text('Jenjang: $_degree'),
                                    const SizedBox(height: 4.0),
                                    Text('Jurusan: $_fieldOfStudy'),
                                    const SizedBox(height: 4.0),
                                    Text('Periode: $_startYear - $_endYear'),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      'Deskripsi: ${_description.trim().isEmpty ? "-" : _description}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('Tutup'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}