package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import haxe.Constraints.Function;
import qt.core.Object.QObject;
import qt.core.QString;

class AbstractButton extends Widget {
    public function new() {
        super();
    }
    
    public var text(null, set):String;
    private function set_text(value:String):String {
        abstractButtonRef.ptr.setText(qt.core.QString.Helper.fromString(value));
        return value;
    }
    
    public function connectClicked(fn:Function) {
        var p:Pointer<QAbstractButton> = _ref.reinterpret();
        QObject.connect(p.ptr, QAbstractButton.clicked, p.ptr, fn);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var abstractButtonRef(get, null):Pointer<QAbstractButton>;
    private function get_abstractButtonRef():Pointer<QAbstractButton> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/qabstractbutton.h')
@:native('QAbstractButton')
@:structAccess
extern class QAbstractButton extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QAbstractButton")     private static function _new():RawPointer<QAbstractButton>;
                                        public static inline function createInstance():Pointer<QAbstractButton> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setText(value:Reference<QString>):Void;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Signals
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("&QAbstractButton::clicked") public static var clicked:Function;
}