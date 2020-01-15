package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;
import qt.widgets.Action.QAction;
import qt.widgets.Widget.QWidget;

class Menu extends Widget {
    public function new(create:Bool = true) {
        if (create == true) {
            if (_ref == null) {
                _ref = QMenu.createInstance().reinterpret();
            }
            
            super();
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addAction(text:String):Action {
        var p = menuRef.ptr.addAction(Helper.fromString(text));
        var action = new Action();
        return action;
    }
    
    public function addSeparator():Action {
        var p = menuRef.ptr.addSeparator();
        var action = new Action();
        return action;
    }
    
    public function addMenu(title:String):Menu {
        var p = menuRef.ptr.addMenu(Helper.fromString(title));
        var menu = new Menu(false);
        menu._ref = Pointer.fromRaw(p).reinterpret();
        return menu;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var menuRef(get, null):Pointer<QMenu>;
    private function get_menuRef():Pointer<QMenu> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QMenu.h')
@:native('QMenu')
@:structAccess
extern class QMenu extends QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QMenu")               private static function _new():RawPointer<QMenu>;
                                        public static inline function createInstance():Pointer<QMenu> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addAction(title:Reference<QString>):RawPointer<QAction>;
    public function addSeparator():RawPointer<QAction>;
    public function addMenu(title:Reference<QString>):RawPointer<QMenu>;
}