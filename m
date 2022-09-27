From: merle w <merlew4n6@gmail.com>
Date: Wed, 28 Sep 2022 01:54:11 +0800
Subject: gdb needs an sbi extension
Message-ID: <1bdab13e1add240f0e245c6687e6ecb602e28d6f.camel@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To implement hardware breakpoints and watchpoints on the riscv, the trigger in M
mode is required. We need an sbi extension for debugging to set the trigger.

Please give suggestions and feedback.

Regards,
Xiang W




Debug Extension (EID #0x44424755 "DBG")
=======================================

Function: Set Tiggers(FID #0)
-----------------------------

```c
struct trigger {
	unsigned long address;
	unsigned long length;
	unsigned long rwx_mask;
	unsigned long privilege_mask;
	unsigned long resource_id;
};
```

rwx_mask:
	bit 0: read
	bit 1: write
	bit 2: execute

privilege_mask?
	bit 0: U-Mode
	bit 1: S-Mode
	bit 2: H-Mode
	bit 3: M-Mode

resource_id: This is a resource identifier, non-0, 0 is used to indicate that
the resource is free. This flag is used to associate which trigger is used, and
is useful when clearing settings.


```c
struct sbiret sbi_debug_set_triggers(unsigned long addr_lo, unsigned long addr_hi, unsigned long num);
```

addr_lo and addr_hi are used to access address ranges whose physical address 
width is greater than XLEN. The addr_lo and addr_hi point to the struct trigger
array. 

num represents the number of elements in the array.

Trigger is a scarce resource and should be used as the context of the program,
set when resuming execution, and cleared when swapped out. In order to reduce
the number of sbi calls, the breakpoint information is passed through an array
here.


Function: Clear Tiggers(FID #1)
--------------------------------
```c
struct sbiret sbi_debug_clear_triggers(unsigned long addr_lo, unsigned long addr_hi, unsigned long num);
```

addr_lo and addr_hi are used to access address ranges whose physical address 
width is greater than XLEN. The addr_lo and addr_hi point to the struct trigger
array. 

num represents the number of elements in the array.

This call will undo all trigger settings.


