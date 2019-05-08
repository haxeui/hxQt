#ifndef _MAIN_WINDOW_PROXY_H_
#define _MAIN_WINDOW_PROXY_H_

#include <hxcpp.h>
#include <QtWidgets/QMainWindow.h>
#include <QtCore/qcoreevent.h>

class QMainWindowProxy : public QMainWindow {
    public:
    ::Dynamic onResize = null();
    
    protected:
        void resizeEvent(QResizeEvent* event) override {
            if (hx::IsNotNull(onResize)) {
                onResize();
            }
        }
};

#endif