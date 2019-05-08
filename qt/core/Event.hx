package qt.core;

import cpp.Pointer;
import cpp.RawPointer;

class Event {
    private var _ref:Pointer<QEvent>;
    
    public function new(type:Int = 0, create:Bool = true) {
        if (create = true) {
            _ref = QEvent.createInstance(untyped __cpp__("QEvent::Type({0})", type));
        }
    }
    
    public var type(get, null):Int;
    private function get_type():Int {
        return eventRef.ptr.type();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var eventRef(get, null):Pointer<QEvent>;
    private function get_eventRef():Pointer<QEvent> {
        return _ref.reinterpret();
    }
    
    public static function fromRef(ref:Pointer<QEvent>):Event {
        var event = new Event(false);
        event._ref = ref;
        return event;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtCore/qcoreevent.h')
@:native('QEvent')
@:structAccess
extern class QEvent {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QEvent")              private static function _new(type:Int):RawPointer<QEvent>;
                                        public static inline function createInstance(type:Int):Pointer<QEvent> {
                                            return Pointer.fromRaw(_new(type));
                                        }
                                        
    public function type():Int;
}
