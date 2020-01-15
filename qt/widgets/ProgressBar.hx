package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import haxe.Constraints.Function;
import qt.core.Object.QObject;
import qt.core.Orientation;
import qt.core.QString;
import qt.widgets.Widget.QWidget;

class ProgressBar extends Widget {
    public function new() {
        if (_ref == null) {
            _ref = QProgressBar.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var value(get, set):Int;
    private function get_value():Int {
        return progressBarRef.ptr.value();
    }
    private function set_value(value:Int):Int {
        progressBarRef.ptr.setValue(value);
        return value;
    }
    
    public var minimum(get, set):Int;
    private function get_minimum():Int {
        return progressBarRef.ptr.minimum();
    }
    private function set_minimum(value:Int):Int {
        progressBarRef.ptr.setMinimum(value);
        return value;
    }
    
    public var maximum(get, set):Int;
    private function get_maximum():Int {
        return progressBarRef.ptr.maximum();
    }
    private function set_maximum(value:Int):Int {
        progressBarRef.ptr.setMaximum(value);
        return value;
    }
    
    public var orientation(null, set):Orientation;
    private function set_orientation(value:Orientation):Orientation {
        progressBarRef.ptr.setOrientation(value);
        return value;
    }
    
    public var format(null, set):String;
    private function set_format(value:String):String {
        progressBarRef.ptr.setFormat(Helper.fromString(value));
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
extern class QProgressBar extends QWidget {
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
    public function value():Int;
    public function setOrientation(value:Orientation):Void;
    public function setFormat(value:Reference<QString>):Void;

    public function setMinimum(value:Int):Void;
    public function minimum():Int;
    public function setMaximum(value:Int):Void;
    public function maximum():Int;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Signals
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("&QProgressBar::valueChanged") public static var valueChanged:Function;
}