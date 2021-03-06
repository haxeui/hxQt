package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import qt.widgets.MenuBar.QMenuBar;
import qt.widgets.Widget.QWidget;

class MainWindow extends Widget {
    public function new() {
        if (_ref == null) {
            _ref = QMainWindow.createInstance().reinterpret();
        }
        
        super();
    }
    
    public var centralWidget(null, set):Widget;
    private function set_centralWidget(value:Widget):Widget {
        mainWindowRef.ptr.setCentralWidget(value.widgetRef);
        return value;
    }
    
    public var menuBar(get, null):MenuBar;
    private function get_menuBar():MenuBar {
        var p = mainWindowRef.ptr.menuBar();
        var menuBar = new MenuBar(false);
        menuBar._ref = Pointer.fromRaw(p).reinterpret();
        return menuBar;
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
    public function setCentralWidget(widget:Pointer<QWidget>):Void;                                        
    public function menuBar():RawPointer<QMenuBar>;
}
