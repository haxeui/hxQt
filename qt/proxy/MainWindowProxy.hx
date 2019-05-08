package qt.proxy;

import cpp.Pointer;
import cpp.RawPointer;
import qt.widgets.MainWindow;

class MainWindowProxy extends MainWindow {
    public function new() {
        if (_ref == null) {
            _ref = QMainWindowProxy.createInstance().reinterpret();
        }

        super();
    }

    private var _onResize:Void->Void = null;
    public var onResize(get, set):Void->Void;
    private function get_onResize():Void->Void {
        return _onResize;
    }
    private function set_onResize(value:Void->Void):Void->Void {
        if (_onResize == null) {
            mainWindowProxyRef.ptr.onResize = onResizeInternal;
        }
        _onResize = value;
        return value;
    }
    
    private function onResizeInternal() {
        if (_onResize != null) {
            _onResize();
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    private var mainWindowProxyRef(get, null):Pointer<QMainWindowProxy>;
    private function get_mainWindowProxyRef():Pointer<QMainWindowProxy> {
        return _ref.reinterpret();
    }
}


@:include('QMainWindowProxy.h')
@:native('QMainWindowProxy')
extern class QMainWindowProxy extends MainWindow.QMainWindow {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QMainWindowProxy")    private static function _new():RawPointer<QMainWindowProxy>;
                                        public static inline function createInstance():Pointer<QMainWindowProxy> {
                                            return Pointer.fromRaw(_new());
                                        }
    public var onResize:Dynamic;
}
