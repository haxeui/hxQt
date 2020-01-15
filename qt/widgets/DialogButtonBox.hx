package qt.widgets;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;
import qt.widgets.PushButton.QPushButton;
import qt.widgets.Widget.QWidget;

class DialogButtonBox extends Widget {
    public static var InvalidRole:Int           = untyped __cpp__("QDialogButtonBox::ButtonRole::InvalidRole");
    public static var AcceptRole:Int            = untyped __cpp__("QDialogButtonBox::ButtonRole::AcceptRole");
    public static var RejectRole:Int            = untyped __cpp__("QDialogButtonBox::ButtonRole::RejectRole");
    public static var DestructiveRole:Int       = untyped __cpp__("QDialogButtonBox::ButtonRole::DestructiveRole");
    public static var ActionRole:Int            = untyped __cpp__("QDialogButtonBox::ButtonRole::ActionRole");
    public static var HelpRole:Int              = untyped __cpp__("QDialogButtonBox::ButtonRole::HelpRole");
    public static var YesRole:Int               = untyped __cpp__("QDialogButtonBox::ButtonRole::YesRole");
    public static var NoRole:Int                = untyped __cpp__("QDialogButtonBox::ButtonRole::NoRole");
    public static var ApplyRole:Int             = untyped __cpp__("QDialogButtonBox::ButtonRole::ApplyRole");
    public static var ResetRole:Int             = untyped __cpp__("QDialogButtonBox::ButtonRole::ResetRole");

    public static var Ok:Int                    = untyped __cpp__("QDialogButtonBox::StandardButton::Ok");
    public static var Open:Int                  = untyped __cpp__("QDialogButtonBox::StandardButton::Open");
    public static var Save:Int                  = untyped __cpp__("QDialogButtonBox::StandardButton::Save");
    public static var Cancel:Int                = untyped __cpp__("QDialogButtonBox::StandardButton::Cancel");
    public static var Close:Int                 = untyped __cpp__("QDialogButtonBox::StandardButton::Close");
    public static var Discard:Int               = untyped __cpp__("QDialogButtonBox::StandardButton::Discard");
    public static var Apply:Int                 = untyped __cpp__("QDialogButtonBox::StandardButton::Apply");
    public static var Reset:Int                 = untyped __cpp__("QDialogButtonBox::StandardButton::Reset");
    public static var RestoreDefaults:Int       = untyped __cpp__("QDialogButtonBox::StandardButton::RestoreDefaults");
    public static var Help:Int                  = untyped __cpp__("QDialogButtonBox::StandardButton::Help");
    public static var SaveAll:Int               = untyped __cpp__("QDialogButtonBox::StandardButton::SaveAll");
    public static var Yes:Int                   = untyped __cpp__("QDialogButtonBox::StandardButton::Yes");
    public static var YesToAll:Int              = untyped __cpp__("QDialogButtonBox::StandardButton::YesToAll");
    public static var No:Int                    = untyped __cpp__("QDialogButtonBox::StandardButton::No");
    public static var NoToAll:Int               = untyped __cpp__("QDialogButtonBox::StandardButton::NoToAll");
    public static var Abort:Int                 = untyped __cpp__("QDialogButtonBox::StandardButton::Abort");
    public static var Retry:Int                 = untyped __cpp__("QDialogButtonBox::StandardButton::Retry");
    public static var Ignore:Int                = untyped __cpp__("QDialogButtonBox::StandardButton::Ignore");
    public static var NoButton:Int              = untyped __cpp__("QDialogButtonBox::StandardButton::NoButton");
    
    public function new() {
        if (_ref == null) {
            _ref = QDialogButtonBox.createInstance().reinterpret();
        }
        
        super();
    }
   
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function addButton(text:String, role:Int = -1) {
        // TODO: should return button
        if (role == -1) {
            role = ActionRole;
        }
        var p = dialogButtonBoxRef.ptr.addButton(Helper.fromString(text), untyped __cpp__("(QDialogButtonBox::ButtonRole){0}", role));
    }
    
    public function addStandardButton(button:Int) {
        // TODO: should return button
        var p = dialogButtonBoxRef.ptr.addStandardButton(untyped __cpp__("(QDialogButtonBox::StandardButton){0}", button));
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var dialogButtonBoxRef(get, null):Pointer<QDialogButtonBox>;
    private function get_dialogButtonBoxRef():Pointer<QDialogButtonBox> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QDialogButtonBox.h')
@:native('QDialogButtonBox')
@:structAccess
extern class QDialogButtonBox extends QWidget {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QDialogButtonBox")    private static function _new():RawPointer<QDialogButtonBox>;
                                        public static inline function createInstance():Pointer<QDialogButtonBox> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("addButton")
    public function addStandardButton(button:Int):RawPointer<QPushButton>;
    public function addButton(text:Reference<QString>, role:Int):RawPointer<QPushButton>;
}