Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874F606A323
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B3Qh5FGM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mU1eosAZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l12qs85bDHl/vhC00a5q1a1XKlmTUBWjWjhK2+DGwks=; b=B3Qh5FGMtwd71hxnkdiWhigzeo
	q47H7GwUQC/jYoNEDOgj6Qqae89WUEXZUwfCkB7SrRlFD/Cv/4Xc/rOG85XLxROeldzCwrDCkaoQE
	KAkdOBM8xUKclpzaBHH7Y4uAKlLXceeT1dSqR0WkXzT0hNsbOCwolNBoCtJAD6S6/PtZurNKnb/sW
	aUcCXDF6Ntq+vr/AiXQj4KSizhkzQj+qlrFnxHhGf2C+PLJwhRUqCtt1tIdauPSJ8jEED39zxtPow
	HTzr3Fugl9NHDAXr+cWZspvfG7mSxfXmgK6SKo+s8SaNTmMMRyJkeQ9BIuSBdJ+FWSf9tkONxorsx
	K3DDSS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsu3-0000000720h-2MCd;
	Tue, 24 Nov 2026 15:57:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssh-000000070jk-1l0C
	for opensbi@bombadil.infradead.org;
	Tue, 24 Nov 2026 15:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gu2V11C+7/zu4BqjYYOBBZTG8LWZ/ozermr1VRi3sJE=; b=mU1eosAZ2aVqRuMMwJEs7oaDYF
	McyGjPQrQe7ZaCBywlVmQsks0hQL3rnUNG6oNfTBH3UDR3QHECwZLqpWkcYGFjhz2ovltCEXDZUb2
	HcJzFoNFIC0vxq0P4AOPZy+ssR/HagKVd0YY4ktD5QiYiRHcvnI5dxKkFrt9v+dJ7nWs4zklWcAUa
	eBKr0c+Ykb/JjJnaOYgYyR2eSngPIuLSw3YxJtYtGco7A1WuJSM78WheSWu8EYaMOtaonFHdXfCBm
	GVh0etW4CihnANdIRf78psJCx4hNCbF4GHlPDz432A3EIWU0Clf4W9I/AicbvYYyVxWGE7XJhjphy
	1Sek9XMQ==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVssc-00000004IuD-2AvP
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 15:56:30 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3ELadswVrzQ3YAQ--.6798S2;
	Tue, 24 Nov 2026 23:56:13 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: heinrich.schuchardt@canonical.com
Cc: himanshu.chauhan@oss.qualcomm.com,
	atishp@atishpatra.org,
	anup@brainfault.org,
	opensbi@lists.infradead.org,
	liutong <liutong@iscas.ac.cn>
Subject: Re: [PATCH 2/7] lib: sbi: dbtr: share trigger checks of install and update
Date: Tue, 24 Nov 2026 15:55:58 +0000
Message-Id: <20261124155558.3260505-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f64743b7-f481-4b59-89b8-3f2f4f6249cb@canonical.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com> <20261120231119.90214-3-heinrich.schuchardt@canonical.com> <awPuSu5ka-wI9eOE@hu-himchau-blr.qualcomm.com> <f64743b7-f481-4b59-89b8-3f2f4f6249cb@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAB3ELadswVrzQ3YAQ--.6798S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr15JryUGw43KFyUGr17KFg_yoWDKFXE9r
	Z5ZFs8Ww1kXw4Duan3urZY9rn3K3y5Xa40v3yYga429wnFqrs7X397KwnxXrsrX34rCFyD
	KrZrXa1akF13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUrv38UUUUU
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_155626_835323_97CBBF37 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.0 (/)
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

On 11/24/26 09:26, Heinrich Schuchardt wrote:
> We should drop this patch in favor of Liutong's
> [PATCH v3 0/3] lib: sbi: fix shared memory double-fetch in DBTR and SSE

I split that series after the September review. The current patches are:

  [PATCH] lib: sbi: sse: fix shared memory double-fetch in sse_write_attrs
  https://lore.kernel.org/opensbi/20261105013958.32686-1-liutong@iscas.ac.cn/

  [PATCH v2] lib: sbi: dbtr: validate trigger configuration in update_trig
  https://lore.kernel.org/opensbi/20261115163732.746589-1-liutong@iscas.ac.cn/

I have not resent the install_trig patch. I have a tested one and can
send it as a base for your series.

The update half of what 2/7 adds is in the v2 above: dbtr_trigger_valid(),
the type_mask test, and a copy of the entry, so the value checked is the
value programmed. 2/7 still passes &entry->data to dbtr_trigger_setup()
after the checks, so there the two can differ. What 2/7 has that the v2
does not is the shared helper and the install/update parity. Rebased on
the v2 it would be a smaller patch.

liutong


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
