class SurveyContent {
  String title;
  String date;
  String authorName;
  String author;
  String type;
  String processTime;
  String numQuestion;
  String status;
  String totalReward;
  String description;
  String imageAsset;

  SurveyContent({
    required this.title,
    required this.date,
    required this.authorName,
    required this.author,
    required this.type,
    required this.processTime,
    required this.numQuestion,
    required this.status,
    required this.totalReward,
    required this.description,
    required this.imageAsset,
  });
}

var surveyContentList = [
  SurveyContent(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    date: '12 Sept - 31 Des 2022',
    description:
    'Saat ini internet telah berkembang menjadi media komunikasi yang sangat cepat dan juga efektif. Internet tumbuh menjadi sedemikian besar dan berdaya sebagai alat komunikasi yang tak bisa diabaikan. Aktivitas manusia semakin lebih mudah dengan adanya internet saat ini. Salah satu kemudahan yang tampak ialah khalayak dapat berbelanja kapan pun dan dimana pun pada saat dibutuhkan melalui online. Seiring berkembangnya jual beli online maka semakin banyak pesaing dalam berjualan online. Oleh karena itu, untuk menarik minat pembeli dibutuhkan adanya ',
    authorName: 'Indah Rahayu',
    author: 'Author ',
    type: 'Education',
    processTime: '10 Menit ',
    numQuestion: '30 Pertanyaan',
    status: 'Aktif',
    totalReward: '1000 Poin',
    imageAsset: 'images/artikel.png'
  )
];
