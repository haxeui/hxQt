package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import qt.core.Size;
import qt.widgets.Frame.QFrame;
import qt.widgets.ScrollBar.QScrollBar;

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
    
    public var hasHorizontalScrollBar(get, null):Bool;
    private function get_hasHorizontalScrollBar():Bool {
        var p:RawPointer<QScrollBar> = abstractScrollAreaRef.ptr.horizontalScrollBar();
        var pp:Pointer<QScrollBar> = Pointer.fromRaw(p);
        return pp.ptr.isVisible();
    }
        
    public var hasVerticalScrollBar(get, null):Bool;
    private function get_hasVerticalScrollBar():Bool {
        var p:RawPointer<QScrollBar> = abstractScrollAreaRef.ptr.verticalScrollBar();
        var pp:Pointer<QScrollBar> = Pointer.fromRaw(p);
        return pp.ptr.isVisible();
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
extern class QAbstractScrollArea extends QFrame {
    public function maximumViewportSize():QSize;
    public function horizontalScrollBar():RawPointer<QScrollBar>;
    public function verticalScrollBar():RawPointer<QScrollBar>;
}