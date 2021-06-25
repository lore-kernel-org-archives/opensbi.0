From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Fri, 25 Jun 2021 10:05:23 +0200
Subject: [PATCH 1/1] lib: sbi_scratch: re-implement scratch memory
 allocator
In-Reply-To: <CAAhSdy2rQirjTpHQGdr5m8fC2VVAWNQwkOUH9FCN-bHNmcXeww@mail.gmail.com>
References: <20210608203046.105890-1-xypron.glpk@gmx.de>
 <779f28a30f0aaa9820de17150bf8c2fbd479de76.camel@126.com>
 <CAAhSdy2rQirjTpHQGdr5m8fC2VVAWNQwkOUH9FCN-bHNmcXeww@mail.gmail.com>
Message-ID: <6bc55f7d-3f4c-7407-bfd3-4984256c85a2@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/23/21 6:43 AM, Anup Patel wrote:
> On Wed, Jun 23, 2021 at 10:02 AM Xiang W <wxjstz@126.com> wrote:
>>
>> ? 2021-06-08???? 22:30 +0200?Heinrich Schuchardt???
>>> Up to now we could allocated scratch memory but not deallocate it.
>>>
>>> Provide a best fit memory allocator.
>>>
>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>
>> sbi_scratch_alloc_offset is currently only used to expand the
>> sbi_scratch data structure, and does not need to dynamically release
>> memory. Such modification will increase memory consumption. If you want
>> to add alloc and free, you should add a section for heap in the link
>> script
>
> The sbi_scratch space is per-HART (or per-CPU) space and is very
> different from a global heap space. The sbi_scratch will usually be
> a small resource but we still need to manage it hence this patch.
>
> Having a global heap space in OpenSBI is a separate topic and
> till now we have avoided adding a heap space to keep the runtime
> memory usage low. Let's see how long we can continue without
> a global heap space.
>
> Regards,
> Anup

The most problematic thing about sbi_scratch_free_offset() is
synchronization of the harts. It is necessary that all harts stop using
a memory area before it is released by sbi_scratch_free_offset().

Currently sbi_tlb_init() is the only caller of
sbi_scratch_free_offset(). sbi_scratch_free_offset() is only used to
free memory that was allocated in the same call to sbi_tlb_init(). So
here synchronization is not problematic.

Best regards

Heinrich

