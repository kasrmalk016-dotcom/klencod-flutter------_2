
import 'package:flutter/material.dart';

void main() {
  runApp(const MuslimApp());
}

const Color green = Color(0xFF073B32);
const Color gold = Color(0xFFE3BD69);
const Color background = Color(0xFFF5F2E9);

class MuslimApp extends StatelessWidget {
  const MuslimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'رفيق المسلم',
      theme: ThemeData(
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        appBarTheme: const AppBarTheme(
          backgroundColor: green,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [
    HomeTab(),
    QuranTab(),
    AzkarTab(),
    DuaTab(),
    PrayerTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('رفيق المسلم'),
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        backgroundColor: Colors.white,
        indicatorColor: gold.withValues(alpha: 0.35),
        onDestinationSelected: (value) {
          setState(() => index = value);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'القرآن',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'الأذكار',
          ),
          NavigationDestination(
            icon: Icon(Icons.volunteer_activism),
            label: 'الأدعية',
          ),
          NavigationDestination(
            icon: Icon(Icons.mosque_outlined),
            label: 'الصلاة',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            children: [
              Icon(Icons.nightlight_round, color: gold, size: 48),
              SizedBox(height: 12),
              Text(
                'وَاذْكُر رَّبَّكَ كَثِيرًا',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'رفيقك اليومي للقرآن والذكر والدعاء',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          'أقسام التطبيق',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _homeCard(
          context,
          Icons.menu_book,
          'القرآن الكريم',
          'اقرأ آيات القرآن الكريم',
          const QuranTab(),
        ),
        _homeCard(
          context,
          Icons.favorite,
          'الأذكار اليومية',
          'أذكار الصباح والمساء والتسبيح',
          const AzkarTab(),
        ),
        _homeCard(
          context,
          Icons.volunteer_activism,
          'الأدعية',
          'أدعية من القرآن والسنة',
          const DuaTab(),
        ),
        _homeCard(
          context,
          Icons.mosque,
          'الصلاة',
          'تعرف على الصلوات الخمس',
          const PrayerTab(),
        ),
      ],
    );
  }

  Widget _homeCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Widget page,
  ) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: green,
          child: Icon(icon, color: gold),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 17),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(title: Text(title)),
                body: page,
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  static const surahs = [
    'الفاتحة',
    'البقرة',
    'آل عمران',
    'النساء',
    'المائدة',
    'الأنعام',
    'الأعراف',
    'الأنفال',
    'التوبة',
    'يونس',
    'هود',
    'يوسف',
    'الرعد',
    'إبراهيم',
    'الحجر',
    'النحل',
    'الإسراء',
    'الكهف',
    'مريم',
    'طه',
    'الأنبياء',
    'الحج',
    'المؤمنون',
    'النور',
    'الفرقان',
    'الشعراء',
    'النمل',
    'القصص',
    'العنكبوت',
    'الروم',
    'لقمان',
    'السجدة',
    'الأحزاب',
    'سبأ',
    'فاطر',
    'يس',
    'الصافات',
    'ص',
    'الزمر',
    'غافر',
    'فصلت',
    'الشورى',
    'الزخرف',
    'الدخان',
    'الجاثية',
    'الأحقاف',
    'محمد',
    'الفتح',
    'الحجرات',
    'ق',
    'الذاريات',
    'الطور',
    'النجم',
    'القمر',
    'الرحمن',
    'الواقعة',
    'الحديد',
    'المجادلة',
    'الحشر',
    'الممتحنة',
    'الصف',
    'الجمعة',
    'المنافقون',
    'التغابن',
    'الطلاق',
    'التحريم',
    'الملك',
    'القلم',
    'الحاقة',
    'المعارج',
    'نوح',
    'الجن',
    'المزمل',
    'المدثر',
    'القيامة',
    'الإنسان',
    'المرسلات',
    'النبأ',
    'النازعات',
    'عبس',
    'التكوير',
    'الانفطار',
    'المطففين',
    'الانشقاق',
    'البروج',
    'الطارق',
    'الأعلى',
    'الغاشية',
    'الفجر',
    'البلد',
    'الشمس',
    'الليل',
    'الضحى',
    'الشرح',
    'التين',
    'العلق',
    'القدر',
    'البينة',
    'الزلزلة',
    'العاديات',
    'القارعة',
    'التكاثر',
    'العصر',
    'الهمزة',
    'الفيل',
    'قريش',
    'الماعون',
    'الكوثر',
    'الكافرون',
    'النصر',
    'المسد',
    'الإخلاص',
    'الفلق',
    'الناس',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: surahs.length,
      itemBuilder: (context, i) {
        return Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: green,
              foregroundColor: gold,
              child: Text('${i + 1}'),
            ),
            title: Text(
              'سورة ${surahs[i]}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.menu_book, color: green),
            onTap: () {
              if (i == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FatihaPage(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SurahInfoPage(
                      name: surahs[i],
                      number: i + 1,
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}

class FatihaPage extends StatelessWidget {
  const FatihaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سورة الفاتحة')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Text(
          'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ\n\n'
          'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ ۝ '
          'الرَّحْمَٰنِ الرَّحِيمِ ۝ '
          'مَالِكِ يَوْمِ الدِّينِ ۝ '
          'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ ۝ '
          'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ ۝ '
          'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ '
          'غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 27,
            height: 2.1,
            color: green,
          ),
        ),
      ),
    );
  }
}

class SurahInfoPage extends StatelessWidget {
  final String name;
  final int number;

  const SurahInfoPage({
    super.key,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('سورة $name')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'سورة $name\n\n'
            'ترتيب السورة في المصحف: $number\n\n'
            'لإظهار نص السورة كاملًا، يجب إضافة بيانات القرآن الكريم '
            'الموثوقة إلى المشروع.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, height: 1.8),
          ),
        ),
      ),
    );
  }
}

