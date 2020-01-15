package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.gui.Pixmap;
import qt.gui.Pixmap.QPixmap;
import qt.core.QString;
import qt.widgets.Frame.QFrame;

class Label extends Frame {
    public function new() {
        if (_ref == null) {
            _ref = QLabel.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var text(null, set):String;
    private function set_text(value:String):String {
        labelRef.ptr.setText(Helper.fromString(value));
        return value;
    }
    
    private var _pixmap:Pixmap = null;
    public var pixmap(null, set):Pixmap;
    private function set_pixmap(value:Pixmap):Pixmap {
        if (_pixmap != null) {
            _pixmap.pixmapRef.destroy();
            _pixmap = null;
        }
        labelRef.ptr.setPixmap(value.pixmapRef.ref);
        _pixmap = value;
        return value;
    }
    
    public var pixmapResource(null, set):String;
    private function set_pixmapResource(value:String):String {
        this.pixmap = Pixmap.fromResource(value);
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var labelRef(get, null):Pointer<QLabel>;
    private function get_labelRef():Pointer<QLabel> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QLabel.h')
@:native('QLabel')
@:structAccess
extern class QLabel extends QFrame {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QLabel")              private static function _new():RawPointer<QLabel>;
                                        public static inline function createInstance():Pointer<QLabel> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setText(value:Reference<QString>):Void;
    public function setPixmap(value:Reference<QPixmap>):Void;
}