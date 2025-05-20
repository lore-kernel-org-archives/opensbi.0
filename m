Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37238C3DA6D
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 08:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7B8sGNb3NW3U731Vpy+WRJOE8sTnAa9+Cgwo4VmwZ1w=; b=TROydXAqSf94Ge
	ILG1P+BOj7oYwQpHFMWgDWM2IIacdJsVN2Mp+gPfCH0qh/XE9PvBZ7o5TyQqfN3njEM1rv2ofSEQv
	ni/0Mfy4ufHbqh5Hin6iVDjJjh9hZl+RYiDLlPL9QBJgv2yCMSdahJDj+i3R2M+d7v1pdUmgJm66x
	6nfnYnMAOg2gCy8/ZfXCOkUN0SKk6WHAVxRqsxuJ/LnX+YQkfoQE7LekXffX7HDJimLq7w/DvZ9hd
	0fRJBjMxc8PD1eqoUMw+tKrbdkXu6sJem+RB/cjqAOITMbwLUSslJhgBECrH2J0zIsfJhkOrT8aPl
	3Qxzvp4hNSsoUeDvF1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIFD-0000000C0N4-351A;
	Tue, 20 May 2025 08:22:39 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIFC-0000000C0Ma-0RKH
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 08:22:39 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3da74959554so17945975ab.2
        for <opensbi@lists.infradead.org>; Tue, 20 May 2025 01:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747729357; x=1748334157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrU6TLkN4vFT1HuS+GGprNhwp2EbEHUrbhvRzbUEWkY=;
        b=OjJpvjImUprAcnGEF9bnvLlHXoBKHnFHUniuHlVKsayVpCYANt/UKZcFFT5km+ycga
         jo2nAO9O2LF5RWs8jNpS7GKo+5jtPC/tOFBS4W45mu9aQMfiF1APom1Gj5EnzaZynA5j
         Bp3ZjNQrD9QfHHeWFDQrWDmpY9QUbZay9rCyKz1Ji+7dXSYXGxS5Di1O5founQeLBGgn
         hD6tVh50JC5D4gVOohjXwMrjrd+JeXVopRjnof8RkPh9DQw9CR6JjKodIdHcD5lO81tM
         kPtJJCxgJqMDZosQucZRuJOIM6EexogRxYhtSJ7FMsp8u6ejQ72CsZDT3PU5k+hmDwyx
         sZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747729357; x=1748334157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrU6TLkN4vFT1HuS+GGprNhwp2EbEHUrbhvRzbUEWkY=;
        b=lFkl2C4+72eKo8sIxqX28T7ebSxUvOGzhyOp0BtLrPgLO+LbRpUXTLyGWtP37bzByq
         QpkfMsvQP5JVpqmdBcG5WXq3B84IH1ufN//bMJ4EA9LW1MZD4DCdcjfV4Jbg4RaS9XHd
         OWqyL9W9LiiVXZXfVE67ngPdOUJSX+NDQlMtLk5wNnrM09fPtEi+ji3ZsOvY9N7sgSRN
         2RVUvkrbHc+KVWWC8C04y5R8mbJVDJPuMNf3JJWd5O/4wrfsN1FEoTFKSGcpAz1qTP2l
         Kc70Gmjf+10E8nSmT25Hj4pb1Dl3RJshkzWlnr0Zu90DcfUoVb1xjXP3DmjxwehXpRlo
         iFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyhOoLH40MeBJr2StsmDgif3J+RzswhAik4L21SPkD9X2QJNepJBct5haXKf5N+6uP8/a5q9KU@lists.infradead.org
X-Gm-Message-State: AOJu0YyNRnZkt7QkP2CE/lIBX3Ue9e+ngj3RSIn62eFb8jYscjYVm6xV
	7hpfv1Rhrr3idDdG8Pl5Wt6Owb1D90dFM+4NvRQSD5fzctzIVQAreIB6kfFQ4R6noco2fXOiXwM
	JDSu+pBFMJhTeuJqpM3UpeEg+GJgGk4pWf9YL3MTUYw==
X-Gm-Gg: ASbGncsSJHLZ693/8mOZorzcXSZcEOKsz8GJboaqzQfA/0Nt0lHkdJKSuCxiXpImH+I
	xJPjLfmwKeJk/jzwmvNhsKLzgAnJGVM+hMIiyeAZ+wzqnFh5bYq37Lq6sSG60/T4WQ05oFS57pZ
	bMz5ENvAdATneJruFFpvRs8umh8pnnJDvc2g==
X-Google-Smtp-Source: AGHT+IHZsazubfPh6g7Ex1/htuB91I0qIdAxOZq8T3+fwkuJ4zSVgVWh4r6ZveJrthx3RsaL+09t+lS4mqpIgSvWqzU=
X-Received: by 2002:a05:6e02:4515:20b0:3dc:72f8:eb5a with SMTP id
 e9e14a558f8ab-3dc72f8f6c6mr38756695ab.8.1747729357211; Tue, 20 May 2025
 01:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250516122844.113423-1-apatel@ventanamicro.com>
