package qt.core;

import cpp.Pointer;
import cpp.RawPointer;
import qt.styles.Style;

@:include('QtWidgets/qapplication.h')
class Application {
    private var _ref:Pointer<QApplication>;
    
    public function new() {
        untyped __cpp__('char *argv[] = {NULL};');
        untyped __cpp__('int argc = sizeof(argv) / sizeof(char*) - 1;');
        _ref = untyped __cpp__('new QApplication(argc, argv)');
    }
    
    public static var style(null, set):Style;
    private static function set_style(value:Style):Style {
        QApplication.setStyle(value.styleRef.get_raw());
        return value;
    }
    
    public function exec() {
        _ref.ptr.exec();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var applicationRef(get, null):Pointer<QApplication>;
    private function get_applicationRef():Pointer<QApplication> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QApplication.h')
@:native('QApplication')
@:structAccess
extern class QApplication {
    public function exec():Void;
    @:native("QApplication::setStyle") public static function setStyle(style:RawPointer<qt.styles.Style.QStyle>):Void;
}