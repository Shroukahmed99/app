import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeContent extends StatefulWidget {
  final ScreenshotController screenshotController;
  final Future<void> Function(BuildContext context) onShare;

  const HomeContent({
    Key? key,
    required this.screenshotController,
    required this.onShare,
  }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _currentQuestionIndex = 0;
  final List<String> _questions = [
    'What is the most important lesson you have learned in life?',
    'What are the qualities you look for in a friend?',
    'How do you deal with failure?',
    'What is your greatest achievement?',
    'How do you stay motivated?',
    'What would you do if you knew you couldn’t fail?',
    'What is your favorite book and why?',
    'If you could live anywhere in the world, where would it be?',
    'What is your biggest fear?',
    'How do you define success?',
    'What is the best advice you have ever received?',
    'If you could meet anyone in history, who would it be?',
    'What is one thing you wish you could change about the world?',
    'What’s something you’ve always wanted to learn but haven’t yet?',
    'What are your hobbies and why do you enjoy them?',
    'How do you handle stress?',
    'What’s the most meaningful relationship in your life?',
    'What makes you happiest?',
    'What’s your dream job?',
    'How do you balance work and personal life?',
    'What is your greatest strength?',
    'What is your greatest weakness?',
    'What motivates you to work hard?',
    'What would you do with a million dollars?',
    'If you could be famous for one thing, what would it be?',
    'What is the most adventurous thing you’ve ever done?',
    'How do you cope with difficult situations?',
    'What is your favorite way to spend a weekend?',
    'How would you describe your perfect day?',
    'If you could change one thing about your life, what would it be?',
    'What’s the best gift you’ve ever received?',
    'What’s the best gift you’ve ever given?',
    'What’s the biggest challenge you’ve faced?',
    'How do you stay focused?',
    'What’s the most important thing in a relationship?',
    'What’s something that always makes you laugh?',
    'If you could travel anywhere right now, where would you go?',
    'What’s the most beautiful place you’ve ever been?',
    'What’s your favorite quote?',
    'What’s your proudest accomplishment?',
    'If you could have dinner with anyone, dead or alive, who would it be?',
    'What’s one skill you wish you could master?',
    'What’s your biggest regret?',
    'If you could have any superpower, what would it be?',
    'What is your idea of a perfect vacation?',
    'What do you like most about yourself?',
    'If you could time travel, where would you go?',
    'What’s your biggest goal right now?',
    'What’s one thing that always cheers you up?',
    'What’s the best thing about your job?',
    'How do you handle criticism?',
    'What would you do if you had no responsibilities?',
    'What’s your favorite childhood memory?',
    'What’s one of your biggest life goals?',
    'If you could master any skill instantly, what would it be?',
    'What’s one thing you couldn’t live without?',
    'What’s something you’ve done that you’re really proud of?',
    'What’s the best decision you’ve made so far?',
    'What is your favorite thing to do on a rainy day?',
    'How do you define happiness?',
    'What’s your biggest accomplishment outside of work?',
    'What’s the hardest thing you’ve ever done?',
    'What makes you feel truly alive?',
    'What’s the most valuable lesson you’ve learned so far?',
    'If you could instantly become an expert in something, what would it be?',
    'What’s your favorite way to relax?',
    'What’s the one thing you want to achieve this year?',
    'What’s the best thing you’ve ever bought?',
    'What’s the one thing you are most grateful for?',
    'If you could change anything about the world, what would it be?',
    'What’s the biggest mistake you’ve ever made?',
    'What is your favorite time of day?',
    'What’s one of the hardest things you’ve had to learn?',
    'What are you most passionate about?',
    'What’s your biggest pet peeve?',
    'How do you deal with disappointment?',
    'What’s something that makes you feel inspired?',
    'If you could live any day over again, which day would it be?',
    'What’s something you’ve always wanted to try?',
    'What’s something you’ve never done but want to?',
    'What’s the most important thing in your life?',
    'What’s your favorite type of music?',
    'What’s your ideal way to spend the holidays?',
    'What’s your favorite thing to do with friends?',
    'What’s your favorite way to stay active?',
    'What’s one thing that makes you feel connected to others?',
    'What’s the most challenging thing you’ve done this year?',
    'What’s the best way to spend a Sunday?',
    'What’s your favorite season and why?',
    'What’s the best meal you’ve ever had?',
    'What’s the most exciting thing you’ve ever experienced?',
    'If you could have any job in the world, what would it be?',
    'What is one thing you want to accomplish this year?',
    'What’s your favorite thing to do at night?',
    'What’s something you’ve learned recently?',
    'What’s one of your biggest life lessons?',
    'What’s your definition of success?',
    'If you could change one habit, what would it be?',
    'What’s your favorite way to spend your birthday?',
    'What’s the best advice you would give to your younger self?',
    'If you could have dinner with anyone in the world, who would it be?',
    'What’s something you want to be remembered for?',
    'What’s the best compliment you’ve ever received?',
    'What’s something you’ve always wanted to tell someone but haven’t?',
    'What’s your favorite thing about being a part of a community?',
    'What’s one piece of advice you would give to others?',
    'What’s the most beautiful thing you’ve ever seen?',
    'What makes a great leader?',
    'What’s one thing you’ve never done but wish you could?',
    'What’s the most interesting thing you’ve learned recently?',
    'What makes you feel most at peace?',
    'What’s your biggest fear for the future?',
    'What’s the most surprising thing you’ve learned about yourself?',
    'What’s your favorite way to unwind after a long day?',
    'What’s your dream vacation?',
    'If you could have any skill, what would it be?',
    'What’s your favorite type of exercise?',
    'What would you do if you won the lottery?',
    'What’s something you’ve learned that changed your perspective?',
    'What’s the most beautiful place you’ve visited?',
    'What’s your favorite childhood toy?',
    'What’s something you’re really looking forward to?',
  ];

  double progressValue = 0.0;

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        progressValue = (_currentQuestionIndex + 1) / _questions.length;
      });
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        progressValue = (_currentQuestionIndex + 1) / _questions.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: widget.screenshotController,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.language, color: Colors.black),
                  onPressed: () {
                    final currentLocale = context.locale.languageCode;
                    if (currentLocale == 'en') {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  },
                ),
                Text(
                  context.locale.languageCode == 'en' ? 'English' : 'العربية',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${_currentQuestionIndex + 1}/${_questions.length}', // عرض الرقم الديناميكي
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
                minHeight: 16,
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _questions[_currentQuestionIndex], // نص السؤال الحالي
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: _previousQuestion,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: _nextQuestion,
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => widget.onShare(context),
                icon: Icon(Icons.share),
                label: Text('share_screenshot'.tr()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
