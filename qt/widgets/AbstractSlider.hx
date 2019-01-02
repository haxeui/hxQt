package qt.widgets;

import cpp.Pointer;
import qt.core.Orientation;

class AbstractSlider extends Widget {
    public function new() {
        super();
    }
    
    public var value(null, set):Int;
    private function set_value(value:Int):Int {
        abstractSliderRef.ptr.setValue(value);
        return value;
    }
    
    public var orientation(null, set):Orientation;
    private function set_orientation(value:Orientation):Orientation {
        abstractSliderRef.ptr.setOrientation(value);
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var abstractSliderRef(get, null):Pointer<QAbstractSlider>;
    private function get_abstractSliderRef():Pointer<QAbstractSlider> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QAbstractSlider.h')
@:native('QAbstractSlider')
@:structAccess
extern class QAbstractSlider extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setValue(value:Int):Void;
    public function setOrientation(value:Orientation):Void;
}