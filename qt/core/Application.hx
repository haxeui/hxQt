package qt.core;

import cpp.Pointer;

@:include('QtWidgets/qapplication.h')
class Application {
    private var _ref:Pointer<QApplication>;
    
    public function new() {
        untyped __cpp__('char *argv[] = {NULL};');
        untyped __cpp__('int argc = sizeof(argv) / sizeof(char*) - 1;');
        _ref = untyped __cpp__('new QApplication(argc, argv)');
    }
    
    public function exec() {
        _ref.ptr.exec();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/qapplication.h')
@:native('QApplication')
extern class QApplication {
    public function exec():Void;
}
