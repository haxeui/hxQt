package qt.layout;

import cpp.Pointer;
import cpp.RawPointer;

class Layout extends LayoutItem {
    public function new() {
        super();
    }
    
    public var spacing(null, set):Int;
    private function set_spacing(value:Int):Int {
        layoutRef.ptr.setSpacing(value);
        return value;
    }
    
    public function setContentsMargins(left:Int, top:Int, right:Int, bottom:Int) {
        layoutRef.ptr.setContentsMargins(left, top, right, bottom);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var layoutRef(get, null):Pointer<QLayout>;
    private function get_layoutRef():Pointer<QLayout> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QLayout.h')
@:native('QLayout')
@:structAccess
extern class QLayout extends qt.layout.LayoutItem.QLayoutItem {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QLayout")             private static function _new():RawPointer<QLayout>;
                                        public static inline function createInstance():Pointer<QLayout> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setSpacing(spacing:Int):Void;
    public function setContentsMargins(left:Int, top:Int, right:Int, bottom:Int):Void;
}