import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:toonflix/pages/first.dart';

const Map<String, dynamic> discReference = {
  'D': {
    '기본특성': '강한주장\n자신감\n도전적\n목표지향적\n경쟁적',
    '단점': '성격이 급함\n독재적\n공격적',
    '두려움': '통제력을 빼았기는 것',
    '집착': '아부쟁이들을 가까이함',
    '조언': '참모를 버리지 말것'
  },
  'I': {
    '기본특성': '재미있음\n사교적\n긍정적\n허품\n열정적',
    '단점': '충동적\n불안정을 즐김\n많은 일 벌이기',
    '두려움': '사람들로부터 거부당하는 것',
    '집착': '싫증을 빨리 냄',
    '조언': '신중히 생각하고 결정할 것'
  },
  'S': {
    '기본특성': '협력을 잘 함\n경청\n참을성 많음\n소극적\n속을 알 수 없음',
    '단점': '느린 행동\n익숙한 방식으로 결정\n열정이 부족',
    '두려움': '변화하는 것',
    '집착': '지금 그대로 가기를 원함',
    '조언': '원하는 바를 표현하는 것'
  },
  'C': {
    '기본특성': '꼼꼼함\n신중함\n분석적\n데이터 중심\n정확도 높음',
    '단점': '비판적\n까다로움\n당황스럽게 하는 질문',
    '두려움': '갑작스러운 변화',
    '집착': '정확하게 따지고 싶어함',
    '조언': '별 일 아니면 질문을 줄일 것'
  }
};

class ResultPage extends StatefulWidget {
  final String name;
  final int d, i, s, c;

  const ResultPage(
      {super.key,
      required this.name,
      required this.d,
      required this.i,
      required this.s,
      required this.c});

  @override
  State<ResultPage> createState() => _ResultPageState(name, d, i, s, c);
}

class _ResultPageState extends State<ResultPage> {
  late String name;
  late int d, i, s, c;
  _ResultPageState(this.name, this.d, this.i, this.s, this.c);

  late int max1, max2, max3, max4;
  late String maxk1, maxk2, maxk3, maxk4;
  late String basic, flaw, fear, obsession, advice;
  late String type;

