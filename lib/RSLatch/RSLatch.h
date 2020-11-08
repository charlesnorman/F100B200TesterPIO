#ifndef _RSLATCH_
#define _RSLATCH_

#include "Arduino.h"

class RSLatch
{
public:
	RSLatch();
	~RSLatch();
    bool reset();
    bool state();
	bool set();
private:
	bool  Q;
    bool  Qn;
};

#endif