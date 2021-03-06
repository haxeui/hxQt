package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import qt.widgets.AbstractButton.QAbstractButton;

class CheckBox extends AbstractButton {
    public function new() {
        if (_ref == null) {
            _ref = QCheckBox.createInstance().reinterpret();
        }
        
        super();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var checkBoxRef(get, null):Pointer<QCheckBox>;
    private function get_checkBoxRef():Pointer<QCheckBox> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QCheckBox.h')
@:native('QCheckBox')
@:structAccess
extern class QCheckBox extends qt.widgets.AbstractButton.QAbstractButton {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QCheckBox")           private static function _new():RawPointer<QCheckBox>;
                                        public static inline function createInstance():Pointer<QCheckBox> {
                                            return Pointer.fromRaw(_new());
                                        }
}