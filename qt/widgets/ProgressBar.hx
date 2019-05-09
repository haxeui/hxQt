package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import haxe.Constraints.Function;
import qt.core.Object.QObject;
import qt.core.Orientation;

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
    
    public var orientation(null, set):Orientation;
    private function set_orientation(value:Orientation):Orientation {
        progressBarRef.ptr.setOrientation(value);
        return value;
    }
    
    public function connectValueChanged(fn:Function) {
        var p:Pointer<QProgressBar> = _ref.reinterpret();
        QObject.connect(p.ptr, QProgressBar.valueChanged, p.ptr, fn);
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
    public function setOrientation(value:Orientation):Void;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Signals
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("&QProgressBar::valueChanged") public static var valueChanged:Function;
}