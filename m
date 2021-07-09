From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 9 Jul 2021 15:25:33 +0100
Subject: [PATCH v3 0/3] Fully support standalone Clang/LLVM toolchains
In-Reply-To: <5e2079547e08b8847488d404a396e6dc7820f7e6.camel@126.com>
References: <20210709041213.11883-1-jrtc27@jrtc27.com>
 <1480faa5d70aca5788d8a5f0909aeba9f737b230.camel@126.com>
 <F28A4A8F-EC89-484F-9CF3-522CC3237FBC@jrtc27.com>
 <5e2079547e08b8847488d404a396e6dc7820f7e6.camel@126.com>
Message-ID: <E7D244BE-B58D-4534-8BFC-CF4268C334E6@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Jul 2021, at 15:23, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-07-09???? 14:49 +0100?Jessica Clarke???
>> On 9 Jul 2021, at 14:46, Xiang W <wxjstz@126.com> wrote:
>>> 
>>> ? 2021-07-09???? 05:12 +0100?Jessica Clarke???
>>> I tested these patches. Some bugs reported
>>> 
>>> ld.lld: error: can't create dynamic relocation R_RISCV_32 against
>>> symbol: _fw_start in readonly segment; recompile object files with
>>> -
>>> fPIC or pass '-Wl,-z,notext' to allow text relocations in the
>>> output
>>>>>> defined in
>>> /home/merle/workspaces/opensbi/build/platform/generic/firmware/fw_d
>>> ynam
>>> ic.elf.ld:9
>>>>>> referenced by fw_base.S:502
>>> (/home/merle/workspaces/opensbi/firmware/fw_base.S:502)
>>>>>> 
>>> /home/merle/workspaces/opensbi/build/platform/generic/firmware/fw_d
>>> ynam
>>> ic.o:(.entry+0x3BC)
>> 
>> This was reported by Bin. Don?t use a Linux triple for something
>> that?s
>> neither the Linux kernel nor a Linux userspace executable/library.
>> 
>> Jess
> 
> Linux triple?

That error looks like you built with CROSS_COMPILE=riscv64-linux- or
similar. What exactly did you run?

Jess


