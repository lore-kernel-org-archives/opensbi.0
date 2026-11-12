Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E124606A323
	for <opensbi@archiver.kernel.org>; Thu, 12 Nov 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WzMArexB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aEvuQjvpTP9VQXj/DNh66wfXKAgJeJAuhuyl4X9J1fY=; b=WzMArexBHdz/WWphCcbawk5bR6
	qLLKyh/emIfsvWlpOLXC5Z5zhuXoZTjRBsO2dNqm+mXlCyqcjGRQVjIh3TPqcIv/zL4mmUVS+GDxg
	ZmdIuDqnIEMg8kCaOk619JdEGA+dn0NnP8YGnMYcYDWVCHXYN2MlaRdkXNRc6zAtpQv6qMwjW7MuD
	iVssmjsG9sulBylfreW0E6m1G3MyY1UYoa4XUYaSprViUrSj4sC9nxe0fUcfXir17J5PJWL8K8l3L
	w0jFSZVsDFBckNPeLbanHZjr4vKV2vBCM5fu7m7jKsBvGcxi2TMLRdlaqenx7rDGJCm25rbVnXo84
	GbiTJUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQsF-00000009JoR-1Zzx;
	Thu, 12 Nov 2026 09:13:39 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQsB-00000009JnL-0eH8
	for opensbi@lists.infradead.org;
	Thu, 12 Nov 2026 09:13:38 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAnwrc5g_Vqv+H1AA--.48761S2;
	Thu, 12 Nov 2026 17:13:29 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org,
	Xiang W <wxjstz@126.com>
Cc: gaohan@iscas.ac.cn,
	troy.mitchell@linux.spacemit.com,
	xianbin.zhu@linux.spacemit.com,
	anup@brainfault.org
Subject: Re: [PATCH] platform: generic: spacemit: k3: deny S-mode access to the reset vectors
Date: Thu, 12 Nov 2026 09:13:16 +0000
Message-Id: <20261112091316.4067761-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ed4015c1beede6efeb899735ce1006cd51ab7269.camel@126.com>
References: <20261103094415.3007814-1-liutong@iscas.ac.cn> <ed4015c1beede6efeb899735ce1006cd51ab7269.camel@126.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnwrc5g_Vqv+H1AA--.48761S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr47uF13JF4fJrWDCFWkXrb_yoW5Wr1UpF
	W3Gr13Crs7CrZ2vw1xuw4xC34kAan3Ja4DGFy5Ary8Aws8Wry29FW8t3Z5Aa47Cr1fXF1Y
	gr4Utw1kuan8ZaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0ow
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bn-erUUUUU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_011335_602480_41982EB0 
X-CRM114-Status: GOOD (  15.73  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 07:59:32 +0000, Xiang W wrote:
> The PMP granularity on K3 is 4 KiB, so a mapping size smaller than
> that will be ignored.
>
> Could you clarify how this case should be handled?

Thanks, and thanks to Han Gao for putting it on hardware. You are
right.

The region order comes out of sbi_domain_memregion_init() without
reference to the PMP granularity, and both protection backends then
drop a region whose order is below it:

	if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max)
		...program the entry...
	else
		sbi_printf("Can not configure pmp for domain %s ...

(lib/sbi/sbi_hart_pmp.c:209 and :390). So with a 4 KiB granularity the
1 KiB region in my patch is never programmed and the firmware boots on
with one line printed. The patch was a no-op on your board. I had only
tested on qemu virt, where the granularity is 4 bytes and any size
passes.

Rounding up to the page is not a fix either, and this is the part I had
wrong. The page at 0xd4282000 also holds the APMU block, which upstream
Linux drives directly from S-mode:

	syscon_apmu: system-controller@d4282800 {
		compatible = "spacemit,k3-syscon-apmu";
		reg = <0x0 0xd4282800 0x0 0x400>;
		#clock-cells = <1>;
		#power-domain-cells = <1>;
	};

(arch/riscv/boot/dts/spacemit/k3.dtsi, with drivers/clk/spacemit/ccu-k3.c
behind it). Denying S-mode the page on its own would take out the clock,
reset and power domain provider for the whole board.

SpaceMit's k3-br-v1.0.y does not only register the region. It also
installs emulate_load and emulate_store, which translate the faulting
S-mode address and perform the access in M-mode, except for an
m_only_ranges list that it refuses to emulate - and that list is exactly
the four RVBADDR pairs plus the PMU CAP and CX idle and wakeup
registers. The comment on the barriers in that emulator names the kernel
CCU driver's recalc_rate loop, so the S-mode traffic is expected there by
design. Upstream already has the hooks for that
(sbi_platform_operations.emulate_load and emulate_store), although no
in-tree platform uses them yet.

That two part shape is what makes the protection safe on that branch,
and my patch carried over only the first part. I am dropping it rather
than sending a v2 that would break clocks.

Troy, Xianbin: would you be interested in upstreaming that protection
from k3-br-v1.0.y?

One smaller thing this exposed, separate from K3: a region below the PMP
granularity is dropped with a single printf and boot continues, so a
platform author gets no signal that the protection they registered is
not in effect. That is how I missed it. Whether it should be louder, or
rounded up, looks like its own discussion and I did not want to fold it
into this thread.

Thanks again for catching this before it went in.

liutong


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
