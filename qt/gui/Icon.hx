package qt.gui;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.gui.Pixmap.QPixmap;

class Icon {
    private var _ref:Pointer<QIcon>;
    
    public function new(pixmap:Pixmap) {
        if (_ref == null) {
            _ref = QIcon.createInstance(pixmap.pixmapRef.ref).reinterpret();
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var iconRef(get, null):Pointer<QIcon>;
    private function get_iconRef():Pointer<QIcon> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtGui/QIcon.h')
@:native('QIcon')
@:structAccess
extern class QIcon {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QIcon")               private static function _new(pixmap:Reference<QPixmap>):RawPointer<QIcon>;
                                        public static inline function createInstance(pixmap:Reference<QPixmap>):Pointer<QIcon> {
                                            return Pointer.fromRaw(_new(pixmap));
                                        }
}