In-Reply-To: <20250516122844.113423-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 13:52:26 +0530
X-Gm-Features: AX0GCFuOsU3bOCmeGzk27OZ2xe2M4XzSBBjUbEay9ikxQeihMxYQTcpQh6dmlHg
Message-ID: <CAAhSdy38X+3VF4owqsTzHxMEB2KXMbj4pCSATepsR5rniHb7hA@mail.gmail.com>
Subject: Re: [PATCH] include: sbi: Change SBI spec version to 3.0
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_012238_144855_C75D1D3C 
X-CRM114-Status: GOOD (  15.12  )
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

T24gRnJpLCBNYXkgMTYsIDIwMjUgYXQgNTo1OOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE5vdyB0aGF0IFNCSSB2My4wIHNwZWNpZmljYXRpb24g
aXMgZnJvemVuLCBjaGFuZ2UgcnVudGltZSBTQkkgdmVyc2lvbgo+IGltcGxlbWVudGVkIGJ5IE9w
ZW5TQkkgdG8gdjMuMC4gQWxzbywgbWFyayBleHRlbnNpb25zIGRlZmluZWQgYnkgdGhlCj4gU0JJ
IHYzLjAgc3BlY2lmaWNhdGlvbiBhcyBub24tZXhwZXJpbWVudGFsLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+CgpBcHBsaWVkIHRoaXMgcGF0
Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgaW5j
bHVkZS9zYmkvc2JpX2VjYWxsLmggIHwgMiArLQo+ICBsaWIvc2JpL3NiaV9lY2FsbF9kYnRyLmMg
fCAxIC0KPiAgbGliL3NiaS9zYmlfZWNhbGxfZndmdC5jIHwgMSAtCj4gIGxpYi9zYmkvc2JpX2Vj
YWxsX21weHkuYyB8IDEgLQo+ICBsaWIvc2JpL3NiaV9lY2FsbF9zc2UuYyAgfCAxIC0KPiAgNSBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3NiaS9zYmlfZWNhbGwuaCBiL2luY2x1ZGUvc2JpL3NiaV9lY2FsbC5oCj4g
aW5kZXggODhhNjliYjMuLjE1NDAwZTVhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9l
Y2FsbC5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2VjYWxsLmgKPiBAQCAtMTMsNyArMTMsNyBA
QAo+ICAjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9saXN0
Lmg+Cj4KPiAtI2RlZmluZSBTQklfRUNBTExfVkVSU0lPTl9NQUpPUiAgICAgICAgICAgICAgICAy
Cj4gKyNkZWZpbmUgU0JJX0VDQUxMX1ZFUlNJT05fTUFKT1IgICAgICAgICAgICAgICAgMwo+ICAj
ZGVmaW5lIFNCSV9FQ0FMTF9WRVJTSU9OX01JTk9SICAgICAgICAgICAgICAgIDAKPiAgI2RlZmlu
ZSBTQklfT1BFTlNCSV9JTVBJRCAgICAgICAgICAgICAgMQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvc2JpX2VjYWxsX2RidHIuYyBiL2xpYi9zYmkvc2JpX2VjYWxsX2RidHIuYwo+IGluZGV4IGQy
OGZkMzk2Li45YzQ5NmM0MiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9lY2FsbF9kYnRyLmMK
PiArKysgYi9saWIvc2JpL3NiaV9lY2FsbF9kYnRyLmMKPiBAQCAtNjksNyArNjksNiBAQCBzdHJ1
Y3Qgc2JpX2VjYWxsX2V4dGVuc2lvbiBlY2FsbF9kYnRyID0gewo+ICAgICAgICAgLm5hbWUgICAg
ICAgICAgICAgICAgICAgPSAiZGJ0ciIsCj4gICAgICAgICAuZXh0aWRfc3RhcnQgICAgICAgICAg
ICA9IFNCSV9FWFRfREJUUiwKPiAgICAgICAgIC5leHRpZF9lbmQgICAgICAgICAgICAgID0gU0JJ
X0VYVF9EQlRSLAo+IC0gICAgICAgLmV4cGVyaW1lbnRhbCAgICAgICAgICAgPSB0cnVlLAo+ICAg
ICAgICAgLmhhbmRsZSAgICAgICAgICAgICAgICAgPSBzYmlfZWNhbGxfZGJ0cl9oYW5kbGVyLAo+
ICAgICAgICAgLnJlZ2lzdGVyX2V4dGVuc2lvbnMgICAgPSBzYmlfZWNhbGxfZGJ0cl9yZWdpc3Rl
cl9leHRlbnNpb25zLAo+ICB9Owo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9lY2FsbF9md2Z0
LmMgYi9saWIvc2JpL3NiaV9lY2FsbF9md2Z0LmMKPiBpbmRleCAzNTE5Mjg1ZS4uMjI3NzQwNWUg
MTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZWNhbGxfZndmdC5jCj4gKysrIGIvbGliL3NiaS9z
YmlfZWNhbGxfZndmdC5jCj4gQEAgLTQ1LDcgKzQ1LDYgQEAgc3RydWN0IHNiaV9lY2FsbF9leHRl
bnNpb24gZWNhbGxfZndmdCA9IHsKPiAgICAgICAgIC5uYW1lICAgICAgICAgICAgICAgICAgID0g
ImZ3ZnQiLAo+ICAgICAgICAgLmV4dGlkX3N0YXJ0ICAgICAgICAgICAgPSBTQklfRVhUX0ZXRlQs
Cj4gICAgICAgICAuZXh0aWRfZW5kICAgICAgICAgICAgICA9IFNCSV9FWFRfRldGVCwKPiAtICAg
ICAgIC5leHBlcmltZW50YWwgICAgICAgICAgID0gdHJ1ZSwKPiAgICAgICAgIC5yZWdpc3Rlcl9l
eHRlbnNpb25zICAgID0gc2JpX2VjYWxsX2Z3ZnRfcmVnaXN0ZXJfZXh0ZW5zaW9ucywKPiAgICAg
ICAgIC5oYW5kbGUgICAgICAgICAgICAgICAgID0gc2JpX2VjYWxsX2Z3ZnRfaGFuZGxlciwKPiAg
fTsKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZWNhbGxfbXB4eS5jIGIvbGliL3NiaS9zYmlf
ZWNhbGxfbXB4eS5jCj4gaW5kZXggMDNhYzcxYjIuLjBhNWUzNTI1IDEwMDY0NAo+IC0tLSBhL2xp
Yi9zYmkvc2JpX2VjYWxsX21weHkuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2VjYWxsX21weHkuYwo+
IEBAIC02Nyw3ICs2Nyw2IEBAIHN0cnVjdCBzYmlfZWNhbGxfZXh0ZW5zaW9uIGVjYWxsX21weHkg
PSB7Cj4gICAgICAgICAubmFtZSAgICAgICAgICAgICAgICAgICA9ICJtcHh5IiwKPiAgICAgICAg
IC5leHRpZF9zdGFydCAgICAgICAgICAgID0gU0JJX0VYVF9NUFhZLAo+ICAgICAgICAgLmV4dGlk
X2VuZCAgICAgICAgICAgICAgPSBTQklfRVhUX01QWFksCj4gLSAgICAgICAuZXhwZXJpbWVudGFs
ICAgICAgICAgICA9IHRydWUsCj4gICAgICAgICAucmVnaXN0ZXJfZXh0ZW5zaW9ucyAgICA9IHNi
aV9lY2FsbF9tcHh5X3JlZ2lzdGVyX2V4dGVuc2lvbnMsCj4gICAgICAgICAuaGFuZGxlICAgICAg
ICAgICAgICAgICA9IHNiaV9lY2FsbF9tcHh5X2hhbmRsZXIsCj4gIH07Cj4gZGlmZiAtLWdpdCBh
L2xpYi9zYmkvc2JpX2VjYWxsX3NzZS5jIGIvbGliL3NiaS9zYmlfZWNhbGxfc3NlLmMKPiBpbmRl
eCAzMDNjMGYyZC4uYjdkYmYwNzIgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZWNhbGxfc3Nl
LmMKPiArKysgYi9saWIvc2JpL3NiaV9lY2FsbF9zc2UuYwo+IEBAIC01OSw3ICs1OSw2IEBAIHN0
cnVjdCBzYmlfZWNhbGxfZXh0ZW5zaW9uIGVjYWxsX3NzZSA9IHsKPiAgICAgICAgIC5uYW1lICAg
ICAgICAgICAgICAgICAgID0gInNzZSIsCj4gICAgICAgICAuZXh0aWRfc3RhcnQgICAgICAgICAg
ICA9IFNCSV9FWFRfU1NFLAo+ICAgICAgICAgLmV4dGlkX2VuZCAgICAgICAgICAgICAgPSBTQklf
RVhUX1NTRSwKPiAtICAgICAgIC5leHBlcmltZW50YWwgICAgICAgICAgID0gdHJ1ZSwKPiAgICAg
ICAgIC5yZWdpc3Rlcl9leHRlbnNpb25zICAgID0gc2JpX2VjYWxsX3NzZV9yZWdpc3Rlcl9leHRl
bnNpb25zLAo+ICAgICAgICAgLmhhbmRsZSAgICAgICAgICAgICAgICAgPSBzYmlfZWNhbGxfc3Nl
X2hhbmRsZXIsCj4gIH07Cj4gLS0KPiAyLjQzLjAKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
