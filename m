Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D84BFF8868
	for <opensbi@archiver.kernel.org>; Mon, 27 Apr 2026 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vV8NJjdmn458wQ6UM1ekMRSfY8gabXKUgcVGAnlNBtg=; b=AfcQMmcD79I6RK
	IoIrJ6ijWoIg6MknfP4HwmJx+C14LCBxLyHFxz8FSZ5ASZgaoIGeBXBbX1KVy8LtBPEV1O7k/VSVI
	jTiSVH5oIRpeOJomZWDbyZYyYv3BjOz4O3LJr7YxBd+O1VvfYqHb3ppsTldYxBqRolZOa6pRtHk6p
	qfTOZ54uh5uIKKwSNiMCvtd/aB1XJvM92scinGHVjid6qV3FaPNy0J6o0VDfMjEg7EruMuLKYCM2/
	tlL0fklb9g8DwH9MDYbc1xKRzUhdFQCIAHvHGbvqUF1vvpzpC2LNZ9RlN3LJXLcQB2hqudqJpY0aC
	2XPZaho3ULmB4Bi/qTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQGX-0000000HWyp-0TR4;
	Mon, 27 Apr 2026 18:01:05 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQGU-0000000HWxz-03RI
	for opensbi@lists.infradead.org;
	Mon, 27 Apr 2026 18:01:03 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2d9472c97dbso831634eec.3
        for <opensbi@lists.infradead.org>; Mon, 27 Apr 2026 11:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1777312860; x=1777917660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy5HJox9K+ywpNoWtH5Xdo5WQ8DmepzpqgdDEmdFO70=;
        b=OVvWBO+g3J8dEHsg8DuJRnZtSgUZt9pHib8qQnR0GsIoqDqFmhDG5vmFp/wvDFrRfv
         uJb8gtZyf8kAzq39MVAb1vh0g3+Ne8mFFLWqvdfoT8hgB2fyo8lhpqJQzkilPnRt3IrU
         /oKJGXOPvQ5s4KnDAoPgPXhIm3YczpTWO4ZpWjCChQUYgWYWWOQsd5KhOar/oBIfRMKs
         QaiMUrc4MCNfKZ7GeIVH0KFFMlndbedq8pavhKMsZS0bW1iiGsIuVsEBVHmyyP43JTMg
         pb8U2AYNpYtTo/mBprT+/yUeCGL0hNHKJBuHLCsKX/+OTJbJ5f3OckjWkZbjyAPcxiDH
         CM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312860; x=1777917660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zy5HJox9K+ywpNoWtH5Xdo5WQ8DmepzpqgdDEmdFO70=;
        b=Airj2u0x1+x+0pdfbbhdDvKxE+WUBFjlJ7z3soFm//KK/dKnjRZGAyxIcfPk34ch+0
         /cO+sY6xZXRPMMlFrY8Rz38UuQqJDJpRvg+3+GntEcET/kM5xmKEXRGDbDF5YuEFwBQ4
         8GYg6iEprunZPugtzBxdwUxhaTFyllcof67xD7HJ5S/uxyqkZQII4/bmyuXRhsefbpFk
         70k3wUcR/knZOTFTu6HrlaORzLJDCvYowjkCjOHFYxndh8JZXkNev8pCEZJXOAMKaDTV
         fmOxn2/tjiTXYdRSiFFgY8mXgAjIzVFmhIaR/jfVIN2w4aoEDWGTGG3X1TAFhhxawmIw
         8wQA==
X-Gm-Message-State: AOJu0YwbeGOXO8BpwzM5KW3Ek/UefCA9FkBWo3GpjAvEeeCkZ4Zl261E
	tSKqC/vJxlJHDkHA/3wZljDK8TjhJcokYdxUpRZtD/J7riJcbSwi1rXwioUjs/7PHKM=
X-Gm-Gg: AeBDievNz7C/7TrB7QESUGfsRDFwTowfQTwReMoMLoY2tE4WuZL+KaZjCBLJLyNyumb
	M0V6CT9Pt3FbE8Jx2Kp95EjUROuZZCy8Hekwe4zXFz/80Mx5LOQRQOI3SBD6S5hBiMyEkXy7I0G
	pQbGDTNhq0AbwEoeB4zh9596PjwLctB8L5qPHGL+gLpUB/WQJEqXiWAujqbmqI+fYOJLvmcEo0g
	AmncLVxEIPpe+1A8LVMHmGOOKcbaFM6v+ZRJ2MBCoZjVxiVzVh6ZXaDYsX37rOsLmim7xhqK1um
	ZFaQLordVltR5cSVUE5eFXPEKZns+kZKiwmIEAjBTgCqrMp9gfXK/NGXyLiymHmavuIxJSChBg+
	GSAC9FQn5eyrF/+juZeIF/SwccWukx3PqAXE8XGONKdUNtYP9OqtledbWiNrKdxZmt/epQh5QOP
	+BrIU+e4U1Kd1yYR70Ya3YBjbqZq6AjYxEXwXXivw8ohwV42o9Mubd3VGeYnin51SKnhqJgoY=
