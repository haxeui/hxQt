package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;
import qt.widgets.Menu.QMenu;
import qt.widgets.Widget.QWidget;

class MenuBar extends Widget {
    public function new(create:Bool = true) {
        if (create == true) {
            if (_ref == null) {
                _ref = QMenuBar.createInstance().reinterpret();
            }
            
            super();
        }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addMenu(title:String):Menu {
        var p = menuBarRef.ptr.addMenu(Helper.fromString(title));
        var menu = new Menu(false);
        menu._ref = Pointer.fromRaw(p).reinterpret();
        return menu;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var menuBarRef(get, null):Pointer<QMenuBar>;
    private function get_menuBarRef():Pointer<QMenuBar> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QMenuBar.h')
@:native('QMenuBar')
@:structAccess
extern class QMenuBar extends QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QMenuBar")            private static function _new():RawPointer<QMenuBar>;
                                        public static inline function createInstance():Pointer<QMenuBar> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addMenu(title:Reference<QString>):RawPointer<QMenu>;
}