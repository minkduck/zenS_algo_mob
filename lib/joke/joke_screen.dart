import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_zens_company/utils/app_assets.dart';
import 'package:test_zens_company/utils/app_layout.dart';

import 'joke.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  List<Joke> jokes = [
    Joke(
        'A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on."'
        '\nThe child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now."'
        '\nThe child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."'),
    Joke(
        'Teacher: "Kids,what does the chicken give you?"\nStudent: "Meat!"\nTeacher: "Very good! Now what does the pig give you?"\nStudent: "Bacon!"\nTeacher: "Great! And what does the fat cow give you?"\nStudent: "Homework!"'),
    Joke(
        'The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied crying, "Because I heard my daddy tell my mommy, \'I am going to eat that pussy once Jimmy leaves for school today!\' "'),
    Joke(
        'A housewife, an accountant and a lawyer were asked "How much is 2+2?" The housewife replies: "Four!". The accountant says: "I think it\'s either 3 or 4. Let me run those figures through my spreadsheet one more time." The lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?"'),
  ];

  int currentIndex = 0;

  bool voted = false;

  void handleVote(bool like) {
    setState(() {
      voted = true;
    });
    moveToNextJoke();
  }

  void moveToNextJoke() {
    setState(() {
      currentIndex++;
      if (currentIndex >= jokes.length) {
        Get.snackbar(
          'No More Jokes!',
          'That\'s all the jokes for today! Come back another day!',
          duration: Duration(seconds: 5),
        );
      }
      voted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Gap(AppLayout.getHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.logo1,
                  width: 60,
                  height: 60,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Handicrafted by',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          'Jim HLS',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    Image.asset(
                      AppAssets.logo2,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFF29B363),
            child: Center(
              child: Column(
                children: [
                  Gap(AppLayout.getHeight(40)),
                  Text(
                    'A joke a day keeps the doctor away',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.5,
                    ),
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Text(
                    'If you joke wrong way, your teeth have to pay. (Serious)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                  Gap(AppLayout.getHeight(30)),
                ],
              ),
            ),
          ),
          Gap(AppLayout.getHeight(50)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: currentIndex < jokes.length
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          child: Text(
                            jokes[currentIndex].content,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[700]),
                          ),
                        ),
                        Gap(AppLayout.getHeight(130)),
                        if (!voted)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () => handleVote(true),
                                child: Ink(
                                    height: 35,
                                    width: 120,
                                    decoration:
                                        BoxDecoration(color: Colors.blue),
                                    child: Center(
                                      child: Text(
                                        'This is Funny!',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ),
                                    )),
                              ),
                              Gap(AppLayout.getWidth(5)),
                              InkWell(
                                onTap: () => handleVote(false),
                                child: Ink(
                                  height: 35,
                                  width: 120,
                                  decoration:
                                      BoxDecoration(color: Color(0xFF29B363)),
                                  child: Center(
                                    child: Text(
                                      'This is not funny.',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                      ],
                    )
                  : Text(
                      'That\'s all the jokes for today! Come back another day!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
            ),
          ),
          Spacer(),
          Divider(
            color: Colors.grey,
            thickness: 0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Text(
              'This appis created as part of HLsolutions program. The materials contained on this website are provided for general information only and do not constitude any form of advice. HLS assumees no responsiblity for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.',
              style: TextStyle(color: Colors.grey, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Text(
              'Copyright 2021 HLS',
              style: TextStyle(color: Colors.grey[700], fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
