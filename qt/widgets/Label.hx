package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;

class Label extends Frame {
    public function new() {
        if (_ref == null) {
            _ref = QLabel.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var text(null, set):String;
    private function set_text(value:String):String {
        labelRef.ptr.setText(qt.core.QString.Helper.fromString(value));
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var labelRef(get, null):Pointer<QLabel>;
    private function get_labelRef():Pointer<QLabel> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QLabel.h')
@:native('QLabel')
@:structAccess
extern class QLabel extends qt.widgets.Frame.QFrame {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QLabel")              private static function _new():RawPointer<QLabel>;
                                        public static inline function createInstance():Pointer<QLabel> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setText(value:Reference<QString>):Void;
}