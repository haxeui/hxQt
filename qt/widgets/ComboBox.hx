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
        comboBoxRef.ptr.insertItem(index, qt.core.QString.Helper.fromString(text));
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
    public function insertItem(index:Int, text:Reference<QString>):Void;
}