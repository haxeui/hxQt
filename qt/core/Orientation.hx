package qt.core;

@:unreflective
@:native("Qt::Orientation")
@:include('QtWidgets/qapplication.h')
@:enum extern abstract Orientation(OrientationImpl) {
    @:native("Qt::Horizontal")            var Horizontal;
    @:native("Qt::Vertical")              var Vertical;
}

@:unreflective
@:native("cpp::Struct<Qt::Orientation, cpp::EnumHandler>")
@:include('QtWidgets/qapplication.h')
extern class OrientationImpl {
}
