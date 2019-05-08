package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import cpp.Void;
import qt.core.Object;
import qt.core.QString;
import qt.core.Rect;
import qt.core.Size;
import qt.layout.Layout;

class Widget extends Object {
    public function new() {
        if (_ref == null) {
            _ref = QWidget.createInstance().reinterpret();
        }
        
        super();
    }
    
    public function resize(width:Int, height:Int) {
        widgetRef.ptr.resize(width, height);
    }
    
    public function show() {
        widgetRef.ptr.show();
    }
    
    public function setGeometry(x:Int, y:Int, width:Int, height:Int) {
        widgetRef.ptr.setGeometry(x, y, width, height);
    }

    public var parent(null, set):Widget;
    private function set_parent(value:Widget):Widget {
        widgetRef.ptr.setParent(value.widgetRef.get_raw());
        return value;
    }
    
    public var layout(null, set):Layout;
    private function set_layout(value:Layout):Layout {
        widgetRef.ptr.setLayout(value.layoutRef.get_raw());
        return value;
    }
    
    public var windowTitle(null, set):String;
    private function set_windowTitle(value:String):String {
        widgetRef.ptr.setWindowTitle(qt.core.QString.Helper.fromString(value));
        return value;
    }
    
    public var styleSheet(null, set):String;
    private function set_styleSheet(value:String):String {
        widgetRef.ptr.setStyleSheet(qt.core.QString.Helper.fromString(value));
        return value;
    }
    
    public var childrenRect(get, null):Rect;
    @:access(qt.core.Rect)
    private function get_childrenRect():Rect {
        var rc = new Rect();
        rc._ref = widgetRef.ptr.childrenRect();
        return rc;
    }
    
    public function move(x:Int, y:Int) {
        widgetRef.ptr.move(x, y);
    }

    public function adjustSize() {
        widgetRef.ptr.adjustSize();
    }

    public var x(get, set):Int;
    private function get_x():Int {
        return widgetRef.ptr.x();
    }
    private function set_x(value:Int):Int {
        widgetRef.ptr.move(value, y);
        return value;
    }

    public var y(get, set):Int;
    private function get_y():Int {
        return widgetRef.ptr.y();
    }
    private function set_y(value:Int):Int {
        widgetRef.ptr.move(x, value);
        return value;
    }
    
    public var width(get, set):Int;
    private function get_width():Int {
        return widgetRef.ptr.width();
    }
    private function set_width(value:Int):Int {
        widgetRef.ptr.resize(value, height);
        return value;
    }

    public var height(get, set):Int;
    private function get_height():Int {
        return widgetRef.ptr.height();
    }
    private function set_height(value:Int):Int {
        widgetRef.ptr.resize(width, value);
        return value;
    }
    
    public var sizeHint(get, null):Size;
    @:access(qt.core.Size)
    private function get_sizeHint():Size {
        var qs:QSize = widgetRef.ptr.sizeHint();
        var size = new Size();
        size._ref = qs;
        return size;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var widgetRef(get, null):Pointer<QWidget>;
    private function get_widgetRef():Pointer<QWidget> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QWidget.h')
@:native('QWidget')
@:structAccess
extern class QWidget extends qt.core.Object.QObject {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QWidget")             private static function _new():RawPointer<QWidget>;
                                        public static inline function createInstance():Pointer<QWidget> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function show():Void;
    public function resize(width:Int, height:Int):Void;
    public function x():Int;
    public function y():Int;
    public function width():Int;
    public function height():Int;
    public function sizeHint():qt.core.Size.QSize;
    public function move(x:Int, y:Int):Void;
    public function setGeometry(x:Int, y:Int, width:Int, height:Int):Void;
    public function geometry():qt.core.Rect.QRect;
    public function childrenRect():qt.core.Rect.QRect;
    public function setParent(parent:RawPointer<QWidget>):Void;
    public function setLayout(layout:RawPointer<qt.layout.Layout.QLayout>):Void;
    public function setWindowTitle(value:Reference<QString>):Void;
    public function adjustSize():Void;
    public function setStyleSheet(value:Reference<QString>):Void;
}