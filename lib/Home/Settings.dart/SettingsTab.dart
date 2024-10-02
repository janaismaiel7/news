import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Home/Settings.dart/languageBottomSheet.dart';
import 'package:news/Providers/appConfigProvider.dart';
import 'package:news/appColors.dart';
import 'package:provider/provider.dart';

class Settingstab extends StatefulWidget {
  const Settingstab({super.key});

  @override
  State<Settingstab> createState() => _SettingstabState();
}

class _SettingstabState extends State<Settingstab> {
  @override
  Widget build(BuildContext context) {
    Map<String,String> langs ={
      'en': AppLocalizations.of(context)!.english,
      'ar': AppLocalizations.of(context)!.arabic
    };
    var provider =Provider.of<Appconfigprovider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,

          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              showLangBottomSheet();
            },
           child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Appcolors.primaryColor,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  langs[provider.appLange]!,
                  style: Theme.of(context).textTheme.bodySmall,),
                  Icon(Icons.arrow_drop_down)
              ],
            ),
           ),
          )
        ],
      ),
    );
  }
  
  void showLangBottomSheet() {
    showModalBottomSheet(context: context,
     builder: (context)=> Languagebottomsheet());
  }
}
