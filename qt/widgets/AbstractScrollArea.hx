package qt.widgets;

import cpp.Pointer;
import qt.core.Size;

class AbstractScrollArea extends Frame {
    public function new() {
        super();
    }
    
    public var maximumViewportSize(get, null):Size;
    @:access(qt.core.Size)
    private function get_maximumViewportSize():Size {
        var qs:QSize = abstractScrollAreaRef.ptr.maximumViewportSize();
        var size = new Size();
        size._ref = qs;
        return size;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var abstractScrollAreaRef(get, null):Pointer<QAbstractScrollArea>;
    private function get_abstractScrollAreaRef():Pointer<QAbstractScrollArea> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QAbstractScrollArea.h')
@:native('QAbstractScrollArea')
@:structAccess
extern class QAbstractScrollArea extends qt.widgets.Frame.QFrame {
    public function maximumViewportSize():qt.core.Size.QSize;
}