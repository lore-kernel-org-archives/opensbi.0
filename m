Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E707CCCFA1A
	for <opensbi@archiver.kernel.org>; Mon, 10 Nov 2025 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nS7vVkNVCAP+9KR3vWb2pb4BNDQoZ9EdMtyB6YWUWb0=; b=an3oDSs/PYMPtc
	oVWnooWhIFIZyUZlSG1ytfrHGWRPfAtEJZ4Dkdl3AS9jJTIjljX5XDNy5hxpNXcQ9ZxCpaNWOQ8aT
	F0INuhlq42m5nrUoqBBJqsW6PZcYM4BtzD6qrulgAvLVBrjyBOWQDeolqvw+9atzJWZ7vlqLC1Wim
	cKseJoc3iM5Ka9wT0vgbgspthYEbjt2Gc62V00sbXL+2MHjGQ3iwI4gvJu6dLB2Oa7O1GWNQMccDW
	U1Sl1E4A72CZ5XTysCJEy61vnuzfKghZYbhi51V0FlSqCPz6Cv6xHfOH1ps38CsklNE5WMrTLL8gK
	pvIg5NFabdQSzQ9RGpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN7T-00000004y97-2vAf;
	Mon, 10 Nov 2025 08:19:23 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN7R-00000004y7o-19Hv
	for opensbi@lists.infradead.org;
	Mon, 10 Nov 2025 08:19:22 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-43377ee4825so9754475ab.2
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 00:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762762760; x=1763367560; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zTY1r6c2WGQsT38BHWqsdwE8J54eWvKTVnqtkP/UrM=;
        b=rvpWGA+h8jff5yisFWQPblNGxAXbe5sWQ3bW1U9yRz+MvI0dTdDeQD9OB+SJkGoHgo
         UoopRRaNb60Lc9RG5L6bp1RX8q54jDxq8gNuFYqzRFoQflLHlPaYYmhl/SN10Tv4vIW8
         lvWRwUiTNDfe8XjADa4eB/mRPj82eZtM50xXC0XLaW2KmMJk1Ps8q09g10z6SIoFQFei
         Q16CAWUq+wal3fcNPUJh/LxC2Y9YVUfj51Lb3LDdjXuyDo15hGqzotzX4AfROBoc2Giy
         ECCKw3TDMQwFpjlAZgovNCozWNV+gb5VUXknhJp1kfb+vrCnKLo33yxuNmWGtwr+Arpj
         etSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762760; x=1763367560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zTY1r6c2WGQsT38BHWqsdwE8J54eWvKTVnqtkP/UrM=;
        b=vQBmMrxM1QVR2/BxoKH77WQMKiCyrx/ETC97+iiKtpjjHRTDnLUKHGBM62qelTP+8r
         MEGpxwsqqgVpzYkuEsJKRim/EUQ5k0HipZR8EkdbmLzR7ur633S/Yp3E/IznlCjUcOiV
         wA4n+zxzkCmFi9/HNgV+izV2IBNzRedDhDm5i9BPpRuZoPni0Pnf8vLeWoaukQ82Cj2g
         Zw8FazHsUT/ssIcjgGOAyEnNaVVgModpig0IAmUvtTcpyk1BEEuEHPSUoaYALiTCYMf5
         UuCrU+9iCQr0t2IE/yzJQlSDojTcqgu9FUaHoKwuu/4QvxuT4Z/yg4L3ZzhqbKDARhW8
         auPw==
X-Forwarded-Encrypted: i=1; AJvYcCX9EEyMUTvcsIZt/vUwaDVEfIhD7ykfeY/1Zhi82/YGQaw7m0HiGWzGTHZ/xFylKRd1cWOsYpB8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs+z9NxxraDcnmdPt2QjkZRrOFcLxalYbFJNthg38ZaerubT2J
	qPCatg4MGU9/tTD6aS1l62kR+kGAjcLrhZq87XCpzdJeB2SPoeIxSf5ADP0PkF5aFf+wyruggx9
	AAxkWqADpJGYOZP6Jmyv59banPrErUIrL9CE02OidIwLpDjbKDZL8
