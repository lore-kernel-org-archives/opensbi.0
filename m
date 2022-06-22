From: dramforever <dramforever@live.com>
Date: Wed, 22 Jun 2022 15:12:45 +0800
Subject: [PATCH v4] lib: sbi: Improve csr read and write
In-Reply-To: <eb75c146d4657e71ca67dce5517438e80f4af962.camel@126.com>
References: <20220526144214.308921-1-wxjstz@126.com>
 <CAK9=C2U9KyVTJhXN9jOqqR7JMYz0Mn9ar=seXbPg1+UdHhhbpg@mail.gmail.com>
 <1e615125574b838bc99dd58239874fa2e1685bdb.camel@126.com>
 <81DE08C6-50D4-4CC2-AE63-266D727F083F@jrtc27.com>
 <eb75c146d4657e71ca67dce5517438e80f4af962.camel@126.com>
Message-ID: <TYYP286MB1439D9E3CB6446A5AA91353AC6B29@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 6/21/22 23:53, Xiang W wrote:
> ? 2022-05-26???? 16:28 +0100?Jessica Clarke???
>> On 26 May 2022, at 16:19, Xiang W <wxjstz@126.com> wrote:
>>> ? 2022-05-26???? 20:35 +0530?Anup Patel???
>>>> On Thu, May 26, 2022 at 8:12 PM Xiang W <wxjstz@126.com> wrote:
>>>>> <patch contents snipped>
>>>> I agree we need FENCE.I in the path but this is
>>>> like a big hammer in the execution path.
>>>>
>>>> This is now much slower compared to the existing
>>>> approach because every CSR access using this
>>>> function will execute FENCE.I
>>> I passed the qemu test, and it can be run normally with
>>> or without fence.i. But I'm not sure if the exception
>>> happens on other platform or we have a more lightweight
>>> way.
>> There is not. Optimising this kind of bad practice code is not a goal
>> of modern architectures. After all, it totally precludes having W^X
>> protection in OpenSBI (e.g. via the PMP, or via CHERI), especially
>> executable stacks form a key part of *the* classic buffer overflow
>> shell code attack.
>>
>> Jess
> Currently opensbi does not have strict RWX permission control. We only?
> need W and X permissions not to exist at the same time to avoid security
> risks. If opensbi has RWX permission control, we only need to change the
> permission of opcode_buff before and after running. The stack default is
> RW permission, we can change the permission of opcode_buff to RX before
> the call, and change the permission to RW after the call is completed.
>
> I think these jobs can be put after opensbi has rwx permission control.
>
> Regards,
> Xiang W

But in that case, wouldn't this codegen approach be even slower? Is
there any particular reason to believe that this will be faster than the
current switch-case? Some benchmark on existing silicon would be nice.

The original implementation compiles down a jump table, with several
branches and bound checks at the beginning. It really is just a hunch,
but I find it difficult to be convinced how generating code could be faster.

Optimizing the current switch-case approach into a better jump table
seems to be the way to go here. Currently the compiler does not seem to
take advantage of the fact that every csr* instruction is exactly 4
bytes. There also seems to be a few extra instructions for dealing with
int instead of long, though I am not sure. Furthermore, having separate
functions for hpmcounter, pmpcfg, etc. might help with avoiding some
branches, and possibly also make code clearer at call site.

Regards,
dram

