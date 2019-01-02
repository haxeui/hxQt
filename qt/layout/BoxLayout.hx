package qt.layout;

import cpp.Pointer;
import cpp.RawPointer;
import qt.widgets.Widget;

class BoxLayout extends Layout {
    public function new(dir:Direction) {
        if (_ref == null) {
            _ref = QBoxLayout.createInstance(dir).reinterpret();
        }
        
        super();
    }
    
    public function addWidget(widget:Widget, stretch:Int = 0) {
        boxLayoutRef.ptr.addWidget(widget.widgetRef.get_raw(), stretch);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var boxLayoutRef(get, null):Pointer<QBoxLayout>;
    private function get_boxLayoutRef():Pointer<QBoxLayout> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enums
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:include('QtWidgets/QBoxLayout.h')
@:unreflective
@:native("QBoxLayout::Direction")
@:enum extern abstract Direction(DirectionImpl) {
    @:native("QBoxLayout::LeftToRight")            var LeftToRight;
    @:native("QBoxLayout::RightToLeft")            var RightToLeft;
    @:native("QBoxLayout::TopToBottom")            var TopToBottom;
    @:native("QBoxLayout::BottomToTop")            var BottomToTop;
}

@:include('QtWidgets/QBoxLayout.h')
@:unreflective
@:native("cpp::Struct<QBoxLayout::Direction, cpp::EnumHandler>")
extern class DirectionImpl {
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QBoxLayout.h')
@:native('QBoxLayout')
@:structAccess
extern class QBoxLayout extends qt.layout.Layout.QLayout {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QBoxLayout")          private static function _new(dir:Direction):RawPointer<QBoxLayout>;
                                        public static inline function createInstance(dir:Direction):Pointer<QBoxLayout> {
                                            return Pointer.fromRaw(_new(dir));
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addWidget(widget:RawPointer<qt.widgets.Widget.QWidget>, stretch:Int = 0):Void;
}