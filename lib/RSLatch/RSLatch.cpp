#include <Arduino.h>
#include <RSLatch.h>

RSLatch::RSLatch()
{
	Q = false;
	Qn = false;
}

RSLatch::~RSLatch(){};

bool RSLatch::set()
{
    Q = true;
    Qn = false;
    return Q;
}

bool RSLatch::reset()
{
    Q = false, Qn = true;
    return Q;
}

bool RSLatch::state()
{
    return Q;
}
