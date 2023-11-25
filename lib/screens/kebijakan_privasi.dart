import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KebijakanPrivasi extends StatefulWidget {
  const KebijakanPrivasi({Key? key}) : super(key: key);

  @override
  _KebijakanPrivasi createState() => _KebijakanPrivasi();
}

class _KebijakanPrivasi extends State<KebijakanPrivasi> {
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
          child: ListView(children: [
            //Text
            Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: 'Kebijakan Privasi '),
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
                'Selamat datang di SurveyAsia.id (untuk selanjutnya “SurveyAsia” atau “Kami”), dan selamat menikmati layanan dari kami. Dengan ini, kami berkomitmen untuk melindungi seluruh data pribadi Pendatang, Pengguna, Responden (yang selanjutnya disebut “Anda”) yang kami kumpulkan atau yang telah dikirimkan kepada kami, baik secara offline, online, maupun melalui pesan elektronik (E-mail) atau melalui bentuk apapun. Serta berkomitmen melindungi Informasi Pribadi atau Data Pribadi Anda sesuai dengan Kebijakan Privasi (selanjutnya disebut “Kebijakan”) ini.',
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
                'Dengan mengakses, mendaftar, atau mengklik “Setuju” pada proses pendaftaran Pengguna, maupun Layanan SurveyAsia, Anda menyatakan bahwa setiap Informasi Pribadi Anda merupakan informasi yang benar dan sah, dan kami anggap Anda sudah membaca, mengerti, memahami, dan menyetujui seluruh isi yang tertuang dalam Kebijakan ini, dan oleh karenanya Anda telah memberikan persetujuan kepada SurveyAsia untuk memperoleh, mengumpulkan, mengolah, menyimpan, menjaga, menggunakan, dan (pada keadaan-keadaan tertentu) mengungkapkan Informasi Pribadi Anda tersebut untuk tujuan sebagaimana tercantum dalam Kebijakan Privasi.',
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
                '1. Informasi Pribadi',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'Informasi Pribadi adalah segala hal data yang dimiliki seseorang yang hanya dirinya yang tahu dan tidak ada seorangpun selain dirinya yang tahu, dan Informasi Pribadi ini mencakup hal antara lain nama, tanggal lahir, dan keterangan lainnya tentang hal tersebut, atau nomor, lambang, kode, citra atau suara yang terkait dengan hal tersebut, yang dapat mengidentifikasi seseorang.',
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
                '2. Sumber Dan Pengumpulan Informasi Data',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'SurveyAsia mengumpulkan Informasi Pribadi Anda melalui proses pembuatan akun klien, sebagai Responden melalui proses sign up/pendaftaran di platform SurveyAsia, di mana Responden diminta untuk mengisi data diri untuk memperoleh akun. Selain itu, SurveyAsia juga mengumpulkan Informasi Pribadi saat Responden berpartisipasi dalam mengisi sebuah studi, serta ketika klien menghubungi kami melalui fitur “contact us” atau melalui E-mail. Dengan demikian, SurveyAsia akan memperoleh dan mengumpulkan Informasi yang Responden serahkan secara mandiri, termasuk namun tidak terbatas pada:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
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
                    margin: const EdgeInsets.only(left: 20, top: 2),
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
                    width: 330,
                    child: const Text(
                      "Data Diri berupa nama, NIK, jenis kelamin, tempat dan tanggal lahir, pekerjaan, alamat kantor, serta alamat pribadi.",
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
                    margin: const EdgeInsets.only(left: 20, top: 2),
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
                    width: 330,
                    child: const Text(
                      "Informasi Diri berupa E-mail, nomor telepon, dan informasi lainnya yang dibutuhkan dalam identifikasi kecocokan Responden terhadap suatu studi.",
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
                    margin: const EdgeInsets.only(left: 20, top: 2),
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
                    width: 330,
                    child: const Text(
                      "Jawaban yang Responden berikan dalam partisipasi dalam menjawab studi atau survey dari Researcher.",
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
                '3. Penggunaan Informasi Pribadi',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'Situs SurveyAsia akan menyimpan, menjaga, mengelola, dan menggunakan informasi dari Pengguna untuk kebutuhan yang dibutuhkan situs SurveyAsia, seperti :',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'a. Data Klien',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 30),
              child: const Text(
                'SurveyAsia akan menyimpan, dan menjaga data klien yang telah masuk di database SurveyAsia, dan akan menggunakan data klien untuk kebutuhan riset di setiap studi kasus dan memberikan studi kasus yang sesuai dengan data yang cocok untuk menyelesaikan suatu riset ke depannya.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'b. Data Riset',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 30),
              child: const Text(
                'Data dari jawaban yang diberikan oleh klien akan disimpan dan digunakan SurveyAsia untuk analisis riset yang mungkin dibutuhkan oleh beberapa klien atau dari SurveyAsia sendiri dan studi kasus ke depannya.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'c. Peningkatan Kualitas Situs',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 30),
              child: const Text(
                'Segala timbal balik yang masuk ke data SurveyAsia akan disimpan dan digunakan untuk meningkatkan kualitas dan kenyamanan serta peningkatan fitur dan pelayanan yang akan diberikan kepada klien SurveyAsia.',
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
                '4. Perlindungan Informasi Pribadi',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'SurveyAsia selalu menjaga Informasi Pribadi yang telah diberikan dan dipercayakan oleh klien, serta menerapkan berbagai langkah dan cara yang cukup ketat untuk mencegah akses, pengumpulan, penggunaan, penyalinan, penyuntingan, dan penghapusan yang tidak sah dengan berbagai tindakan prosedur keamanan yang sudah teruji dengan baik.',
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
                '5. Pembaruan dan Penerimaan Kebijakan',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'Sebagai bentuk upaya kami dalam menyesuaikan atau mengikuti ketentuan atau perubahan hukum dan peraturan yang berlaku, selanjutnya mungkin akan dilakukan perubahan atau pembaruan terhadap Kebijakan ini, yang mungkin kami lakukan tanpa adanya pemberitahuan sebelumnya. Sehubungan dengan hal tersebut, kami menyarankan Anda untuk secara rutin dapat membaca dan memeriksa kembali Kebijakan ini.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'Dengan tetap mengakses, menggunakan layanan, ataupun berpartisipasi di SurveyAsia maka Anda dianggap telah menyetujui perubahan-perubahan dalam Kebijakan yang ada. Anda juga memahami bahwa versi terbaru dari Kebijakan ini secara otomatis menggantikan semua versi sebelumnya.',
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
                '6. Persetujuan dan Pembatalan Persetujuan',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'Sebagaimana telah dijelaskan sebelumnya bahwa dengan mengakses, mendaftar, atau mengklik “Setuju” pada proses pendaftaran Pengguna, maupun Layanan SurveyAsia, maka Anda telah memberikan persetujuan kepada SurveyAsia untuk memperoleh, mengumpulkan, mengolah, menyimpan, menjaga, menggunakan, dan (pada keadaan-keadaan tertentu) mengungkapkan Informasi Pribadi Anda tersebut untuk tujuan sebagaimana tertuang dalam Kebijakan ini.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'Anda sewaktu-waktu berhak untuk membatalkan persetujuan Anda terhadap pengumpulan, pengolahan, penyimpanan, penggunaan yang SurveyAsia lakukan terhadap Informasi Pribadi anda dengan menyampaikan permohonan pembatalan persetujuan kepada kami disertai dengan alasan Anda. Setalah kami menyetujui permohonan pembatalan persetujuan yang Anda ajukan kepada kami, kami akan berhenti melakukan pengumpulan, pengolahan, penyimpanan,dan penggunaan terhadap Informasi Pribadi Anda. Akan tetapi, hal tersebut tidak berlaku dalam hal adanya kewajiban hukum bagi kami atau sehubungan dengan pelaksanaan kegiatan usaha yang sah dan beralasan secara hukum untuk mempertahankannya. Dengan membatalkan persetujuan maka Anda tidak dapat lagi mengakses, serta menggunakan Layanan SurveyAsia sebagai Respoden, dan Anda telah setuju untuk membebaskan kami dan tidak akan meminta pertanggungjawaban atas setiap kerugian yang mungkin Anda derita sehubungan dengan penghentian akses serta layanan anda di SurveyAsia.',
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
                '7. Hukum Yang Berlaku',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: const Text(
                'Kebijakan ini diatur dan ditafsirkan berdasarkan syarat dan ketentuan yang telah dibuat dan hukum Negara Republik Indonesia.',
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
                '8. Kontak Kami',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 5, left: 12),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Anda dapat menghubungi kami melalui E-mail ke '),
                    TextSpan(
                        text: 'support@surveyasia.id ',
                        style: TextStyle(color: Colors.deepOrange)),
                    TextSpan(
                        text: 'atau menghubungi Business Development kami.'),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      title: const Text(
        'Kebijakan Privasi',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
