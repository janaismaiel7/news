import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Providers/appConfigProvider.dart';
import 'package:news/appColors.dart';
import 'package:provider/provider.dart';

//stateful bec we are using providers
class Languagebottomsheet extends StatefulWidget {
  @override
  State<Languagebottomsheet> createState() => _LanguagebottomsheetState();
}

class _LanguagebottomsheetState extends State<Languagebottomsheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfigprovider>(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeLang('en');
              },
              child: provider.appLange == 'en'
                  ? getSelectedIteamWidget(
                      AppLocalizations.of(context)!.english)
                  : getUnSelectedIteamWidget(
                      AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.changeLang('ar');
              },
              child: provider.appLange == 'ar'
                  ? getSelectedIteamWidget(AppLocalizations.of(context)!.arabic)
                  : getUnSelectedIteamWidget(
                      AppLocalizations.of(context)!.arabic)),
        ],
      ),
    );
  }

  Widget getSelectedIteamWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Appcolors.primaryColor)),
        Icon(
          Icons.check,
          size: 25,
          color: Appcolors.primaryColor,
        ),
      ],
    );
  }

  Widget getUnSelectedIteamWidget(String text) {
    return Text(text, style: Theme.of(context).textTheme.bodySmall!);
  }
}
