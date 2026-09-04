Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1324C624DE
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8iVkXmDUsBicYW6HZWQJ9CnbkbCSw54+DFl4j2sG7U=; b=YxVnylsqmY2vFI
	BwgnzFP8Y0VQVYRoyTHu1/01/Cp/kbRrfmDuJaIs5mu2SgunTxEWwAwmDr80E/4cSMyJ+2uu6k3iE
	0MYz6rFdBaZCYod9py8YsrqwhdDviPrRzxNluAdxg5r3QcAshUrdjlZRPzUFwOs9tAUd6mTzpD5sc
	Y0/ekywNv9VjQwnP4+8u9gJc7P2L8j6bPHYnv0vcRb/fneH7hw1ydH+G9nlJMJhlT3EfjAnasIODp
	kkaZIwydl78q0NG5olJrGAc4jqM+nOmo7yHvA7n1Vim+hD0OMyLi7FprINORsSrEA9uL+Xf1Sdv71
	7UlArOJTluB8gJuRdKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omp-00000001J13-1iwo;
	Fri, 04 Sep 2026 07:56:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omm-00000001Izu-3tqO
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 07:56:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-482e067e908so636669f8f.2
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 00:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788508591; cv=none;
        d=google.com; s=arc-20260327;
        b=SQ67rw/Ma/j+viw1ODiHFK1j/SqJDUR9HuKb8ysfJXtafhjvgvoCru0bNkV41q75rr
         1ttyE+VNhPOAcZ6BOtscebDo5BDtEmUqnBWzhLEDPSP1lOWqiLUQP1Kqm5Ud5QyvJ1wf
         yaSi0QTLu50j3fLKmQK3bnlm6uxjbgIwyTpunP6QZpNiha84SEMN3YxJZNAx54F692OI
         OhlMuVwUq+QlkYNxP3zT79xSL4CfKr4qshImqxL9qeejAwYAIlUV1Lo3nkRwY5abHIq4
         zGxMaRqI9xv5o5Ru9RutOoy/FQlycHAGTdr0OB5J0DDyZpztxxmDQhG843e6Aw6CyzFD
         Q19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nNi8qmgYgMbdhyhCxP6+dVntahF/FJG7kc+gYGJ9U5I=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=k1yaq8CGCJJqSoVeUdg49HljB/9/U6yFOCsq8ySPO5kxknnpXIrZ3hvVbRKBRzXgib
         YwoslPQdZF53xzEW4eBGix6JyUsv7LoDKHpQFSGPLB0nU53NzRBhKm7oyY33RGfXglLE
         reVMJNC/CQq1Qd12eRf0+R0YQ6KWdBqLS1fz6zKSxDqgHJvnFCKbWVukqJQHunTNzUKh
         KMLcJLp+vVDLhIvBJzB793eWXoGuwutFXBKoa5bXNLTimHvFJ83Oxx21vJPGtucFfr6A
         PO2vMhpIAsnOtYhc0NscOV05kefAWWxa1oBeOxGy/ny0L+6Psu/VDCVIaIcQJsem9yWt
         YPJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788508591; x=1789113391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNi8qmgYgMbdhyhCxP6+dVntahF/FJG7kc+gYGJ9U5I=;
        b=CgOpRrh9wKGSaGYsuL/OftQt4ZqhSMmIpmwSYY91hR2W9gCId8pqK0C1qkoIFVlkT1
         /cXFr9UNHCnOclq8IMo5yxhxbvIlb5Ri/lE0VIXdxdflkoISB/Nta/ZdXNYbTLKyeeyj
         mAwm8LiaKFJU82/t5wCL4vsJGKprvGl+JQ5H2H6yG1bJ2Txzq/f0YSf/g+PchEKPgzar
         YWfny/5BjsV7NehlU7R9XgueFKLmdGb9b2cNefJQbq1ccCY0qElVJaXLdFjVG1WyRAlX
         VOrZnXdt0Z64JZzFU6hmCXr0tw4IdWJRGf4iUwkzzgdcCbwkmlH6pOE7xFCu4FK6Fqx4
         5gDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508591; x=1789113391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNi8qmgYgMbdhyhCxP6+dVntahF/FJG7kc+gYGJ9U5I=;
        b=UWqjtJqsv8z4ioFt3Ip4hCAkKCH5pO/+OR11rqVMEpqnl6Rl4Vc7dU93B0XSet3LEc
         lCYDh1uIoChX7f/8pJn8FxOGGbx3MGp/d7HnVYwSy/EYNQVpdXOfhFoP7sgjGF8urjzC
         3STgY+79ogGTjMkpSQrf+ssnoeUb6LeMHu8pnw2RbStGOwowyBZlCsa5lcNdXHl3rQ1d
         uYk7GrD/uUAFp0UfgqMhET+ckVv+iuYXteTM9fCeMSMNrMrp/kK2hH8V01bkEemKYLrA
         naCrMB+e1USUgKA6g1TnhMBfI1jTm0xSLTHTVfuLLLqaFqCbwFuOVbfWh3fPTop5Sh3f
         v9Bg==
