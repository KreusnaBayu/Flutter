import 'package:flutter/material.dart';
import 'package:pengenalan/List.dart';
import 'package:pengenalan/Profile.dart';


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          HomeContentPage(),
          List(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'More',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: Center(
            child: Container(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/prof.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: Text("Joker"),
          subtitle: Text("Joker adalah sebuah karakter penjahat super fiksi yang dibuat oleh Bill Finger, Bob Kane, dan Jerry Robinson yang pertama kali muncul dalam keluaran debut buku komik Batman (25 April 1940) yang diterbitkan oleh DC Comics. Klaim atas pembuatan Joker dipersengketakan; Kane dan Robinson mengklaim tanggung jawab atas rancangan Joker, sementara Finger berkontribusi terhadap penulisannya. Meskipun Joker direncanakan untuk dimatikan pada penampilan awalnya, atas tuntutan editorial, ia menjadi karakter musuh besar pahlawan super Batman."),
        ),
        SizedBox(height: 40),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: Center(
            child: Container(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/tdk.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: Text("Batman"),
          subtitle: Text("Batman (manusia kelelawar) adalah tokoh pahlawan super fiksi yang diciptakan oleh seniman Bob Kane dan penulis Bill Finger dan diterbitkan oleh DC Comics. Tokoh ini pertama muncul di Detective Comics #27 (Mei 1939). Identitas asli Batman adalah Bruce Wayne, seorang pengusaha yang kaya raya. Nama Bruce Wayne itu sendiri diambil dari nama tokoh sejarah, yaitu Robert the Bruce dan Anthony Wayne."),
        ),
        SizedBox(height: 40),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: Center(
            child: Container(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/jst.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: Text("Justice League"),
          subtitle: Text("Justice League adalah kumpulan pahlawan super yang bergabung bersama sebagai sebuah tim. Tujuh anggota asli adalah Aquaman, Batman, The Flash, Green Lantern, Martian Manhunter, Superman dan Wonder Woman. Daftar tim telah diputar selama bertahun-tahun, yang terdiri dari berbagai superhero dari DC Universe, seperti The Atom, Big Barda, Black Canary, Cyborg, Green Arrow, Elongated Man, The Flash, Green Lantern, Hawkgirl, Hawkman, Metamorpho, Plastic Man, Power Girl, Orion, Red Tornado, Stargirl, Captain Marvel/Shazam dan Zatanna, dan banyak lainnya."),
        ),
      ],
    );
  }
}


