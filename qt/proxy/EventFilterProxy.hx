package qt.proxy;

import cpp.Pointer;
import cpp.RawPointer;
import qt.core.Event;
import qt.core.EventType;
import qt.core.Object;

class EventFilterProxy extends Object {
    
    public function new() {
        if (_ref == null) {
            _ref = QEventFilterProxy.createInstance().reinterpret();
        }
        super();
    }

    private var _onEvent:Object->Event->Bool = null;
    public var onEvent(get, set):Object->Event->Bool;
    private function get_onEvent():Object->Event->Bool {
        return _onEvent;
    }
    private function set_onEvent(value:Object->Event->Bool):Object->Event->Bool {
        if (_onEvent == null) {
            eventFilterProxyRef.ptr.onEvent = onEventInternal;
        }
        _onEvent = value;
        return value;
    }
    
    @:access(qt.core.Event)
    private function onEventInternal() {
        var currentObj = eventFilterProxyRef.ptr.currentObj;
        var currentEvent = eventFilterProxyRef.ptr.currentEvent;
        var event = Event.fromRef(Pointer.fromRaw(eventFilterProxyRef.ptr.currentEvent));
        
        eventFilterProxyRef.ptr.currentReturn = false;
        if (_onEvent != null) {
            eventFilterProxyRef.ptr.currentReturn = _onEvent(null, event);
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    private var eventFilterProxyRef(get, null):Pointer<QEventFilterProxy>;
    private function get_eventFilterProxyRef():Pointer<QEventFilterProxy> {
        return _ref.reinterpret();
    }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QEventFilterProxy.h')
@:native('QEventFilterProxy')
@:structAccess
extern class QEventFilterProxy extends QObject {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QEventFilterProxy")   private static function _new():RawPointer<QEventFilterProxy>;
                                        public static inline function createInstance():Pointer<QEventFilterProxy> {
                                            return Pointer.fromRaw(_new());
                                        }
    public var onEvent:Dynamic;
    public var currentObj:RawPointer<QObject>;
    public var currentEvent:RawPointer<QEvent>;
    public var currentReturn:Bool;
}
