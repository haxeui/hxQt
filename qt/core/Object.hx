package qt.core;

import cpp.ConstStar;
import cpp.Pointer;
import cpp.RawPointer;
import haxe.Constraints.Function;
import qt.proxy.EventRecieverProxy;

class Object {
    private var _ref:Pointer<QObject>;
    private var _eventRecieverProxy:Pointer<EventRecieverProxy>;
    
    public function new() {
        if (_ref == null) {
            _ref = QObject.createInstance().reinterpret();
        }
        _eventRecieverProxy = EventRecieverProxy.createInstance();
        _eventRecieverProxy.ptr.callback = eventCallback;
    }
    
    public function destroy() {
        if (_ref != null) {
            _ref.destroy();
            _ref = null;
        }
        if (_eventRecieverProxy != null) {
            _eventRecieverProxy.destroy();
            _eventRecieverProxy = null;
        }
    }
    
    private function eventCallback() {
        var lastEvent:Event = Event.fromRef(Pointer.fromRaw(_eventRecieverProxy.ptr.lastEvent));
        event(lastEvent);
    }
    
    private function event(event:Event) {
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtCore/QObject.h')
@:native('QObject')
extern class QObject {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QObject")             private static function _new():RawPointer<QObject>;
                                        public static inline function createInstance():Pointer<QObject> {
                                            return Pointer.fromRaw(_new());
                                        }
    @:native('QObject::connect') public static function connect(sender:ConstStar<QObject>, signal:Any, receiver:ConstStar<QObject>, member:Function):cpp.Void;
}
