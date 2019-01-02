package qt.core;

import cpp.Callable;
import cpp.ConstCharStar;
import cpp.ConstPointer;
import cpp.ConstStar;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import cpp.Star;
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

@:unreflective
@:include('QtCore/qobject.h')
@:native('QObject')
extern class QObject {
    @:native('QObject::connect') public static function connect(sender:ConstStar<QObject>, signal:Any, receiver:ConstStar<QObject>, member:Function):cpp.Void;
}
