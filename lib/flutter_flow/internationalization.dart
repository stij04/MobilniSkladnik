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
      'en': 'Home Page',
    },
    '8fb5lxgv': {
      'cs': 'Získané body',
      'en': 'Earned Points',
    },
    'tbmift75': {
      'cs': ' B',
      'en': ' B',
    },
    'ychee8n3': {
      'cs': 'a',
      'en': '',
    },
    '9zlup11i': {
      'cs': 'Aktuální úroveň',
      'en': 'Current Level',
    },
    'zr3uv6vg': {
      'cs': 'Získané mince',
      'en': 'Earned Coins',
    },
    'ehe9cz27': {
      'cs': ' MS',
      'en': ' MS',
    },
    '4criz5k3': {
      'cs': 'Hello World',
      'en': '',
    },
    'x39rr9sk': {
      'cs': 'Pozice v žebříčku',
      'en': 'Ranking Position',
    },
    '0ipzu7o4': {
      'cs': '. místo',
      'en': '. place',
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
  // BadgePage
  {
    'sejepopn': {
      'cs': 'Odznaky',
      'en': 'Badges',
    },
    '031z9e1c': {
      'cs': 'Získané odznaky',
      'en': 'Badges earned',
    },
    '4hffo68x': {
      'cs': 'Získáno dne: ',
      'en': 'Obtained on: ',
    },
    '7bfpfoxl': {
      'cs': 'Hello World',
      'en': '',
    },
    'ei8uqq50': {
      'cs': '+ ',
      'en': '+ ',
    },
    'dv6minds': {
      'cs': ' MS',
      'en': ' MS',
    },
    'nwhvrus1': {
      'cs': 'Hello World',
      'en': '',
    },
    'w6mr7rmk': {
      'cs': 'Dostupné odznaky',
      'en': 'All available badges',
    },
    'yrvtlk09': {
      'cs': '+ ',
      'en': '+ ',
    },
    'f5il9pvb': {
      'cs': ' MS',
      'en': ' MS',
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
      'en': ' B',
    },
    'o4a8zf4k': {
      'cs': 'Hello World',
      'en': '',
    },
    'h9diujwt': {
      'cs': '2',
      'en': '2',
    },
    'nugp44d9': {
      'cs': ' B',
      'en': ' B',
    },
    'xda2qh44': {
      'cs': 'Hello World',
      'en': '',
    },
    'gbmgj6tb': {
      'cs': '1',
      'en': '1',
    },
    'o7ngyap7': {
      'cs': ' B',
      'en': ' B',
    },
    't9peqwnf': {
      'cs': 'Hello World',
      'en': '',
    },
    '4an8xcwl': {
      'cs': '3',
      'en': '3',
    },
    '3tislpl4': {
      'cs': '. místo',
      'en': '. place',
    },
    'a7orttoe': {
      'cs': '. místo',
      'en': '. place',
    },
    'uw1gvwux': {
      'cs': ' B',
      'en': ' B',
    },
    '0w6f25t1': {
      'cs': '1. místo',
      'en': '1st place',
    },
    'j9pvqigq': {
      'cs': ' B',
      'en': ' B',
    },
    '7jc2te99': {
      'cs': '1. místo',
      'en': '1st place',
    },
    'wnw7f38f': {
      'cs': 'Žebříček',
      'en': 'Ranking',
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
      'en': 'Sorted by (A-Z)',
    },
    'owt24gfb': {
      'cs': 'Seřazeno podle (A-Z)',
      'en': 'Sorted by (A-Z)',
    },
    'aa8phhbd': {
      'cs': 'Seřazeno od nejnižší ceny',
      'en': 'Sorted from lowest price',
    },
    'gp4vd3wl': {
      'cs': 'Seřazeno od nejvyšší ceny',
      'en': 'Sorted from highest price',
    },
    'y7ug6cr6': {
      'cs': 'Vyhledat položku...',
      'en': 'Search for an item...',
    },
    'bnqq3u31': {
      'cs': ' MS',
      'en': ' MS',
    },
    'nsrf77oz': {
      'cs': '1500 MS',
      'en': '',
    },
    'rvyk3q3t': {
      'cs': 'Koupit',
      'en': 'Buy',
    },
    'pdpjp536': {
      'cs': ' MS',
      'en': ' MS',
    },
    'v30vqmdv': {
      'cs': '1500 MS',
      'en': '',
    },
    'fnqh4uny': {
      'cs': 'Koupit',
      'en': 'Buy',
    },
    '2gi2lcvx': {
      'cs': ' MS',
      'en': ' MS',
    },
    'dlyo7hk0': {
      'cs': '1500 MS',
      'en': '',
    },
    'm3043r4x': {
      'cs': 'Koupit',
      'en': 'Buy',
    },
    'fvdfdqds': {
      'cs': 'Odměny',
      'en': 'Rewards',
    },
  },
  // ProfilePage
  {
    '0a2r82cb': {
      'cs': 'Můj profil',
      'en': 'My Profile',
    },
    'sz2hhdla': {
      'cs': 'Avatar',
      'en': 'Avatar',
    },
    '56bcopar': {
      'cs': 'Generovat nového avatara',
      'en': 'Generate a new avatar',
    },
    'gv8vohcd': {
      'cs': 'Uložit',
      'en': 'Save',
    },
    'd99fe29l': {
      'cs': 'Vtátit zpět',
      'en': 'Previous',
    },
    'y1xcrmbe': {
      'cs': 'Osobní údaje',
      'en': 'Personal Information',
    },
    'f5ikp2nj': {
      'cs': 'Jméno: ',
      'en': 'Name: ',
    },
    '8186cve1': {
      'cs': ' ',
      'en': ' ',
    },
    'gsiwxv0l': {
      'cs': 'Jméno:',
      'en': 'Name:',
    },
    'a0lz1vdg': {
      'cs': 'Email: ',
      'en': 'Email: ',
    },
    '5s5ccxud': {
      'cs': 'Email:',
      'en': 'Email: ',
    },
    'ns4hggmw': {
      'cs': 'Přezdívka: ',
      'en': 'Nickname: ',
    },
    'rmkkqng4': {
      'cs': 'Přezdívka:',
      'en': 'Nickname: ',
    },
    'jp5yrdcy': {
      'cs': 'Nastavení aplikace',
      'en': 'App Settings',
    },
    'j56hso0k': {
      'cs': 'Světlý režim',
      'en': 'Light Mode',
    },
    'k7b1rpxk': {
      'cs': 'Tmavý režim',
      'en': 'Dark Mode',
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
      'en': 'Log in to a demo account',
    },
    '3h8eyxg2': {
      'cs': 'Domů',
      'en': 'Home',
    },
  },
  // LevelPage
  {
    'hrcpgo2o': {
      'cs': 'Úrovně',
      'en': 'Levels',
    },
    '8ejxvqwo': {
      'cs': 'Další úroveň: ',
      'en': 'Next level: ',
    },
    '0qvw8ppm': {
      'cs': 'Další úroveň: 7 - Lídr skladu',
      'en': '',
    },
    'al0y6t07': {
      'cs': 'Pro další úroveň zbývá získat: ',
      'en': 'For the next level, it remains to get: ',
    },
    'wy007f6v': {
      'cs': ' B',
      'en': ' B',
    },
    'a8pz2qa7': {
      'cs': 'Pro další úroveň zbývá získat: 650 bodů',
      'en': '',
    },
    '5wyzk7i5': {
      'cs': 'Po nasbírání ',
      'en': 'After collecting ',
    },
    'sip59qzb': {
      'cs': ' bodů',
      'en': ' points',
    },
    'ezkpqvz1': {
      'cs': 'Hello World',
      'en': '',
    },
    '3kg2746e': {
      'cs': '+ ',
      'en': '+ ',
    },
    '3h1stjxf': {
      'cs': ' MS',
      'en': ' MS',
    },
    'qghl5s1h': {
      'cs': 'Hello World',
      'en': '',
    },
    '2zyqv62w': {
      'cs': 'Úrovně',
      'en': 'Levels',
    },
  },
  // EditNicknamePage
  {
    'ih0tj89d': {
      'cs': 'Upravit přezdívku',
      'en': 'Edit nickname',
    },
    'x1tkz7fe': {
      'cs': 'Zde můžete upravit svou přezdívku',
      'en': 'You can edit your nickname here',
    },
    'zq1boycl': {
      'cs': '',
      'en': '',
    },
    '3vn6cp4g': {
      'cs': 'Zvolte si přezdívku...',
      'en': 'Choose a nickname...',
    },
    'bbzdfh9z': {
      'cs': 'Uložit',
      'en': 'Save',
    },
    '0h8w2cxz': {
      'cs': 'Žebříček',
      'en': 'Leaderboard',
    },
  },
  // NotificationPage
  {
    'v27mzux4': {
      'cs': 'Notifikace',
      'en': 'Notifications',
    },
    'y0evhr2w': {
      'cs': 'Nová úroveň dosažena!',
      'en': 'New level reached!',
    },
    '6t23zwn3': {
      'cs': 'Získali jste + ',
      'en': 'You have gained + ',
    },
    'tb4ddm4k': {
      'cs': ' MS',
      'en': ' MS',
    },
    '4jrtwtaq': {
      'cs': '',
      'en': '',
    },
    'wn6qzekw': {
      'cs': 'Notifikace',
      'en': 'Notifications',
    },
  },
  // NoNotificationComponent
  {
    '9envknlb': {
      'cs': 'Nemáte žádná upozornění',
      'en': 'No notifications',
    },
  },
  // NoBadgeComponent
  {
    '44nj10ck': {
      'cs': 'Zatím jste nezískal žádné odznaky',
      'en': 'No badges have been earned yet',
    },
  },
  // Miscellaneous
  {
    'wk0ihg61': {
      'cs': 'Zasílání notifikací z aplikace',
      'en': 'Sending notifications from the application',
    },
    '4wconsxu': {
      'cs': 'Zadané přihlašovací údaje nejsou správné',
      'en': 'Login information is incorrect',
    },
    '7pqvm9od': {
      'cs': 'Email pro obnovení hesla byl odeslán!',
      'en': 'Password reset email sent!',
    },
    'x9pthrbz': {
      'cs': 'Email je povinný!',
      'en': 'Email required!',
    },
    'pw9y7z04': {
      'cs': 'Telefonní číslo je povinné a musí začínat znakem +.',
      'en': 'Phone number required and has to start with +.',
    },
    '7jiu4tlx': {
      'cs': 'Hesla se neshodují',
      'en': 'Passwords don\'t match',
    },
    'z2umwqcw': {
      'cs': 'Zadejte ověřovací SMS kód',
      'en': 'Enter SMS verification code',
    },
    'fgwaz367': {
      'cs':
          'Od posledního přihlášení uplynulo příliš dlouho. Před smazáním účtu se znovu přihlaste.',
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account.',
    },
    '9o7kwr5g': {
      'cs':
          'Od posledního přihlášení uplynula příliš dlouhá doba. Před aktualizací e-mailu se znovu přihlaste.',
      'en':
          'Too long since most recent sign in. Sign in again before updating your email.',
    },
    '3d8x02t0': {
      'cs': 'Email s potvrzením změny e-mailu byl odeslán!',
      'en': 'Email change confirmation email sent!',
    },
    '15gst236': {
      'cs': 'Teto email již používá jiný účet',
      'en': 'Email already in use by another account',
    },
    '4yof8dhh': {
      'cs': 'Zadané přihlašovací údaje nejsou správné',
      'en': 'Login information is incorrect',
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
