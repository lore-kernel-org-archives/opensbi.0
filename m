Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E662C54E65
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 20:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UVvOGVMgf0G8HowuOhYCWptCNkecVzmwOhCeW6W2DE=; b=suehA423Ld1IxD
	OZf79ewjTXouiHqxX+rm7Z3I8Hye3DCvd/r/qMFEZHp+NQDxVE1jpYaofY86/zwAhuOYR9eBCgkPM
	icQiOREwbIJcfDlEqrUhudX4Px1r9QR6+CntCqlZplPQ7LmbB4xDqyu3FZ3mEL+4NC8GOVnzpI5d4
	JtfoxCN4LF/ki9V5/KyPaRxxPXtBjeQaqjuLD+B7sM1Rdjbhw1T/2Mn3BV6qCez3nxwMgpXBOCcvp
	7Ktbctl5jqxeqoxOVbxQJnjZP74LcmZw/LTSiIR0FpU/6B5svyI8pf6DpCxdkbzn5ecqams5Y1LvL
	PeURBAcxr/8y+QnERWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICtv-000000029nV-0nBJ;
	Thu, 22 May 2025 20:52:27 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICtt-000000029mJ-113J
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 20:52:26 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-551efd86048so6602127e87.3
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747947143; x=1748551943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZolcgNE9jlYiD1CDAlD1Gr0448/GNeaEVH0PcI066w=;
        b=DEChfW3XpxKm4U8R3YYesdKlDNFqeb/SB9HdxmPF7CxoswnPpGcsLirKYbR6qalLsF
         HkccCecGep6Dejr+Xllg0/dmgcTSDoVXqLaLZcTOiZ2tt48lBMMoTXK/IFfmfr/bRkXO
         qN5XmCufWcIS6DLxByiTkSqt/1fNvZlX6NEWTcJOBOq2VALpiUzJPZfKcLQU739yJYej
         HMDDu2MDhjaUUmf48UPoI127LGnekXdn6VTpXEu9TW1p68fKsIhvss2Ba/e4uZffu+8R
         Qnk8uYmbjS7y8c4xaf6ybB9Z2Zvzeq7Uj/prTOZEuyyKk403IU8HOvU1IM/ShJZEAMNb
         4i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747947143; x=1748551943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZolcgNE9jlYiD1CDAlD1Gr0448/GNeaEVH0PcI066w=;
        b=PmJB2RZKHfVjYg0OcJmxB5bgrus0doNUA2Q69h7ZmisofqJ1NIzl2Dwfh1QiebCAHJ
         oiZgPycNAOHOq0ZHrYlvZe/lhWLSaFSz5yhN8VnKr/KH6XUtjH4EppeglUyVY1Eho4qw
         gSc0o9UEU4MnC0duv039Rg7O6svugxl0o8RcrQLoIoBgVNBgAuXch+CWZwuGQmx9Tdo3
         TBQqJjkiOI4W11UvrZeGy5v8ZzG8ZADoaVkuV3+bDVFThHUhdhSqM4ZM+0Kb6RKLzljh
         v3bic1UY0SLCb/9Sg1re/p3I0770fXlcQ3fdUF1CygvjOjwKmd2OCLt8ZllahzjJ3ZW/
         xNLQ==
X-Gm-Message-State: AOJu0YxX0JC44X8CGAcmEkt67ZnjVooRSxQyY3XuujsCmumMREPczwjW
	TkpQY1+SJAfxQthzA/qd3EtM6/QF/0W5hEXdU0qpam8we/DqYOjwm86KyRNxgj8zwZA429w2HWg
	uOckIVYmHIo9hwKidKgcUnkfvYD8GyI8=
X-Gm-Gg: ASbGncuM5BnNCTGG+VX238fYvom4Zw/autfYeU4N4cWcHVBv/eWyT3iJjTQezhR+COi
	PEY9QPHxGMhYBeEwmnoMQaeo9oyFzoNze1jdN2XI3JQcW/gFaABFI1jAs3ABY6yxca5+4hupKx+
	z88tZ66qV45f0qekGJwMahrTg2cFThNV608g==
X-Google-Smtp-Source: AGHT+IEWt5tg8iMKaxV3Xb0E8C4oEuN3LtHyhVkYKGpaI8PdvzTicQjCh0zP8bno6KBVhi/5oGbrlWWs4wWPKAFJ13M=
X-Received: by 2002:a05:6512:6090:b0:54f:c4e0:e147 with SMTP id
 2adb3069b0e04-550e97e096cmr9011033e87.34.1747947143209; Thu, 22 May 2025
 13:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250519215848.27569-6-cfu@mips.com> <CAAhSdy3W1fUAMdsL=GQvO3TpE_T2mEQEs_aX-CsJnPz_kk=KTQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3W1fUAMdsL=GQvO3TpE_T2mEQEs_aX-CsJnPz_kk=KTQ@mail.gmail.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 22 May 2025 13:52:10 -0700
X-Gm-Features: AX0GCFv4ShLq9XnG9443h-I_Ckp_XAcl0xu_6x6nIsR3ZBCgSSD4E8uJk5YnVaQ
Message-ID: <CAM1rFzH4R5fZO9ZdX=0nJnT-YabRz_ZnYAiGgOx8hnLqQc+jHA@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] platform: generic: mips: add a dts file
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_135225_274952_B4C392C5 
X-CRM114-Status: UNSURE (   8.52  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgMTA6MzHigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIwLCAyMDI1IGF0IDM6MjnigK9BTSBD
aGFvLXlpbmcgRnUgPGljZWJlcmdmdUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFdlIGFkZCBh
IGR0cyBmaWxlIGZvciA0IGNvcmVzIDIgdGhyZWFkcyBlYWNoIG9uIGEgQm9zdG9uIGJvYXJkLgo+
Cj4gRXZlbiB0aGlzIHNob3VsZCBiZSBwYXJ0IG9mIHlvdXIgZWFybHkgYm9vdCBzdGFnZSBiZWZv
cmUgT3BlblNCSS4KPgo+IFJlZ2FyZHMsCj4gQW51cApZZXMsIEkgd2lsbCByZW1vdmUgdGhpcyBm
aWxlLiBUaGFua3MhCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
