import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Home/news/newsDetails.dart';
import 'package:news/Home/news/newsWidget.dart';
import 'package:news/appColors.dart';
import 'package:news/model/news_response/article.dart';

class Searchview extends StatelessWidget {
final News result;
Searchview({required this.result});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),

      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(Newsdetails.routeName, arguments: result);

        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: result.urlToImage??"",
                width: MediaQuery.of(context).size.width*0.4,
                height: MediaQuery.of(context).size.height*0.3,
                fit: BoxFit.cover,
                placeholder: (context,url)=> Center(
                  child: CircularProgressIndicator(
                    color: Appcolors.primaryColor,
                  ),
                ),
                errorWidget: (context,url,error)=>Center(child: Icon(Icons.error),),
              ),
            ),
            Expanded(child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(result.author??'no author',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    color: Appcolors.greyColor
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  Text(result.title??"no title",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    color: Appcolors.greyColor
                  ),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  Text(result.publishedAt??'null',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    color: Appcolors.greyColor
                  ),
                     textAlign:TextAlign.right),
               
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}