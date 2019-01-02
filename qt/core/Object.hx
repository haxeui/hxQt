package qt.core;

import cpp.ConstStar;
import cpp.Pointer;
import haxe.Constraints.Function;

class Object {
    public var _ref:Pointer<QObject>;
    
    public function new() {
    }
    
    public function destroy() {
        if (_ref != null) {
            _ref.destroy();
            _ref = null;
        }
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtCore/QObject.h')
@:native('QObject')
extern class QObject {
    @:native('QObject::connect') public static function connect(sender:ConstStar<QObject>, signal:Any, receiver:ConstStar<QObject>, member:Function):cpp.Void;
}
