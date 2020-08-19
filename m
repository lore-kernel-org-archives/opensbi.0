From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Wed, 19 Aug 2020 14:08:44 +0200
Subject: [PATCH v3 1/2] lib: sbi_init: Avoid thundering hurd problem with
 coldboot_lock
In-Reply-To: <3af21d65-6694-139e-583e-33ab48cea97f@gmail.com>
References: <20200818040728.528426-1-anup.patel@wdc.com>
 <3af21d65-6694-139e-583e-33ab48cea97f@gmail.com>
Message-ID: <3552d0c5-e7f0-3b1d-ff76-d5e9572c56f4@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19.08.20 14:03, Sean Anderson wrote:
> On 8/18/20 12:07 AM, Anup Patel wrote:
>> We can have thundering hurd problem with coldboot_lock where the
>> boot HART can potentially starve trying to acquire coldboot_lock
>> because some of the non-boot HARTs are continuously acquiring and
>> releasing coldboot_lock. This can happen if MIP.MSIP bit is already
>> set for some of the non-boot HARTs.
>>
>> To avoid thundering hurd problem for coldboot_lock, we use the
>> __smp_load_acquire() and __smp_store_release() for coldboot_done
>> flag and use coldboot_lock only for coldboot_wait_hmask.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>
> Just curious, what are the changes from v1 and v2?

Barriers are realized in a different way in patch 1.

Except for the barriers patch 1 follows what I proposed in my original
patch and the following discussion.

And for sure Jessica was right that at least compiler barriers are needed.

Best regards

Heinrich

