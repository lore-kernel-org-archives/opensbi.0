Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC11CCFA13
	for <opensbi@archiver.kernel.org>; Thu, 30 Apr 2026 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QZgikwmDwgmXWFkiSutHtuRgQZ9ssSyWLA171V2EN28=; b=zqpC6ktXC7WYyf
	TY53Nu4tx8bj/a+tG/f8Y+aD2kovb6TeTipMbzxIHD6MRloXT4zxMBt5wp9xg5JD2x6GgqIkf+bYz
	5nmmEmlQxe8ma2h9IVnntW0X1rdVfBM9XdUgyb/vZuTGQideap0bPN6l1UPchjHnNHtLgtwC52WGf
	MZawRT9ozhaQfAMR0iY+KrGUkM5cpFVbSk3kzLkyFzqkosNfh6NnZq+B399MCvCJB48WzlwYnT9+l
	tjyLX/X6Aiera9vqfwDa6qsvVWrqZpvoPvh22Szv8ahxaezpXj2TPdO02RnnvH7gADQNocLqUhhS/
	HAB0f0BnjRDKJRk8R/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYV-00000005Bk8-45Ch;
	Thu, 30 Apr 2026 10:23:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYT-00000005Bjs-32rq
	for opensbi@bombadil.infradead.org;
	Thu, 30 Apr 2026 10:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Xsd50O7EwlNhXePDo0+oXCZLfHVMCx2rzDk8ehf6CY4=; b=J9+K4Tx73OWF2i5GLTQGONBNXK
	7TDSCpLYPHlN7eDomHlSWIdF8yl0m4GnhHbMOK5AYbM4NjZvlQiSEVDmS0BANpD+fNDkJEYSoL+tA
	brRNOt2yjIgFM9SnxCO7Xe3+SVARwyl1wsU2RxU0YZ3qGPfLwNkJooTsOY4OysXbGJ70U6l8cxH4U
	GPuphkTYZCdNZ9xEP6ogq9wv/N7Av/vAhJ4HZAcqYmc/BfzLWvDJWpuSU+4OcyNFdgIh5RQTccbR6
	pFlQitSoGe/hEEYVA9EiEP5cXNZ24pEskDTCJMVBCWoi0NY3nK/LS1MGdCROA5K4TDgZQ4fvQtYpb
	vh+b+7Ng==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOYO-000000077N0-2D2a
	for opensbi@lists.infradead.org;
	Thu, 30 Apr 2026 10:23:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35d90833cacso562921a91.2
        for <opensbi@lists.infradead.org>; Thu, 30 Apr 2026 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777544604; x=1778149404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xsd50O7EwlNhXePDo0+oXCZLfHVMCx2rzDk8ehf6CY4=;
        b=U2nJrWNaLi+Db2CVWWdrNBxGcCXE/aAoBVQylZLlAd+3mRAYWTnRrZNiL/CmG3AjP2
         01wF/RdHZQZmsPj8IwYLJmiHTrSFHq7PI3/DrF9fnnyVA/lbLQMuDxz9gZRQQerIYapP
         YdU1EPpM1ASk+SfSrv8goyMBle6VqxcviMcGgEmbDQkH93w+cMuyRxHtUMUPLawD4o2N
         leS8kE1vYLP0Q+sijji4rayhVMuz6KhWxZeUhC7ibOf9C60ExVV8Sg7aY81hdsvREMyR
         hQGUmIAiFbs/znlz1BD3uMiAkcVIsFQLoFQdP92q36z0u4ihH48oAJVf/PQKZ/ivulPv
         yBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777544604; x=1778149404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xsd50O7EwlNhXePDo0+oXCZLfHVMCx2rzDk8ehf6CY4=;
        b=fXiTemh5UfItw7ajxR7lN3RNi3WdQqkytqhtmE4u3ySFjNPvtB8LJsEXPHYsSPtYkO
         Fyx21oJAQq+oZfGQnakncZaKDy/Wz2L8N78qw8TUrMseQMaTpqozgA3JTo5G6lawWrep
         IultJK0xnwNgkCHg61JwGzSJOZ1yu+zoycN0nL5gqo/XAibjf9Kbp/NUB427PoEvIGiS
         /AsVqX5w8GPPCPtpA5kWyNie0zrcUeV+QQfPIoUs071Y1tcoGzERZ3Q91IBrBZbvj8sl
         3zS4PrYugbw4qqsAzHVussMEv+4K4XRAMwR6mqZ81cPPxxfKPBNWUg4ICgYVDr+wuUSg
         i/Zw==
