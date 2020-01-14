package qt.gui;

import cpp.Pointer;
import qt.core.QString;

class Color {
    private var _ref:QColor;
    
    public function new() {
    }
    
    public var red(get, null):Int;
    private function get_red():Int {
        return _ref.red();
    }
    
    public var green(get, null):Int;
    private function get_green():Int {
        return _ref.green();
    }
    
    public var blue(get, null):Int;
    private function get_blue():Int {
        return _ref.blue();
    }
    
    public var name(get, null):String;
    private function get_name():String {
        var s = _ref.name();
        return Helper.toString(s);
    }
    
    public var intValue(get, null):Int;
    private function get_intValue():Int {
        var r = _ref.red();
        var g = _ref.green();
        var b = _ref.blue();
        
        r = (r << 16) & 0xFF0000;
        g = (g << 8) & 0x00FF00;
        b = b & 0x0000FF;

        return 0x000000 | r | g | b;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtGui/QColor.h')
@:native('QColor')
@:structAccess
extern class QColor {
    public function red():Int;
    public function green():Int;
    public function blue():Int;
    public function name():QString;
}