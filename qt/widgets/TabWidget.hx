package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.Object.QObject;
import qt.core.QString;
import qt.widgets.Widget.QWidget;
import haxe.Constraints.Function;

class TabWidget extends Widget {
    public function new() {
        if (_ref == null) {
            _ref = QTabWidget.createInstance().reinterpret();
        }
        
        super();
    }
    
    public function addTab(page:Widget, label:String):Int {
        return tabWidgetRef.ptr.addTab(page.widgetRef.get_raw(), qt.core.QString.Helper.fromString(label));
    }
    
    
    public function connectCurrentChanged(fn:Function) {
        var p:Pointer<QTabWidget> = _ref.reinterpret();
        QObject.connect(p.ptr, QTabWidget.currentChanged, p.ptr, fn);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var tabWidgetRef(get, null):Pointer<QTabWidget>;
    private function get_tabWidgetRef():Pointer<QTabWidget> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QTabWidget.h')
@:native('QTabWidget')
@:structAccess
extern class QTabWidget extends qt.widgets.Widget.QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QTabWidget")          private static function _new():RawPointer<QTabWidget>;
                                        public static inline function createInstance():Pointer<QTabWidget> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addTab(page:RawPointer<QWidget>, label:Reference<QString>):Int;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Signals
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("&QTabWidget::currentChanged") public static var currentChanged:Function;
}