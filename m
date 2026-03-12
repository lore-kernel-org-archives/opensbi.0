Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17628105A591
	for <opensbi@archiver.kernel.org>; Thu, 12 Mar 2026 12:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRs0PY8q0rNHKK0/9mGkAuN1FJ7bQAzBQt2Zf55CHgM=; b=CGJeEgyvaMjck0
	e9OXxNnZDydf4NYe0HHmu96DrCUBaif+RPhD913H/I17YibTnYCUVJDqDkGBhCcT3xeUlLf+F5MG4
	MBrZ5bX78W/5uD4ZEJ6RsXBnDhF/vls0LcDYCFpzd4XIEEWd8EqMcWJYYXOquOqQPdtjN2ZoEkwkz
	7H5ikdNVTtFcFYHDhS5EYqKyibVFlRtGOK2rRIkv4qYy7nqN9lKSLVj1wjn1wxABzjZp3mH76IDJU
	6MxznqJY0G5UOllg8YI/aFDnUra/3oJ3JUIlrsAPwflV0PqmEHSi7pSHbKdz8UtJH9z0H4UeNYxap
	rtXGfR5iWMN0XEIqM3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0f6H-0000000E2Ep-1Xdk;
	Thu, 12 Mar 2026 12:25:13 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0f6C-0000000E2Dg-2tUv
	for opensbi@lists.infradead.org;
	Thu, 12 Mar 2026 12:25:11 +0000
Received: from [192.168.0.107] (unknown [123.118.222.47])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KesLJpB5B0Cg--.20880S2;
	Thu, 12 Mar 2026 20:25:03 +0800 (CST)
Message-ID: <49147179-48eb-48dd-9d4b-ee9e56469ccf@iscas.ac.cn>
Date: Thu, 12 Mar 2026 20:25:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] OpenSBI: Lazy floating-point and vector context switching
To: dave.patel@riscstar.com, opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ray Mao <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>
References: <20260312110158.77308-1-dave.patel@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260312110158.77308-1-dave.patel@riscstar.com>
X-CM-TRANSID: rQCowAC3m+KesLJpB5B0Cg--.20880S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWxXw45ur48Xr47Xr4DXFb_yoW5KFWDpa
	yfuF4SkrWDWFZ5Aa1vyryUW3yYgr4xtFW3W3Z5WrW8Xay5ury09r4ft34YqF9rArWxZrWY
	qa98JFykCa98ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_052509_111844_0F84D562 
X-CRM114-Status: GOOD (  21.10  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi Dave,

Some email procedural stuff first. I'm not sure how you're sending
emails, but it is behaving very weirdly. Your email hasn't got an
In-Reply-To header, and the quoting just shows up. I have received
correctly-threaded emails from your domain though, so I'm guessing your
email server is fine. Please ask your colleagues about this and try to
fix it.

The public-inbox archive seems to be smart enough to figure out a
Subject match, at least, so for anyone getting confused:

https://lore.kernel.org/opensbi/20260311171103.70074-1-dave.patel@riscstar.com/T

On 3/12/26 19:01, dave.patel@riscstar.com wrote:
> Hi,
>
> On , wrote:
>
>> This does not work in Machine mode, where OpenSBI resides.
> The code provided works in Machine mode. It has been tested in an M-mode
> environment where OpenSBI executes using S-mode bare metal app.
>
>> See privileged spec, section "Extension Context Status in mstatus
>> Register": "Machine and Supervisor modes share a single copy of the FS,
>> VS, and XS bits."
> Yes, that is correct. Machine and Supervisor modes share a single copy
> of the FS and VS bits.
>
>> This means that a Supervisor mode program can set sstatus.FS to Dirty,
>> access floating point state, and set sstatus.FS back to Off without
> ?Machine mode software noticing ever.
>
> That is correct. However, in the proposed approach the lazy context
> switch is triggered only when sstatus.FS is Dirty. If sstatus.FS is not
> Dirty, then no save/restore operation is performed.
>
So, the problem is that this is unreliable. A Supervisor mode program
can just:

  li t0, SSTATUS_FS
  csrs sstatus, t0
  fadd fa0, fa0, fa0
  csrc sstatus, t0

And that would change fa0 without trapping while leaving sstatus.FS as Off.

The Supervisor mode software *itself* needs to set sstatus.FS and
sstatus.VS for its own state tracking, so this isn't a contrived
example. For example, Linux clears sstatus.FS and sstatus.VS (i.e. sets
them both to Off) early on entry into kernel mode [1] to disallow use of
them in most kernel code. You can imagine Linux needs to do its own lazy
saving of F and V registers.

If then it traps into Machine mode while in kernel mode, for, e.g., an
SBI call, sstatus.FS and sstatus.VS would not be Dirty, yet the F and V
registers may have been manipulated arbitrarily by User mode before
entering the kernel in Supervisor mode. Then OpenSBI code would
incorrectly assume that saving isn't required.

[1]: https://elixir.bootlin.com/linux/v7.0-rc1/source/arch/riscv/kernel/entry.S#L176

>> See also https://github.com/riscv/riscv-isa-manual/issues/832
>> "Impossible to implement HS-level sstatus.{FS,VS} = Off with
>> software-emulated hypervisor extension?" where I ran into the same
>> problem in a different context.
> Could you please elaborate on how the issue described there applies in
> this context?

That's another aspect of the same issue: Machine mode can't track and
control F and V for Supervisor mode.

>> So basically, lazy saving/restoring F and V in Machine mode with
>> multiple Supervisor mode programs is not a designed feature, and is not
>> possible as the privileged architecture is currently designed. For these
>> use cases non-lazy switching is required.
> Could you provide more details on the limitations you are referring to?
> In particular, it would be helpful to understand whether the concern is
> related to the shared FS/VS state visibility between privilege levels,
> or to some other aspect of the privileged architecture.

It is just the shared access that's the problem.

Vivian "dramforever" Wang


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
