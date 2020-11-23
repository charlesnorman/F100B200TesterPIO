#ifndef _PUSH_BUTTON_CONTROLLER_
#define _PUSH_BUTTON_CONTROLLER_

#include <Arduino.h>
#include <RSLatch.h>

class PushButtonController
{
public:
    PushButtonController();
    explicit PushButtonController(bool isMomentary);
    PushButtonController(bool isMomentary, int this_debounce_delay);
    ~PushButtonController();
    bool update(bool pressed);
    bool getState();
    bool getLast();
    bool r_trig();
    bool f_trig();

private:
    unsigned int debounce_delay;
    int last_millis;
    bool momentary;
    bool enable_reset;
    bool last;
    bool had_r_trig;
    bool had_f_trig;
    RSLatch latch;

};
#endif