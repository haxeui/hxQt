package qt.core;
import cpp.ConstCharStar;
import cpp.Pointer;
import cpp.StdString;

class ByteArray {
    public var _ref:Pointer<QByteArray>;
    
    public function new() {
    }
}

@:unreflective
@:include('QtCore/QByteArray.h')
@:native('QByteArray')
@:structAccess
extern class QByteArray {
    @:native("QByteArray::fromRawData")     public static function fromRawData(data:ConstCharStar, size:Int):QByteArray;
    @:native("QByteArray::fromStdString")   public static function fromStdString(data:StdString):QByteArray;
}
