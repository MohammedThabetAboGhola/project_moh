import 'package:flutter/material.dart';
import 'package:project_moh/config/MyColors.dart';
import 'package:project_moh/constants/constants.dart';

import 'OnboardContent.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0 ;


  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: list_onboar.length,
                  controller: _pageController,
                  onPageChanged: (index){
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context ,index)=>OnboardContent(
                  image: list_onboar[index].image,
                  title: list_onboar[index].title,
                  desc: list_onboar[index].desc,
                ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      list_onboar.length,
                          (index) =>Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(isActive: index == _pageIndex,),
                          ) ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: (){
                        _pageController.nextPage(
                            curve: Curves.ease,
                            duration:Duration(milliseconds: 300));
                        if(_pageIndex == 2){
                          Navigator.pushReplacementNamed(context, MyConstants.LOGIN_SCREEN);
                        }
                      },
                      child: Icon(Icons.arrow_forward,color: MyColors.white,size: 30,),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MaterialStateColor.resolveWith((states) => MyColors.blue),
                        shape:const CircleBorder(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12 : 4 ,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? MyColors.orange:MyColors.orange.withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}

class Onboard {
  final String image , title, desc;
  Onboard({required this.image,required this.title, required this.desc});

}

final List<Onboard> list_onboar = [
  Onboard(image:'assets/images/on1.png',
      title: 'اهلاوسهلا',
      desc: 'مبارك التفوق في الثانوية العامة إبداء رحلتك الجامعية واختر تخصصك'),

  Onboard(image:'assets/images/on2.png',
      title: 'فكرة التطبيق',
      desc: 'يساعدك التطبيق في البحث عن التخصص الجامعي المناسب لك '),

  Onboard(image:'assets/images/qa.png',
      title: 'هيا لنبدء',
      desc: 'في البحث عن التخصص والاجابة عن الاسئلة حوله'),
];



