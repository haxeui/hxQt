package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import qt.widgets.AbstractButton.QAbstractButton;

class PushButton extends AbstractButton {
    public function new() {
        if (_ref == null) {
            _ref = QPushButton.createInstance().reinterpret();
        }
        
        super();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var pushButtonRef(get, null):Pointer<QPushButton>;
    private function get_pushButtonRef():Pointer<QPushButton> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QPushButton.h')
@:native('QPushButton')
extern class QPushButton extends qt.widgets.AbstractButton.QAbstractButton {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QPushButton")         private static function _new():RawPointer<QPushButton>;
                                        public static inline function createInstance():Pointer<QPushButton> {
                                            return Pointer.fromRaw(_new());
                                        }
}