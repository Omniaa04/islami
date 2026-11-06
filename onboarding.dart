
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Onboarding> {

  final PageController pageController = PageController();

  int currentPage = 0;

  final Color goldColor = const Color(0xFFE8BD75);

  void nextPage() {
    if (currentPage < 4) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [

              Expanded(
                child: PageView(
                  controller: pageController,

                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },

                  children: [


                    buildPage(
                      image: 'assets/welcome.png',
                      title: 'Welcome To Islami App',
                      description:
                      '',
                    ),


                    buildPage(
                      image: 'assets/kabba.png',
                      title: 'Welcome To Islami',
                      description:
                      'We Are Very Excited To Have You In Our Community',
                    ),


                    buildPage(
                      image: 'assets/reading.png',
                      title: 'Reading the Quran',
                      description:
                      'Read, and your Lord is the Most Generous',
                    ),


                    buildPage(
                      image: 'assets/bearish.png',
                      title: 'Bearish',
                      description:
                      'Praise the name of your Lord, the Most High',
                    ),


                    buildPage(
                      image: 'assets/radio.png',
                      title: 'Holy Quran Radio',
                      description:
                      'You can listen to the Holy Quran Radio through the application for free and easily',
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(bottom: 20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    TextButton(
                      onPressed:
                      currentPage == 0 ? null : previousPage,
                      child: Text(
                        'Back',
                        style: TextStyle(color: goldColor),
                      ),
                    ),


                    Row(
                      children: List.generate(5, (index) {
                        return AnimatedContainer(
                          duration:
                          const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          width: currentPage == index ? 18 : 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? goldColor
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),

                    TextButton(
                      onPressed: nextPage,
                      child: Text(
                        currentPage == 4 ? 'Finish' : 'Next',
                        style: TextStyle(
                          color: goldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      children: [

        const SizedBox(height: 25),

        Image.asset(
          'assets/logo.png',
          height: 75,
        ),

        const SizedBox(height: 15),

        Expanded(
          child: Image.asset(
            image,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: goldColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFFE8BD75),
            fontSize: 13,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 25),
      ],
    );
  }
}



