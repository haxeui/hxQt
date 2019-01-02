package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;

class MainWindow extends Widget {
    public function new() {
        if (_ref == null) {
            _ref = QMainWindow.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var centralWindow(null, set):qt.widgets.Widget;
    private function set_centralWindow(value:qt.widgets.Widget):qt.widgets.Widget {
        mainWindowRef.ptr.setCentralWidget(value.widgetRef);
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    private var mainWindowRef(get, null):Pointer<QMainWindow>;
    private function get_mainWindowRef():Pointer<QMainWindow> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QMainWindow.h')
@:native('QMainWindow')
extern class QMainWindow {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QMainWindow")         private static function _new():RawPointer<QMainWindow>;
                                        public static inline function createInstance():Pointer<QMainWindow> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setCentralWidget(widget:Pointer<qt.widgets.Widget.QWidget>):Void;                                        
}
