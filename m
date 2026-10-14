Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E66BCC6B27
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxH8y/BkFemR27OPLd0gqRJFBV95YXftOgOVqFT5ugY=; b=SddEKRX73clVv3
	gliKEyY+QsgdOmRiqTPrhzFfkhZeRpIEiQfiCXt383qSUSt/G4B6HPz0U93DPeYLet6+2oqQwpxfI
	YhdT4P22FoQCiRtASBRIPbULIVCwfvXNJoLbTy2nvQdcWcRl1pW6VX8mYlhAOYpSLYO6pw7w/Qa0R
	DRIfBvI2szqm5jujxwlzMBaPhf9WjYBQW6lpWKVZe++4TaOQeltxHbdg5hIRH/6BkBa2tVYO4MrBP
	Z02IC+V4l/uxMUp+oQkXpFJuelgG/ta3a5kuFOqQy02AxclhIpgXAve68Ne0+vFhZE/9BKQ4ocBHS
	qNRT5fI+ZhKNHDYnI2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGusr-0000000EyDd-1mTm;
	Wed, 14 Oct 2026 09:02:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGusq-0000000EyCd-2Pyf
	for opensbi@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hPHyJky59S5BWoQ8N6yHP5NyAKwc+PaJfBzNNYtKL7U=; b=I/RyQleEn1Ex7B3R9f+Qdsmrx2
	WV1OuCfR337gilmL5XtIRNSzFWYXJKvFv5EIY+voQBwzq5zFjgj37PbrW/x0hF1VOG2fEVXLaDkfm
	gIy5eWGgPhkdQOQOAhRZ54Pyvp+xLCCffgm0f7WvI91RC5PYq0RdoQYlRjzR3AwUDPK7BJxJY8bm6
	A+dAsenXmcvvWuVf1ZJmck7by5iejmtzDpYDEmIHN8MgnJxHSGe2lK0Z9kscAo2bQGU33dn/txzt/
	j4KhR2rPa1dcDzVNuAAlooAL/muChJxDwUmVbtIzOueBWFVtRKb4Kd5b5wiUwEH/3DaNaoaO++lKX
	14qgtuvg==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGusn-0000000GXOI-0LFR
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 09:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=hPHyJky59S5BWoQ8N6yHP5NyAKwc+PaJfBzNNYtKL7U=;
	b=n02XlVL7Ybc4T5Mo3FIuv9ZzQhkVhHjHZ6uKlNv5it+d1V3qRG7cYOX9O2KTHR
	PTl4Dj06bWYeuDSh5/w9z0Um4ghycanx7EHCp88BZ/FPtHDIIYNwAvS2/7fgGABw
	8ozJ4XsIiBWReFTmunlicR9zuf9QAEGOBQFW3kCWuOA40=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3H0IvRc9q+ir9Eg--.34351S2;
	Wed, 14 Oct 2026 17:02:39 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: liutong@iscas.ac.cn,
	himanshu.chauhan@oss.qualcomm.com
Cc: opensbi@lists.infradead.org,
	anup.patel@oss.qualcomm.com,
	hppiscas@163.com
Subject: Re: [PATCH] lib: sbi: dbtr: validate complete shared memory range
Date: Wed, 14 Oct 2026 17:02:37 +0800
Message-ID: <caplitmus-rv.reply.20261014.dbtr-domain.e5796d04af70496d81d5e9384f0ff282@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911015919.79296-1-liutong@iscas.ac.cn>
References: <20260827115833.50735-1-pengpeng@iscas.ac.cn> <20260911015919.79296-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3H0IvRc9q+ir9Eg--.34351S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4kZFy3XF4fAryUuryxuFg_yoWfuwb_X3
	4rtrn3Wan8AFnrXr1Iyr1YvFW7X3yjyr1293y8Xw47K34fXwn5XrZ09r1IyF17CrZF9ry2
	yFnxWF18Crya9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjUKIJUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7RDrtGrPRTBK3wAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_100245_741986_0326691F 
X-CRM114-Status: UNSURE (   6.20  )
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

Hi liutong, Himanshu,

I checked the domain setup and DBTR ecall path at master 6ad246a14948.
The handler passes sbi_domain_thishart_ptr() to sbi_dbtr_setup_shmem().
On the cold-boot path, sbi_domain_init() allocates the domain-pointer
offset and registers the root domain for the available harts before
sbi_ecall_init(). A domain initialization failure stops that path
rather than reaching ecall registration.

I have not established a normal initialized ecall path that supplies a
NULL domain. This does not prove that every internal caller or platform
path excludes it, so I would not describe NULL-domain bypass as a
demonstrated runtime bug.

Would removing the dom && guard from the assigned-hart check be
appropriate as defensive validation? sbi_domain_is_assigned_hart()
already returns false for NULL, so this would reject it separately
from the complete shared-memory range check.

Thanks,
Pengpeng


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
