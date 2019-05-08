#ifndef _EVENT_RECIEVER_PROXY_H_
#define _EVENT_RECIEVER_PROXY_H_

#include <hxcpp.h>
#include <QtCore/QObject.h>
#include <QtCore/qcoreevent.h>

class EventRecieverProxy : public QObject  {
    public:
        
    ::Dynamic callback;
    QEvent* lastEvent;
    
    EventRecieverProxy() {
    }
    
    bool event(QEvent* event) override {
        this->lastEvent = event;
        this->callback();
        return true;
    }
};

#endif