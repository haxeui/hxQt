package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import haxe.Constraints.Function;
import qt.core.Object.QObject;
import qt.core.QString;

class LineEdit extends Widget {
    public function new() {
        if (_ref == null) {
            _ref = QLineEdit.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var text(get, set):String;
    private function get_text():String {
        var s = lineEditRef.ptr.text();
        return Helper.toString(s);
    }
    private function set_text(value:String):String {
        lineEditRef.ptr.setText(qt.core.QString.Helper.fromString(value));
        return value;
    }
    
    public var placeholderText(get, set):String;
    private function get_placeholderText():String {
        var s = lineEditRef.ptr.placeholderText();
        return Helper.toString(s);
    }
    private function set_placeholderText(value:String):String {
        lineEditRef.ptr.setPlaceholderText(qt.core.QString.Helper.fromString(value));
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Signals
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function connectTextChanged(fn:Function) {
        var p:Pointer<QLineEdit> = _ref.reinterpret();
        QObject.connect(p.ptr, QLineEdit.textChanged, p.ptr, fn);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var lineEditRef(get, null):Pointer<QLineEdit>;
    private function get_lineEditRef():Pointer<QLineEdit> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QLineEdit.h')
@:native('QLineEdit')
@:structAccess
extern class QLineEdit extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QLineEdit")           private static function _new():RawPointer<QLineEdit>;
                                        public static inline function createInstance():Pointer<QLineEdit> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function text():QString;
    public function setText(value:Reference<QString>):Void;
    public function placeholderText():QString;
    public function setPlaceholderText(value:Reference<QString>):Void;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Signals
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("&QLineEdit::textChanged") public static var textChanged:Function;
}