X-Gm-Message-State: AFuF++nY9eFgafMEv1QZK+/LYAbCx+mGh9Lra6lTOGhXsVGwvx0xwoEu
	RB3h2aTtJZWq8D8ITsbwTzwRIe1XDMoQFD2swlXa8Z09LGeTfHH81eu2daanHc8NSvevteIlvpA
	HSYAknyt9GK8jMcgcybo6xpTJydPqN/Ls2mJIimqasw==
X-Gm-Gg: AYBFou2N0pCgGQmawGhM597Rz48C8GxsPGNu0l+s7+G6Cxg+KYtEC8FF8JoZjoziAiK
	5vG1maH+8jxQZbLbFDzqG9GJYPEAJjYUTIRrq/O2UH6N4V1bJ7Z1gVUinAODqBkxgHY1IddKDPx
	t0SRruoRllkN4Oaxj62Jq0WqBaRIZvVK5wgug4z391AdceFDAbrinkFp3VUdoxGsH2QIJPpLLje
	C7HI5xN622+Dbkim08weAT7Kst0s2+jnN36SepokcU5BZDlgawhEnyYJXMU+O6X3dlv4aTvEUE/
	Sj0K3lUQLOrUpX7AyUGQ21+0pgBFpNc2fqXD1Gxr7vCEpRtCoZL9Fk1Ah2UEj8DmrU6YCIW9PVa
	8gmyy2wv62kROTXHVTrz3qg6njNskJCiHJBG8AOHMT1ohuRxwe/WATgJIqjZ/YSI=
X-Received: by 2002:a5d:5f51:0:b0:485:8a46:704b with SMTP id
 ffacd0b85a97d-4858a467215mr2359644f8f.29.1788508590910; Fri, 04 Sep 2026
 00:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260803171128.3506804-1-david.garcia@aheadcomputing.com>
 <20260818210023.466462-1-david.garcia@aheadcomputing.com> <20260818210023.466462-3-david.garcia@aheadcomputing.com>
In-Reply-To: <20260818210023.466462-3-david.garcia@aheadcomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Sep 2026 13:26:17 +0530
X-Gm-Features: AcwNN1UP-1LupyL-oQO2c6ex03mjLVZH0FzrhS-q6OXZtQIb5VjFuMNmTOnW7l0
Message-ID: <CAAhSdy3mQ--TBDTn4fj2ZJJu=2MGCr0WXwX7HEKOZ0tnkx6Hcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] lib: sbi_pmu: Match raw event selector only
 against raw event map entries
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_005632_998065_EB94DDAE 
X-CRM114-Status: GOOD (  21.29  )
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

