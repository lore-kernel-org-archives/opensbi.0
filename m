Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6427DF8E4A1
	for <opensbi@archiver.kernel.org>; Fri, 17 Apr 2026 02:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cEK3Oh6sC5qpw0TL/2hKIaGe9Qzzg/1zbn2OdCX7y4=; b=A2c2fHpXuWeVHF
	jESNdGcEET3PNUNFZXQNaWX/RBhnlPrZA3VNoQJpygfrtn+YcGnZtyQy2LGcrTTVdoEv+SxHGXYxk
	Ncr7AJZRy2GdCcG41/YC4jY4RzkjfYIuyCHdaJEVXTXVMnM3s3MdpFcmZacisGZb0YCUUusAn42+r
	rl/baSckN+IEXs1SQaowcCow8NI+LCvnuesgSXH/zXrcqc3PtOYlhBtyBh3iUqd0RcNtvXSqLLfaF
	Et74evFQR7Wvju9Mp8mr6Yfxinj3v4wia8JQ+ofEm2SrIYQ+urR1wIZOYA8hjsSn5AC1L7KXRQ1WE
	v7CCjley7Pg+rwfLsYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDZGN-00000003LTu-2BvN;
	Fri, 17 Apr 2026 02:48:59 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDZGK-00000003LTI-1w0N;
	Fri, 17 Apr 2026 02:48:58 +0000
Received: from [10.213.21.49] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnfBCTn+Fp3xTRDQ--.57733S2;
	Fri, 17 Apr 2026 10:48:52 +0800 (CST)
Message-ID: <c2b7a633-00c8-448f-9c76-3da087682657@iscas.ac.cn>
Date: Fri, 17 Apr 2026 10:48:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: smp: Align secondary_start_sbi to 4 bytes
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, anup@brainfault.org, andrew.jones@oss.qualcomm.com,
 guoren@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, opensbi@lists.infradead.org
References: <83397314-c7f3-4122-9587-80c29b1d13aa@iscas.ac.cn>
 <20260415123757.123581-1-cp0613@linux.alibaba.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260415123757.123581-1-cp0613@linux.alibaba.com>
X-CM-TRANSID: zQCowADnfBCTn+Fp3xTRDQ--.57733S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4DAr4kWF4rWw1fCryUJrb_yoWfXrb_ZF
	Z0vrs0kw1jvFZ3Kw1fKF429r4Dua10gryYvFy0qwn7GasxXrn8Xr40vr1fX3WrX34FqF9x
	Grn7Ja4xJwnFvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2xYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7PEfUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_194856_908304_EDEBDD46 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On 4/15/26 20:37, Chen Pei wrote:

[...]

>>> In summary, it is more reasonable to make secondary_start_sbi
>>> satisfy 4-byte alignment.
>> Thus, it is unnecessary.
>>
>> If this fixes a bug where an interrupt can trap into the wrong stvec for
>> you, then your firmware is broken.
> This isn't about fixing a bug (as mentioned earlier, it's highly unlikely
> to happen),

It is *impossible* given correct HW and FW, but okay...

> but rather the STVEC check mechanism added to QEMU discovered
> this issue. Regarding the problem itself, I would appreciate any clarification
> or modifications from OpenSBI, but currently this modification is the simplest
> and most feasible.

The stvec CSR is WARL. If the "STVEC check mechanism" is complaining
about usage of CSRs as specified, then the check is a false positive and
is not something fixable.

Vivian "dramforever" Wang


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
