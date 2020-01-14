package qt.gui;
import cpp.Pointer;
import qt.gui.Color.QColor;

class Palette {
    public static var Window:Int                = untyped __cpp__("QPalette::Window");
    public static var Background:Int            = untyped __cpp__("QPalette::Background");
    public static var WindowText:Int            = untyped __cpp__("QPalette::WindowText");
    public static var Foreground:Int            = untyped __cpp__("QPalette::Foreground");
    public static var Base:Int                  = untyped __cpp__("QPalette::Base");
    public static var AlternateBase:Int         = untyped __cpp__("QPalette::AlternateBase");
    public static var ToolTipBase:Int           = untyped __cpp__("QPalette::ToolTipBase");
    public static var ToolTipText:Int           = untyped __cpp__("QPalette::ToolTipText");
    public static var PlaceholderText:Int       = untyped __cpp__("QPalette::PlaceholderText");
    public static var Text:Int                  = untyped __cpp__("QPalette::Text");
    public static var Button:Int                = untyped __cpp__("QPalette::Button");
    public static var ButtonText:Int            = untyped __cpp__("QPalette::ButtonText");
    public static var BrightText:Int            = untyped __cpp__("QPalette::BrightText");
    public static var Light:Int                 = untyped __cpp__("QPalette::Light");
    public static var Midlight:Int              = untyped __cpp__("QPalette::Midlight");
    public static var Dark:Int                  = untyped __cpp__("QPalette::Dark");
    public static var Mid:Int                   = untyped __cpp__("QPalette::Mid");
    public static var Shadow:Int                = untyped __cpp__("QPalette::Shadow");
    public static var Highlight:Int             = untyped __cpp__("QPalette::Highlight");
    public static var HighlightedText:Int       = untyped __cpp__("QPalette::HighlightedText");
    public static var Link:Int                  = untyped __cpp__("QPalette::Link");
    public static var LinkVisited:Int           = untyped __cpp__("QPalette::LinkVisited");
    
    private var _ref:QPalette;
    
    public function new() {
    }
    
    @:access(qt.gui.Color)
    public function color(role:Int):Color {
        var p = _ref.color(untyped __cpp__("(QPalette::ColorRole){0}", role));
        var color = new Color();
        color._ref = p;
        return color;
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtGui/QPalette.h')
@:native('QPalette')
@:structAccess
extern class QPalette {
    public function color(role:Int):QColor;
}