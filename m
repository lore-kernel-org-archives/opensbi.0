Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A08CCCF9E3
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3KKua8EIrJ9JhGZQKBltRMiRa4gq6aYSR/sMHtzB14=; b=XMtZX7J5nVWX0Q
	7Qu0wD8Et4nI1276lK+JrMas0hbZrevhFd1Grb126Zi3kj/fDLUFW0B9kgcd3yvxQPuoM8DoUql9j
	lF0wdFtHhZJ8ZwkhFozrgFOw4PoO231phyKcMw8mS5XV5MQ/r6ryKVeJHfr62BNrIxZ9OiZb7djqm
	Nf/OoHds0WJc60UBfp4LE8cRRBzTCPna4mgsFqcIRM1wEvQ1zwWtv4kCxB30M4W4egJcv71q7AYxb
	WD4QWWc2eAkW3UwB/WlZduB071Kt6jz+zO29ciEdZQajSBo+SJLM8uBlou0iMeZAYgMxq323D9frI
	M/to1vciwtTpTK+XEYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHFI-0000000GoTs-23vH;
	Fri, 07 Nov 2025 07:50:56 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHFF-0000000GoSs-2I4m
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 07:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762501849; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=IYHZDfpIr+21np9TskznzQNL6iPkApOEfJxj2Y0OHE8=;
	b=JQkHxRWvJNA4gNDFH9u4IAlX8aQdboMRSrErMmQXUDgfh2ts8o1FCbmNfZ/CfQttbJXIaowf3aUDtA/pT4NvfoL+cCvNFyfqZwyJLKH9wHjUdApizPEimC9Of4OWEgDy/hV836JDyA9tCWroXoTX/CmRvmPq0g2cVzPjb+Vn3RI=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WrsE3QJ_1762501837 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Nov 2025 15:50:41 +0800
From: cp0613@linux.alibaba.com
To: samuel.holland@sifive.com
Cc: anup@brainfault.org,
	opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi: Flush cache entries after writing PMP CSRs
Date: Fri,  7 Nov 2025 15:50:38 +0800
Message-ID: <20251107075038.1836-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <560e84db-664b-4cc5-9eb3-e526e94139ad@sifive.com>
References: <560e84db-664b-4cc5-9eb3-e526e94139ad@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_235054_087874_FCE7975D 
X-CRM114-Status: GOOD (  14.55  )
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

On 2025-10-30 10:36 AM, Samuel Holland wrote:

> > If hardware is filling TLB entries for M-mode then it must tag these TLB
> > entries with privilege level so that they don't match for S-mode otherwise
> > a simple M-mode to S-mode switch at boot-time will allow bootloaders
> > to access M-mode memory with M-mode permissions.

> Yes, agreed, the TLB entries must be tagged with the privilege mode, but that's
> not the problem here. The problem has nothing at all to do with privilege mode
> transitions, and nothing to do with executing code in S-mode, either. The bug
> can be observed purely within the scope of the function calling
> sbi_hart_map_saddr().

> sbi_hart_map_saddr() rewrites a PMP range to allow M-mode access to some address
> range that it previously did not have permission to access. The problem is that
> this PMP change may not be observed until software executes a sfence.vma
> covering at least this address range. So without this patch, it is
> architecturally valid to receive an access fault when M-mode attempts to access
> this address range (i.e. on the very next line of code after calling
> sbi_hart_map_saddr()).

Hi Samuel,

Thank you so much for participating in the discussion.
You pointed out the key points, this is indeed a case.

Thanks,
Pei

> > Regards,
> > Samuel

> >>> Further, flushing TLB entries in sbi_hart_map/unmap_saddr() also
> >>> slows-down many SBI calls which use shared memory.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
