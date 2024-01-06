import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:bluescope_news_244/widgets/home_item_widget.dart';
import 'package:bluescope_news_244/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({super.key});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.sp),
                    topRight: Radius.circular(32.sp),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.h),
                      Container(
                        width: 80.h,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColorsBlueScopeNews.colorD9E6F0,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColorsBlueScopeNews.colorD9E6F0,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.clockIcon,
                                  height: 15.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '1 hours ago',
                                  style: AppTextStylesBlueScopeNews.s12W500(),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColorsBlueScopeNews.colorD9E6F0,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.eyeIcon,
                                  height: 15.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '235',
                                  style: AppTextStylesBlueScopeNews.s12W500(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30.sp,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(15.h),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });

                    ///////////////////////////////////
                    ///Здесь логика Чики
                  },
                  child: isFavorite
                      ? Image.asset(
                          AppImages.heartActivIcon,
                          height: 24.h,
                          color: AppColorsBlueScopeNews.colorDD3737,
                        )
                      : Image.asset(
                          AppImages.heartIcon,
                          height: 24.h,
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(width: 20),
            ],
            backgroundColor: Colors.white,
            expandedHeight: 350.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                url,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    """
China, Denmark, France and the Netherlands have all recently reported an increase in cases of pneumonia in children linked to a bacteria called Mycoplasma pneumoniae. A spike in cases has also been reported in one county in Ohio.
There’s no sign of any widespread or pronounced increase in Mycoplasma infections in other places in the United States, but this bacteria tends to cause pneumonia outbreaks every one to three years. The US hasn’t had a real wave of it since before the Covid-19 pandemic, and experts say they would not be surprised if there was an increase this year.
“We expect that there are going to be some seasons that are worse than others for Mycoplasma infections, and it certainly seems that, across the US and Europe, that this year might be worse than other years,” said Dr. Buddy Creech, a pediatric infectious disease specialist at Vanderbilt University.
Last week, European experts conducting surveillance for Mycoplasma at 45 sites in 24 countries reported that the incidence of cases, which fell to less than 1% during the pandemic, had started to rise again at the beginning of the year. By this summer and fall, there was an average increase of more than fourfold, with larger increases in Asia and Europe, according to a report published in The Lancet Microbe.
According to the US Centers for Disease Control and Prevention, resistance to the type of antibiotics used to treat this infection may be playing a role in the increase in cases in China.
“You can see periodic epidemics every few years, especially in the 5- to 12-year-olds, so school-aged kids,” said Dr. Peter Hotez, who co-directs the Texas Children’s Hospital Center for Vaccine Development.
A common infection makes a comeback
Mycoplasma may not be familiar to parents, but it isn’t a mystery to doctors, who know it to be a common cause of mild or “walking” pneumonia. It causes a cough that may linger for weeks, typically with a fever and headache, and often a splotchy rash on the trunk, back or arms.
Pneumonia is an inflammation that causes the lungs to fill with fluid or pus, and it has many causes, including viruses, bacteria and chemicals. Across the country, respiratory infections caused by Covid-19, flu and respiratory syncytial virus or RSV are on the rise now, sending cases of pneumonia up, too. On Wednesday, health officials in Warren County, Ohio, said they had been seeing higher-than-normal numbers of pneumonia cases in kids, with 142 cases since August.
“We do not think this is a novel/new respiratory disease but rather a large uptick in the number of pneumonia cases normally seen at one time,” the district said in a news release.
Among the agents detected in testing were Mycoplasma and Strep bacteria, as well as adenovirus.
Doctors aren’t required to report Mycoplasma infections to public health departments in many states, but the CDC says it keeps an eye out for these infections through a network of emergency departments and through laboratory data.
“As of today, we are not seeing anything that is atypical in terms of pneumonia-related emergency department visits,” CDC Director Dr. Mandy Cohen said Friday.
What parents should know
Creech says many of these cases may not be showing up yet. Since most cases of pneumonia caused by Mycoplasma tend to be milder, they are often treated in a pediatrician’s office.
“The burden of disease is usually in the private pediatrician’s office who’s seeing a child with a cough that won’t go away or a cough that’s a little bit more significant than what we might see with a cold,” Creech said.
Pneumonia is often treated with antibiotics like amoxicillin without first testing to find the cause.
“In those situations, there’s often not a lot of testing that’s done, and instead, pediatricians are left to try to use antibiotics. And if it works, then patients get better; and if it doesn’t work, then kids go to the hospital, and they get tested. So I think that we will inevitably underestimate how much Mycoplasma is out there,” he said.
Creech says it’s important for parents and health care providers to be alert – but not alarmed – that Mycoplasma cases may be elevated this year.The front-line antibiotics that treat most kinds of pneumonia don’t work for Mycoplasma infections. For those, doctors need to prescribe a different kind of antibiotic, typically azithromycin or a Z-Pak.
However, Z-Paks don’t really work well for pneumonia caused by other things, so doctors and parents have to be thoughtful about how to treat these infections.
“The take-home point for parents is, when you start antibiotics for pneumonia, there’s typically a reasonable response to therapy in the first couple of days. And if there’s not, then that’s a reason to check back in with your pediatrician,” Creech said.
""",
                    style: AppTextStylesBlueScopeNews.s14W400(
                      color: AppColorsBlueScopeNews.color64717B,
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
