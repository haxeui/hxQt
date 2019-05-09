package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import haxe.Constraints.Function;
import qt.core.Object.QObject;
import qt.core.QString;
import qt.gui.Icon;
import qt.gui.Icon.QIcon;

class AbstractButton extends Widget {
    public function new() {
        super();
    }
    
    public var text(null, set):String;
    private function set_text(value:String):String {
        abstractButtonRef.ptr.setText(qt.core.QString.Helper.fromString(value));
        return value;
    }
    
    public var icon(null, set):Icon;
    private function set_icon(value:Icon):Icon {
        abstractButtonRef.ptr.setIcon(value.iconRef.ref);
        return value;
    }

    public var checked(get, set):Bool;
    private function get_checked():Bool {
        return abstractButtonRef.ptr.isChecked();
    }
    private function set_checked(value:Bool):Bool {
        abstractButtonRef.ptr.setChecked(value);
        return value;
    }
    
    public function connectClicked(fn:Function) {
        var p:Pointer<QAbstractButton> = _ref.reinterpret();
        QObject.connect(p.ptr, QAbstractButton.clicked, p.ptr, fn);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var abstractButtonRef(get, null):Pointer<QAbstractButton>;
    private function get_abstractButtonRef():Pointer<QAbstractButton> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QAbstractButton.h')
@:native('QAbstractButton')
@:structAccess
extern class QAbstractButton extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setText(value:Reference<QString>):Void;
    public function setIcon(value:Reference<QIcon>):Void;
    public function setChecked(value:Bool):Void;
    public function isChecked():Bool;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Signals
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("&QAbstractButton::clicked") public static var clicked:Function;
}