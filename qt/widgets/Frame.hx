package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;

class Frame extends Widget {
    public function new() {
        super();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var frameRef(get, null):Pointer<QFrame>;
    private function get_frameRef():Pointer<QFrame> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QFrame.h')
@:native('QFrame')
@:structAccess
extern class QFrame extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QFrame")              private static function _new():RawPointer<QFrame>;
                                        public static inline function createInstance():Pointer<QFrame> {
                                            return Pointer.fromRaw(_new());
                                        }
}