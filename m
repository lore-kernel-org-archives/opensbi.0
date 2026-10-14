Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4B8CC6B27
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oabez8MkZKLOpcRGWjZrGUREAOYOEl09kKvhGYyhnuk=; b=H9xdSngEz9jJQ2
	uNG2yG/O72Wq3L/dzTFANCs0qF4xrYp4hxvNqByE5oiy7m5ep9jfBqnOzZ+EgHOvRkA3AplI4PSe9
	4jpvqI9QKIiwpVHP87zspGzMMK1qcV+5kd0fehPhzvFZm4IYBLl94jkBrKKibHZO+YuAKahL7+RND
	GpLnSnHgFZLe7o6SmdWOjg+lJXVsuVJblTU+i0odV73S7oDQf+HtHhHi6kGuT2TprHSCBMd9qp0Qk
	Fm2fB0wCYw97r0CSdeUimLIWpMGTc0p3DxQhgk2X8J0xuvSIaBKfy1epL5C0liXYD4FZqAqOYGhqj
	x+Lb6dMekXKZD0jfOKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGus6-0000000Exzq-3e3b;
	Wed, 14 Oct 2026 09:02:02 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGus3-0000000Exxo-1KGS
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 09:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=ZpM9KbhxWLfmx8arZr0Aj4i5h5LHvh5yw/HxrgmrUBU=;
	b=hGoAIad6PWgrEwbPYp7GK1ZDAfFCin7HybUrFdT8Xb9BhoHKBso44ip+f5vmmw
	BCSHwGJNXqvQq+f9pbcMkSANsvcuaGX+vZ7b9EpPLFHzvLabZuAjIr55wXjsLLrq
	bcZ9O679hWuA5kRtTLpRT2Yi5uBHFaS9eMLD5GrdsSiII=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnr5YDRc9qGuc3Eg--.54963S2;
	Wed, 14 Oct 2026 17:01:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: sebasjosue84@gmail.com
Cc: opensbi@lists.infradead.org,
	anup.patel@oss.qualcomm.com,
	atishp@rivosinc.com,
	hppiscas@163.com
Subject: Re: [PATCH] lib: sbi: reject PMU skip-match counter class mismatches
Date: Wed, 14 Oct 2026 17:01:53 +0800
Message-ID: <caplitmus-rv.reply.20261014.pmu-test.c7fe4ad71542422d99c77cdf4db674bd@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261013044221.1563754-1-sebasjosue84@gmail.com>
References: <20260827115718.50124-1-pengpeng@iscas.ac.cn> <20261013044221.1563754-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnr5YDRc9qGuc3Eg--.54963S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUjWrXUUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QTgqWrPRQQ+oQAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_020200_024614_03DDCC77 
X-CRM114-Status: UNSURE (   3.66  )
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

Hi Sebastian,

Thanks for testing both directions and for the Tested-by.

Yes, ctr_idx - num_hw_ctrs is evaluated as unsigned and wraps; it does
not produce a negative array index. The class check rejects either
mismatch before it reaches the counter-specific operations.

Thanks,
Pengpeng


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
