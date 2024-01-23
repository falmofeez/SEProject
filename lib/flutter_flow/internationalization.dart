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
      'ar': 'مرحبًا بعودتك،',
    },
    'dvo11jjn': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '4ralgwrb': {
      'en': 'Enter your email here...',
      'ar': 'أدخل عنوان بريدك الإلكتروني هنا...',
    },
    '683dtx63': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '3x9v3p7l': {
      'en': 'Enter your password here...',
      'ar': 'أدخل كلمة المرور الخاصة بك هنا...',
    },
    'zr0jatn1': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    'sjck1c74': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'sbyja0bb': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '0irbwvr1': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Headpage
  {
    'jbjum51a': {
      'en': 'Study With Us!',
      'ar': 'ادرس معنا!',
    },
    'bgzvils0': {
      'en':
          'BrainTech is here to help tech students by providing different learning materials from trusted sources,\n join us to help you with your journey! ',
      'ar':
          'BrainTech هنا لمساعدة طلاب التقنية من خلال توفير مواد تعليمية مختلفة من مصادر موثوقة،\n انضم إلينا لمساعدتك في رحلتك!',
    },
    '8vny8tx2': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'a4x8cr1m': {
      'en': 'OR',
      'ar': 'أو',
    },
    'm4hfdo8e': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
    },
    'wnu3wyz7': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // courses
  {
    'pwihcegu': {
      'en': 'Courses',
      'ar': 'الدورات',
    },
    'vhotuz5m': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // creatAccount
  {
    '1nf45epv': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'olpj20ts': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'rm2cji4e': {
      'en': 'Enter your email here...',
      'ar': 'أدخل عنوان بريدك الإلكتروني هنا...',
    },
    'lyuj1eum': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'tumpoeu1': {
      'en': 'Enter your password here...',
      'ar': 'أدخل كلمة المرور الخاصة بك هنا...',
    },
    '5t4inza4': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    '75est7lp': {
      'en': 'Confirm your password here...',
      'ar': 'قم بتأكيد كلمة المرور الخاصة بك هنا...',
    },
    's1mlqd5f': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'w53mri6i': {
      'en': 'Enter your name here...',
      'ar': 'أدخل اسمك هنا...',
    },
    'wqe984e4': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
    },
    '0afs59o8': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '03vcq5ub': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // resetPassword
  {
    '2hewbons': {
      'en': 'Back',
      'ar': 'عودة',
    },
    'olzpzsx7': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    '5npq0o8h': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar':
          'سنرسل إليك بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك، يرجى إدخال البريد الإلكتروني المرتبط بحسابك أدناه.',
    },
    '9vc8eouw': {
      'en': 'Your email address...',
      'ar': 'عنوان بريدك  الإلكتروني...',
    },
    'bkjvtk2k': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
    },
    'chjrnv19': {
      'en': 'Send Link',
      'ar': 'أرسل الرابط',
    },
    'g8u7xnem': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // learningMaterialITP
  {
    'izjve8pq': {
      'en': 'Videos',
      'ar': 'مقاطع الفيديو',
    },
    're7iev9l': {
      'en': 'Search...',
      'ar': 'البحث...',
    },
    'abkwietn': {
      'en': '4.25',
      'ar': '4.25',
    },
    '8eu3uvv7': {
      'en': 'Library',
      'ar': 'المكتبة',
    },
    'np9dlssz': {
      'en': 'Quizzez',
      'ar': 'الاختبارات',
    },
    '6wuplzal': {
      'en': 'Introduction to Programming',
      'ar': 'مقدمة في البرمجة',
    },
    'me8zz08g': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ProfilePage
  {
    'fh00nwgn': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'phllca9t': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'd7jmskrw': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
    },
    '00d9nvrz': {
      'en': 'Terms of Services',
      'ar': 'شروط الخدمة',
    },
    '4osrzuy3': {
      'en': 'Invite friends',
      'ar': 'ادعو أصدقاء',
    },
    '47fyjs32': {
      'en': 'Delete Account',
      'ar': 'حذف الحساب',
    },
    'h53xa6w9': {
      'en': 'Personal Account',
      'ar': 'حساب شخصي',
    },
  },
  // EditProfile
  {
    '8vaxhiy1': {
      'en': 'Your information',
      'ar': 'معلوماتك',
    },
    'tffy7xon': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    '1wapcay5': {
      'en': 'Your Email',
      'ar': 'بريدك الالكتروني',
    },
    'xj6guvzt': {
      'en': 'New email',
      'ar': 'بريد إلكتروني جديد',
    },
    'uhevivzy': {
      'en': 'Your new email',
      'ar': 'بريدك الإلكتروني الجديد',
    },
    'xdpxg5ow': {
      'en': 'Confirm email',
      'ar': 'تأكيد عنوان البريد الإلكتروني',
    },
    'gs7ulgy7': {
      'en': 'Confirm your email',
      'ar': 'قم بتأكيد بريدك الإلكتروني',
    },
    '88n8pi54': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'xn9n8mkc': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    '1va4m5cb': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // ChangePassword
  {
    '9vf8osss': {
      'en': 'Your Password',
      'ar': 'كلمة السر خاصتك',
    },
    '9xaidw06': {
      'en': 'Current password',
      'ar': 'كلمة السر الحالية',
    },
    'ytyzuckg': {
      'en': 'New Password',
      'ar': 'كلمة المرور الجديدة',
    },
    'f9m5wt82': {
      'en': 'Confirm new password',
      'ar': 'تأكيد كلمة المرور الجديدة',
    },
    '7hv2oya3': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'juwkp4vv': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'dr1p74is': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // NotificationSet
  {
    'vjr2ljcz': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
    },
    'q7oyu62g': {
      'en': 'Push Notifications',
      'ar': 'اشعارات التطبيق',
    },
    'a2lzo35g': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': 'تلقي إشعارات الدفع من تطبيقنا بشكل شبه منتظم.',
    },
    'q65ldxk3': {
      'en': 'Email Notifications',
      'ar': 'اشعارات البريد الالكتروني',
    },
    'p15u5swt': {
      'en':
          'Receive email notifications from our application about new learning materials.',
      'ar':
          'تلقي إشعارات عبر البريد الإلكتروني من تطبيقنا حول المواد التعليمية الجديدة.',
    },
    'emlj089n': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'z1beykjz': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
    },
    'qit7aye3': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // ContactUs
  {
    'ka2ojf1z': {
      'en': 'Welcome to support',
      'ar': 'مرحبا بكم في الدعم',
    },
    'i8wdjrib': {
      'en': 'How can we help you?',
      'ar': 'كيف يمكننا مساعدتك؟',
    },
    'drkyiyb1': {
      'en': 'BrainTechSupport@gmail.com',
      'ar': 'BrainTechSupport@gmail.com',
    },
    'ltdrpeo7': {
      'en': 'Review FAQ\'s below',
      'ar': 'قم بمراجعة الأسئلة الشائعة أدناه',
    },
    '8ayq6ttn': {
      'en': 'What should I do if I forget my password?',
      'ar': 'ماذا يجب أن أفعل إذا نسيت كلمة المرور الخاصة بي؟',
    },
    'ajwtqtbb': {
      'en':
          'If you forget your password, click on the \"Forgot Password\" link on the login page. Enter the email address associated with your account, and you will receive an email with instructions on how to reset your password. Follow the instructions in the email to reset your password',
      'ar':
          'إذا نسيت كلمة المرور الخاصة بك، فانقر على رابط \"نسيت كلمة المرور\" في صفحة تسجيل الدخول. أدخل عنوان البريد الإلكتروني المرتبط بحسابك، وسوف تتلقى رسالة بريد إلكتروني تحتوي على تعليمات حول كيفية إعادة تعيين كلمة المرور الخاصة بك. اتبع الإرشادات الموجودة في البريد الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك',
    },
    'psbxtw5u': {
      'en': 'How can I update my profile information?',
      'ar': 'كيف يمكنني تحديث معلومات ملفي الشخصي؟',
    },
    'vvug6l8a': {
      'en':
          'To update your profile information, click on the edit profile section. You can typically find this option under your Account, you can edit details such as your email address, and username. Save your changes once you\'re done.',
      'ar':
          'لتحديث معلومات ملفك الشخصي، انقر فوق قسم تعديل الملف الشخصي. يمكنك عادةً العثور على هذا الخيار ضمن حسابك، ويمكنك تعديل التفاصيل مثل عنوان بريدك الإلكتروني واسم المستخدم. احفظ تغييراتك بمجرد الانتهاء.',
    },
    'hyg9ru70': {
      'en': 'How do I delete my account and associated data from the app?',
      'ar': 'كيف يمكنني حذف حسابي والبيانات المرتبطة به من التطبيق؟',
    },
    'fvua1f60': {
      'en':
          'To delete your account and associated data from the app, go to your account. Look for the option to delete your account. Follow the prompts to confirm the deletion. Please note that deleting your account is typically an irreversible action, and all your data will be permanently removed from the app.',
      'ar':
          'لحذف حسابك والبيانات المرتبطة به من التطبيق، انتقل إلى حسابك. ابحث عن خيار حذف حسابك. اتبع المطالبات لتأكيد الحذف. يرجى ملاحظة أن حذف حسابك عادة ما يكون إجراء لا رجعة فيه، وستتم إزالة جميع بياناتك نهائيًا من التطبيق.',
    },
    'vdek6687': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    'p0jw9u2t': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // FavoriteList
  {
    '6zs17l4b': {
      'en': 'Favorite List',
      'ar': 'قائمة المفضلة',
    },
    'f97od2wi': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // learningMaterialOOP
  {
    '0woixpv2': {
      'en': 'Videos',
      'ar': 'مقاطعال فيديو',
    },
    '4wifwsut': {
      'en': 'Search...',
      'ar': 'البحث...',
    },
    'fhldmoea': {
      'en': '4.25',
      'ar': '4.25',
    },
    'szdsqfqk': {
      'en': 'Library',
      'ar': 'المكتبة',
    },
    'zl1f235x': {
      'en': 'Quizzez',
      'ar': 'الاختبارات',
    },
    'cg1pbtio': {
      'en': 'Object Oriented Programming',
      'ar': 'البرمجة الشيئية',
    },
    'jhatji8l': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // quizPage
  {
    'dwtj7tn3': {
      'en': 'Quiz',
      'ar': 'اختبار',
    },
    'qpkeja6h': {
      'en': 'Complete',
      'ar': 'انهاء ',
    },
    'lyg52cjf': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'jdji8kze': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // AddQuiz
  {
    '7yxb3z7j': {
      'en': 'Write Question',
      'ar': 'اكتب سؤال ',
    },
    'x6sggyds': {
      'en': 'Option A',
      'ar': 'الخيار أ',
    },
    '3igjf13p': {
      'en': 'Option B',
      'ar': 'الخيار ب',
    },
    '59ddqmxw': {
      'en': 'Option C',
      'ar': 'الخيار ج',
    },
    'vl8vjl8d': {
      'en': 'Option D',
      'ar': 'الخيار د',
    },
    'q6yejbcx': {
      'en': 'Add Question\n',
      'ar': 'أضف سؤال',
    },
    '5uh0fe1n': {
      'en': 'Add Quiz',
      'ar': 'إضافة مسابقة',
    },
    '7eu2ok70': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // TermsOfService
  {
    'g52ehxbl': {
      'en':
          'Welcome to BrainTech!\nThese Terms of Service govern your access to and use of our BrainTech System. Please read these Terms carefully before using our platform.',
      'ar':
          'مرحبا بكم في BrainTech!\nتحكم شروط الخدمة هذه وصولك إلى نظام BrainTech واستخدامه. يرجى قراءة هذه الشروط بعناية قبل استخدام منصتنا.',
    },
    '92h7ngnd': {
      'en': '1. Acceptance of Terms',
      'ar': '1. قبول الشروط',
    },
    'e8fo4rvf': {
      'en':
          'By accessing or using BrainTech, you agree to be bound by these Terms and any additional guidelines or rules applicable to specific features or services within BrainTech. If you do not agree to these Terms, please refrain from using our platform',
      'ar':
          'من خلال الوصول إلى BrainTech أو استخدامه، فإنك توافق على الالتزام بهذه الشروط وأي إرشادات أو قواعد إضافية تنطبق على ميزات أو خدمات محددة داخل BrainTech. إذا كنت لا توافق على هذه الشروط، فيرجى الامتناع عن استخدام منصتنا',
    },
    '1g72rogx': {
      'en': '2.User Accounts',
      'ar': '2. حسابات المستخدمين',
    },
    'rqv8euml': {
      'en':
          '2.1 Registration: To access certain features, you may need to create a user account. You agree to provide and complete information during the registration process and to keep your account information up to date.\n\n2.2 Account Security: You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use or suspected breach of security.',
      'ar':
          '2.1 التسجيل: للوصول إلى ميزات معينة، قد تحتاج إلى إنشاء حساب مستخدم. أنت توافق على تقديم واستكمال المعلومات أثناء عملية التسجيل والحفاظ على تحديث معلومات حسابك.\n\n2.2 أمان الحساب: أنت مسؤول عن الحفاظ على سرية بيانات اعتماد حسابك وعن جميع الأنشطة التي تحدث ضمن حسابك. أنت توافق على إخطارنا فورًا بأي استخدام غير مصرح به أو خرق أمني مشتبه به.',
    },
    'aw0nbt1s': {
      'en': '3. User Responsibilities',
      'ar': '3. مسؤوليات المستخدم',
    },
    '5q3metzf': {
      'en':
          '3.1 You are responsible for your interactions with other users on BrainTech. We reserve the right to monitor user activity and take appropriate action if violations of these Terms are identified.\n\n3.2 You shall not engage in any activity that may interfere with or disrupt the functioning of BrainTech or compromise its security.',
      'ar':
          '3.1 أنت مسؤول عن تفاعلاتك مع المستخدمين الآخرين على BrainTech. نحن نحتفظ بالحق في مراقبة نشاط المستخدم واتخاذ الإجراء المناسب في حالة اكتشاف انتهاكات لهذه الشروط.\n\n3.2 لا يجوز لك المشاركة في أي نشاط قد يتعارض مع عمل BrainTech أو يعطله أو يعرض أمنه للخطر.',
    },
    'duat7rxq': {
      'en': '4. Limitations',
      'ar': '4. القيود',
    },
    'ma4hpn24': {
      'en':
          'BrainTech provides the platform on an \"as is\" and \"as available\" basis. We do not warrant that the platform will be error-free, uninterrupted, or free from viruses or other harmful components.',
      'ar':
          'توفر BrainTech النظام الأساسي \"كما هو\" و\"كما هو متاح\". نحن لا نضمن أن النظام الأساسي سيكون خاليًا من الأخطاء أو غير منقطع أو خاليًا من الفيروسات أو المكونات الضارة الأخرى.',
    },
    'm6l55kye': {
      'en': '5. Changes to the Terms',
      'ar': '5. التغييرات في الشروط',
    },
    'os4a69gy': {
      'en':
          'We reserve the right to modify or update these Terms at any time. We will provide notice of significant changes through BrainTech or other means. Your continued use of the platform after such changes indicates your acceptance of the modified Terms.',
      'ar':
          'نحن نحتفظ بالحق في تعديل أو تحديث هذه الشروط في أي وقت. سنقدم إشعارًا بالتغييرات المهمة من خلال BrainTech أو وسائل أخرى. يشير استمرار استخدامك للمنصة بعد هذه التغييرات إلى موافقتك على الشروط المعدلة.',
    },
    'c6tap30i': {
      'en': 'Terms Of Service',
      'ar': 'شروط الخدمة',
    },
    'ejuykjmj': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // DiscussionPage
  {
    'z5dyfm2l': {
      'en': 'Randy Mcdonald',
      'ar': 'راندي ماكدونالد',
    },
    '47s9s9ma': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar':
          'لقد كان هذا رائعًا حقًا، وأنا سعيد جدًا لأننا تمكنا من اللحاق في نهاية هذا الأسبوع.',
    },
    'tx773ss6': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': 'الاثنين. 3 يوليو - 4:12 مساءً',
    },
    'ksj2xor5': {
      'en': 'Randy Mcdonald',
      'ar': 'راندي ماكدونالد',
    },
    'jjyqmnqb': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar':
          'لقد كان هذا رائعًا حقًا، وأنا سعيد جدًا لأننا تمكنا من اللحاق في نهاية هذا الأسبوع.',
    },
    'ltogq4p8': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': 'الاثنين. 3 يوليو - 4:12 مساءً',
    },
    'xgaemhv6': {
      'en': 'Randy Mcdonald',
      'ar': 'راندي ماكدونالد',
    },
    '6xhp07kz': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar':
          'لقد كان هذا رائعًا حقًا، وأنا سعيد جدًا لأننا تمكنا من اللحاق في نهاية هذا الأسبوع.',
    },
    'r2nmd62a': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': 'الاثنين. 3 يوليو - 4:12 مساءً',
    },
    'cf89n1d3': {
      'en': 'Randy Mcdonald',
      'ar': 'راندي ماكدونالد',
    },
    '4lshy4b2': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar':
          'لقد كان هذا رائعًا حقًا، وأنا سعيد جدًا لأننا تمكنا من اللحاق في نهاية هذا الأسبوع.',
    },
    'byi44osm': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': 'الاثنين. 3 يوليو - 4:12 مساءً',
    },
    'tduo0h79': {
      'en': 'My Chats',
      'ar': 'دردشاتي',
    },
    'r6ha24lz': {
      'en': '__',
      'ar': '__',
    },
  },
  // finishpage
  {
    '18329hxj': {
      'en': 'Congrats!',
      'ar': 'تهاني!',
    },
    'oo9w7qh4': {
      'en': 'Go Home',
      'ar': 'عودة  للرئيسية',
    },
  },
  // createQuiz
  {
    'mad20gb9': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ui3yggg9': {
      'en': 'Enter the title here..',
      'ar': 'أدخل العنوان هنا ..',
    },
    'gnblggg6': {
      'en': 'Duration',
      'ar': 'مدة',
    },
    'jzt3fkcd': {
      'en': 'Enter the duration here in seconds..',
      'ar': 'أدخل المدة هنا بالثواني..',
    },
    'cy27bdfz': {
      'en': 'Create set',
      'ar': 'إنشاء مجموعة',
    },
    'v7r58uq8': {
      'en': 'Available sets',
      'ar': 'الاختبارات المتاحة',
    },
    'uyjgvsem': {
      'en': 'Create quiz',
      'ar': 'إنشاء اختبار',
    },
    '8e2i0nto': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // C101
  {
    'f4tawmdd': {
      'en': '1 Introduction to Computer Programming',
      'ar': 'مقدمة',
    },
    'av3ucy2r': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // C102
  {
    '00m7mpek': {
      'en': '2 Introduction To Problem Solving',
      'ar': 'مقدمة لحل المشكلات',
    },
    'we35s2fo': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // C103
  {
    'c1xvavdl': {
      'en': '3 Fundementals - Numeric Data',
      'ar': 'الأساسيات - البيانات الرقمية',
    },
    'urg6y0mk': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // C104
  {
    'n0vo2abn': {
      'en': '4 Fundementals - Arrays',
      'ar': '04 الأساسيات - المصفوفات',
    },
    '135pcxgp': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // C105
  {
    'mt2vawrh': {
      'en': '5 Fundementals - String',
      'ar': '05 الأساسيات - السلسلة',
    },
    'ju2j76j9': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // chat_2_Details
  {
    'irzzdyt6': {
      'en': 'Group Chat',
      'ar': 'مجموعة محادثة',
    },
    '898vm4px': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // chat_2_main
  {
    'iriq0lp0': {
      'en': 'Below are your chats and group chats',
      'ar': 'فيما يلي الدردشات والمحادثات الجماعية الخاصة بك',
    },
    'f09uu8za': {
      'en': 'My Chats',
      'ar': 'دردشاتي',
    },
    'jvhkftt7': {
      'en': '__',
      'ar': '__',
    },
  },
  // chat_2_InviteUsers
  {
    'qsx5exg0': {
      'en': 'Invite Friends',
      'ar': 'ادعو أصدقاء',
    },
    'ig07fdxc': {
      'en': 'Selected',
      'ar': 'المحدد',
    },
    'd9i9txrr': {
      'en': 'Invite Friends',
      'ar': 'ادعو أصدقاء',
    },
    'sop0w9w0': {
      'en': 'Select users from below to start a chat.',
      'ar': 'حدد المستخدمين من الأسفل لبدء الدردشة.',
    },
    'y3ulzi50': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // image_Details
  {
    '4d5mx1ve': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // learningMaterialDT
  {
    'sf3q77dd': {
      'en': 'Videos',
      'ar': 'مقاطعال فيديو',
    },
    'qol56f5t': {
      'en': 'Search...',
      'ar': 'البحث...',
    },
    'lyxpt61s': {
      'en': '4.25',
      'ar': '4.25',
    },
    'pk254f0q': {
      'en': 'Library',
      'ar': 'المكتبة',
    },
    'y3j2ijuf': {
      'en': 'Quizzez',
      'ar': 'الاختبارات',
    },
    'i45vrh62': {
      'en': 'Data Structures',
      'ar': 'البرمجة الشيئية',
    },
    '8bxi4ndd': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // C201
  {
    'v8cele6o': {
      'en': '1 Introduction to Object Oriented Programming',
      'ar': '',
    },
    'jrrmknr1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C202
  {
    'vrnc6man': {
      'en': '2 Methods in Java',
      'ar': '',
    },
    'wltvfq8a': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C203
  {
    'l4mtnu7i': {
      'en': '3 Classes and Objects',
      'ar': '',
    },
    'fe6ui9q4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C204
  {
    '76mce0p7': {
      'en': '4 Classes and Other Concepts',
      'ar': '',
    },
    'brc61af1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C205
  {
    'kwgrgdse': {
      'en': '5 Relationships among Classes',
      'ar': '',
    },
    'otb1mdvt': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C301
  {
    'dziq613h': {
      'en': '1 Introduction to Data Structures',
      'ar': '',
    },
    '6sa2ovs3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C302
  {
    '673q27ag': {
      'en': '2 Algorithm Analysis',
      'ar': '',
    },
    't66mli0b': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C303
  {
    'ixmmmczh': {
      'en': '3 Linked Lists - Part 1',
      'ar': '',
    },
    'wk0zzc3p': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C304
  {
    '2ok4zqdu': {
      'en': '4 Linked List - Part 2',
      'ar': '',
    },
    '6xflt9q2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // C305
  {
    'ehh7hiqa': {
      'en': '5 Linked List - Part 3',
      'ar': '',
    },
    '9xl4hvbj': {
      'en': 'Home',
      'ar': '',
    },
  },
  // menu
  {
    'h9jxnp9a': {
      'en': 'Personal Account ',
      'ar': 'حساب شخصي',
    },
    'cjm1nbyg': {
      'en': 'Favorite list',
      'ar': 'القائمة المفضلة',
    },
    '016mtc1b': {
      'en': 'Discussion board',
      'ar': 'لوحة النقاش',
    },
    '9u75mweu': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    '51vyxsbq': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
  },
  // rateQuiz
  {
    'jofevtbh': {
      'en': 'How was the Quiz?',
      'ar': 'كيف كان الاختبار؟',
    },
    'nrf2wihi': {
      'en': 'Give us your honest feedback!',
      'ar': 'أعطنا ملاحظاتك بكل صدق!',
    },
    'u6ifi7au': {
      'en': 'Leave a comment..',
      'ar': 'اترك تعليقا..',
    },
    'hqn36zo1': {
      'en': 'submit',
      'ar': 'تسليم',
    },
  },
  // chat_DetailsOverlay
  {
    'cqvtpbx5': {
      'en': 'Group Chat ID: ',
      'ar': 'معرف الدردشة الجماعية:',
    },
    'jg7is68v': {
      'en': 'In this chat',
      'ar': 'في هذه الدردشة',
    },
    '24j26pzl': {
      'en': 'Close',
      'ar': 'يغلق',
    },
  },
  // chat_ThreadComponent
  {
    'wxi1zc8r': {
      'en': 'Start typing here...',
      'ar': 'ابدأ بالكتابة هنا...',
    },
    'n6irfix8': {
      'en': 'You must enter a message...',
      'ar': 'يجب عليك إدخال رسالة...',
    },
    'uinhc8t3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // user_ListSmall
  {
    'rl3evtgt': {
      'en': 'ME',
      'ar': 'أنا',
    },
  },
  // deleteDialog
  {
    'vpwity6o': {
      'en': 'Options',
      'ar': 'خيارات',
    },
    'zaks648k': {
      'en': 'Invite Users',
      'ar': 'دعوة المستخدمين',
    },
    '5ihdh1df': {
      'en': 'Delete Chat',
      'ar': 'حذف الدردشة',
    },
    'mh74pqq3': {
      'en': 'Confirm Delete',
      'ar': 'تأكيد الحذف',
    },
    'fcdcbj6b': {
      'en': 'You can\'t undo this action.',
      'ar': 'لا يمكنك التراجع عن هذا الإجراء.',
    },
    'id3lww6u': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
  },
  // Miscellaneous
  {
    'p0qegv3d': {
      'en': '',
      'ar': '',
    },
    'xnbio425': {
      'en': '',
      'ar': '',
    },
    '90n7flxl': {
      'en': '',
      'ar': '',
    },
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