X-Gm-Message-State: AOJu0YxD348Zsli3vEmqE6fUyhumzCOzVkPEhWHFzcPTvW9J+Thx4+ZN
	kOk+fqSgRDNrukK0IxX0cLrZczbOFhSMU5ze8vowH1ELGAMGei0OCfdbT34kpfOWzesZ5C4cwVC
	A1uuK
X-Gm-Gg: AeBDiet6qlxbB2rvHEpDL1L/y+Gmc9zzmQ69Z30SjgzyjkdS3ClfiL8y9PaLwYpa93T
	qErUZ9I8GVD6/DlpZPuOlTv/kQPEOhB5S84NGVcfTYw1DqwhhKX5UjM1riuehx5VA7h76VxZj42
	fOWcN+FP/LuqlQ5GvxqTr0XyRCKZs1L1CfjfPbXovTx9dkPTX1yi3inX730mthSFOfRfc1agw2A
	WXXM0ulhiEWOV6RJpqY8jdfPWlN8ZVSAJ3DglnB5vw0Y+7zuRUutTdN/FxvAlrPH0DKrWsGJqG4
	UvlLP6YVdKmACEqlJwp1epx+c82bAzbn4Cd2oKIWecvEcGNir7Y93pQlKGsweePDufQJxOGkBc6
	K+lB45Lmu7pXD3Fwyv/8d8OjATltqeIj6r16FlEbvYScd29KSTElgY+238y6m/VjZyrv57uDH8M
	nEyOv/tguljBzDBzUqsndf+2bdQj67umjP+wx+VAr4AID/3r5vhekOFL5LdJHo6aVR8cHl+AYGA
	9q1tENi3Q==
X-Received: by 2002:a17:90b:3c4e:b0:361:4521:d311 with SMTP id 98e67ed59e1d1-364c309c2b0mr2392740a91.18.1777544604364;
        Thu, 30 Apr 2026 03:23:24 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dbeb2db0sm321070a91.10.2026.04.30.03.23.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 03:23:23 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: opensbi@lists.infradead.org
Cc: cleger@rivosinc.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH 0/2] lib: sbi: sse: fix interrupted context corruption
Date: Thu, 30 Apr 2026 18:23:11 +0800
Message-ID: <20260430102313.95249-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_112333_137009_4F53067B 
X-CRM114-Status: GOOD (  11.92  )
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

SSE `inject` builds a synthetic S-mode context to enter the registered
S-mode handler. After the handler calls `complete`, OpenSBI resumes the
context that was interrupted by the SSE event. That makes the SSE
entry/completion path different from a normal interrupt path: the state
visible while the handler is running is not necessarily the state that
should be restored when the handler completes.

The current code reconstructs part of the interrupted state from the
handler-visible trap state and from the ABI-visible interrupted flags.
That exposes two bugs:

  - KVM Context Corruption

    If SSE interrupts KVM guest execution, OpenSBI must restore the
    virtualization state that was active before it entered the S-mode
    handler context. Restoring only hstatus SPV/SPVP is insufficient on
    a virtualization-enabled system because hstatus carries more H-mode
    state. Likewise, MPV must come from the state captured before
    OpenSBI rewrites the trap state for handler entry. Reconstructing
    these values from handler-visible state can corrupt the KVM resume
    context.
    This follows the earlier discussion [1].

  - SSE Handler's SSTATUS Leakage

    SSE can interrupt kernel execution at any point and run a complex
    handler. PMU-SSE is a real-world example: with PMU-SSE
    enabled, `perf top` repeatedly enters the SSE handler and completion
    paths at a high frequency. Any synthetic handler SIE/SPIE/SPP state
    that leaks into the SSE-interrupted context is quickly exposed. With
    the previous version, this could resume with mismatched privilege and
    interrupt state and lead to an "environment call from U-mode" panic.

Fix this by adding OpenSBI's private resume-state to `sbi_sse_event`.
This state must persist from `inject` to `complete`, but it must not be
stored in the SSE attributes: the attributes are ABI-visible and can be
updated by the S-mode handler. Patch 1 saves and restores hstatus and
the interrupted virtualization state. Patch 2 saves and restores the
interrupted S-mode SIE/SPIE/SPP bits as a unit.

PATCH 1 is the OpenSBI side of the KVM context corruption fix. The
related Linux side should preserve the kernel stvec in do_sse() to help
protect the virtualization context. I will send the relevant Linux
patchset updates in the near future.

[1] https://lore.kernel.org/r/9290f53d-3545-4299-9781-c1c558f71158@rivosinc.com

Zhanpeng Zhang (2):
  lib: sbi: sse: fix KVM context corruption
  lib: sbi: sse: fix SSE handler sstatus leakage

 lib/sbi/sbi_sse.c | 80 ++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 33 deletions(-)

-- 
2.50.1 (Apple Git-155)

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
