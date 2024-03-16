import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['cs', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? csText = '',
    String? enText = '',
  }) =>
      [csText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'l7o6231s': {
      'cs': 'Domovská stránka',
      'en': 'Home page',
    },
    '8fb5lxgv': {
      'cs': 'Získané body',
      'en': 'Points',
    },
    'tbmift75': {
      'cs': ' B',
      'en': '',
    },
    'ychee8n3': {
      'cs': 'a',
      'en': '',
    },
    '9zlup11i': {
      'cs': 'Aktuální úroveň',
      'en': 'Points',
    },
    'zr3uv6vg': {
      'cs': 'Získané mince',
      'en': 'Game coin',
    },
    'ehe9cz27': {
      'cs': ' MS',
      'en': '',
    },
    '4criz5k3': {
      'cs': 'Hello World',
      'en': '',
    },
    'x39rr9sk': {
      'cs': 'Pozice v žebříčku',
      'en': 'Leaderboard',
    },
    '0ipzu7o4': {
      'cs': '. místo',
      'en': '',
    },
    'xj8mfgue': {
      'cs': 'Žebříček',
      'en': 'Leaderboard',
    },
    'mlaqyuk7': {
      'cs': 'Domů',
      'en': 'Home',
    },
  },
  // BadgesPage
  {
    'sejepopn': {
      'cs': 'Odznaky',
      'en': 'Badges',
    },
    '031z9e1c': {
      'cs': 'Získané odznaky',
      'en': '',
    },
    '4hffo68x': {
      'cs': 'Získáno dne: ',
      'en': '',
    },
    '7bfpfoxl': {
      'cs': 'Hello World',
      'en': '',
    },
    'ei8uqq50': {
      'cs': '+ ',
      'en': '',
    },
    'dv6minds': {
      'cs': ' MS',
      'en': '',
    },
    'nwhvrus1': {
      'cs': 'Hello World',
      'en': '',
    },
    'w6mr7rmk': {
      'cs': 'Dostupné odznaky',
      'en': '',
    },
    'yrvtlk09': {
      'cs': '+ ',
      'en': '',
    },
    'f5il9pvb': {
      'cs': ' MS',
      'en': '',
    },
    'zkidffsj': {
      'cs': 'Hello World',
      'en': '',
    },
    'tbxgqiyx': {
      'cs': 'Odznaky',
      'en': 'Badges',
    },
  },
  // LeaderboardPage
  {
    'z4ashohh': {
      'cs': 'Žebříček',
      'en': 'Leaderboard',
    },
    'mjn2637n': {
      'cs': ' B',
      'en': '',
    },
    'o4a8zf4k': {
      'cs': 'Hello World',
      'en': '',
    },
    'h9diujwt': {
      'cs': '2',
      'en': '',
    },
    'nugp44d9': {
      'cs': ' B',
      'en': '',
    },
    'xda2qh44': {
      'cs': 'Hello World',
      'en': '',
    },
    'gbmgj6tb': {
      'cs': '1',
      'en': '',
    },
    'o7ngyap7': {
      'cs': ' B',
      'en': '',
    },
    't9peqwnf': {
      'cs': 'Hello World',
      'en': '',
    },
    '4an8xcwl': {
      'cs': '3',
      'en': '',
    },
    '3tislpl4': {
      'cs': '. místo',
      'en': '',
    },
    'a7orttoe': {
      'cs': '. místo',
      'en': '',
    },
    'uw1gvwux': {
      'cs': ' B',
      'en': '',
    },
    '0w6f25t1': {
      'cs': '1. místo',
      'en': '1st place',
    },
    'j9pvqigq': {
      'cs': ' B',
      'en': '',
    },
    '7jc2te99': {
      'cs': '1. místo',
      'en': '1st place',
    },
    'wnw7f38f': {
      'cs': 'Žebříček',
      'en': 'Leaderboard',
    },
  },
  // RewardPage
  {
    'o3gj3re7': {
      'cs': 'Odměny',
      'en': 'Rewards',
    },
    '9gi2k5l4': {
      'cs': 'Seřazeno podle (A-Z)',
      'en': '',
    },
    'owt24gfb': {
      'cs': 'Seřazeno podle (A-Z)',
      'en': '',
    },
    'aa8phhbd': {
      'cs': 'Seřazeno od nejnižší ceny',
      'en': '',
    },
    'gp4vd3wl': {
      'cs': 'Seřazeno od nejvyšší ceny',
      'en': '',
    },
    'y7ug6cr6': {
      'cs': 'Search for an item...',
      'en': '',
    },
    'bnqq3u31': {
      'cs': ' MS',
      'en': '',
    },
    'nsrf77oz': {
      'cs': '1500 MS',
      'en': '',
    },
    'rvyk3q3t': {
      'cs': 'Koupit',
      'en': '',
    },
    'pdpjp536': {
      'cs': ' MS',
      'en': '',
    },
    'v30vqmdv': {
      'cs': '1500 MS',
      'en': '',
    },
    'fnqh4uny': {
      'cs': 'Koupit',
      'en': '',
    },
    '2gi2lcvx': {
      'cs': ' MS',
      'en': '',
    },
    'dlyo7hk0': {
      'cs': '1500 MS',
      'en': '',
    },
    'm3043r4x': {
      'cs': 'Koupit',
      'en': '',
    },
    'fvdfdqds': {
      'cs': 'Odměny',
      'en': 'Rewards',
    },
  },
  // ProfilePage
  {
    '0a2r82cb': {
      'cs': 'Profil',
      'en': 'Profile',
    },
    'mdib5zra': {
      'cs': 'Vygenerovat nového avatara',
      'en': '',
    },
    'jdjj3165': {
      'cs': 'Upravit přezdívku',
      'en': '',
    },
    'j56hso0k': {
      'cs': 'Světlý režim',
      'en': 'Light Mode',
    },
    'k7b1rpxk': {
      'cs': 'Tmavý režim',
      'en': 'Dark Mode',
    },
    'rpsf591m': {
      'cs': 'Change Password',
      'en': '',
    },
    'qu2gy17n': {
      'cs': 'Profil',
      'en': 'Profile',
    },
  },
  // LoginPage
  {
    '9yjlvdmr': {
      'cs': 'Mobilní',
      'en': 'Mobile',
    },
    'bdehk8ux': {
      'cs': 'skladník',
      'en': 'Warehouseman',
    },
    'aofvzt9o': {
      'cs': 'Vítejte zpět!',
      'en': 'Welcome back!',
    },
    'j3avg6pr': {
      'cs':
          'Vyplňte níže uvedené informace, abyste získali přístup ke svému účtu.',
      'en': 'Fill out the information below to access your account.',
    },
    'u43wq1g4': {
      'cs': 'Email',
      'en': 'Email',
    },
    'pnskayw3': {
      'cs': 'Heslo',
      'en': 'Password',
    },
    'xq3syzkz': {
      'cs': 'Přihlásit',
      'en': 'Log in',
    },
    'pn5npwvg': {
      'cs': 'Přihlásit se k demo účtu',
      'en': '',
    },
    '3h8eyxg2': {
      'cs': 'Domů',
      'en': 'Home',
    },
  },
  // ForgotPasswordPage
  {
    'xmgqfntb': {
      'cs': 'Zpět',
      'en': 'Back',
    },
    'qvgb4o0l': {
      'cs': 'Zapomenuté heslo',
      'en': 'Forgot password',
    },
    'qrzr6yqt': {
      'cs':
          'Zašleme vám e-mail s odkazem na resetování hesla. Níže prosím zadejte e-mail spojený s vaším účtem.',
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
    },
    '5imytm96': {
      'cs': 'Vaše emailová adresa...',
      'en': 'Your email address...',
    },
    't8shlyp9': {
      'cs': 'Zadejte svůj e-mail...',
      'en': 'Enter your email...',
    },
    'izxe0xlq': {
      'cs': 'Poslat odkaz',
      'en': 'Send link',
    },
    'avb5b8xt': {
      'cs': 'Zpět',
      'en': 'Back',
    },
    'f2xnn0zb': {
      'cs': 'Domů',
      'en': 'Home',
    },
  },
  // PointsHistoryPage
  {
    'shf6clzz': {
      'cs': 'Filtr',
      'en': 'Filter',
    },
    'lprz0jfp': {
      'cs': 'Získáno',
      'en': '1st place',
    },
    'ttc0qy2h': {
      'cs': ' b',
      'en': '',
    },
    'vvkmj2bd': {
      'cs': 'Body',
      'en': '1st place',
    },
    'fnx6moks': {
      'cs': 'Historie získaných bodů',
      'en': 'Leaderboard',
    },
    'brevg0mw': {
      'cs': 'Žebříček',
      'en': 'Leaderboard',
    },
  },
  // LevelPage
  {
    'hrcpgo2o': {
      'cs': 'Úrovně',
      'en': 'Leaderboard',
    },
    '8ejxvqwo': {
      'cs': 'Další úroveň: ',
      'en': '',
    },
    '0qvw8ppm': {
      'cs': 'Další úroveň: 7 - Lídr skladu',
      'en': '',
    },
    'al0y6t07': {
      'cs': 'Pro další úroveň zbývá získat: ',
      'en': '',
    },
    'wy007f6v': {
      'cs': ' B',
      'en': '',
    },
    'a8pz2qa7': {
      'cs': 'Pro další úroveň zbývá získat: 650 bodů',
      'en': '',
    },
    '3kg2746e': {
      'cs': '+ ',
      'en': '',
    },
    '3h1stjxf': {
      'cs': ' MS',
      'en': '',
    },
    'qghl5s1h': {
      'cs': 'Hello World',
      'en': '',
    },
    '5wyzk7i5': {
      'cs': 'Po nasbírání ',
      'en': '',
    },
    'sip59qzb': {
      'cs': ' bodů',
      'en': '',
    },
    'ezkpqvz1': {
      'cs': 'Hello World',
      'en': '',
    },
    '2zyqv62w': {
      'cs': 'Žebříček',
      'en': 'Leaderboard',
    },
  },
  // Miscellaneous
  {
    'wk0ihg61': {
      'cs': 'Zasílání notifikací z aplikace',
      'en': '',
    },
    '4wconsxu': {
      'cs': '',
      'en': '',
    },
    '7pqvm9od': {
      'cs': '',
      'en': '',
    },
    'x9pthrbz': {
      'cs': '',
      'en': '',
    },
    'pw9y7z04': {
      'cs': '',
      'en': '',
    },
    '7jiu4tlx': {
      'cs': '',
      'en': '',
    },
    'z2umwqcw': {
      'cs': '',
      'en': '',
    },
    'fgwaz367': {
      'cs': '',
      'en': '',
    },
    '9o7kwr5g': {
      'cs': '',
      'en': '',
    },
    '3d8x02t0': {
      'cs': '',
      'en': '',
    },
    '15gst236': {
      'cs': '',
      'en': '',
    },
    '4yof8dhh': {
      'cs': '',
      'en': '',
    },
    'dhcbqr70': {
      'cs': '',
      'en': '',
    },
    '041czjdv': {
      'cs': '',
      'en': '',
    },
    'zo108nx8': {
      'cs': '',
      'en': '',
    },
    'u994yzz0': {
      'cs': '',
      'en': '',
    },
    'paxtqduk': {
      'cs': '',
      'en': '',
    },
    '9j4b7p3n': {
      'cs': '',
      'en': '',
    },
    'jql0rtcc': {
      'cs': '',
      'en': '',
    },
    '7f8e7zus': {
      'cs': '',
      'en': '',
    },
    'ehrwrb7v': {
      'cs': '',
      'en': '',
    },
    'v53wabi9': {
      'cs': '',
      'en': '',
    },
    'f1vzcpae': {
      'cs': '',
      'en': '',
    },
    '84f1519m': {
      'cs': '',
      'en': '',
    },
    'ewvc0rh8': {
      'cs': '',
      'en': '',
    },
    'bv7u6pmf': {
      'cs': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
