class  DepartmentControl {
String guidance='guidance';
  Map <String,String> names = {
    'guidance':'قسم الأرشاد',
    'awereness':'قسم التوعية',
    'technology':'قسم التكنولوجيا',
    'successStories':'قصص نجاح والمستفيدين من كورونا',
    'coronaBenefits':'فوائد كورونا',
    'departmentOfDiseases':'قسم الأمراض'
  };

  Map <String,String> description = {
    'guidance':'في هذا القسم سوف تتعرف على الوقاية من كوفيد-19 وكذلك الوقاية من هذا المرض و الوسائل المتاحة لأنتشار هذا المرض',
    'awereness':'في هذا القسم ستجد الأجوبة حول اكثر التساؤلات و تصحيح لمفاهيم خاطئة حول بعض الأشياء وكذلك طريقة الأدامة الصحيحة للكمامة',
    'technology':'في هذا القسم سوف نتكلم عن اهم التقنيات المستخدمة للمساعدة في الحد من مرض كورونا وكذلك عمل بعض بالدول في استخدام التكنلوجيا لتقليل انتشار المرض',
    'successStories':'في هذا القسم ستجد قصص اشخاص حققو نجاح اثناء فترة بقائهم في المنزل كذلك اهم المستفيدون من مرض كورونا',
    'coronaBenefits':'في هذا القسم سنتكلم عن وضع العالم بعد كورونا كذلك وضع الأرض وماذا استفادت و فائدة الحجر الصحي',
    'departmentOfDiseases':'في هذا القسم سنتكلم الامراض المشابه لكرورنا وماذا ينبغي ان تفعل اذا كانت لديك من هذه الاعراض'
  };
  Map <String,String> iamges = {
    'guidance':'images/guidance.png',
    'awereness':'images/awereness.png',
    'technology':'images/technology.png',
    'successStories':'images/successStories.png',
    'coronaBenefits':'images/coronaBenefits.png',
    'departmentOfDiseases':'images/departmentOfDiseases.png'
  };

Map <String,String> routeName = {
  'guidance':'/showGuidanceDepartment',
  'awereness':'/showAwerenessDepartment',
  'technology':'/AllPageOfTecnology',
  'successStories':'/AllPageOfSeccesss',
  'coronaBenefits':'/showCoronaBenefitsDepartment',
  'departmentOfDiseases':'/showDiseasesDepartment'
};




}