package qt.core;

@:unreflective
@:include('QtCore/QStringList.h')
@:native('QStringList')
@:structAccess
extern class QStringList extends QList {
    public function value(i:Int):QString;
}