  void resetPressed() {
    Navigator.pop(context);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Map<String, int> disc = {'D': d, 'I': i, 'S': s, 'C': c};
    List<int> li = disc.values.toList();

    li.sort(((a, b) => a.compareTo(b)));
    max1 = li.elementAt(li.length - 1);
    max2 = li.elementAt(li.length - 2);
    max3 = li.elementAt(li.length - 3);
    max4 = li.elementAt(li.length - 4);

    maxk1 = disc.keys.firstWhere((k) => disc[k] == max1);
    disc.remove(maxk1);
    maxk2 = disc.keys.firstWhere((k) => disc[k] == max2);
    disc.remove(maxk2);
    maxk3 = disc.keys.firstWhere((k) => disc[k] == max3);
    disc.remove(maxk3);
    maxk4 = disc.keys.firstWhere((k) => disc[k] == max4);

    type = '';

    /// abcd : 2 ab
    if (max1 > max2 && max2 > max3 && max3 > max4) {
      type = '$maxk1$maxk2';
      basic =
          '$maxk1 \n ${discReference[maxk1]['기본특성']} \n $maxk2 \n ${discReference[maxk2]['기본특성']}';
      flaw =
          '$maxk1 \n ${discReference[maxk1]['단점']} \n $maxk2 \n ${discReference[maxk2]['단점']}';
      fear =
          '$maxk1 \n ${discReference[maxk1]['두려움']} \n $maxk2 \n ${discReference[maxk2]['두려움']}';
      obsession =
          '$maxk1 \n ${discReference[maxk1]['집착']} \n $maxk2 \n ${discReference[maxk2]['집착']}';
      advice =
          '$maxk1 \n ${discReference[maxk1]['조언']} \n $maxk2 \n ${discReference[maxk2]['조언']}';
    }

    /// aabc : 2 a=a
    else if (max1 == max2 && max2 > max3 && max3 > max4) {
      type = '($maxk1$maxk2)';
      basic =
          '$maxk1 \n ${discReference[maxk1]['기본특성']} \n $maxk2 \n ${discReference[maxk2]['기본특성']}';
      flaw =
          '$maxk1 \n ${discReference[maxk1]['단점']} \n $maxk2 \n ${discReference[maxk2]['단점']}';
      fear =
          '$maxk1 \n ${discReference[maxk1]['두려움']} \n $maxk2 \n ${discReference[maxk2]['두려움']}';
      obsession =
          '$maxk1 \n ${discReference[maxk1]['집착']} \n $maxk2 \n ${discReference[maxk2]['집착']}';
      advice =
          '$maxk1 \n ${discReference[maxk1]['조언']} \n $maxk2 \n ${discReference[maxk2]['조언']}';
    }

    /// aaab : 3 a=a=a
    else if (max1 == max2 && max2 == max3 && max3 > max4) {
      type = '($maxk1$maxk2$maxk3)';
      basic =
          '$maxk1 \n ${discReference[maxk1]['기본특성']} \n $maxk2 \n ${discReference[maxk2]['기본특성']} \n $maxk3 \n ${discReference[maxk3]['기본특성']}';
      flaw =
          '$maxk1 \n ${discReference[maxk1]['단점']} \n $maxk2 \n ${discReference[maxk2]['단점']} \n $maxk3 \n ${discReference[maxk3]['단점']}';
      fear =
          '$maxk1 \n ${discReference[maxk1]['두려움']} \n $maxk2 \n ${discReference[maxk2]['두려움']} \n $maxk3 \n ${discReference[maxk3]['두려움']}';
      obsession =
          '$maxk1 \n ${discReference[maxk1]['집착']} \n $maxk2 \n ${discReference[maxk2]['집착']} \n $maxk3 \n ${discReference[maxk3]['집착']}';
      advice =
          '$maxk1 \n ${discReference[maxk1]['조언']} \n $maxk2 \n ${discReference[maxk2]['조언']} \n $maxk3 \n ${discReference[maxk3]['조언']}';
    }

    /// aaaa : 4 aaaa
    else if (max1 == max2 && max2 == max3 && max3 == max4) {
      type = '($maxk1$maxk2$maxk3$maxk4)';
      basic =
          '$maxk1 \n ${discReference[maxk1]['기본특성']} \n $maxk2 \n ${discReference[maxk2]['기본특성']} \n $maxk3 \n ${discReference[maxk3]['기본특성']} \n $maxk4 \n ${discReference[maxk4]['기본특성']}';
      flaw =
          '$maxk1 \n ${discReference[maxk1]['단점']} \n $maxk2 \n ${discReference[maxk2]['단점']} \n $maxk3 \n ${discReference[maxk3]['단점']} \n $maxk4 \n ${discReference[maxk4]['단점']}';
      fear =
          '$maxk1 \n ${discReference[maxk1]['두려움']} \n $maxk2 \n ${discReference[maxk2]['두려움']} \n $maxk3 \n ${discReference[maxk3]['두려움']} \n $maxk4 \n ${discReference[maxk4]['두려움']}';
      obsession =
          '$maxk1 \n ${discReference[maxk1]['집착']} \n $maxk2 \n ${discReference[maxk2]['집착']} \n $maxk3 \n ${discReference[maxk3]['집착']} \n $maxk4 \n ${discReference[maxk4]['집착']}';
      advice =
          '$maxk1 \n ${discReference[maxk1]['조언']} \n $maxk2 \n ${discReference[maxk2]['조언']} \n $maxk3 \n ${discReference[maxk3]['조언']} \n $maxk4 \n ${discReference[maxk4]['조언']}';
    }

    /// abbc : 3 a(b=b)
    else if (max1 > max2 && max2 == max3 && max3 > max4) {
      type = '$maxk1 ($maxk2$maxk3)';
      basic =
          '$maxk1 \n ${discReference[maxk1]['기본특성']} \n $maxk2 \n ${discReference[maxk2]['기본특성']} \n $maxk3 \n ${discReference[maxk3]['기본특성']}';
      flaw =
          '$maxk1 \n ${discReference[maxk1]['단점']} \n $maxk2 \n ${discReference[maxk2]['단점']} \n $maxk3 \n ${discReference[maxk3]['단점']}';
      fear =
          '$maxk1 \n ${discReference[maxk1]['두려움']} \n $maxk2 \n ${discReference[maxk2]['두려움']} \n $maxk3 \n ${discReference[maxk3]['두려움']}';
      obsession =
          '$maxk1 \n ${discReference[maxk1]['집착']} \n $maxk2 \n ${discReference[maxk2]['집착']} \n $maxk3 \n ${discReference[maxk3]['집착']}';
      advice =
          '$maxk1 \n ${discReference[maxk1]['조언']} \n $maxk2 \n ${discReference[maxk2]['조언']} \n $maxk3 \n ${discReference[maxk3]['조언']}';
    }

    /// abbb : 4 a(b=b=b)
    else if (max1 > max2 && max2 == max3 && max3 == max4) {
      type = '$maxk1 ($maxk2$maxk3$maxk4)';
      basic =
          '$maxk1 \n ${discReference[maxk1]['기본특성']} \n $maxk2 \n ${discReference[maxk2]['기본특성']} \n $maxk3 \n ${discReference[maxk3]['기본특성']} \n $maxk4 \n ${discReference[maxk4]['기본특성']}';
      flaw =
          '$maxk1 \n ${discReference[maxk1]['단점']} \n $maxk2 \n ${discReference[maxk2]['단점']} \n $maxk3 \n ${discReference[maxk3]['단점']} \n $maxk4 \n ${discReference[maxk4]['단점']}';
      fear =
          '$maxk1 \n ${discReference[maxk1]['두려움']} \n $maxk2 \n ${discReference[maxk2]['두려움']} \n $maxk3 \n ${discReference[maxk3]['두려움']} \n $maxk4 \n ${discReference[maxk4]['두려움']}';
      obsession =
          '$maxk1 \n ${discReference[maxk1]['집착']} \n $maxk2 \n ${discReference[maxk2]['집착']} \n $maxk3 \n ${discReference[maxk3]['집착']} \n $maxk4 \n ${discReference[maxk4]['집착']}';
      advice =
          '$maxk1 \n ${discReference[maxk1]['조언']} \n $maxk2 \n ${discReference[maxk2]['조언']} \n $maxk3 \n ${discReference[maxk3]['조언']} \n $maxk4 \n ${discReference[maxk4]['조언']}';
    }

    /// abcc : 2 ab
    else if (max1 > max2 && max2 > max3 && max3 == max4) {
      type = '$maxk1$maxk2';
      basic =
          '$maxk1 \n ${discReference[maxk1]['기본특성']} \n $maxk2 \n ${discReference[maxk2]['기본특성']}';
      flaw =
          '$maxk1 \n ${discReference[maxk1]['단점']} \n $maxk2 \n ${discReference[maxk2]['단점']}';
      fear =
          '$maxk1 \n ${discReference[maxk1]['두려움']} \n $maxk2 \n ${discReference[maxk2]['두려움']}';
      obsession =
          '$maxk1 \n ${discReference[maxk1]['집착']} \n $maxk2 \n ${discReference[maxk2]['집착']}';
      advice =
          '$maxk1 \n ${discReference[maxk1]['조언']} \n $maxk2 \n ${discReference[maxk2]['조언']}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF39E5EF),
        title: const Text(
          'DISC TEST',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: false,
        elevation: 4,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ('$type 유형'),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '${d + i}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${d + c}',
                              style: const TextStyle(fontSize: 20),
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  discContainer(
                                      text: d,
                                      disc: 'D',
                                      color: Colors.green.withOpacity(0.4)),
                                  discContainer(
                                      text: c,
                                      disc: 'C',
                                      color: Colors.yellow.withOpacity(0.4)),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  discContainer(
                                      text: i,
                                      disc: 'I',
                                      color: Colors.red.withOpacity(0.4)),
                                  discContainer(
                                      text: s,
                                      disc: 'S',
                                      color: Colors.blue.withOpacity(0.4)),
                                ],
                              ),
                            ),
                            Text(
                              '${i + s}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          '${c + s}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RadarChart.light(
                        ticks: const [3, 6, 9, 12, 15],
                        features: const [
                          'D',
                          '  I',
                          'S',
                          'C  ‎',
                        ],
                        data: [
                          const [0, 0, 0, 0],
                          [
                            d,
                            i,
                            s,
                            c,
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  '기본특성',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                basic,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Material(
                                elevation: 3,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          '단점',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          flaw,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Material(
                                elevation: 3,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          '두려움',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          fear,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Material(
                                elevation: 3,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          '집착',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          obsession,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Material(
                                elevation: 3,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          '조언',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          advice,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      iconSize: 45,
                      icon: const Icon(Icons.refresh_outlined),
                      onPressed: resetPressed,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class discContainer extends StatefulWidget {
  const discContainer({
    Key? key,
    required this.text,
    required this.disc,
    required this.color,
  }) : super(key: key);

  final int text;
  final String disc;
  final Color color;

  @override
  State<discContainer> createState() => _discContainerState();
}

class _discContainerState extends State<discContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color,
        ),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text(
                '${widget.text}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.disc,
                style: TextStyle(
                    fontSize: 110,
                    color: Colors.black.withOpacity(0.1),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
