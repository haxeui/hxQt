#ifndef _EVENT_FILTER_PROXY_H_
#define _EVENT_FILTER_PROXY_H_

#include <hxcpp.h>
#include <QtCore/QObject.h>
#include <QtCore/QDebug.h>
#include <QtCore/qcoreevent.h>

class QEventFilterProxy : public QObject {
    public:
    ::Dynamic onEvent = null();
    QObject* currentObj;
    QEvent* currentEvent;
    bool currentReturn;
    
    protected:
        bool eventFilter(QObject *obj, QEvent *event) override {
            currentReturn = false;
            if (hx::IsNotNull(onEvent)) {
                currentObj = obj;
                currentEvent = event;
                onEvent();
            }
            return currentReturn;
        }
};

#endif