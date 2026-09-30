Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D93CA5FB1
	for <opensbi@archiver.kernel.org>; Wed, 30 Sep 2026 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37J3ycEKHJ55J5sqvyDpsy8ID21QMMwcg3DuU7w/Rmw=; b=etyByPYDj6RdBc
	aDE0BI7leK59KawE02cJ7VA46Imzhe20GrVe1brEHcQDKHOeTPLGwh/gbV0qZtbK76PeH1SzjgUlo
	Q0iXqZyTy7CzdGgXgG7B9GftCO9GeT9xe4GyBqovh7RYhrmUBK/EhJoaioqX5ad0siw2J66P2PqYT
	lyE4zZh9VXIW79KD7tTuPD9jhvL1F+8aGQ6jkcwTNHLlyfLog9HZWCe6ghHrTP7JbLPXeYjW/ELq9
	kS1Ks9u99uXassLWwPT4nkMLH36OjjAbvQJTxmq3g/6VzUqACsu/VvJFPAk88UQTQt+GNnc6prr17
	sJK8pLaxzA0xBFGsTvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsX0-00000005sdo-2WPD;
	Wed, 30 Sep 2026 11:31:26 +0000
Received: from out-164.mta0.migadu.com ([91.218.175.164] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsWx-00000005scr-3uOB
	for opensbi@lists.infradead.org;
	Wed, 30 Sep 2026 11:31:25 +0000
X-Envelope-To: opensbi@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fA9a5p52fbpZZnjOtknYqWlMEppQvEzUSovaz1CMl8I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790767880; v=1; x=1791372680;
 b=jdqoYWnKqA0dbdOMVzMqwt4hwMI7bl5fydvYkorHtvWg6ZVXdIsZFCsoNToQ7t0ng0NFI3rl
 H08/8HPr6gG2W41QCq8xrP3lob9YAARbib/2GC5nAAQb5mbhoOou5lGPEFCEYy597IDMzbkXfw7
 VPLixWQTkOnCkiI/8WZ/2EHQ=
X-Envelope-To: opensbi@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f841383894dd621f;
	Wed, 30 Sep 2026 11:31:20 +0000
X-Mizu-Trace-ID: f841383894dd621f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 13:31:15 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	opensbi@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH 1/2] riscv: sbi: dbtr: fix enable trigger
 return code check
Message-ID: <45hjpd7vkuxfz56lybc6umu5gtm6tjxcafmnxgivbreagy3ddz@k53zzk324hog>
References: <20260313050831.4016944-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313050831.4016944-1-npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_043124_111518_BE24CE3D 
X-CRM114-Status: GOOD (  12.11  )
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

On Fri, Mar 13, 2026 at 03:08:30PM +1000, Nicholas Piggin wrote:
> Enabling triggers that are not mapped to a HW debug trigger
> should return SBI_ERR_INVALID_PARAM.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  riscv/sbi-dbtr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/riscv/sbi-dbtr.c b/riscv/sbi-dbtr.c
> index 129f79b8..489242b0 100644
> --- a/riscv/sbi-dbtr.c
> +++ b/riscv/sbi-dbtr.c
> @@ -744,7 +744,7 @@ static void dbtr_test_uninstall_enable(struct sbi_dbtr_shmem_entry *shmem, enum
>  	dbtr_uninstall_trigger();
>  
>  	ret = sbi_debug_enable_triggers(0, 1);
> -	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_enable_triggers");
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_enable_triggers");
>  
>  	install_exception_handler(EXC_BREAKPOINT, dbtr_exception_handler);
>  
> -- 
> 2.51.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
