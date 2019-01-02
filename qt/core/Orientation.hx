package qt.core;

@:unreflective
@:native("Qt::Orientation")
@:enum extern abstract Orientation(OrientationImpl) {
    @:native("Qt::Horizontal")            var Horizontal;
    @:native("Qt::Vertical")              var Vertical;
}

@:unreflective
@:native("cpp::Struct<Qt::Orientation, cpp::EnumHandler>")
extern class OrientationImpl {
}
