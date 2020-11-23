#include <PushButtonController.h>
#include <time.h>

PushButtonController::PushButtonController(bool isMomentary)
    : enable_reset{false}, last{false}
{
    momentary = isMomentary;
    latch = RSLatch();
}
PushButtonController::PushButtonController()
{
    enable_reset = false;
    last = false;
    momentary = true;
    debounce_delay = 10;
    latch = RSLatch();
}
PushButtonController::PushButtonController(bool isMomentary, int this_debounce_delay)
    : enable_reset{false}, last{false}
{
    momentary = isMomentary;
    debounce_delay = this_debounce_delay;
    latch = RSLatch();
}
bool PushButtonController::r_trig()
{
    return had_r_trig;
}

bool PushButtonController::f_trig()
{
    return had_f_trig;
}

PushButtonController::~PushButtonController() {}

bool PushButtonController::getState()
{
    return latch.state();
}

bool PushButtonController::update(bool pressed)
{
    had_f_trig = false;
    had_r_trig = false;
    if ((millis() - last_millis) < debounce_delay)
        return latch.state();

    if (pressed == last)
    {
        last_millis = millis();
        return latch.state();
    }
    pressed ? had_r_trig = true : had_f_trig = true;
    last = pressed;

    /*Momentary logic*/
    if (momentary)
    {
        pressed == true ? latch.set() : latch.reset();
        return latch.state();
    }

    /*Toggle logic*/
    if (pressed && enable_reset)
    {
        latch.reset();
        enable_reset = false;
        return latch.state();
    }
    if (pressed && !latch.state())
    {
        latch.set();
        enable_reset = true;
    }
    return latch.state();
}

bool PushButtonController::getLast()
{
    return last;
}
