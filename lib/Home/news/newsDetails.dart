import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Home/news/newIteam.dart';
import 'package:news/appColors.dart';
import 'package:news/model/news_response/article.dart';
import 'package:url_launcher/url_launcher.dart'; 

class Newsdetails extends StatefulWidget {
  static String routeName = 'NewsDetails';

  @override
  State<Newsdetails> createState() => _NewsdetailsState();
}

class _NewsdetailsState extends State<Newsdetails> {
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    
    return Stack(
      children: [
     Container(
      color: Appcolors.whiteColor,
     ),
        Image.asset(
          'assets/images/pattern.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        
    
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Appcolors.whiteColor,
            ),
            title: Text(
              news.title ?? '',
              style: GoogleFonts.exo(
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              maxLines: 2,
            ),
          ),
          
          
          body: SingleChildScrollView(
            child: Column(
              children: [
                
                Newiteam(news: news),
                
           
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    news.description ?? '',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      color: Appcolors.greyColor,
                    ),
                  ),
                ),
                
               
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'View Full Article',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleMedium,
                          color: Appcolors.greyColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(news.url??''));
                          }
                    ),),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
