package qt.core;
import cpp.ConstCharStar;
import cpp.StdString;

@:unreflective
@:include('QtCore/QString.h')
@:native('QString')
@:structAccess
extern class QString {
    public function data():ConstCharStar;
    public function toStdString():StdString;
}

class Helper {
    public static function fromString(value:String):QString {
        return untyped __cpp__('(QString)value.c_str()');
    }
    
    public static function toString(value:QString):String {
        var stdString:StdString = untyped __cpp__('value.toStdString()');
        return stdString.toString();
    }
}