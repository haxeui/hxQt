package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import haxe.Constraints.Function;
import qt.core.Object.QObject;
import qt.widgets.ListView.QListView;
import qt.widgets.ListWidgetItem.QListWidgetItem;

class ListWidget extends ListView {
    public function new() {
        if (_ref == null) {
            _ref = QListWidget.createInstance().reinterpret();
        }
        
        super();
    }
    
    public function addItem(item:ListWidgetItem) {
        var p = item.listWidgetItemRef;
        listWidgetRef.ptr.addItem(p.raw);
    }
    
    public function clear() {
        listWidgetRef.ptr.clear();
    }
    
    public var selectedRow(get, set):Int;
    private function get_selectedRow():Int {
        return listWidgetRef.ptr.currentRow();
    }
    private function set_selectedRow(value:Int):Int {
        listWidgetRef.ptr.setCurrentRow(value);
        return value;
    }
    
    public function connectItemSelectionChanged(fn:Function) {
        var p:Pointer<QListWidget> = _ref.reinterpret();
        QObject.connect(p.ptr, QListWidget.itemSelectionChanged, p.ptr, fn);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var listWidgetRef(get, null):Pointer<QListWidget>;
    private function get_listWidgetRef():Pointer<QListWidget> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QListWidget.h')
@:native('QListWidget')
@:structAccess
extern class QListWidget extends QListView {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QListWidget")         private static function _new():RawPointer<QListWidget>;
                                        public static inline function createInstance():Pointer<QListWidget> {
                                            return Pointer.fromRaw(_new());
                                        }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addItem(item:RawPointer<QListWidgetItem>):Void;
    public function clear():Void;
    public function setCurrentRow(row:Int):Void;
    public function currentRow():Int;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Signals
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("&QListWidget::itemSelectionChanged") public static var itemSelectionChanged:Function;
}