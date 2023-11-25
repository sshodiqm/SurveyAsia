import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survei_asia/res/theme.dart';

class SyaratDanKetentuan extends StatefulWidget {
  const SyaratDanKetentuan({Key? key}) : super(key: key);

  @override
  _SyaratDanKetentuan createState() => _SyaratDanKetentuan();
}

class _SyaratDanKetentuan extends State<SyaratDanKetentuan> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.deepOrange;
    }

    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              //Text
              Container(
                margin: const EdgeInsets.all(0),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'Syarat Dan Ketentuan Pengguna '),
                      TextSpan(
                          text: 'SurveyAsia ',
                          style: TextStyle(color: Colors.deepOrange)),
                    ],
                  ),
                ),
              ),

              //Text
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Terima kasih telah mengunjungi kami, dan sudah mempercayakan website SurveyAsia sebagai pilihan dalam membantu riset Anda. Ketentuan aturan berikut mengatur penggunaan Anda terhadap website SurveyAsia dan Anda wajib mematuhi segala aturan yang telah ditetapkan oleh SurveyAsia.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),

              //Text
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  'Pengguna yang mengakses website SurveyAsia disarankan untuk membaca secara seksama dan memahami peraturan yang ada karena akan berdampak pada hak dan kewajiban yang tersirat terhadap hukum.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),

              //Text
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  '1. Pernyataan Pengguna',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 5),
                      child: const Text(
                        "a.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 5),
                      width: 345,
                      child: const Text(
                        "Dengan ini “Saya mengerti dan menyetujui” Syarat dan Ketentuan dan segala aturan yang telah ditetapkan oleh SurveyAsia dalam hak dan larangan saat mengakses situs SurveyAsia.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "b.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Syarat dan Ketentuan adalah perjanjian yang sah antara pengguna dengan SurveyAsia, pengguna harus menyetujui semua Syarat dan Ketentuan yang telah ada, dan jika tidak menyetujui salah satu poin saja diperkenankan tidak mengakses situs SurveyAsia.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "c.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "SurveyAsia berhak mengganti yarat dan Ketentuan sewaktu-waktu tanpa pemberitahuan kepada pengguna, diharapkan pengguna selalu membaca Syarat dan Ketentuan yang ada setiap ingin mengakses situs SurveyAsia.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),

              //Text
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  '2. Responden',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 5),
                      child: const Text(
                        "a.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 5),
                      width: 345,
                      child: const Text(
                        "Wajib mengisi data diri asli dan sebenarnya untuk data riset yang akurat.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "b.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Responden wajib mengunggah data diri (KTP) untuk validasi akun.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "c.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Mengisi studi yang ada dengan jujur dan sebenarnya.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "d.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Memberikan data dengan jujur dan sebenarnya.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "e.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Responden akan dikirimkan email dan/atau notifikasi berupa ajakan untuk berpartisipasi dalam sebuah studi yang ada.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "f.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Tidak menggunakan cara/program ilegal dalam menyelesaikan studi.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              //Text
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  '3. Data Informasi',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 5),
                      child: const Text(
                        "a.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 5),
                      width: 345,
                      child: const Text(
                        "Pengguna menyetujui bahwa SurveyAsia telah berhak dalam menyimpan dan menggunakan semua Data Informasi yang telah diberikan kepada SurveyAsia, dan Data Informasi tersebut dapat digunakan oleh SurveyAsia dalam tujuan analisis.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "b.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Pengguna menyetujui bahwa SurveyAsia dapat menggunakan data Pengguna dan segala data yang telah diberikan untuk analisis yang dilakukan oleh SurveyAsia.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "c.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "SurveyAsia menjamin kerahasiaan data Pengguna yang telah diberikan dan informasi yang tertera pada KTP, dan tidak akan diberikan kepada pihak yang bekerja sama dengan SurveyAsia terkecuali mendapat persetujuan oleh Pengguna tersebut.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              //Text
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  '4. Saldo dan Penarikan',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "a.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Pengguna wajib memberikan data akun bank / dompet digital dengan benar, agar tidak terjadi kesalahan.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "b.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Jika terjadi kesalahan dalam memasukkan data pencairan dana, hal tersebut menjadi tanggung jawab Pengguna.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "c.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Pengguna mendapat reward saldo setelah menyelesaikan studi dengan baik dan benar, dan telah disetujui oleh SurveyAsia.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "d.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "SurveyAsia berhak mengurangi saldo Pengguna jika ditemukan kecurangan, data palsu, data yang tidak akurat, duplikasi, dan penggunaan program ilegal dalam studi yang dilakukan oleh Responden.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "e.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Penarikan dana akan diproses secepatnya dengan maksimal 3 x 24 jam hari kerja.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "f.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Jika ditemukan kecurangan dan pelanggaran terhadap Syarat dan Ketentuan, maka SurveyAsia dapat melakukan penundaan/pembatalan terhadap proses penarikan dana.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              //Text
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  '5. Pertautan Akun dengan SurveyAsia',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "a.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Pengguna dapat mendaftar akun dengan mengaitkan akun yang telah disediakan oleh SurveyAsia (Google, Facebook).",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "b.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "SurveyAsia terintegrasi dengan Google dan Facebook.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "c.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Jika layanan SurveyAsia ditautkan ke situs dan sumber lain yang telah disediakan oleh pihak ketiga, tautan tersebut hanya disediakan untuk informasi Pengguna, SurveyAsia tidak ada kendali untuk mengakses situs tersebut, dan tidak bertanggung jawab atas kerugian yang mungkin timbul kepada Pengguna.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              //Text
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  '6. Pelanggaran dan Tindakan',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2),
                      child: const Text(
                        "a.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 345,
                      child: const Text(
                        "Jika ditemukan adanya pelanggaran terhadap persyaratan ini, pihak SurveyAsia dapat melakukan beberapa tindakan seperti berikut sesuai dengan pelanggaran yang dilakukan:",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, top: 2),
                      child: const Text(
                        "\u2022",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 330,
                      child: const Text(
                        "Pencabutan hak Pengguna dalam mengakses layanan yang disediakan SurveyAsia secara sementara atau permanen.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, top: 2),
                      child: const Text(
                        "\u2022",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 330,
                      child: const Text(
                        "Memberikan peringatan kepada Pengguna.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, top: 2),
                      child: const Text(
                        "\u2022",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 330,
                      child: const Text(
                        "Mengajukan tuntutan hukum terhadap Pengguna.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, top: 2),
                      child: const Text(
                        "\u2022",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2),
                      width: 330,
                      child: const Text(
                        "Penghapusan dan blacklist akun Pengguna.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, top: 2, bottom: 20),
                      child: const Text(
                        "b.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 2, bottom: 20),
                      width: 345,
                      child: const Text(
                        "Pengguna setuju untuk mengganti semua biaya kerugian dan kerusakan akibat pelanggaran persyaratan SurveyAsia.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Text(
        'Syarat Dan Ketentuan',
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
