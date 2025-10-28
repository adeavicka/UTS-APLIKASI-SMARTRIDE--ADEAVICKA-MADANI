abstract class Transportasi {
  String nama; // nama transportasi contoh blue taxi
  double _tarifDasar; //Tarif dasar per unit

  Transportasi(this.nama, this._tarifDasar); // Contructor nama dan tarifDasar

  double get tarifDasar => _tarifDasar; // Getter untuk tarif dasar

  //Method abstrak untuk menghitung tarif  (harus di implementasikan di anak class)
  double hitungTarif(int jumlahPenumpang);
}

//Kelas Taksi (Turunan Dari Transportasi)
class Taksi extends Transportasi {
  double jarak; // jarak tempuh perjalanan

  // constructor taksi
  Taksi(String nama, double tarifDasar, this.jarak) : super(nama, tarifDasar);
  // override method hitungTarif dengan rumus // total = tarifDasar * jarak
  @override
  double hitungTarif(int jumlahPenumpang) => tarifDasar * jarak;
}

// kelas bus //
class Bus extends Transportasi {
  bool adaWifi; // menandakan apakah bus memiliki wifi

  //constructor bus
  Bus(String nama, double tarifDasar, this.adaWifi) : super(nama, tarifDasar);
  // override method hitung tarifDasar dengan rumus / total = (tarifDasar * jumlahpenumpang) + biaya tambahan jika ada wifi
  @override
  double hitungTarif(int jumlahPenumpang) =>
      tarifDasar * jumlahPenumpang + (adaWifi ? 5000 : 0);
}

// Kelas Pesawat //
class Pesawat extends Transportasi {
  String kelas; //Kelas penerbangannya (Ekonomi / Bisnis)
  // constructor Pesawat
  Pesawat(String nama, double tarifDasar, this.kelas) : super(nama, tarifDasar);

  // override method hitungTarif dengan rumus / total = tarifDasar *jumlahPenumpang * multipiler kelas
  // jika kelas bisnis, tarif nya dikalikan dengan 1.5
  @override
  double hitungTarif(int jumlahPenumpang) =>
      tarifDasar * jumlahPenumpang * (kelas == 'Bisnis' ? 1.5 : 1.0);
}

//Program Utama
void main() {
  //Membuat daftar transportasi yang tersedia
  List<Transportasi> daftarTransport = [
    Taksi('Blue Taxi', 5000, 12), // Taksi dengan tarif 5000/km dan jarak 12 km
    Bus('TransJakarta', 10000, true), // Bus dengan tarif 10000/org, ada wifi
    Pesawat(
      'Garuda',
      500000,
      'Bisnis',
    ), // Pesawat dengan tarif 500000/Orang dengan kelas bisnis
  ];

  // Dummy input pelanggan
  List<String> namaPelangganList = [
    'adea',
    'vicka',
    'madani',
  ]; // nama pelanggan
  List<int> jumlahPenumpangList = [1, 3, 2]; // jumlah penumpangtiap pemesanan
  List<int> pilihanTransportList = [1, 2, 3]; // pilihan

  print('--- SmartRide---');

  //looping untuk memproses setiap pemesanan
  for (int i = 0; i < namaPelangganList.length; i++) {
    Transportasi transport =
        daftarTransport[pilihanTransportList[i] -
            1]; // ambil objek transportasi
    String nama = namaPelangganList[i]; // ambil nama pelanggan
    int jumlah = jumlahPenumpangList[i]; // ambil jumlah pelanggan

    double total = transport.hitungTarif(
      jumlah,
    ); // Hitung total tarif sesuai jenis transportasi

    //tampilkan struk pemesanan
    print('\n--- Struk Pemesanan ---');
    print('Pelanggan: $nama');
    print('Transportasi: ${transport.nama}');
    print('Jumlah Penumpang: $jumlah');
    print('Total tarif: Rp${total.toStringAsFixed(2)}'); // format 2 desimal
    print('-----------------------------------');
  }
  // pesan punutup
  print(
    '\nTerima kasih telah menggunakan SmartRide, Sampai Jumpa Hati Hati dijalan',
  );
}
