Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565FCC982E1
	for <opensbi@archiver.kernel.org>; Sun, 20 Sep 2026 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyCM6HJDWt1UQyQ2B7XqVmZB/6Wm9/a/LSypIEp3cJw=; b=JylH5WL83l2QJT
	zZwMTk9YO90MRHTzfrPwkZ7ZdVJ5bH+DOcQkU0C+ndvMYtgMS3TkTaTwHRJvBFExFiOPHyPqSv8rr
	eObUuKV739JcUOW2Q10RTPXlEiCh0ip125guvbZ8+wWppT6PiTgYdbb+7H2PgNCuwLNNyz4aBGXve
	+IvO2SGYAkrcE55dzaHOnROswgxSLM0n6SAAvnf7OdyO+S3GushwCbTApu12VHzcpgOyFgvVWUL5H
	FNtPs0RGiOxh67Dm5xnhlNWgEBTSbyksE2Iq6B/1HNG0FiN0AAF72fCdIodu9wA2nbPQM8CM+dDoA
	3y9Dm3NcyIFSqB5tUCEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8H1V-0000000HT0C-3Eiw;
	Sun, 20 Sep 2026 12:52:01 +0000
Received: from mail-proxy25236.mail.163.com ([103.129.252.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8H1S-0000000HSzk-2ZLK
	for opensbi@lists.infradead.org;
	Sun, 20 Sep 2026 12:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=Ie/AnnB5XnIl/jIn/17nIwCvVpS5mc6z/DM7a9jLLy4=;
	b=KO41mp0mEi+W0wtosw6+q9lcVoZOBfW+jyQnVuAQ1loHO9KWOqIxiWjWqbXqP8
	9WOiBKBKuZeEdZ4S2vVBb6O5fVTyIJd6XL/BphoCSSJkjFn3VYVmLGITYyFYna3b
	YrLucgmKHJiuQmvOr0T4SxRhGye4/JqtxI3QT3T6DbWpE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD33cjY1q9qkBGYAQ--.51556S2;
	Sun, 20 Sep 2026 20:51:37 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: liutong <liutong@iscas.ac.cn>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Pengpeng Hou <hppiscas@163.com>,
	opensbi@lists.infradead.org,
	Anup Patel <anup.patel@oss.qualcomm.com>
Subject: Re: [PATCH] lib: sbi: dbtr: validate complete shared memory range
Date: Sun, 20 Sep 2026 20:51:34 +0800
Message-ID: <caplitmus-rv.dbtr-coordination.341b753a35cf48d188154856e5a26574@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911015919.79296-1-liutong@iscas.ac.cn>
References: <20260827115833.50735-1-pengpeng@iscas.ac.cn> <20260911015919.79296-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: PSgvCgD33cjY1q9qkBGYAQ--.51556S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RQo7KUUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhlyO2qv1tmycgAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_055158_944972_381F4AB0 
X-CRM114-Status: UNSURE (   4.79  )
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

Thanks for pointing out the earlier range-check patch and the NULL-domain
guard. I will coordinate with that work rather than resend an overlapping
range-check patch.

The July 31 v2 3/6 is now marked superseded in Patchwork. Could you point
me to its current replacement? I would like to check the domain and
assigned-hart validation against that version before proposing any
additional change.

Thanks,
Pengpeng


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
