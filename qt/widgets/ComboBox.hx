package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;

class ComboBox extends Widget {
    public function new() {
        if (_ref == null) {
            _ref = QComboBox.createInstance().reinterpret();
        }
        
        super();
    }
    
    public function insertItem(index:Int, text:String) {
        comboBoxRef.ptr.insertItem(index, Helper.fromString(text));
    }
    
    public function addItem(text:String) {
        comboBoxRef.ptr.addItem(Helper.fromString(text));
    }
    
    public var currentIndex(null, set):Int;
    private function set_currentIndex(value:Int):Int {
        comboBoxRef.ptr.setCurrentIndex(value);
        return value;
    }
    
    public function clear() {
        comboBoxRef.ptr.clear();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var comboBoxRef(get, null):Pointer<QComboBox>;
    private function get_comboBoxRef():Pointer<QComboBox> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QComboBox.h')
@:native('QComboBox')
@:structAccess
extern class QComboBox extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QComboBox")           private static function _new():RawPointer<QComboBox>;
                                        public static inline function createInstance():Pointer<QComboBox> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addItem(text:Reference<QString>):Void;
    public function insertItem(index:Int, text:Reference<QString>):Void;
    public function clear():Void;
    public function setCurrentIndex(index:Int):Void;
}