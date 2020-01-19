package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;
import qt.gui.Icon;
import qt.gui.Icon.QIcon;

class ListWidgetItem {
    private var _ref:Pointer<ListWidgetItem>;
    
    public function new() {
        if (_ref == null) {
            _ref = QListWidgetItem.createInstance().reinterpret();
        }
    }
    
    public var text(null, set):String;
    private function set_text(value:String):String {
        listWidgetItemRef.ptr.setText(Helper.fromString(value));
        return value;
    }
    
    public var icon(null, set):Icon;
    private function set_icon(value:Icon):Icon {
        listWidgetItemRef.ptr.setIcon(value.iconRef.ref);
        return value;
    }
    
    public function destroy() {
        if (_ref != null) {
            _ref.destroy();
            _ref = null;
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var listWidgetItemRef(get, null):Pointer<QListWidgetItem>;
    private function get_listWidgetItemRef():Pointer<QListWidgetItem> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QListWidget.h')
@:native('QListWidgetItem')
@:structAccess
extern class QListWidgetItem {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QListWidgetItem")     private static function _new():RawPointer<QListWidgetItem>;
                                        public static inline function createInstance():Pointer<QListWidgetItem> {
                                            return Pointer.fromRaw(_new());
                                        }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function text():QString;
    public function setText(value:Reference<QString>):Void;
    public function setIcon(value:Reference<QIcon>):Void;
}