package qt.core;

@:unreflective
@:include('QtCore/QString.h')
@:native('QString')
extern class QString {
}

class Helper {
    public static function fromString(value:String):QString {
        return untyped __cpp__('(QString)value.c_str()');
    }
}