T24gV2VkLCBBdWcgMTksIDIwMjYgYXQgMjozMOKAr0FNIERhdmlkIEUuIEdhcmNpYSBQb3JyYXMK
PGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gc2JpX3BtdV9ldmVu
dF9nZXRfaW5mbygpIHdhbGtzIGh3X2V2ZW50X21hcFtdIHRvIGRlY2lkZSB3aGV0aGVyIGEKPiBy
ZXF1ZXN0ZWQgZXZlbnQgaXMgc3VwcG9ydGVkLiBGb3IgU0JJX1BNVV9FVkVOVF9SQVdfSURYIGFu
ZAo+IFNCSV9QTVVfRVZFTlRfUkFXX1YyX0lEWCBpdCBjb21wYXJlcyB0aGUgcmVxdWVzdGVkIGV2
ZW50X2RhdGEgYWdhaW5zdAo+IHRlbXAtPnNlbGVjdCAvIHRlbXAtPnNlbGVjdF9tYXNrIHdpdGhv
dXQgZmlyc3QgY2hlY2tpbmcgdGhhdCB0aGUgbWFwCj4gZW50cnkgYmVpbmcgZXhhbWluZWQgaXMg
aXRzZWxmIGEgcmF3IGV2ZW50IGVudHJ5Lgo+Cj4gTm9uLXJhdyBoYXJkd2FyZSBldmVudCBlbnRy
aWVzIGFyZSBhZGRlZCB2aWEgc2JpX3BtdV9hZGRfaHdfZXZlbnRfY291bnRlcl9tYXAoKSwKPiBs
ZWF2ZSBzZWxlY3QgYW5kIHNlbGVjdF9tYXNrIGF0IHplcm8sIGhlbmNlIHRoZXkgc2F0aXNmeToK
Pgo+ICAgICAgICAgdGVtcC0+c2VsZWN0ID09IChldmVudF9kYXRhICYgdGVtcC0+c2VsZWN0X21h
c2spCj4KPiBzbyB0aGUgZmlyc3Qgbm9uLXJhdyBlbnRyeSB2aXNpdGVkIHdpbGwgYWx3YXlzIG1h
dGNoLgo+IFRoZSBpc3N1ZSdzIG9ic2VydmFiaWxpdHkgZGVwZW5kcyBwdXJlbHkgb24gdGhlIG9y
ZGVyaW5nIG9mIGh3X2V2ZW50X21hcFtdOgo+IGlmIHRoZSBwbGF0Zm9ybSByZWdpc3RlcnMgaXRz
IHJhdyBldmVudHMgbGFzdCwgZXZlcnkgcmF3IGV2ZW50IHF1ZXJ5LCBpbmNsdWRpbmcKPiB1bnN1
cHBvcnRlZCBvbmVzLCB3aWxsIGJlIHJlcG9ydGVkIGFzIHN1cHBvcnRlZC4KPgo+IEZpeCBpdCBi
eSBjaGVja2luZyBldmVudF9pZHggYWdhaW5zdCB0ZW1wLT5zdGFydF9pZHggYW5kIHRlbXAtPmVu
ZF9pZHggYmVmb3JlIGNvbXBhcmluZyBzZWxlY3Qvc2VsZWN0X21hc2suCj4KPiBGaXhlczogZTQz
NDU4NDIxNjhiICgibGliOiBzYmlfcG11OiBJbXBsZW1lbnQgU0JJIFBNVSBldmVudCBpbmZvIGZ1
bmN0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBFLiBHYXJjaWEgUG9ycmFzIDxkYXZpZC5n
YXJjaWFAYWhlYWRjb21wdXRpbmcuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9v
cGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9wbXUuYyB8
IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9wbXUuYyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gaW5kZXggNDU1
ODg3NmUuLjY3NmRlOWFhIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3BtdS5jCj4gKysrIGIv
bGliL3NiaS9zYmlfcG11LmMKPiBAQCAtMTExMCw2ICsxMTEwLDE1IEBAIGludCBzYmlfcG11X2V2
ZW50X2dldF9pbmZvKHVuc2lnbmVkIGxvbmcgc2htZW1fcGh5c19sbywgdW5zaWduZWQgbG9uZyBz
aG1lbV9waHlzCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBGb3IgcmF3IGV2
ZW50cywgZXZlbnQgZGF0YSBpcyB1c2VkIGFzIHRoZSBzZWxlY3QgdmFsdWUgKi8KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChldmVudF9pZHggPT0gU0JJX1BNVV9FVkVOVF9S
QVdfSURYIHx8Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2ZW50
X2lkeCA9PSBTQklfUE1VX0VWRU5UX1JBV19WMl9JRFgpIHsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICogT25seSBhIHJhdyBldmVudCBtYXAgZW50cnkgY2FycmllcyBhCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIG1lYW5pbmdmdWwgc2VsZWN0L3Nl
bGVjdF9tYXNrIHBhaXIsIHNvCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAqIHNraXAgYW55IGVudHJ5IHdoaWNoIGRvZXMgbm90IGNvdmVyIHRoZQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiByYXcgZXZlbnQgaW5kZXguCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAodGVtcC0+c3RhcnRfaWR4ID4gZXZlbnRfaWR4
IHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldmVudF9p
ZHggPiB0ZW1wLT5lbmRfaWR4KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBqdXN0IG1hdGNoIHRoZSBzZWxlY3RvciAqLwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAodGVtcC0+c2VsZWN0ID09IChlaW5mb1tpXS5ldmVu
dF9kYXRhICYKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0ZW1wLT5zZWxlY3RfbWFzaykpIHsKPiAtLQo+IDIu
NDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
