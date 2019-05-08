package qt.core;

import cpp.Pointer;
import cpp.RawPointer;
import qt.styles.Style;

@:buildXml("<include name=\"${haxelib:hxQt}/Build.xml\" />")
@:include('QtWidgets/qapplication.h')
class Application extends GuiApplication {
    public function new() {
        untyped __cpp__('char *argv[] = {NULL};');
        untyped __cpp__('int argc = sizeof(argv) / sizeof(char*) - 1;');
        _ref = untyped __cpp__('new QApplication(argc, argv)');
        super();
    }
    
    public static var style(null, set):Style;
    private static function set_style(value:Style):Style {
        QApplication.setStyle(value.styleRef.get_raw());
        return value;
    }
    
    public function exec() {
        applicationRef.ptr.exec();
    }
    
    @:access(qt.core.Object)
    public function postEvent(receiver:Object, event:Event) {
        var objPtr:Pointer<qt.core.Object.QObject> = receiver._eventRecieverProxy.reinterpret();
        var eventPtr = event.eventRef;
        applicationRef.ptr.postEvent(objPtr.raw, eventPtr.raw);
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
extern class QApplication extends qt.core.GuiApplication.QGuiApplication {
    public function exec():Void;
    public function postEvent(receiver:RawPointer<qt.core.Object.QObject>, event:RawPointer<qt.core.Event.QEvent>):Void;
    
    @:native("QApplication::setStyle") public static function setStyle(style:RawPointer<qt.styles.Style.QStyle>):Void;
}
