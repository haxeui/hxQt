package qt.gui;
import cpp.Char;
import cpp.ConstStar;
import cpp.NativeArray;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import cpp.StdString;
import haxe.Resource;
import qt.core.ByteArray.QByteArray;
import qt.gui.PaintDevice;

class Pixmap extends PaintDevice {
    public function new() {
        if (_ref == null) {
            _ref = QPixmap.createInstance().reinterpret();
        }
        
        super();
    }
    
    public function loadFromData(data:QByteArray):Bool {
        return pixmapRef.ptr.loadFromData(data);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var pixmapRef(get, null):Pointer<QPixmap>;
    private function get_pixmapRef():Pointer<QPixmap> {
        return _ref.reinterpret();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Static Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static function fromResource(resourceId:String):Pixmap {
        var imageBytes = Resource.getBytes(resourceId);
//        var stringData = imageBytes.toString();
//        var qba:QByteArray = QByteArray.fromRawData(stringData, stringData.length);
        var p = NativeArray.address(imageBytes.getData(), 0);
        var qba:QByteArray = untyped __cpp__("QByteArray::fromRawData((const char *){0}, {1})", p.raw, imageBytes.length);
//        var qba:QByteArray = QByteArray.fromRawData(imageBytes.getData(), imageBytes.length);
//        var qba:QByteArray = QByteArray.fromStdString(StdString.ofString(stringData));
        var pixmap = new Pixmap();
        pixmap.loadFromData(qba);
        return pixmap;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtGui/QPixmap.h')
@:native('QPixmap')
@:structAccess
extern class QPixmap extends qt.gui.PaintDevice.QPaintDevice {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QPixmap")             private static function _new():RawPointer<QPixmap>;
                                        public static inline function createInstance():Pointer<QPixmap> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function loadFromData(data:Reference<QByteArray>):Bool;
}