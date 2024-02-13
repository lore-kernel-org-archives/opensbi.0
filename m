From: Ivan Orlov <ivan.orlov0322@gmail.com>
Date: Tue, 13 Feb 2024 15:29:40 +0000
Subject: [PATCH 1/4] docs: Add documentation about tests and SBIUnit
In-Reply-To: <20240213-1b27a0bbd79dd323daf5757e@orel>
References: <20240208095050.398522-1-ivan.orlov0322@gmail.com>
 <20240212-f61079aa6ee3990c6084ff7c@orel>
 <12c2ecd6-0367-470f-90bf-35a805574147@gmail.com>
 <20240213-a2478b49c77f64f9f111e96b@orel>
 <168f8ed3-6cc1-4cb0-a3bc-a738383775a1@gmail.com>
 <20240213-1b27a0bbd79dd323daf5757e@orel>
Message-ID: <e9192a2b-c493-4c50-bdcb-699fd0df4454@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/13/24 15:21, Andrew Jones wrote:
>> Hmmm, I've never heard about this thing before, could you please point me to
>> a reference or source where I could read about it?
> 
> It's used in OpenSBI code for arrays such as sbi_ecall_exts. See commit
> 56bed1a0fe39 ("lib: sbi_ecall: Generate extensions list with carray") for
> that example.
> 

Thanks, I'll take a look and use them in the V2 if it is possible!

>>
>> In this case we would have to update the makefile logic, because now OpenSBI
>> uses 'compile_elf' makefile procedure for the test payload and the firmware
>> elf files both, and we would not like to use --whole-archive for the test
>> payload. I guess it is an overcomplication...
> 
> Maybe, but I'm not sure how much we'd care about having bloated binaries
> when building with CONFIG_SBIUNIT.
>

The problem is not with the bloated payload binaries: if we use 
--whole-archive when linking the test payload, it starts giving the 
'undefined reference' errors, because some of the object files refer to 
symbols which don't exist in the test payload. Like:

```
opensbi/platform/generic/andes/sleep.S:63: undefined reference to 
`_start_warm'
```

_start_warm is defined in fw_base, but it's not accessible when building 
the test payload (firmware/payloads/).

Probably, we could just disable the test payload building when 
CONFIG_SBIUNIT is enabled, but I'm not sure if it is a correct 
approach... Another option would be optional --whole-archive use, so we 
would use it for linking the fw_* ELF files only.

-- 
Kind regards,
Ivan Orlov


