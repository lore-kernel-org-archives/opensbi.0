Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B73CA9ECF
	for <opensbi@archiver.kernel.org>; Mon, 12 Oct 2026 02:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+aHsxz1PYqXtFCKQIGEY48AkMxbdC0/5klTjvswcyVM=; b=jU5gJk88dJQ2ah
	/+whSQ+sNwY8W2OHqVL/kQVtIDgHCvaxyaZ9vhktSySrJOJxxBQvwWS1H6jZ5/gd7bjePNBh0TTYl
	nJEXFiFWOb1d8rWbP6xIIAHQUWpcT2pT+AUfueOJS/XwVYJSk5j6IHQFA4ZEfjTrBHCuk7GDNpqnr
	O/g4+4+B2jyQVzyh+YxIkRO/dkB7z5xFVlFNgouuacBjZsx2z3M40zWOe9SOXdc6MwlpAK8kK99Tc
	EUb/yfyBJ8Qt6dZMgkR+5+sjZl3dfFpcK11+XhimqTl5vRIPeVoZzeypiVeX6qkGLQQ2KRvh5epwY
	uttzvAJxErliGY8VEJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG5ef-00000009ZfY-1Kt1;
	Mon, 12 Oct 2026 02:20:45 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG5ed-00000009Zf6-1XqK
	for opensbi@lists.infradead.org;
	Mon, 12 Oct 2026 02:20:44 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5da7a39e584so491712e0c.2
        for <opensbi@lists.infradead.org>; Sun, 11 Oct 2026 19:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791771642; x=1792376442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bmijAwB2/P3Gv+dIIYAnw9lJeMbwwpaI+GhJxhb1WPg=;
        b=hir/vMmIh/1zaEY/UIqeYSe8RJWdUbMH7VJAg8mIqgpM/aXzDrv30x8vymXJ1WdloU
         rx9Kv5Rp0fz3dEjzH3V+Mt40dSqexitIoyDdXysN9vLK7BwQ5qPiTFIUeLCptn/mK4zi
         87ngIjs9f6X9DHmew7RVebhQ2aSPShrpzF2Nx9UaoNQ/6bEJv17r2/IEgc02+ajW9qYR
         fBfcwkPdFBibEzfbPCLtcM8RI189z7T+rbiYdAxivRBK3VKH3Ru7KEi8hGRSdPi/uaTH
         rVH3VCt5eXmS0HaCMf/JwJg+I6QXQRA4fFz2Ea44MWRyLVcZommERCQsG10Gm10b3LFW
         l85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791771642; x=1792376442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmijAwB2/P3Gv+dIIYAnw9lJeMbwwpaI+GhJxhb1WPg=;
        b=T6oJyE2NrkON04PE8HU8aydD/pgOtfyFiFXCLqXe7/wI6qNs9/ur4yYCbUn0MSN+pu
         ziyR20Z4KFQnwMQdZIK8qTGna8R7yYB2i3E6t/o6XMJ2lpEepxGQ7vyCIIpbiK19Ufei
         DfgBY/93o78IbkFHkjnshLrNBoqZxqZ5CnzqY2B6RKWs5homZnoeUrU+yJr7nltZV6yG
         1BbhWol5lOzFBzxBp2es41+Q1VrY2z17X7EiQ+wk6TqKUVOJo2fcuNfpk4q/gFdqv8i6
         6b+fMHiYNdCcIgFD5YAtw76wIhIYuVf3zyny3NdCY1ITVforxHZSyDWrQwEqB0xyDR23
         JkiA==
X-Gm-Message-State: AFq9FYIQXh0Ch6seLR0C2fePO6TtQRLkRAhDBByPSdQJjfbPqpyqd1IV
	1Gahb4okcX6zbYX6RImXwf8Ae8wEVLlGuEF9dRNRjvhjwlchL8sVSH050UyU7bVViGS+JQ==
X-Gm-Gg: AYBFou3WxAM9TH0ROByyK+7r1g0il9AeqkJc5auCVg7+nwip4G2q1odzrU5K3fnZbrP
	KrkP4bm5g3wVuh1joE50JsAqbmPOVgyodCAvDXaL5V08aFB+mkXjRdMu9pKr5Dc6W3WdQ5GStnv
	TV3Rmqt2W/zEwJwM4kV/or4CyOdfaQI2ziFwQOgiNHyQ3h4gOJOqwd8IIdGkyyAqVBQoNDDPCdr
	54ihVjI7A9XOIoXEY8z6fQbKL6RGRa4jEb7vQv02TqyT2gwz8XYHxKX1g0llNhETw0Gfy9YSU94
	Tw0JfcDpL//M+xtxUgtxUZGNTPdDbXHOMSnwfOgOKBXnwe3wCmoxA/JZKsLNKAVS2R+CkqcjAKv
	7ih8vFaYOdWuSrrbP2I27JH21D8Jfp1vkYZzQKXpyWdXvUGYZV7NzqMV2pemvBuWNx3o5HEwOJO
	BZSGsbUiIKSJ/OOs8LGX6KHlPFFqdQtJT83R+wWIZ/PBXGwcvGnOiDgTetpqVa/i7TkCWQWu/T+
	DOvhk9AufNpR1zw7LFmwFhB+cwXedh3P3qzKi+GbeaCvL2BLUAW/c8EnhMuBdU=
