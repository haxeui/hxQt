package qt.styles;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;
import qt.core.QStringList;
import qt.styles.Style.QStyle;

@:access(qt.core.Object)
class StyleFactory {
    public static function create(key:String):Style {
        var pointer:RawPointer<QStyle> = QStyleFactory.create(qt.core.QString.Helper.fromString(key));
        var style = new Style();
        style._ref = Pointer.fromRaw(pointer).reinterpret();
        return style;
    }
    
    public static var keys(get, null):Array<String>;
    private static function get_keys():Array<String> {
        var k = [];
        var qsl:QStringList = QStyleFactory.keys();
        for (a in 0...qsl.count()) {
            k.push(Helper.toString(qsl.value(a)));
        }
        return k;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QStyleFactory.h')
@:native('QStyleFactory')
extern class QStyleFactory {
    @:native('QStyleFactory::create') public static function create(key:Reference<QString>):RawPointer<QStyle>;
    @:native('QStyleFactory::keys') public static function keys():QStringList;
}
