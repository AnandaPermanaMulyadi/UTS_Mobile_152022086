import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String nama = "Ananda Permana Mulyadi";
  final String nim = "15-2022-086";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Mobile App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SplashScreen(nama: nama, nim: nim),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// SPLASH SCREEN 5 DETIK
class SplashScreen extends StatefulWidget {
  final String nama;
  final String nim;
  const SplashScreen({Key? key, required this.nama, required this.nim}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => DashboardPage(nama: widget.nama, nim: widget.nim)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            CircleAvatar(radius: 70, backgroundImage: AssetImage('assets/images/profile.jpg')),
            const SizedBox(height: 18),
            const Text('Aplikasi UTS Pemrograman Mobile',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(widget.nama, style: const TextStyle(color: Colors.white70, fontSize: 16)),
            Text(widget.nim, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.white),
          ]),
        ),
      ),
    );
  }
}

/// DASHBOARD with Bottom Navigation and IndexedStack
class DashboardPage extends StatefulWidget {
  final String nama;
  final String nim;
  const DashboardPage({Key? key, required this.nama, required this.nim}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      BiodataPage(nama: widget.nama, nim: widget.nim),
      ContactsPage(),
      CalculatorPage(),
      WeatherPage(),
      NewsPage(),
    ];
  }

  void _onItemTapped(int idx) => setState(() => _selectedIndex = idx);

  final bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Biodata'),
    BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Kontak'),
    BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Kalkulator'),
    BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Cuaca'),
    BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Berita'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard - UTS'),
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