X-Received: by 2002:a05:6123:91:b0:5c9:a60b:e5c8 with SMTP id 71dfb90a1353d-5e91f4aae07mr2403577e0c.11.1791771641723;
        Sun, 11 Oct 2026 19:20:41 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cbf7fccsm6102828e0c.15.2026.10.11.19.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:20:40 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@rivosinc.com,
	david.garcia@aheadcomputing.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH] lib: sbi_pmu: unmap shared memory on the early exit in event_get_info
Date: Sun, 11 Oct 2026 20:20:33 -0600
Message-ID: <20261012022033.1165060-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_192043_468349_F33F6BB4 
X-CRM114-Status: GOOD (  24.57  )
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

sbi_pmu_event_get_info() maps the caller's shared memory into M-mode with
sbi_hart_protection_temp_map_range(). The must-be-zero check added inside the
event loop returns straight to the supervisor without reaching the matching
temp_unmap_range() at the end of the function, so the mapping is left behind.

This has a security impact beyond leaking a mapping. Under Smepmp the
temporary mapping is a single reserved PMP entry, SBI_SMEPMP_RESV_ENTRY.
sbi_hart_smepmp_temp_map_range() refuses to reprogram that entry while it is
already enabled:

	if (sbi_hart_is_pmp_enabled(SBI_SMEPMP_RESV_ENTRY))
		return SBI_ENOSPC;

and no caller in the tree checks that return value. sbi_pmu.c, sbi_sse.c,
sbi_mpxy.c, sbi_dbtr.c and sbi_ecall_dbcn.c all discard it. So once the entry
is left behind, every later shared memory ecall on that hart runs with PMP 0
still covering the previous region, and M-mode faults the first time it
dereferences the new buffer.

A supervisor triggers this with one ecall carrying a reserved bit in the first
event_idx. The next SBI_EXT_DBCN_CONSOLE_WRITE then takes an M-mode load
access fault on the console buffer and the firmware stops making forward
progress, taking DBCN, SSE, MPXY and DBTR down with it on that hart. It also
breaks the Smepmp invariant that M-mode does not retain standing access to
supervisor memory.

Confirmed on qemu virt with a bare metal S-mode payload, QEMU 8.2.2:

  build                 -cpu                protection   result
  master 6ad246a1       rv64                pmp          completes
  master 6ad246a1       rv64,smepmp=true    epmp         firmware dies
  master + this patch   rv64,smepmp=true    epmp         completes

The middle row leaves this as the last entry in the QEMU exception trace,
where the epc is inside nputs() in M-mode and the tval is the supervisor
console buffer:

  cause:0000000000000005, epc:0x000000008000204c,
  tval:0x0000000080500000, desc=fault_load

Without Smepmp the map and unmap pair compiles down to nothing, which is why
the first row survives.

This only affects master. v1.9 and earlier have the same map and unmap pair
but no return between them, so no released version needs a backport.

Route the early exit through the existing unmap.

Fixes: d97cfb33ae1a ("lib: sbi_pmu: Return invalid param error for reserved event_idx bits")
Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
---

A note that came out of the same audit but does not belong in the commit
message, since it is a design question rather than part of this fix.

Every call site of sbi_hart_protection_temp_map_range() in the tree discards
the return value. There are eleven of them, in sbi_pmu.c, sbi_dbtr.c,
sbi_mpxy.c and sbi_ecall_dbcn.c. The function can return SBI_ENOSPC when the
reserved entry is already in use, and when that happens the caller goes on to
dereference the buffer with no mapping covering it, which is how the bug above
turns into a dead hart rather than an error code.

I checked the rest of the acquire and release pairs on the ecall paths while I
was there. sbi_dbtr_update_trig(), sbi_dbtr_install_trig(), the mpxy attribute
handlers and the SSE event get and put pairs are all balanced on every exit,
including the ones inside loops, so event_get_info() is the only unbalanced
path I found. The discarded return values are what makes that single slip
fatal instead of visible, so it may be worth deciding whether the callers
should check, or whether the helper should fail loudly on its own.

I am happy to send a follow up for whichever shape you prefer.

 lib/sbi/sbi_pmu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e79f6b60..3cc1fc4b 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1075,7 +1075,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 			   unsigned long num_events, unsigned long flags)
 {
 	unsigned long shmem_size = num_events * sizeof(struct sbi_pmu_event_info);
-	int i, j, event_type;
+	int i, j, event_type, ret = 0;
 	struct sbi_pmu_event_info *einfo;
 	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
 	uint32_t event_idx;
@@ -1112,8 +1112,10 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 	for (i = 0; i < num_events; i++) {
 		event_idx = einfo[i].event_idx;
 		/* Any must-be-zero event_idx bits set should return INVALID_PARAM per-spec */
-		if (event_idx & SBI_PMU_EVENT_IDX_MBZ_MASK)
-			return SBI_ERR_INVALID_PARAM;
+		if (event_idx & SBI_PMU_EVENT_IDX_MBZ_MASK) {
+			ret = SBI_ERR_INVALID_PARAM;
+			goto out_unmap;
+		}
 		event_type = pmu_event_validate(phs, event_idx, einfo[i].event_data);
 		if (event_type < 0) {
 			einfo[i].output = 0;
@@ -1154,9 +1156,10 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 		}
 	}
 
+out_unmap:
 	sbi_hart_protection_temp_unmap_range(shmem_phys_lo, shmem_size);
 
-	return 0;
+	return ret;
 }
 
 static void pmu_reset_event_map(struct sbi_pmu_hart_state *phs)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
