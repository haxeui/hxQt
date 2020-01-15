package qt.widgets;

import cpp.Pointer;
import cpp.RawPointer;
import cpp.Reference;
import qt.core.QString;
import qt.widgets.Dialog.QDialog;
import qt.widgets.PushButton.QPushButton;

class MessageBox extends Dialog {
    public static var NoIcon:Int                = untyped __cpp__("QMessageBox::Icon::NoIcon");
    public static var Question:Int              = untyped __cpp__("QMessageBox::Icon::Question");
    public static var Information:Int           = untyped __cpp__("QMessageBox::Icon::Information");
    public static var Warning:Int               = untyped __cpp__("QMessageBox::Icon::Warning");
    public static var Critical:Int              = untyped __cpp__("QMessageBox::Icon::Critical");

    public static var InvalidRole:Int           = untyped __cpp__("QMessageBox::ButtonRole::InvalidRole");
    public static var AcceptRole:Int            = untyped __cpp__("QMessageBox::ButtonRole::AcceptRole");
    public static var RejectRole:Int            = untyped __cpp__("QMessageBox::ButtonRole::RejectRole");
    public static var DestructiveRole:Int       = untyped __cpp__("QMessageBox::ButtonRole::DestructiveRole");
    public static var ActionRole:Int            = untyped __cpp__("QMessageBox::ButtonRole::ActionRole");
    public static var HelpRole:Int              = untyped __cpp__("QMessageBox::ButtonRole::HelpRole");
    public static var YesRole:Int               = untyped __cpp__("QMessageBox::ButtonRole::YesRole");
    public static var NoRole:Int                = untyped __cpp__("QMessageBox::ButtonRole::NoRole");
    public static var ApplyRole:Int             = untyped __cpp__("QMessageBox::ButtonRole::ApplyRole");
    public static var ResetRole:Int             = untyped __cpp__("QMessageBox::ButtonRole::ResetRole");

    public static var Ok:Int                    = untyped __cpp__("QMessageBox::StandardButton::Ok");
    public static var Open:Int                  = untyped __cpp__("QMessageBox::StandardButton::Open");
    public static var Save:Int                  = untyped __cpp__("QMessageBox::StandardButton::Save");
    public static var Cancel:Int                = untyped __cpp__("QMessageBox::StandardButton::Cancel");
    public static var Close:Int                 = untyped __cpp__("QMessageBox::StandardButton::Close");
    public static var Discard:Int               = untyped __cpp__("QMessageBox::StandardButton::Discard");
    public static var Apply:Int                 = untyped __cpp__("QMessageBox::StandardButton::Apply");
    public static var Reset:Int                 = untyped __cpp__("QMessageBox::StandardButton::Reset");
    public static var RestoreDefaults:Int       = untyped __cpp__("QMessageBox::StandardButton::RestoreDefaults");
    public static var Help:Int                  = untyped __cpp__("QMessageBox::StandardButton::Help");
    public static var SaveAll:Int               = untyped __cpp__("QMessageBox::StandardButton::SaveAll");
    public static var Yes:Int                   = untyped __cpp__("QMessageBox::StandardButton::Yes");
    public static var YesToAll:Int              = untyped __cpp__("QMessageBox::StandardButton::YesToAll");
    public static var No:Int                    = untyped __cpp__("QMessageBox::StandardButton::No");
    public static var NoToAll:Int               = untyped __cpp__("QMessageBox::StandardButton::NoToAll");
    public static var Abort:Int                 = untyped __cpp__("QMessageBox::StandardButton::Abort");
    public static var Retry:Int                 = untyped __cpp__("QMessageBox::StandardButton::Retry");
    public static var Ignore:Int                = untyped __cpp__("QMessageBox::StandardButton::Ignore");
    public static var NoButton:Int              = untyped __cpp__("QMessageBox::StandardButton::NoButton");
    
    public function new() {
        if (_ref == null) {
            _ref = QMessageBox.createInstance().reinterpret();
        }
        
        super();
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var text(null, set):String;
    private function set_text(value:String):String {
        messageBoxRef.ptr.setText(Helper.fromString(value));
        return value;
    }
    
    public var informativeText(null, set):String;
    private function set_informativeText(value:String):String {
        messageBoxRef.ptr.setInformativeText(Helper.fromString(value));
        return value;
    }
    
    public var detailedText(null, set):String;
    private function set_detailedText(value:String):String {
        messageBoxRef.ptr.setDetailedText(Helper.fromString(value));
        return value;
    }
    
    public var icon(null, set):Int;
    private function set_icon(value:Int):Int {
        messageBoxRef.ptr.setIcon(untyped __cpp__("(QMessageBox::Icon){0}", value));
        return value;
    }
    
    public function addButton(text:String, role:Int = -1) {
        // TODO: should return button
        if (role == -1) {
            role = ActionRole;
        }
        var p = messageBoxRef.ptr.addButton(Helper.fromString(text), untyped __cpp__("(QMessageBox::ButtonRole){0}", role));
    }
    
    public function addStandardButton(button:Int) {
        // TODO: should return button
        var p = messageBoxRef.ptr.addStandardButton(untyped __cpp__("(QMessageBox::StandardButton){0}", button));
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var messageBoxRef(get, null):Pointer<QMessageBox>;
    private function get_messageBoxRef():Pointer<QMessageBox> {
        return _ref.reinterpret();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QMessageBox.h')
@:native('QMessageBox')
@:structAccess
extern class QMessageBox extends QDialog {
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Creation functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:native("new QMessageBox")         private static function _new():RawPointer<QMessageBox>;
                                        public static inline function createInstance():Pointer<QMessageBox> {
                                            return Pointer.fromRaw(_new());
                                        }
                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // API
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public function setText(value:Reference<QString>):Void;
    public function setInformativeText(value:Reference<QString>):Void;
    public function setDetailedText(value:Reference<QString>):Void;
    public function setIcon(value:Int):Void;
    @:native("addButton")
    public function addStandardButton(button:Int):RawPointer<QPushButton>;
    public function addButton(text:Reference<QString>, role:Int):RawPointer<QPushButton>;
}