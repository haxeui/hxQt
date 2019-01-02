package qt.layout;

import cpp.Pointer;
import cpp.RawPointer;

class HBoxLayout extends BoxLayout {
    public function new() {
        if (_ref == null) {
            _ref = QHBoxLayout.createInstance().reinterpret();
        }
        
        super(qt.layout.BoxLayout.Direction.TopToBottom);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var hboxLayoutRef(get, null):Pointer<QHBoxLayout>;
    private function get_hboxLayoutRef():Pointer<QHBoxLayout> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QBoxLayout.h')
@:native('QHBoxLayout')
extern class QHBoxLayout extends qt.layout.BoxLayout.QBoxLayout {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QHBoxLayout")         private static function _new():RawPointer<QHBoxLayout>;
                                        public static inline function createInstance():Pointer<QHBoxLayout> {
                                            return Pointer.fromRaw(_new());
                                        }
}

