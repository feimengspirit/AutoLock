//
//  AutoLock.h
//  AutoLock
//
//  Created by mengfei.mf on 5/5/15.
//  Copyright (c) 2015 mengfei.mf. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOCK_WITH(lock) feimengspirit::AutoLock al##__LINE__(lock)

namespace feimengspirit
{
class AutoLock
{
public:
    explicit AutoLock(dispatch_semaphore_t sema)
    : m_lock(sema)
    {
        dispatch_semaphore_wait(m_lock, DISPATCH_TIME_FOREVER);
    }
    
    ~AutoLock()
    {
        dispatch_semaphore_signal(m_lock);
    }
    
private:
    AutoLock(const AutoLock&);
    AutoLock& operator=(const AutoLock&);
    
private:
    dispatch_semaphore_t m_lock;
};
}