X-Gm-Gg: ASbGncuw8SIw5QPW03DCgzwi6lPaZeKyqHIY2I8akmuLV7qHNJxC2xgebtRivcbaFUn
	5qCm69ulF4qH60z+r6fsc+85vNeRhOxTXVtT7N1MendQmHoMj1w3fVpwHSnduCmwxosWcAtNO6E
	jU7tK/boHdvXRVj7PiKi14/GX5Z25f0bAxkBmJbyT94+5n7At9KQZJ/rz0D8lB2xbIyTKwgf3tu
	Bm+wh10IosZU0qf3AANisoaRSPERG/yiqPfiylACoK6wapLe/bRi3rJOpqOXFzYMbdJ+n5nHGUb
	P7ae4Q81hCtcR3+Yj3iEq7IKw9BrX07BFuOL0pQ=
X-Google-Smtp-Source: AGHT+IHGemH4OX1UOJqTHZfI5UNK9Y0kp4szhhangI0lCo9gRtmZ63BLQqyYSjBPs5DYQR4TA85KmRWWLUGbcmusOv8=
X-Received: by 2002:a05:6e02:3108:b0:433:7e2f:839d with SMTP id
 e9e14a558f8ab-4337e2f886amr38708615ab.21.1762762760321; Mon, 10 Nov 2025
 00:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20251105011648.9413-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20251105011648.9413-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 10 Nov 2025 13:49:09 +0530
X-Gm-Features: AWmQ_bnKFlR5c3013Ai8Kv202Om8BdwXvLtATeNK9rm8sXE_ronBlhI4PBnvQMM
Message-ID: <CAAhSdy0JnE1MAQ1VHwMQjrnw7r-VeK63-TufShJoSfQV1c9JDg@mail.gmail.com>
Subject: Re: [PATCH 1/1] lib: utils/serial: typo Recieve
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_001921_320054_07CBC2CD 
X-CRM114-Status: GOOD (  13.40  )
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

T24gV2VkLCBOb3YgNSwgMjAyNSBhdCA2OjQ24oCvQU0gSGVpbnJpY2ggU2NodWNoYXJkdAo8aGVp
bnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+ICVzL1JlY2lldmUvUmVj
ZWl2ZS8KPgo+IFNpZ25lZC1vZmYtYnk6IEhlaW5yaWNoIFNjaHVjaGFyZHQgPGhlaW5yaWNoLnNj
aHVjaGFyZHRAY2Fub25pY2FsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3Bl
bnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgbGliL3V0aWxzL3NlcmlhbC91YXJ0
ODI1MC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvc2VyaWFsL3VhcnQ4MjUwLmMgYi9saWIv
dXRpbHMvc2VyaWFsL3VhcnQ4MjUwLmMKPiBpbmRleCAxNzM3NDA4Mi4uYmIyMDljOWEgMTAwNjQ0
Cj4gLS0tIGEvbGliL3V0aWxzL3NlcmlhbC91YXJ0ODI1MC5jCj4gKysrIGIvbGliL3V0aWxzL3Nl
cmlhbC91YXJ0ODI1MC5jCj4gQEAgLTE1LDcgKzE1LDcgQEAKPgo+ICAvKiBjbGFuZy1mb3JtYXQg
b2ZmICovCj4KPiAtI2RlZmluZSBVQVJUX1JCUl9PRkZTRVQgICAgICAgICAgICAgICAgMCAgICAg
ICAvKiBJbjogIFJlY2lldmUgQnVmZmVyIFJlZ2lzdGVyICovCj4gKyNkZWZpbmUgVUFSVF9SQlJf
T0ZGU0VUICAgICAgICAgICAgICAgIDAgICAgICAgLyogSW46ICBSZWNlaXZlIEJ1ZmZlciBSZWdp
c3RlciAqLwo+ICAjZGVmaW5lIFVBUlRfVEhSX09GRlNFVCAgICAgICAgICAgICAgICAwICAgICAg
IC8qIE91dDogVHJhbnNtaXR0ZXIgSG9sZGluZyBSZWdpc3RlciAqLwo+ICAjZGVmaW5lIFVBUlRf
RExMX09GRlNFVCAgICAgICAgICAgICAgICAwICAgICAgIC8qIE91dDogRGl2aXNvciBMYXRjaCBM
b3cgKi8KPiAgI2RlZmluZSBVQVJUX0lFUl9PRkZTRVQgICAgICAgICAgICAgICAgMSAgICAgICAv
KiBJL086IEludGVycnVwdCBFbmFibGUgUmVnaXN0ZXIgKi8KPiAtLQo+IDIuNTEuMAo+CgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
