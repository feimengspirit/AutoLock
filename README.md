###信号量锁(AutoLock)

**说明:**

利用了C++中的构造和析构函数管理资源的生命周期一直是广为使用的技巧。结合iOS上的信号量实现一个简单的锁工具。
	
**范例:**

	dispatch_semaphore_t s_sema = dispatch_semaphore_create(1);
	void func1()
	{
	    LOCK_WITH(sema);
	    ...
	}
	
	void func2()
	{
	    LOCK_WITH(sema);
	    ...
	}
经过上述调用即可保证func1和func2的互斥执行。