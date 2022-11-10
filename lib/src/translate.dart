
import 'translation.dart';

String $(String key) {
  if(JsonTranslation.transCtx == null){
    throw Exception(
      """You must call JsonTranslations.init(context) at the top level Screen of your application before using the '\$' function to translate keywords."""
    );
  }
  return JsonTranslation.transCtx!.translate(key);
}
