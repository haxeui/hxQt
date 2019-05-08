package qt.proxy;

import cpp.Pointer;
import cpp.RawPointer;

@:include('EventRecieverProxy.h')
@:native('EventRecieverProxy')
extern class EventRecieverProxy {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new EventRecieverProxy")  private static function _new():RawPointer<EventRecieverProxy>;
                                        public static inline function createInstance():Pointer<EventRecieverProxy> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    public var callback:Dynamic;
    public var lastEvent:RawPointer<qt.core.Event.QEvent>;
}