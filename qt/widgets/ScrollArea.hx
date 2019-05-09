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
    
    public var widget(get, set):Widget;
    private function get_widget():Widget {
        var p:RawPointer<QWidget> = scrollAreaRef.ptr.widget();
        var widget = new Widget(Pointer.fromRaw(p));
        return widget;
    }
    private function set_widget(value:Widget):Widget {
        scrollAreaRef.ptr.setWidget(value.widgetRef.get_raw());
        return value;
    }
    
    public var widgetResizable(null, set):Bool;
    private function set_widgetResizable(value:Bool):Bool {
        scrollAreaRef.ptr.setWidgetResizable(value);
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
    public function setWidget(widget:RawPointer<QWidget>):Void;
    public function widget():RawPointer<QWidget>;
    public function setWidgetResizable(resizable:Bool):Void;
}