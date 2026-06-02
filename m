Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8866CD6E5D
	for <opensbi@archiver.kernel.org>; Tue,  2 Jun 2026 19:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPycCRWc/FQRKNDwUy48cJLEHghlP6yDkR574d1W4Is=; b=IuitniJqJsbsZJ
	//fkovQ8ccmx+eatuRaL7IqzSk6tQ08/kvudlbvDenHaSADHfi1ufNJbI65XeYa6AUV78rTLQyUP1
	6mUE3gPq6T0qmqe4nfd9yoRgpKitvqsbCWxJEfhmaMoJf1j4Imwd8/Lvh4RLladR5zKZXrMgVNIeb
	wJRFea/axNVoB2DGk3wypm1OANOuojGw8GMasoXz7EBWjXvOaPTLo07oofkw1ppywz3kLclhIUBn7
	FAP+tbTgPve9eacVPM8KqazE2dCOeVQOk6moN9h2KE4lueM0jHEnBUhDRHCp7eyiVZFjB6NNOaTlW
	CcF0ITsumHUk+Ky3/ZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUXI-0000000Dg7s-1i8C;
	Tue, 02 Jun 2026 19:12:24 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUXF-0000000Dg7M-14qS
	for opensbi@lists.infradead.org;
	Tue, 02 Jun 2026 19:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=hx0V5RYSG+PBxqF++uZjBioWU/KdZnKP5PC1Wvtp7sw=; b=A+vdj5ZnV8rvfMjuwKvVmV0kO8
	iEr7BB+b1pdLtduI2Endd1wIT2P6eHTplrqmswcSzQJ3ojuuXmS0XGBM3jWETJmI0eNHk1514tI77
	WM9/sFK/qvuLTdYoBGZnNynCY1fquZcyez8OyfT94N7OBCpe93XG5RHl/SyKRnvHgIQh/bMvMacU9
	JCvX33HaB+voPnpaWj6zyWTC0rB++7TDn3h3yb7CEsOb4yStd2ZNkD7FCAT7e/z9dqWSJVgMHsJdC
	AOvijwoPIPfh8IO/48beFTmTTMilGWFVMm5gwnTXsPnQKL6sCCbFyHAl4JcYL+DgsIddYtwADXwAW
	/xh/78VA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wUUX4-0000000CRrD-2wak;
	Tue, 02 Jun 2026 21:12:10 +0200
Date: Tue, 2 Jun 2026 21:12:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Michael Ellerman <mpe@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
Message-ID: <ah8rCkntd95JPfti@aurel32.net>
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_121221_430933_F45FD8A1 
X-CRM114-Status: GOOD (  11.95  )
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

On 2026-05-24 13:53, Vivian Wang wrote:
> sbi_misaligned_v_ld_emulator() has a local buffer (namely mask) which is
> 8192 bytes in size, so the default stack size is not enough. Double it
> to 16384.
> 
> This stack overflow can be observed by any S-mode software and leads to
> M-mode crash or unexpected behavior, as long as the S-mode software does
> not enable FWFT misaligned delegation [1]. This may be considered a
> temporary fix until further fixes are made to misaligned handling [2].
> 
> Link: https://lore.kernel.org/linux-riscv/nrvt74qnojaubiwjo37ums4lnclu466hovwrhmtbag6f5uhrql@q6msoe2oto4b # [1]
> Link: https://lore.kernel.org/opensbi/20260210094044.72591-1-ganboing@gmail.com # [2]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>  include/sbi/sbi_platform.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

I can confirm that this fix is required to boot a 7.1-rc6 kernel on a 
CPU with vector instructions (in my case SpacemiT K1).

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
