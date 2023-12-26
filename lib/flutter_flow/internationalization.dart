import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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
  // login
  {
    'pwgwj3ze': {
      'en': 'Welcome Back,',
      'ar': '',
    },
    'dvo11jjn': {
      'en': 'Email Address',
      'ar': '',
    },
    '4ralgwrb': {
      'en': 'Enter your email here...',
      'ar': '',
    },
    '683dtx63': {
      'en': 'Password',
      'ar': '',
    },
    '3x9v3p7l': {
      'en': 'Enter your password here...',
      'ar': '',
    },
    'zr0jatn1': {
      'en': 'Forgot Password?',
      'ar': '',
    },
    'sjck1c74': {
      'en': 'Login',
      'ar': '',
    },
    'sbyja0bb': {
      'en': 'Create Account',
      'ar': '',
    },
    '0irbwvr1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Headpage
  {
    'jbjum51a': {
      'en': 'Study With Us!',
      'ar': '',
    },
    'bgzvils0': {
      'en':
          'BrainTech is here to help tech students by providing \ndifferent learning materials from trusted sources,\n join us to help you with your journey! ',
      'ar': '',
    },
    '8vny8tx2': {
      'en': 'Login',
      'ar': '',
    },
    'a4x8cr1m': {
      'en': 'OR',
      'ar': '',
    },
    'm4hfdo8e': {
      'en': 'Create an account',
      'ar': '',
    },
    'wnu3wyz7': {
      'en': 'Home',
      'ar': '',
    },
  },
  // courses
  {
    'pwihcegu': {
      'en': 'Courses',
      'ar': '',
    },
    'vhotuz5m': {
      'en': 'Home',
      'ar': '',
    },
  },
  // creatAccount
  {
    '1nf45epv': {
      'en': 'Get Started',
      'ar': '',
    },
    'olpj20ts': {
      'en': 'Email Address',
      'ar': '',
    },
    'rm2cji4e': {
      'en': 'Enter your email here...',
      'ar': '',
    },
    'lyuj1eum': {
      'en': 'Password',
      'ar': '',
    },
    'tumpoeu1': {
      'en': 'Enter your password here...',
      'ar': '',
    },
    '5t4inza4': {
      'en': 'Confirm Password',
      'ar': '',
    },
    '75est7lp': {
      'en': 'Confirm your password here...',
      'ar': '',
    },
    's1mlqd5f': {
      'en': 'Name',
      'ar': '',
    },
    'w53mri6i': {
      'en': 'Enter your name here...',
      'ar': '',
    },
    'wqe984e4': {
      'en': 'Log In',
      'ar': '',
    },
    '0afs59o8': {
      'en': 'Create Account',
      'ar': '',
    },
    '03vcq5ub': {
      'en': 'Home',
      'ar': '',
    },
  },
  // resetPassword
  {
    '2hewbons': {
      'en': 'Back',
      'ar': '',
    },
    'olzpzsx7': {
      'en': 'Forgot Password',
      'ar': '',
    },
    '5npq0o8h': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar': '',
    },
    '9vc8eouw': {
      'en': 'Your email address...',
      'ar': '',
    },
    'bkjvtk2k': {
      'en': 'Enter your email...',
      'ar': '',
    },
    'chjrnv19': {
      'en': 'Send Link',
      'ar': '',
    },
    'g8u7xnem': {
      'en': 'Home',
      'ar': '',
    },
  },
  // learningMaterial
  {
    'izjve8pq': {
      'en': 'Videos',
      'ar': '',
    },
    're7iev9l': {
      'en': 'Search...',
      'ar': '',
    },
    'abkwietn': {
      'en': '4.25',
      'ar': '',
    },
    '8eu3uvv7': {
      'en': 'Library',
      'ar': '',
    },
    'biemjcmz': {
      'en': ' 01 Introduction',
      'ar': '',
    },
    'ovxekbdu': {
      'en':
          'Introduction to Java is a course that provides an overview of the Java programming language and its fundamentals. ',
      'ar': '',
    },
    'fpnggoxb': {
      'en': ' 02 Introduction to Problem Solving',
      'ar': '',
    },
    'ylpu581l': {
      'en':
          'The Problem Solving in Java course focuses on developing problem-solving skills using the Java programming language.',
      'ar': '',
    },
    'fq6ze5h5': {
      'en': ' 03 Fundamentals - Numeric data',
      'ar': '',
    },
    'jc8rvhmh': {
      'en':
          ' Numeric Data is a course that introduces students to the basics of working with numeric data in computer programming. ',
      'ar': '',
    },
    'vqv2tvay': {
      'en': ' 04 Fundementals - Arrays',
      'ar': '',
    },
    'szotec36': {
      'en':
          'In this course, students will learn how to declare, initialize, and access elements in an array. The course will cover different types of arrays, including one-dimensional arrays and multi-dimensional arrays.',
      'ar': '',
    },
    'hz4v5b9j': {
      'en': ' 05 Fundementals - String',
      'ar': '',
    },
    'jp7j63d8': {
      'en':
          'In this course, students will learn how to declare, initialize, and manipulate strings. They will explore various string operations, such as concatenation, substring extraction, length calculation.',
      'ar': '',
    },
    'np9dlssz': {
      'en': 'Quizzez',
      'ar': '',
    },
    '6wuplzal': {
      'en': 'Introduction to Programming',
      'ar': '',
    },
    'me8zz08g': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ProfilePage
  {
    'fh00nwgn': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'phllca9t': {
      'en': 'Change Password',
      'ar': '',
    },
    'd7jmskrw': {
      'en': 'Notification Settings',
      'ar': '',
    },
    '00d9nvrz': {
      'en': 'Terms of Services',
      'ar': '',
    },
    '47fyjs32': {
      'en': 'Delete Account',
      'ar': '',
    },
    'h53xa6w9': {
      'en': 'Personal Account',
      'ar': '',
    },
  },
  // EditProfile
  {
    '8vaxhiy1': {
      'en': 'Your information',
      'ar': '',
    },
    'tffy7xon': {
      'en': 'Your Name',
      'ar': '',
    },
    '1wapcay5': {
      'en': 'Your Email',
      'ar': '',
    },
    'xj6guvzt': {
      'en': 'New email',
      'ar': '',
    },
    'uhevivzy': {
      'en': 'Your new email',
      'ar': '',
    },
    'xdpxg5ow': {
      'en': 'Confirm email',
      'ar': '',
    },
    'gs7ulgy7': {
      'en': 'Confirm your email',
      'ar': '',
    },
    '88n8pi54': {
      'en': 'Save Changes',
      'ar': '',
    },
    'xn9n8mkc': {
      'en': 'Edit Profile',
      'ar': '',
    },
    '1va4m5cb': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ChangePassword
  {
    '9vf8osss': {
      'en': 'Your Password',
      'ar': '',
    },
    '9xaidw06': {
      'en': 'Current password',
      'ar': '',
    },
    'ytyzuckg': {
      'en': 'New Password',
      'ar': '',
    },
    'f9m5wt82': {
      'en': 'Confirm new password',
      'ar': '',
    },
    '7hv2oya3': {
      'en': 'Save Changes',
      'ar': '',
    },
    'juwkp4vv': {
      'en': 'Change Password',
      'ar': '',
    },
    'dr1p74is': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NotificationSet
  {
    'vjr2ljcz': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': '',
    },
    'q7oyu62g': {
      'en': 'Push Notifications',
      'ar': '',
    },
    'a2lzo35g': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': '',
    },
    'q65ldxk3': {
      'en': 'Email Notifications',
      'ar': '',
    },
    'p15u5swt': {
      'en':
          'Receive email notifications from our application about new learning materials.',
      'ar': '',
    },
    'emlj089n': {
      'en': 'Save Changes',
      'ar': '',
    },
    'z1beykjz': {
      'en': 'Notification Settings',
      'ar': '',
    },
    'qit7aye3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ContactUs
  {
    'ka2ojf1z': {
      'en': 'Welcome to support',
      'ar': '',
    },
    'i8wdjrib': {
      'en': 'How can we help you?',
      'ar': '',
    },
    'drkyiyb1': {
      'en': 'BrainTechSupport@gmail.com',
      'ar': '',
    },
    'ltdrpeo7': {
      'en': 'Review FAQ\'s below',
      'ar': '',
    },
    '8ayq6ttn': {
      'en': 'What should I do if I forget my password?',
      'ar': '',
    },
    'ajwtqtbb': {
      'en':
          'If you forget your password, click on the \"Forgot Password\" link on the login page. Enter the email address associated with your account, and you will receive an email with instructions on how to reset your password. Follow the instructions in the email to reset your password',
      'ar': '',
    },
    'psbxtw5u': {
      'en': 'How can I update my profile information?',
      'ar': '',
    },
    'vvug6l8a': {
      'en':
          'To update your profile information, click on the edit profile section. You can typically find this option under your Account, you can edit details such as your email address, and username. Save your changes once you\'re done.',
      'ar': '',
    },
    'hyg9ru70': {
      'en': 'How do I delete my account and associated data from the app?',
      'ar': '',
    },
    'fvua1f60': {
      'en':
          'To delete your account and associated data from the app, go to your account. Look for the option to delete your account. Follow the prompts to confirm the deletion. Please note that deleting your account is typically an irreversible action, and all your data will be permanently removed from the app.',
      'ar': '',
    },
    'vdek6687': {
      'en': 'Contact Us',
      'ar': '',
    },
    'p0jw9u2t': {
      'en': 'Home',
      'ar': '',
    },
  },
  // FavoriteList
  {
    '6zs17l4b': {
      'en': 'Favorite List',
      'ar': '',
    },
    'f97od2wi': {
      'en': 'Home',
      'ar': '',
    },
  },
  // learningMaterialCopy
  {
    '0woixpv2': {
      'en': 'Videos',
      'ar': '',
    },
    '4wifwsut': {
      'en': 'Search...',
      'ar': '',
    },
    'fhldmoea': {
      'en': '4.25',
      'ar': '',
    },
    'szdsqfqk': {
      'en': 'Library',
      'ar': '',
    },
    '5zqjl0qy': {
      'en': 'Work in progress',
      'ar': '',
    },
    '0vp6c3t0': {
      'en': '..',
      'ar': '',
    },
    'omvzvyhj': {
      'en': '4.25',
      'ar': '',
    },
    '03iox4vm': {
      'en': 'Work in progress',
      'ar': '',
    },
    'yxb3l18n': {
      'en': '..',
      'ar': '',
    },
    'eparvi4l': {
      'en': '4.25',
      'ar': '',
    },
    'zl1f235x': {
      'en': 'Quizzez',
      'ar': '',
    },
    'cg1pbtio': {
      'en': 'Oriented Objective Programming',
      'ar': '',
    },
    'jhatji8l': {
      'en': 'Home',
      'ar': '',
    },
  },
  // quizPage
  {
    'dwtj7tn3': {
      'en': 'Quiz',
      'ar': '',
    },
    'qpkeja6h': {
      'en': 'Complete',
      'ar': '',
    },
    'lyg52cjf': {
      'en': 'Next',
      'ar': '',
    },
    'jdji8kze': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AddQuiz
  {
    '7yxb3z7j': {
      'en': 'Write Question',
      'ar': '',
    },
    'x6sggyds': {
      'en': 'Option A',
      'ar': '',
    },
    '3igjf13p': {
      'en': 'Option B',
      'ar': '',
    },
    '59ddqmxw': {
      'en': 'Option C',
      'ar': '',
    },
    'vl8vjl8d': {
      'en': 'Option D',
      'ar': '',
    },
    'q6yejbcx': {
      'en': 'Add Question\n',
      'ar': '',
    },
    '5uh0fe1n': {
      'en': 'Add Quiz',
      'ar': '',
    },
    '7eu2ok70': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TermsOfService
  {
    'g52ehxbl': {
      'en':
          'Welcome to BrainTech!\nThese Terms of Service govern your access to and use of our BrainTech System. Please read these Terms carefully before using our platform.',
      'ar': '',
    },
    '92h7ngnd': {
      'en': '1. Acceptance of Terms',
      'ar': '',
    },
    'e8fo4rvf': {
      'en':
          'By accessing or using BrainTech, you agree to be bound by these Terms and any additional guidelines or rules applicable to specific features or services within BrainTech. If you do not agree to these Terms, please refrain from using our platform',
      'ar': '',
    },
    '1g72rogx': {
      'en': '2.User Accounts',
      'ar': '',
    },
    'rqv8euml': {
      'en':
          '2.1 Registration: To access certain features, you may need to create a user account. You agree to provide and complete information during the registration process and to keep your account information up to date.\n\n2.2 Account Security: You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use or suspected breach of security.',
      'ar': '',
    },
    'aw0nbt1s': {
      'en': '3. User Responsibilities',
      'ar': '',
    },
    '5q3metzf': {
      'en':
          '3.1 You are responsible for your interactions with other users on BrainTech. We reserve the right to monitor user activity and take appropriate action if violations of these Terms are identified.\n\n3.2 You shall not engage in any activity that may interfere with or disrupt the functioning of BrainTech or compromise its security.',
      'ar': '',
    },
    'duat7rxq': {
      'en': '4. Limitations',
      'ar': '',
    },
    'ma4hpn24': {
      'en':
          'BrainTech provides the platform on an \"as is\" and \"as available\" basis. We do not warrant that the platform will be error-free, uninterrupted, or free from viruses or other harmful components.',
      'ar': '',
    },
    'm6l55kye': {
      'en': '5. Changes to the Terms',
      'ar': '',
    },
    'os4a69gy': {
      'en':
          'We reserve the right to modify or update these Terms at any time. We will provide notice of significant changes through BrainTech or other means. Your continued use of the platform after such changes indicates your acceptance of the modified Terms.',
      'ar': '',
    },
    'c6tap30i': {
      'en': 'Terms Of Service',
      'ar': '',
    },
    'ejuykjmj': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DiscussionPage
  {
    'z5dyfm2l': {
      'en': 'Randy Mcdonald',
      'ar': '',
    },
    '47s9s9ma': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar': '',
    },
    'tx773ss6': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': '',
    },
    'ksj2xor5': {
      'en': 'Randy Mcdonald',
      'ar': '',
    },
    'jjyqmnqb': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar': '',
    },
    'ltogq4p8': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': '',
    },
    'xgaemhv6': {
      'en': 'Randy Mcdonald',
      'ar': '',
    },
    '6xhp07kz': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar': '',
    },
    'r2nmd62a': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': '',
    },
    'cf89n1d3': {
      'en': 'Randy Mcdonald',
      'ar': '',
    },
    '4lshy4b2': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar': '',
    },
    'byi44osm': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': '',
    },
    'tduo0h79': {
      'en': 'My Chats',
      'ar': '',
    },
    'r6ha24lz': {
      'en': '__',
      'ar': '',
    },
  },
  // finishpage
  {
    '18329hxj': {
      'en': 'Congrats!',
      'ar': '',
    },
    'oo9w7qh4': {
      'en': 'Go Home',
      'ar': '',
    },
  },
  // createQuiz
  {
    'mad20gb9': {
      'en': 'Title',
      'ar': '',
    },
    'ui3yggg9': {
      'en': 'Enter the title here..',
      'ar': '',
    },
    'gnblggg6': {
      'en': 'Duration',
      'ar': '',
    },
    'jzt3fkcd': {
      'en': 'Enter the duration here in seconds..',
      'ar': '',
    },
    'cy27bdfz': {
      'en': 'Create set',
      'ar': '',
    },
    'v7r58uq8': {
      'en': 'Available sets',
      'ar': '',
    },
    'uyjgvsem': {
      'en': 'Create quiz',
      'ar': '',
    },
    '8e2i0nto': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C101
  {
    'f4tawmdd': {
      'en': 'Introduction',
      'ar': '',
    },
    'av3ucy2r': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C102
  {
    '00m7mpek': {
      'en': 'Introduction To Problem Solving',
      'ar': '',
    },
    'we35s2fo': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C103
  {
    'c1xvavdl': {
      'en': 'Fundementals - Numeric Data',
      'ar': '',
    },
    'urg6y0mk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C104
  {
    'n0vo2abn': {
      'en': '04 Fundementals - Arrays',
      'ar': '',
    },
    '135pcxgp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C105
  {
    'mt2vawrh': {
      'en': '05 Fundementals - String',
      'ar': '',
    },
    'ju2j76j9': {
      'en': 'Home',
      'ar': '',
    },
  },
  // menu
  {
    'h9jxnp9a': {
      'en': 'Personal Account ',
      'ar': '',
    },
    'cjm1nbyg': {
      'en': 'Favorite list',
      'ar': '',
    },
    '016mtc1b': {
      'en': 'Discussion board',
      'ar': '',
    },
    '9u75mweu': {
      'en': 'Contact us',
      'ar': '',
    },
    '51vyxsbq': {
      'en': 'Logout',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '8ybk4exj': {
      'en': '',
      'ar': '',
    },
    '59n766h5': {
      'en': '',
      'ar': '',
    },
    'kn2kelhf': {
      'en': '',
      'ar': '',
    },
    'vzl9x75j': {
      'en': '',
      'ar': '',
    },
    'esidnjzm': {
      'en': '',
      'ar': '',
    },
    'z0d8t3nh': {
      'en': '',
      'ar': '',
    },
    'j7p28aow': {
      'en': '',
      'ar': '',
    },
    '7eddq4nl': {
      'en': '',
      'ar': '',
    },
    'gk4j83nh': {
      'en': '',
      'ar': '',
    },
    'linuq865': {
      'en': '',
      'ar': '',
    },
    'brvb1kd0': {
      'en': '',
      'ar': '',
    },
    'rrffsrqe': {
      'en': '',
      'ar': '',
    },
    'a6emqdbc': {
      'en': '',
      'ar': '',
    },
    'ivi96ze2': {
      'en': '',
      'ar': '',
    },
    '3y8vm1dp': {
      'en': '',
      'ar': '',
    },
    'ne7rjhpn': {
      'en': '',
      'ar': '',
    },
    'zqo0l9hs': {
      'en': '',
      'ar': '',
    },
    'ixowdgnv': {
      'en': '',
      'ar': '',
    },
    'm9iq5dpl': {
      'en': '',
      'ar': '',
    },
    'vewz8ums': {
      'en': '',
      'ar': '',
    },
    '2egyhe1x': {
      'en': '',
      'ar': '',
    },
    '7759tzlu': {
      'en': '',
      'ar': '',
    },
    'pf6zr0s4': {
      'en': '',
      'ar': '',
    },
    'fbabc3lb': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
