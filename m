Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182D9CA9ED0
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 04:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLnOznS9CBnbYtqHiXQPN08apJwdCJZ7+rDGz/yeMCU=; b=kEkFXGxYU58bF1
	nNhnF7je/11dhsgcye8Xu2TreaAQXV9sMfniNdCuUSYdCPGUQ0d9zE5J8N4nk91Kq023Bb1qGOixi
	gNr5/CHzAkAG16eP/tCeWDJWAFYYnL4y2DcG3EplG7zItguQno6eUucKSo/y7r5nA9qEPLy1iHuN7
	4JGiK44yDUkBZY+GaO4T7tBy8cTeXMvqCTW+8kP8VgOYhGbjbw4APueT2utgcGYzJpe+yTyrBXl4V
	kL9zMIbdJjidB5hEy4nCbwaMzRmHel9JOKVbdu/dXMBwL0FsDqo/IfR0Jaw+qjSTEF/WUsR/uMP+W
	Zw+1Up8+FAaNWfnHq+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGULi-0000000ByyU-3c3e;
	Tue, 13 Oct 2026 04:42:50 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGULg-0000000ByxX-2Cud
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 04:42:49 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5e948e56af3so637916e0c.2
        for <opensbi@lists.infradead.org>; Mon, 12 Oct 2026 21:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866566; x=1792471366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJcOwkMI8GgUEmS7fMJJyTzNN3YJU88kVPe2CgC8Cg8=;
        b=G2iTPW9EyF72c0To8pLk3L0EEU12w56xcyrc6nOpWBs44lepEQXW5/ij+hVa1Q7cQX
         nE87hLhWa6CwwlTAkZtBL+fxmSUZW10FsiWGmX9ESeNwUoMOqMMB/PnbYUlv38XGfU8f
         fwUHUOybxHQ7q+T2w7fMBhitTsBlcaYY3ju6v4OaDiWdYlb1kHqnEqieit9dYh9D9xT/
         ZCHqzZ3kSoJm0KX/weGpmctb+HhLYDJOagDgKDvKrdWCtkRQK0vGEFr71Vv2Rk6eCCOf
         MLsm+krjxqxBvPKOZzsWWmP33tbeSfeUG4HUR15HLvt0VCGzlh4Cg5PMvVEtfv8Qz9tR
         sykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866566; x=1792471366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJcOwkMI8GgUEmS7fMJJyTzNN3YJU88kVPe2CgC8Cg8=;
        b=QvAEAx2MBJWK33X3R4eHOgX218SI0hteU4DLFH4cRFCpM6pGmD9J4whQvTSwguH1z0
         V22U+FhweM92ok4U1vxB8dWfyit7159bN5eh0xb5gIelw05T/81jJ8szMiENhuQbGoex
         JOYmzPdotcEqRmSjh94WQCIlhaPWAUmBme0e5wT6XH+K5Uu4bZ+lmpTFd8P65rP3Jz7+
         yrXLz9L+1OakNcfbrPBhWSR/zh9iXcHM8fgGYF2/PVkd3nV/yjGW5pGTKPOO2HVEpRIj
         ZPXc67TlmoBpp0iZwk8IJLPGQttKdbJYFoDNguqmVsQt+dS9vbbq1AtYRyVLyKRl550U
         p9ew==
X-Forwarded-Encrypted: i=1; AKwUvByxPGpc8mivoSJx166trU/oNnYP1xqW5Y19t7atwKLhZaQ5q6HqMzs5Pj+VDCyss3kHNROM6nUz@lists.infradead.org
X-Gm-Message-State: AFq9FYL16TBl8pQbMZGkdmKjKRpOsSCEsy2ckxe5D+UFdv65jmdPdxKc
	QdNO9qaWxgw6jG+10a9ngtMwjnLsLZ0QGCzFa2Gr/k7i38+T2R9qQN8S
X-Gm-Gg: AYBFou3hYLwY96oqAxGgry4uptS7lAGTJTwwkvZGY49akQrdjlxI9WMUlvB1WyGEiRp
	u97FPyKIXr/DYSMqjJGKVXlJnrUgMO2WPWh46MwEfEq+PcsPbOJkwIbhN6xYuU9cf90gITLJHsM
	fyWAGN//Zn4YIrQSW57+EFVbb64maTmkmhYHxCxypvEjf/S+sErNzhnpjl5WJhg4kvKHuQDMLO2
	igouFK3PUFpHwZx5n1KCyqJSCMdtQkxAt3xdnK7eupAhIHqYRIt086lzl07q/yCpd1eJUF31xQH
	K1prsH2Bz2m1le+5oSihf8rp8yOV7Zkbo47noqr1mt9YOSlr27aVRfXRAv+JqDcZcJeiV1kGmKD
	QTLEDP5zJ6feFlXect8Z/iaeTTEPBhC+iCA+A4XQiLEAM+TvNFYTihE/5MiCPzjqU/XiNUODriq
	O/ijj0sO12QcXiQ4KKbPsifNDUuqgt328E07nEnnOIbuZwvygDfRa5MAHB2Fe4ipUfCuQ5JqqMR
	RGbQx/ywhVB6ztcw+C89lcn9cXoH3ibUK+du1hdca6fUTDl2NnGwhW3rrEU20E=
X-Received: by 2002:a05:6122:179d:b0:5c9:a60d:3276 with SMTP id 71dfb90a1353d-5e91f4989a6mr3223546e0c.10.1791866566373;
        Mon, 12 Oct 2026 21:42:46 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab499esm8269732e0c.4.2026.10.12.21.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:42:45 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: pengpeng@iscas.ac.cn
Cc: anup.patel@oss.qualcomm.com,
	atishp@rivosinc.com,
	opensbi@lists.infradead.org,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: Re: [PATCH] lib: sbi: reject PMU skip-match counter class mismatches
Date: Mon, 12 Oct 2026 22:42:21 -0600
Message-ID: <20261013044221.1563754-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827115718.50124-1-pengpeng@iscas.ac.cn>
References: <20260827115718.50124-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_214248_575259_462A88CD 
X-CRM114-Status: UNSURE (   6.84  )
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

Hi Pengpeng,

I reproduced this independently in both directions, before and after your
patch, using a bare-metal M-mode payload that issues the ecalls directly
under QEMU. Base was master 6ad246a1 rather than the 4e79fd7d you list;
the patch applied cleanly there. QEMU 8.2.2, gcc 13.3.0. Smepmp was not
required.

  direction              tree                  result
  FW event, HW counter   master 6ad246a1       M-mode store access fault
  FW event, HW counter   master + this patch   SBI_ENOTSUPP (-2), survives
  HW event, FW counter   master 6ad246a1       M-mode illegal instruction
  HW event, FW counter   master + this patch   SBI_ENOTSUPP (-2), survives

On the first direction the fault is consistent with the underflow you
describe. ctr_idx is int and num_hw_ctrs is uint32_t, so ctr_idx -
num_hw_ctrs is evaluated as unsigned: it does not go negative, it wraps,
and the fw_counters_data[] access lands far outside the hart state rather
than just before it.

Tested-by: Sebastian Alba Vives <sebasjosue84@gmail.com>

Happy to send the reproducer to the list if that is useful.

Thanks,
Sebastian

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