X-Received: by 2002:a05:7300:8b05:b0:2c0:c55c:156f with SMTP id 5a478bee46e88-2ed09b81261mr3711eec.4.1777312859968;
        Mon, 27 Apr 2026 11:00:59 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e7025cf413sm40565350eec.15.2026.04.27.11.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:00:59 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org,
	evvoevod@tenstorrent.com
Subject: Re: [PATCH 3/7] firmware: Add RNMI/RNME handler infrastructure
Date: Mon, 27 Apr 2026 18:00:39 +0000
Message-ID: <20260427180039.2472287-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy1kwkZtHKUzQov=b8_PvnXT1DZ379P_egDtbpSbkN03dw@mail.gmail.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com> <20260310183155.2186463-4-evvoevod@oss.tenstorrent.com> <CAAhSdy2PHSsMNib5Bscp1mWvdQTii_PG7jDpgR9vf_f=7x04sw@mail.gmail.com> <20260409191943.291207-1-evvoevod@tenstorrent.com> <CAAhSdy2jFkLSH0WThrcEg36LDc+hwiGHRcHGOZ6+FxdO+ok+2Q@mail.gmail.com> <20260416202608.1125121-1-evvoevod@tenstorrent.com> <CAAhSdy1kwkZtHKUzQov=b8_PvnXT1DZ379P_egDtbpSbkN03dw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_110102_163032_C82ED0AD 
X-CRM114-Status: GOOD (  12.35  )
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

On Thu, Apr 23, 2026 at 10:54 AM Anup Patel <anup@brainfault.org> wrote:
> I am leaning towards option #2 and as a separate series
> the sbi_irqchip can be extended to support NMIs.

Hi Anup,

As I'm working on refactoring the Smrnmi series according to our
discussion, I'd like to suggest to go with option 3. It would be
much cleaner to introduce generic NMI support in irqchip and build
Smrnmi on top of that, rather than shipping a temporary
ops->rnmi_handler bridge now and refactoring it later.

NMI support in irqchip doesn't need to be complicated. It could be
as simple as this:

irqchip NMI API:

  typedef int (*sbi_nmi_handler_t)(struct sbi_trap_context *tcntx,
                                   bool resumable);

  int sbi_irqchip_register_nmi_handler(sbi_nmi_handler_t handler);
  int sbi_irqchip_process_nmi(struct sbi_trap_context *tcntx,
                              bool resumable);

A single NMI handler callback not tied to any irqchip device since
NMI is a system-level event. Platforms register their NMI handler
during init.

Two assembly entry points in fw_base.S:

- _trap_nmi_handler -- for generic unresumable NMIs (uses
  mscratch/mepc/mcause, returns via mret). This covers platforms
  without Smrnmi that still have implementation-defined NMI vectors.

- _trap_rnmi_handler -- for Smrnmi resumable NMIs (uses
  mnscratch/mnepc/mncause, returns via mnret).

Both save the context into the same sbi_trap_context structure and
dispatch through sbi_irqchip_process_nmi().

C-level dispatch in sbi_trap.c:

  _trap_nmi_handler  -> sbi_trap_nmi_handler()  -> sbi_irqchip_process_nmi(tcntx, false)
  _trap_rnmi_handler -> sbi_trap_rnmi_handler() -> sbi_irqchip_process_nmi(tcntx, true)

The "resumable" flag lets the platform distinguish RNMI from UNMI
if it needs to (for recovery or just reset), while platforms that
don't care can just ignore it. This could be useful for vendors who
want to share their platform code across platforms with Smrnmi and
without.

For RNME (exception while NMIE=0), we reuse _trap_handler as you
suggested -- it's a regular M-mode trap at a different vector.

The ops->smrnmi_handlers_init() callback stays -- platforms still
need to install the assembly handlers at their implementation-defined
vectors to handle RNMIs correctly.

The series would then be structured as:
1. irqchip NMI registration API (could go in a separate patch set
   if needed for clarity)
2. Smrnmi scratch space and macros which you already approved
3. Rest of the generic part of the Smrnmi patch set

What do you think?

Thanks,
Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
