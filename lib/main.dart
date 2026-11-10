import 'package:flutter/material.dart';

void main() {
  runApp(Tes());
}

class Tes extends StatefulWidget {
  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {
  List<String> menu = ["Soto", "Rawon"];
  List<int> harga = [10000, 15000];

  List<String> gambar = ["assets/soto.jpg", "assets/rawon.jpg"];

  List<TextEditingController> porsi = [
    TextEditingController(),
    TextEditingController(),
  ];

  String hasil = "";

  void pesan() {
    int total = 0;
    String detail = "";

    for (int i = 0; i < menu.length; i++) {
      int jumlah = int.tryParse(porsi[i].text) ?? 0;

      if (jumlah > 0) {
        int subtotal = jumlah * harga[i];
        total += subtotal;

        detail += "${menu[i]} : $jumlah porsi = Rp $subtotal\n";
      }
    }

    setState(() {
      if (total == 0) {
        hasil = "Silakan masukkan jumlah porsi!";
      } else {
        hasil = "Hasil Pesanan\n\n"
            "$detail\n"
            "Total Harga: Rp $total";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFF8ED),
        primaryColor: Color(0xff8B4513),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8B4513),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Menu Makanan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(Icons.restaurant),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Selamat Datang!",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8B4513),
                ),
              ),

              SizedBox(height: 5),

              Text(
                "Silakan pilih menu makanan favoritmu.",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 20),

              // Daftar Menu
              for (int i = 0; i < menu.length; i++)
                Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.only(bottom: 18),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                gambar[i],
                                width: 110,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    menu[i],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff8B4513),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Rp ${harga[i]}",
                                    style: TextStyle(
                                      color: Colors.orange[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              "Porsi x",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff8B4513),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: porsi[i],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Jumlah porsi",
                                  filled: true,
                                  fillColor: Color(0xffFFF3E0),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              // Tombol Pesan
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: pesan,
                  icon: Icon(Icons.shopping_cart),
                  label: Text(
                    "Pesan Sekarang",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff8B4513),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Hasil Pesanan
              if (hasil.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xffFBE4C5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Color(0xffD6A46A),
                    ),
                  ),
                  child: Text(
                    hasil,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Color(0xff633719),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
