Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847FCC3ABBC
	for <opensbi@archiver.kernel.org>; Sat, 10 May 2025 00:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OcujRDuqPaPJg+Lv/FaqNy650bQXzdIhuLHK//C4OE8=; b=eoO
	s4VFapN8XyDg2J/xqCLfZABtHBX+UTF548W6msqUV35Qfnzi4cvKOvc8KCGx9FuA7eTNeMp+6G7Fn
	AL2r3nITHDijEJ4qKwXYYI0zABamEPolLmMPmLd70NXaV1eF4bBO5A/5o+eFzMZDWZz38Zhq5KvlD
	OHeRV4y+KTyBUhT83YLtckIMPTWdHf/kVsPmIHBYG3C0NBB+W8cLxUqGgy1LlWuOpXOctUzOAlOwB
	KPq5zTSEOOvddVV+Y/UiXZ2CTM8Ni1NiSMMCnw4lgKhJlsmo1mxxRiXYvONbZnmIlhoqdbB8UBS9N
	rWtnLJRNl39dBakXKIJlteQFxvFlp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDY3o-00000005BcH-3oOv;
	Sat, 10 May 2025 00:27:24 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDY3l-00000005Bas-2G7Y
	for opensbi@lists.infradead.org;
	Sat, 10 May 2025 00:27:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54e816aeca6so3730290e87.2
        for <opensbi@lists.infradead.org>; Fri, 09 May 2025 17:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1746836838; x=1747441638; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3mVG1HeM3gdC8OZro3hpeCvElqs1hv0qRQHLs49i9jU=;
        b=TZ52jrIK5E94vIBS7ZM2xfk9qPZPIqkiuewItaJzc2mkvbsOoTY5mqO6pkBDB7RWnn
         7w4GbA0wSsGLJOILtwzAXhzlNEKxeKoxmFSO6gkYGfIEQdfl0EqWDvVAFWaUdelSNEgg
         TLQECl+1I5Z5WC8+O5hjSMw/fbypKBmnvgIr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746836838; x=1747441638;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3mVG1HeM3gdC8OZro3hpeCvElqs1hv0qRQHLs49i9jU=;
        b=BOytcLUptIQYst/RaR1IU6l8/t/4uvteYoD0ifrJL+yw7aSb4mJLTlD4LZa+AwnK76
         V6UFMX9wNZldz2u+bfKH3MOIw4K5sP4dgaFFG1+XBQC1NEE6XcOzan/972KeMDWbJhLg
         V2nUJhsceeHC1tmlUUqqoUrl9CCeAZc9x35u1zfuMD+xlc3ruGXtlV2xl7wD9SJa1f4K
         0JnyHMlw/jBo+q1zD1BXtIYOhEVqI9O/ssLqx5vzfrHSbu3uzBtBxVrGh5TZyoEWwUZO
         cMcAcJe0fsOQIhKS9aUy9UOWr1wbX8+s4lMWpdQ4v1H0ppRCz/G+F3UOZUEbOYcHcFBi
         BTXQ==
X-Gm-Message-State: AOJu0YzMKXF/ikcFRWveD0IUOpGVPT6joM7qYIQ506Qm8mHsy1LsI7eg
	tOiROLBULN2ay9xVINbU3bTnB8VpUvOaHAjOfFdKzcYuXgkroHS4LoS/HslxRKpsDh5CQ0mP0Ut
	H9XmWGeSnoeWCO8iMNfXh57F04bqhy9qb2zxYMpkdc6sTTZYVaA==
X-Gm-Gg: ASbGncuLsnkokzDYnEIfCa39WCekBRzMnQessGrgZwGudWn/0RN9rjKEpP8IGDo7Y3F
	8ytUNluXrVAT/ci6dZIBODG0RpUW8aGhcIh+srpsfEnVW3Sfh6RoK8iR8S0ZUKgx0DhIG9BSsDk
	UKodK/xOXoNHlPjZqWkgjkvVzvdlVSs8mZ+cOg1sux
X-Google-Smtp-Source: AGHT+IHq1BR2RwD1OajhP+/YiGZ9fkf144EzsbbWtinB6VHcq7O/YUEpefqqQEj01YRC/lW7eaBIPZsS0NcfX52nkTg=
X-Received: by 2002:a05:6512:10ca:b0:54c:348d:19b7 with SMTP id
 2adb3069b0e04-54fc67e34bcmr1853508e87.46.1746836837608; Fri, 09 May 2025
 17:27:17 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 May 2025 17:27:06 -0700
X-Gm-Features: AX0GCFvBhojEPGxCv8S7ei1dcTB_JLnwOyhSbEHrwZ9C3QNaeRIjn699JP7VHCw
Message-ID: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
Subject: Public Review : RISC-V Supervisor Binary Interface (SBI) version v3.0
To: OpenSBI <opensbi@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, isa-dev@groups.riscv.org, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_172721_573154_EDFB3B96 
X-CRM114-Status: UNSURE (   4.71  )
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

We are excited to announce the public review of the RISC-V Supervisor
Binary Interface (SBI) version 3.0. This 30-day review period begins
today, 9 May 2025, and concludes on 8 June 2025.

Specification Details:

Downloadable PDF Version:
https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf
Source Code: https://github.com/riscv-non-isa/riscv-sbi-doc

How to Give Feedback:
Email your comments to one of the following mailing lists:

public isa-dev mailing list(isa-dev@groups.riscv.org)
PRS mailing list (tech-prs@lists.riscv.org).
Open an Issue or Pull Request to SBI GitHub repository.

Review and Ratification Process:

During the review period, we will collect all feedback (comments,
corrections, and suggestions) for consideration by the Platform
Runtime Services Task Group (PRS TG). Minor corrections and
non-controversial changes will be incorporated into the specification
directly. Any unresolved issues or proposed modifications will be
detailed in the public review summary report. Assuming no issues
necessitate incompatible changes to the specification under review,
the PRS TG will propose that the updated specifications be ratified by
both the RISC-V Technical Steering Committee and the RISC-V Board of
Directors.

We extend our gratitude to all contributors for their dedicated efforts.

Contact,
Task Group: https://lists.riscv.org/g/tech-prs
Task Group Chair: Atish Patra (atishp@rivosinc.com)
Task Group Vice-chair: Sunil V L (sunilvl@ventanamicro.com)


Regards,
Atish
On behalf of PRS TG

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
