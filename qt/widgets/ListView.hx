package qt.widgets;

import qt.widgets.AbstractItemView.QAbstractItemView;

class ListView extends AbstractItemView {
    public function new() {
        super();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QListView.h')
@:native('QListView')
@:structAccess
extern class QListView extends QAbstractItemView {
}