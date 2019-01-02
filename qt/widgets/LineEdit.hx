package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;

class LineEdit extends Widget {
    public function new() {
        if (_ref == null) {
            _ref = QLineEdit.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var text(null, set):String;
    private function set_text(value:String):String {
        lineEditRef.ptr.setText(qt.core.QString.Helper.fromString(value));
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var lineEditRef(get, null):Pointer<QLineEdit>;
    private function get_lineEditRef():Pointer<QLineEdit> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QLineEdit.h')
@:native('QLineEdit')
@:structAccess
extern class QLineEdit extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QLineEdit")           private static function _new():RawPointer<QLineEdit>;
                                        public static inline function createInstance():Pointer<QLineEdit> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setText(value:Reference<QString>):Void;
}