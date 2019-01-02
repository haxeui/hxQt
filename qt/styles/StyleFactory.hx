package qt.styles;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;
import qt.styles.Style.QStyle;

@:access(qt.core.Object)
class StyleFactory {
    public static function create(key:String):Style {
        var pointer:RawPointer<QStyle> = QStyleFactory.create(qt.core.QString.Helper.fromString(key));
        var style = new Style();
        style._ref = Pointer.fromRaw(pointer).reinterpret();
        return style;
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
}
