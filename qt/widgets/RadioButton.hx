package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import qt.widgets.AbstractButton.QAbstractButton;

class RadioButton extends AbstractButton {
    public function new() {
        if (_ref == null) {
            _ref = QRadioButton.createInstance().reinterpret();
        }
        
        super();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var radioButtonRef(get, null):Pointer<QRadioButton>;
    private function get_radioButtonRef():Pointer<QRadioButton> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QRadioButton.h')
@:native('QRadioButton')
@:structAccess
extern class QRadioButton extends qt.widgets.AbstractButton.QAbstractButton {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QRadioButton")        private static function _new():RawPointer<QRadioButton>;
                                        public static inline function createInstance():Pointer<QRadioButton> {
                                            return Pointer.fromRaw(_new());
                                        }
}