class AzkarTab extends StatefulWidget {
  const AzkarTab({super.key});

  @override
  State<AzkarTab> createState() => _AzkarTabState();
}

class _AzkarTabState extends State<AzkarTab> {
  int count = 0;

  final azkar = const [
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ',
    'لَا إِلَهَ إِلَّا اللَّهُ',
    'سُبْحَانَ اللَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا اللَّهُ، وَاللَّهُ أَكْبَرُ',
    'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ',
    'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'الأذكار والتسبيح',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 18),
        ...azkar.map(
          (z) => Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    z,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 22,
                      height: 1.8,
                      color: green,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: green,
                    ),
                    onPressed: () => setState(() => count++),
                    icon: const Icon(Icons.touch_app),
                    label: const Text('سبّح'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          color: green,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'عداد التسبيح',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  '$count',
                  style: const TextStyle(
                    color: gold,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OutlinedButton(
                  onPressed: () => setState(() => count = 0),
                  child: const Text(
                    'تصفير العداد',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DuaTab extends StatelessWidget {
  const DuaTab({super.key});

  static const duas = [
    'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ.',
    'رَبِّ زِدْنِي عِلْمًا.',
    'رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
    'اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي.',
    'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَدُنْكَ رَحْمَةً.',
    'رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي.',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'أدعية مختارة',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        ...duas.map(
          (dua) => Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                dua,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  color: green,
                  fontSize: 22,
                  height: 1.9,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PrayerTab extends StatelessWidget {
  const PrayerTab({super.key});

  static const prayers = [
    ['الفجر', 'ركعتان'],
    ['الظهر', 'أربع ركعات'],
    ['العصر', 'أربع ركعات'],
    ['المغرب', 'ثلاث ركعات'],
    ['العشاء', 'أربع ركعات'],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            children: [
              Icon(Icons.mosque, size: 50, color: gold),
              SizedBox(height: 12),
              Text(
                'الصلوات الخمس',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'حافظ على صلاتك في وقتها',
                style: TextStyle(color: Colors.white70, fontSize: 17),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...prayers.map(
          (p) => Card(
            color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.access_time, color: green),
              title: Text(
                p[0],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('عدد ركعات الفرض: ${p[1]}'),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            'تنبيه: هذه الصفحة لا تحسب مواقيت الصلاة الفعلية. '
            'تحتاج المواقيت الدقيقة إلى تحديد الموقع وطريقة الحساب.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, height: 1.7),
          ),
        ),
      ],
    );
  }
}