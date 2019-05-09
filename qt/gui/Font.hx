package qt.gui;

import cpp.Pointer;
import cpp.RawPointer;

class Font {
    private var _ref:Pointer<QFont>;
    
    public function new() {
    }
    
    public var pointSize(get, set):Int;
    private function get_pointSize():Int {
        return fontRef.ptr.pointSize();
    }
    private function set_pointSize(value:Int):Int {
        fontRef.ptr.setPointSize(value);
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var fontRef(get, null):Pointer<QFont>;
    private function get_fontRef():Pointer<QFont> {
        return _ref.reinterpret();
    }
    
    public static function fromRef(ref:Pointer<QFont>):Font {
        var font = new Font();
        font._ref = ref;
        return font;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:include('QtGui/QFont.h')
@:native('QFont')
extern class QFont {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QFont")               private static function _new():RawPointer<QFont>;
                                        public static inline function createInstance():Pointer<QFont> {
                                            return Pointer.fromRaw(_new());
                                        }

    public function pointSize():Int;
    public function setPointSize(value:Int):Void;
}