/// BIODATA PAGE — versi gradasi warna modern + bebas overflow
class BiodataPage extends StatefulWidget {
  final String nama;
  final String nim;
  const BiodataPage({Key? key, required this.nama, required this.nim}) : super(key: key);

  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  String _selectedProdi = 'Informatika';
  String _gender = 'Laki-laki';
  final TextEditingController _alamatController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1980),
      lastDate: DateTime(now.year + 1),
    );
    if (date != null && mounted) setState(() => _selectedDate = date);
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _selectedDate == null
        ? '-'
        : DateFormat('dd MMM yyyy').format(_selectedDate!);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3E2BFF), Color(0xFF6EC6FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.nama,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo)),
                          const SizedBox(height: 6),
                          Text(widget.nim,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black87)),
                          const SizedBox(height: 8),
                          Text('Program Studi: $_selectedProdi',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.95),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.school, color: Colors.indigo),
                        const SizedBox(width: 10),
                        const Expanded(
                          flex: 2,
                          child: Text('Program Studi:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 3,
                          child: DropdownButton<String>(
                            value: _selectedProdi,
                            isExpanded: true,
                            items: [
                              'Informatika',
                              'Sistem Informasi',
                              'Teknik Komputer'
                            ]
                                .map((e) => DropdownMenuItem(
                                    value: e, child: Text(e)))
                                .toList(),
                            onChanged: (v) {
                              if (v != null) setState(() => _selectedProdi = v);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.person, color: Colors.indigo),
                        const SizedBox(width: 10),
                        const Expanded(
                          flex: 2,
                          child: Text('Jenis Kelamin:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Wrap(
                            spacing: 8,
                            children: [
                              Row(mainAxisSize: MainAxisSize.min, children: [
                                Radio<String>(
                                  value: 'Laki-laki',
                                  groupValue: _gender,
                                  onChanged: (v) => setState(() => _gender = v!),
                                ),
                                const Text('Laki-laki'),
                              ]),
                              Row(mainAxisSize: MainAxisSize.min, children: [
                                Radio<String>(
                                  value: 'Perempuan',
                                  groupValue: _gender,
                                  onChanged: (v) => setState(() => _gender = v!),
                                ),
                                const Text('Perempuan'),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _alamatController,
                      decoration: const InputDecoration(
                        labelText: 'Alamat',
                        border: OutlineInputBorder(),
                        prefixIcon:
                            Icon(Icons.home_rounded, color: Colors.indigo),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Colors.indigo),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text('Tanggal Lahir: $formattedDate',
                              style: const TextStyle(fontSize: 14)),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigoAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: _pickDate,
                          icon: const Icon(Icons.date_range),
                          label: const Text('Pilih'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        elevation: 6,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Preview Data'),
                            content: Text(
                                'Nama: ${widget.nama}\nNIM: ${widget.nim}\nProdi: $_selectedProdi\nGender: $_gender\nAlamat: ${_alamatController.text}\nTanggal Lahir: $formattedDate'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'))
                            ],
                          ),
                        );
                      },
                      child: const Text('Tampilkan Data',
                          style: TextStyle(
                              fontSize: 16, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}


/// CONTACTS PAGE (statis, minimal 15 kontak)
class ContactsPage extends StatelessWidget {
  ContactsPage({Key? key}) : super(key: key);

  final List<Map<String, String>> contacts = List.generate(15, (i) {
    return {
      'name': 'Kontak ${i + 1}',
      'phone': '0812-0000-${1000 + i}',
      'avatar': 'assets/images/contact_placeholder.jpg'
    };
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final c = contacts[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(c['avatar']!)),
            title: Text(c['name']!),
            subtitle: Text(c['phone']!),
            trailing: IconButton(
              icon: const Icon(Icons.call),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Panggil ${c['phone']}')),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// CALCULATOR PAGE (sederhana)
class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '0';
  double? _first;
  String? _operator;
  bool _justCalculated = false;

  void _numInput(String s) {
    setState(() {
      if (_justCalculated) {
        _display = (s == '.') ? '0.' : s;
        _justCalculated = false;
        return;
      }
      if (_display == '0' && s != '.') {
        _display = s;
      } else if (_display.contains('.') && s == '.') {
        return;
      } else {
        _display += s;
      }
    });
  }

  void _clear() {
    setState(() {
      _display = '0';
      _first = null;
      _operator = null;
      _justCalculated = false;
    });
  }

  void _setOp(String op) {
    _first = double.tryParse(_display) ?? 0;
    _operator = op;
    _display = '0';
  }

  void _calculate() {
    if (_operator == null || _first == null) return;
    final second = double.tryParse(_display) ?? 0;
    double res = 0;
    switch (_operator) {
      case '+':
        res = _first! + second;
        break;
      case '-':
        res = _first! - second;
        break;
      case '×':
        res = _first! * second;
        break;
      case '÷':
        res = second == 0 ? double.nan : _first! / second;
        break;
    }
    setState(() {
      _display = (res.isNaN || res.isInfinite) ? 'Error' : _formatResult(res);
      _first = null;
      _operator = null;
      _justCalculated = true;
    });
  }

  void _unary(String op) {
    final val = double.tryParse(_display) ?? 0;
    double res = val;
    if (op == 'x²') res = val * val;
    if (op == '√') res = val >= 0 ? sqrt(val) : double.nan;
    setState(() {
      _display = (res.isNaN || res.isInfinite) ? 'Error' : _formatResult(res);
      _justCalculated = true;
    });
  }

  String _formatResult(double v) {
    if (v == v.toInt()) return v.toInt().toString();
    return v.toString();
  }

  Widget _button(String label, {void Function()? onTap, Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 18)),
          child: Text(label, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rows = [
      ['7', '8', '9', '÷'],
      ['4', '5', '6', '×'],
      ['1', '2', '3', '-'],
      ['0', '.', 'C', '+'],
    ];

    return Column(children: [
      Expanded(
        child: Container(
          color: Colors.black87,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          alignment: Alignment.bottomRight,
          child: Text(_display, style: const TextStyle(color: Colors.white, fontSize: 40)),
        ),
      ),
      // build rows
      for (var row in rows)
        Row(
          children: [
            for (var item in row)
              _button(
                item,
                onTap: () {
                  if (item == 'C') {
                    _clear();
                  } else if (['+', '-', '×', '÷'].contains(item)) {
                    _setOp(item);
                  } else if (item == '.') {
                    _numInput('.');
                  } else {
                    _numInput(item);
                  }
                },
              )
          ],
        ),
      Row(children: [
        _button('x²', onTap: () => _unary('x²')),
        _button('√', onTap: () => _unary('√')),
        _button('=', onTap: _calculate),
      ]),
      const SizedBox(height: 8),
    ]);
  }
}

/// WEATHER PAGE (statis menggunakan gambar assets)
class WeatherPage extends StatelessWidget {
  WeatherPage({Key? key}) : super(key: key);

  final List<Map<String, String>> forecast = [
    {'date': 'Senin', 'temp': '29°C', 'img': 'assets/images/cuaca1.png', 'desc': 'Cerah berawan'},
    {'date': 'Selasa', 'temp': '31°C', 'img': 'assets/images/cuaca2.png', 'desc': 'Terik matahari'},
    {'date': 'Rabu', 'temp': '27°C', 'img': 'assets/images/cuaca3.png', 'desc': 'Hujan ringan'},
    {'date': 'Kamis', 'temp': '26°C', 'img': 'assets/images/cuaca4.png', 'desc': 'Berawan tebal'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              Image.asset('assets/images/weather_sun.jpg', width: 90, height: 90, fit: BoxFit.cover),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text('Bandung', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('28°C • Kelembapan 78%'),
                  SizedBox(height: 4),
                  Text('Berawan dengan potensi hujan ringan'),
                ]),
              ),
            ]),
          ),
        ),
        const SizedBox(height: 12),
        ...forecast.map((f) => Card(
              child: ListTile(
                leading: Image.asset(f['img']!, width: 56, height: 56, fit: BoxFit.contain),
                title: Text('${f['date']} - ${f['temp']}'),
                subtitle: Text(f['desc']!),
              ),
            )),
      ],
    );
  }
}

/// NEWS PAGE (statis, dummy local assets)
class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  final List<Map<String, String>> news = [
    {
      'title': 'Teknologi AI Dorong Efisiensi Industri',
      'img': 'assets/images/berita1.jpg',
      'date': '10 Nov 2025',
      'desc': 'Perusahaan-perusahaan mulai menerapkan solusi AI untuk mempercepat proses produksi.'
    },
    {
      'title': 'BMKG Keluarkan Peringatan Hujan Lebat',
      'img': 'assets/images/berita2.jpg',
      'date': '09 Nov 2025',
      'desc': 'Warga diimbau waspada dan siaga menghadapi potensi banjir lokal.'
    },
    {
      'title': 'Timnas Sukses Melaju ke Semifinal',
      'img': 'assets/images/berita3.jpg',
      'date': '08 Nov 2025',
      'desc': 'Pertandingan sengit berujung kemenangan lewat adu penalti.'
    },
    {
      'title': 'Pertumbuhan UMKM di Era Digital',
      'img': 'assets/images/berita4.jpg',
      'date': '07 Nov 2025',
      'desc': 'Adopsi pembayaran digital membantu UMKM menjangkau pelanggan baru.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: news.length,
      itemBuilder: (context, i) {
        final n = news[i];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(n['img']!, height: 160, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(n['title']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(n['date']!, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const SizedBox(height: 6),
                Text(n['desc']!, maxLines: 2, overflow: TextOverflow.ellipsis),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Untuk tugas: hanya contoh. Bisa dihubungkan ke halaman detail.
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text(n['title']!),
                                content: Text('${n['desc']!}\n\n(Silang untuk detail simulasi)'),
                                actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup'))],
                              ));
                    },
                    child: const Text('Baca Selengkapnya'),
                  ),
                )
              ]),
            )
          ]),
        );
      },
    );
  }
}
