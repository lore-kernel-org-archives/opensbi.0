Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE218CA5FB1
	for <opensbi@archiver.kernel.org>; Wed, 30 Sep 2026 11:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYCFe0NY/pvikclE0klBSUvUL4p0mkEIMwRpZ7g3G9k=; b=rfBYSjDSj7NIOb
	6cVvFKT99ADbeNFn3SCn1fM+BwBtcYXqYJ2pevnO4kdM8UpNGTf6920kZ6OlaC+s5kPoHhSoACWzE
	fvydnmzAZSIOiFbtPDI/sYgQOcrA8QpvMZ5g4ONI/ZfE74GehM6aGEcIdZ9qOG7Bp5ihifpw4Dayy
	+nHvgY09S3FzlktHT8BiTQqgdM3NwAqoDMlFuTpW+n2Pl5pIh5UIOIQmIwX4B6JZFZ/b+OZAM4Wzz
	Qubo+dKkWOrTmf7Cb90FKGoDvMRHb2nd+1KHBZU9UIHBxXlJSEgxgBbTJ5xCSbJEMKx5ea0MlTDMA
	HcLEF+jqS1rNrS0dyZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsYt-00000005sy8-1CSe;
	Wed, 30 Sep 2026 11:33:23 +0000
Received: from out-104.mta0.migadu.com ([2001:41d0:1004:224b::68] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsYk-00000005sv3-04Sc
	for opensbi@lists.infradead.org;
	Wed, 30 Sep 2026 11:33:18 +0000
X-Envelope-To: opensbi@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Fm5gGMCgIfeNDG/Bg80FSuuxecCyrNM0HlS/t4fTz2A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790767991; v=1; x=1791372791;
 b=SXTi5UvuV0WsY3MA4iUT5MfxTzTiXIXUp9SXjwZwzT7NO0kKNplkXAz6EdgZRVvGVx4NPYa+
 NJWXLjsv0WclYardy/7sQJbe1reAiMavhUjiwApTxj186oewokRsRwZT67nq62NrcXCqg7wTRGy
 VpRuHunnpKTeOSjkOASy7wyg=
X-Envelope-To: opensbi@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 95fbaa6515cc444d;
	Wed, 30 Sep 2026 11:33:11 +0000
X-Mizu-Trace-ID: 95fbaa6515cc444d
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 13:33:10 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	opensbi@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH 2/2] riscv: dbtr: Add initial API corner
 case / error handling tests
Message-ID: <xpx2g5f6eadea73vbia7voxgwqj2snqyyftkcbs2sotre4b7z4@esewzeyddt5x>
References: <20260313050831.4016944-1-npiggin@gmail.com>
 <20260313050831.4016944-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313050831.4016944-2-npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_043316_376425_D62034C8 
X-CRM114-Status: GOOD (  11.96  )
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

On Fri, Mar 13, 2026 at 03:08:31PM +1000, Nicholas Piggin wrote:
> The SBI DBTR specification has quite detailed API requirements
> that are easy to get wrong. This implements the beginning of
> testing some corner cases, not with trigger behaviour but with
> API behaviour.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> These tests expose a bunch of major and minor errors in OpenSBI
> handling, for which I will post patches to the opensbi list. As
> well as possibly a bug in the SBI spec, reported here.
> 
> https://github.com/riscv-non-isa/riscv-sbi-doc/issues/257
> 
> Thanks,
> Nick
> ---
> ---
>  riscv/sbi-dbtr.c | 314 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 314 insertions(+)
>

Hi Nicholas,

Sorry I didn't pay attention to the OpenSBI and SBI spec work you've doing
related to these tests. Are the fixes in? Do these tests now match the
spec and the behavior of latest opensbi?

Thanks,
drew

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
