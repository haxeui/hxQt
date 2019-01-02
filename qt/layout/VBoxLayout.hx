package qt.layout;

import cpp.Pointer;
import cpp.RawPointer;

class VBoxLayout extends BoxLayout {
    public function new() {
        if (_ref == null) {
            _ref = QVBoxLayout.createInstance().reinterpret();
        }
        
        super(qt.layout.BoxLayout.Direction.LeftToRight);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var vboxLayoutRef(get, null):Pointer<QVBoxLayout>;
    private function get_vboxLayoutRef():Pointer<QVBoxLayout> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QBoxLayout.h')
@:native('QVBoxLayout')
extern class QVBoxLayout extends qt.layout.BoxLayout.QBoxLayout {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QVBoxLayout")         private static function _new():RawPointer<QVBoxLayout>;
                                        public static inline function createInstance():Pointer<QVBoxLayout> {
                                            return Pointer.fromRaw(_new());
                                        }
}

