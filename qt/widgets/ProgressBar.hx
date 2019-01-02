package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;

class ProgressBar extends Widget {
    public function new() {
        if (_ref == null) {
            _ref = QProgressBar.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var value(null, set):Int;
    private function set_value(value:Int):Int {
        progressBarRef.ptr.setValue(value);
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var progressBarRef(get, null):Pointer<QProgressBar>;
    private function get_progressBarRef():Pointer<QProgressBar> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QProgressBar.h')
@:native('QProgressBar')
@:structAccess
extern class QProgressBar extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QProgressBar")        private static function _new():RawPointer<QProgressBar>;
                                        public static inline function createInstance():Pointer<QProgressBar> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setValue(value:Int):Void;
}