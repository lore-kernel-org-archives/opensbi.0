Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573AEC87FCF
	for <opensbi@archiver.kernel.org>; Thu,  7 Aug 2025 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	References:In-Reply-To:Date:Message-Id:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tYJmwwN7L31YZVY5PJrrScEumtd5VlM6NVtKG9L6Wmg=; b=nSJfIfKRn3XMJMAkUJzYCaccej
	o+5cxD1WtzcAayBJCKCCczaOjMtRUrdLMzw34jYd9nNsldRKUg889VP7TP+hNCO/LG2XUgMPmNm2t
	kS5BV5s4LFUBxm9vHhCckwDSCEvH/RCMDoGqTjdIYGM11reWhCo/qKCcGyq0TOVA9sLEbdtASAZg6
	nxipZu+ugPiTWA5l4/kXZg+wzr7X5PlLX4ujKaC7ylG1d9JQrNCBeeG3P9oE70WO3f+Z82GNojEQL
	pYBupWQlOllmN5t+GIgJUInhGBb1D6rH+g+IlzxpdujdXhQ4mXjTjh6BbEwX61F8gLgV2LeKpil1V
	RV7/yzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujy4D-00000000GcB-2ymU;
	Thu, 07 Aug 2025 10:41:49 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujy4B-00000000Gbj-0gK7
	for opensbi@lists.infradead.org;
	Thu, 07 Aug 2025 10:41:49 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4byNxx2kKSz6FyBx;
	Thu, 07 Aug 2025 18:41:41 +0800 (CST)
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 577AfcFt026811;
	Thu, 7 Aug 2025 18:41:38 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202508071041.577AfcFt026811@mse-fl1.zte.com.cn>
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 577AIfiu042789;
	Thu, 7 Aug 2025 18:18:41 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid204;
	Thu, 7 Aug 2025 18:18:44 +0800 (CST)
Date: Thu, 7 Aug 2025 18:18:44 +0800 (CST)
X-Zmail-TransId: 2afd68947d84ffffffffd55-2e36d
X-Mailer: Zmail v1.0
In-Reply-To: <0d619f92fb64e6d36e5fa8ae64ec5cc472f9da98.camel@126.com>
References: 20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn,202508060106.57616bhq072530@mse-db.zte.com.cn,0d619f92fb64e6d36e5fa8ae64ec5cc472f9da98.camel@126.com
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <wxjstz@126.com>
Cc: <opensbi@lists.infradead.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAyLzNdIHBsYXRmb3JtOiBnZW5lcmljOiBFeHRyYSBtZW1vcnkgZm9yIGhvdXNla2VlcGluZw==?=
X-MAIL: mse-fl1.zte.com.cn 577AfcFt026811
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Thu, 07 Aug 2025 18:41:41 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 689482E5.001/4byNxx2kKSz6FyBx
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_034147_358481_C2AD730D 
X-CRM114-Status: GOOD (  11.45  )
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

> > diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
> > index 646c2e0..7aa27b1 100644
> > --- a/lib/sbi/sbi_heap.c
> > +++ b/lib/sbi/sbi_heap.c
> > @@ -279,3 +279,8 @@ int sbi_heap_alloc_new(struct sbi_heap_control **hpctrl)
> > *hpctrl = sbi_calloc(1, sizeof(struct sbi_heap_control));
> > return 0;
> > }
> > +
> > +unsigned long sbi_heap_total_size(unsigned long usable_size)
> > +{
> > + return usable_size + usable_size / (HEAP_HOUSEKEEPING_FACTOR - 1);
> This patch will conflict with the patch
> https://patchwork.ozlabs.org/project/opensbi/patch/20250617032306.1494528-3-samuel.holland@sifive.com/.

Thank you for pointing it out. Is this patch queued to upstream? Where can I
find this kind of patches?

> If more memory is needed, it is recommended to implement it through other means.

Yes, the housekeeping metadata is still needed. Let me try another version.

Thanks,
Fei.

> Regards,
> Xiang W

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
