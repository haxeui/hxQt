package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import qt.widgets.Widget.QWidget;

class ScrollArea extends AbstractScrollArea {
    public function new() {
        if (_ref == null) {
            _ref = QScrollArea.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var widget(null, set):Widget;
    private function set_widget(value:Widget):Widget {
        scrollAreaRef.ptr.setWidget(value.widgetRef.get_raw());
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var scrollAreaRef(get, null):Pointer<QScrollArea>;
    private function get_scrollAreaRef():Pointer<QScrollArea> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QScrollArea.h')
@:native('QScrollArea')
@:structAccess
extern class QScrollArea extends qt.widgets.AbstractScrollArea.QAbstractScrollArea {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QScrollArea")         private static function _new():RawPointer<QScrollArea>;
                                        public static inline function createInstance():Pointer<QScrollArea> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setWidget(parent:RawPointer<QWidget>):Void;
}