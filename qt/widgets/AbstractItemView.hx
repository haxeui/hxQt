package qt.widgets;

import qt.widgets.AbstractScrollArea.QAbstractScrollArea;

class AbstractItemView extends AbstractScrollArea {
    public function new() {
        super();
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Extern
//////////////////////////////////////////////////////////////////////////////////////////////////////////
@:unreflective
@:include('QtWidgets/QAbstractItemView.h')
@:native('QAbstractItemView')
@:structAccess
extern class QAbstractItemView extends QAbstractScrollArea {
}