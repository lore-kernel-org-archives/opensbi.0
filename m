Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BEBC88E77
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 05:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdwY6NfHmQZuA3eciwpSFUOYgd7tmFspel4c3lcxRw4=; b=JTppbk8BAqqfJa
	7j2EpOGzUXWdbCEjoISnaqhkyU7EpFdt7VUa2ywmfUvTuvsLQdJMk9Phovi/N6CkkSNmxsbHUzz9j
	S9Qtn9KfzOzaiAtDXmMULzVUfmKyEEr4H9i2fAQ/qf52bkW57rX7FDONceLgLRK3vSYBwnT35fv/r
	63mI5zbJB7BAyoWE9x+KpFb1gVW7RAuBXeUrlDMiG9TsSeTOOO+GJhmfVqLceBH2U4a9R9nIAFZdr
	BQJWIF2RXJuOS80g2X37XPKSKfcWwHCVhDoebUhc28OIM3xWXUMerOscWj2HoqnWGHWw9B8RTsGXP
	ddcaWrlrqNDuO8WPlmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6htJ-00000008Mi6-3dK8;
	Wed, 16 Sep 2026 05:09:05 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6htH-00000008Mhl-219J
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 05:09:04 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843378fb37so140798f8f.3
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 22:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789535341; cv=none;
        d=google.com; s=arc-20260327;
        b=JAq+scPOpuOGZheDHE1QY2G0mNORDb7eFZ+D0mHlrv2LcSSdki6TOqIqUvJFcFdtKd
         ilpsm9UWOXRv03TOeux0SFk334wfQOqxX+Mq3/TzXeCxiq7oEy2lPMDgHxTr5XOgn3jp
         OK38XAQ+skb44flD38f/fUCYJAJNNGTv6SGF4pXr9On3AmK9aL9feeide878iPtLSp/J
         UP6aFotzCQkXIQjd8tmrAeGittGxVqBsJQIz/+ImyHn6NNTJAxJv2Dr1ZzshG7kkRFy6
         nMgdiQbFmQiL3xtb6U3BgokHYx+eCyHQYZ+4mgnlXF3LwKCeoFmCB+NWqBE3xB3TNWdG
         Uenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niJMiemjcTrn8X/hDZ19fuU3q1ua2AhuCFtuUisEyfU=;
        fh=eQRLnJNeHQBGvSQQ3K81dsZjCFpV01l3b0rpGkosk9o=;
        b=Qd2xt19tVdhQ8yq1ysDmTcV6Ok8DcLUXT5FD4Qsxz1xLT9XHwaIiVtim3o8wE/Tomw
         Q1Y7Z7slKJgSRVFCNJ55Cui3TJ2TIRLMfarQpdGW3wogKV8+uxorWMXPnZuGyC/fXYIj
         n40ZOpV/n/kmY0OsVTRpxzAfRtnzBvoCdI6ka0qMDy6kOHsuyerImSZGycefbgnYA7SH
         YBUGSJtPTu1iCBPZCM0Nn1/Kogn8eb71JZwr6j769z7NK75G+jIbyNVys4c1XjDXvKeE
         /hN+4DDdttIkbs4ALJTEbpuOBZ9EJW51t7SmINQ9bq0EHanF5sJbpzea+QxPJIkJ+T2h
         xpLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789535341; x=1790140141; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niJMiemjcTrn8X/hDZ19fuU3q1ua2AhuCFtuUisEyfU=;
        b=rMA1MUvKeM4SJEBxPh1tArokvr6XQ+uSjElm7HlmpJbmd7grFVMFx/MqGi1wa6Hyl0
         IelhNkWkQHDB92MQfDRRMgnTQkWO8DCQUBrhrVpJRbizO4kDWA+YJWsIeqle2LyFFAbR
         /EUSs3XwdNoKpfXl2BzWhEkvbqeakNrRsdCAPtOI9tn+pDzFVK9Be2BpoMeh2U1NTLTC
         9pMLAWCq62GWSRj7nPyjGebEZnCHV7iDBaJC4R5pNOxPPtaeWH0ZxM7Sz4jK0Yfh5ACx
         gRk/q59j7+TB+kluGFzX2Hzh7U62LvrQPvbldS9eIFBbGAALG89smRcw20PkgwPPxFj6
         uBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535341; x=1790140141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niJMiemjcTrn8X/hDZ19fuU3q1ua2AhuCFtuUisEyfU=;
        b=Q5IksS/kd+XIqesxSqUq2L/7wS7ZZkm+z/Jn7Muuc5seVhziKL4D3T2ukjjVgjAr3M
         5iiJvfjhdtctnyac3BX9X5Z1S7Icp/Zo6xpdLIcTf/hLFDE6yW+2VDxCwolvJtTW++JV
         4F7hkikhDrrkSs2YzScb55ZRjPZRHK0PTj+wvLR9QDJmG1ZJ1d7ttOhrV5KioB4G151+
         KwIJbB/SntmH9dgZgbcWobciUIcYTbLJN15cC53fiGVia+rk0X+tj9stSSO2M6gy79Tc
         1nfYlO0gVperxNcBXtrRs533ziwH+Rxvt2jOneyIuRbKT5Cf9xj762VqkR3i5CHjH5ci
         fGqg==
X-Gm-Message-State: AFuF++l3ORul6zHLDkHMDL8afL2YKSsGGtF3Y1DFDzg+inwTWO8jnA96
	mu4ngREC17ENxHccPhD4qtlSXHs3NaEvI/pvU4nzKsgaQCBI7TGk/rHY3dYXiBxE4/vzdSH+kG8
	LWWWjrbOe2s+s1SSnDGeOh/fJfgVwH3xDOroVELY+lw==
X-Gm-Gg: AYBFou3/sjA4UTE0xjPTJqr2ReN+ibFoAoPSOxLh9fFyZmyYQWQ0LS/LArLVTCsiQ/T
	OfXcShtiuc3rBth4dkfVSMof+cSjezQJ7/J8MZq37Ge36JOcOfH+DdPggSWd4q0/5zbMK458oFq
	mEZCADNPZko/eLmZS1ColvCGLNrJGTpf9ulu4GluhG6DviUDsSwYTS5dkOKLVDfrqFnuMHdGqJd
	QnhTSU4tHO2/p/kADAdXXopwc6AoltBk+vtguIYoE+k+NtwdyA9MJHTLgt4W3upblQPxWG9XHR0
	9KWL3GL/yE49BrCMmHlTMbfv4t6vlaoCjUZE/TlLpZOYQdZu0UWeaWgulFVc8lpf1h+eTSrD60V
	NW+aK3eXuXrhY+e70+J2FnbDX8gsU8xOsJReJ5q0XP9HKtp7D8HI5vTcigJS1psK2970Xo9G54g
	==
X-Received: by 2002:a5d:5f05:0:b0:486:f908:14c with SMTP id
 ffacd0b85a97d-4870d04bbefmr1005301f8f.47.1789535340710; Tue, 15 Sep 2026
 22:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260901022211.2619560-1-zong.li@sifive.com> <20260901022211.2619560-2-zong.li@sifive.com>
In-Reply-To: <20260901022211.2619560-2-zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Sep 2026 10:38:49 +0530
X-Gm-Features: AcwNN1Ws7nh-KwqZ60IFvGxasTsAHkMFPdQLtcjiBqwf5S7F4UPEhYR7ivVWeOw
Message-ID: <CAAhSdy2c-Cy4TZeL5J8fzQN_BCf5-M9UG_6HSuVum1D5hYNUdg@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: fw_base.S: add a formatted OpenSBI firmware header
To: Zong Li <zong.li@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220903_583698_FF0E5CBE 
X-CRM114-Status: GOOD (  31.05  )
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

T24gVHVlLCBTZXAgMSwgMjAyNiBhdCA3OjUy4oCvQU0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IEFkZCBhIGZpeGVkIDEyOC1ieXRlIGhlYWRlciBhdCB0aGUgdmVyeSBi
ZWdpbm5pbmcgb2YgZXZlcnkgT3BlblNCSQo+IGZpcm13YXJlIGltYWdlLCByZWdhcmRsZXNzIG9m
IHRoZSBmaXJtd2FyZSB0eXBlLiBUaGUgaGVhZGVyIGxldHMgdGhlCj4gcHJldmlvdXMgYm9vdGlu
ZyBzdGFnZSBpZGVudGlmeSBhbiBPcGVuU0JJIGltYWdlIGFuZCwgbW9yZSBpbXBvcnRhbnRseSwK
PiBnaXZlcyBpdCBhIHdlbGwta25vd24gcGxhY2UgaW5zaWRlIHRoZSBpbWFnZSB0byBoYW5kIG92
ZXIgaW5mb3JtYXRpb24KPiB0byBPcGVuU0JJIGJ5IHBhdGNoaW5nIGEgZmV3IHdvcmRzIGluc3Rl
YWQgb2Ygc2V0dGluZyB1cCByZWdpc3RlcnMuCj4KPiBUaGlzIGZpcnN0IHBhdGNoIG9ubHkgaW50
cm9kdWNlcyB0aGUgbGF5b3V0Ogo+Cj4gICAtIGEgNC1ieXRlIGp1bXAgb3ZlciB0aGUgaGVhZGVy
IHRvIF9zdGFydF9yZWFsLCBzbyB0aGF0IF9zdGFydCBzdGF5cwo+ICAgICB0aGUgZW50cnkgcG9p
bnQgb2YgdGhlIGltYWdlLiBUaGUganVtcCBpcyBhc3NlbWJsZWQgd2l0aAo+ICAgICAnLm9wdGlv
biBub3J2Yycgc28gdGhhdCB0aGUgZmllbGRzIGJlaGluZCBpdCBhcmUgYWx3YXlzIGF0IGEgZml4
ZWQKPiAgICAgb2Zmc2V0LCBldmVuIGZvciBhIGJ1aWxkIHdpdGggY29tcHJlc3NlZCBpbnN0cnVj
dGlvbnMgZW5hYmxlZCwKPgo+ICAgLSB0aGUgJ09TQkknIG1hZ2ljLCBhIGhlYWRlciB2ZXJzaW9u
LCB0aGUgWExFTiB0aGUgZmlybXdhcmUgd2FzIGJ1aWx0Cj4gICAgIGZvciBhbmQgdGhlIHNpemUg
b2YgdGhlIGZpcm13YXJlIGltYWdlLCBzbyB0aGF0IHRoZSBwcmV2aW91cyBib290aW5nCj4gICAg
IHN0YWdlIGNhbiB2YWxpZGF0ZSB0aGUgaW1hZ2UgYW5kIGZpZ3VyZSBvdXQgaG93IG11Y2ggbWVt
b3J5IGl0Cj4gICAgIG9jY3VwaWVzLAo+Cj4gICAtIGEgZmxhZ3Mgd29yZCBhbmQgdGhyZWUgOC1i
eXRlIG92ZXJyaWRlIHZhbHVlcywgd2hpY2ggYXJlIHVudXNlZAo+ICAgICAoYW5kIHplcm8pIGZv
ciBub3cgYW5kIGFyZSB3aXJlZCB1cCBieSB0aGUgbmV4dCBwYXRjaC4KPgo+IFRoZSBsYXlvdXQg
aXMgZGVsaWJlcmF0ZWx5IGlkZW50aWNhbCBmb3IgUlYzMiBhbmQgUlY2NCBzbyB0aGF0IHRoZQo+
IHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgY2FuIHBhcnNlIHRoZSBoZWFkZXIgd2l0aG91dCBrbm93
aW5nIHRoZSBYTEVOIG9mCj4gdGhlIGZpcm13YXJlIHVwZnJvbnQuIEVhY2ggb3ZlcnJpZGUgdmFs
dWUgaXMgZm9sbG93ZWQgYnkgYSByZXNlcnZlZAo+IDgtYnl0ZSBzbG90IHNvIHRoYXQgdGhlIHNh
bWUgbGF5b3V0IGNhbiBiZSBleHRlbmRlZCB0byBSVjEyOCBsYXRlci4KPgo+IFN1Z2dlc3RlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBab25n
IExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGZpcm13YXJlL2Z3X2Jhc2UuUyB8IDY4
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9maXJtd2FyZS9md19i
YXNlLlMgYi9maXJtd2FyZS9md19iYXNlLlMKPiBpbmRleCAwYzVjNjVjMS4uZGQyYWRiOGEgMTAw
NjQ0Cj4gLS0tIGEvZmlybXdhcmUvZndfYmFzZS5TCj4gKysrIGIvZmlybXdhcmUvZndfYmFzZS5T
Cj4gQEAgLTE3LDYgKzE3LDE1IEBACj4gICNkZWZpbmUgQk9PVF9MT1RURVJZX0FDUVVJUkVEICAg
ICAgICAgIDEKPiAgI2RlZmluZSBCT09UX1NUQVRVU19CT09UX0hBUlRfRE9ORSAgICAgMQo+Cj4g
Ky8qIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyICovCj4gKyNkZWZpbmUgRldfSEVBREVSX01BR0lD
X1ZBTFVFICAgICAgICAgIDB4NDk0MjUzNGYgLyogQVNDSUkgc3RyaW5nICJPU0JJIiAqLwo+ICsj
ZGVmaW5lIEZXX0hFQURFUl9WRVJTSU9OICAgICAgICAgICAgICAweDEKPiArI2RlZmluZSBGV19I
RUFERVJfU0laRSAgICAgICAgICAgICAgICAgMTI4Cj4gKyNkZWZpbmUgRldfSEVBREVSX1JFU0VS
VkVEX09GRlNFVCAgICAgIDB4NDgKPiArI2RlZmluZSBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVf
QTAgICAgKDEgPDwgMCkKPiArI2RlZmluZSBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVfQTEgICAg
KDEgPDwgMSkKPiArI2RlZmluZSBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVfQTIgICAgKDEgPDwg
MikKPiArCj4gIC5tYWNybyBNT1ZfM1IgX19kMCwgX19zMCwgX19kMSwgX19zMSwgX19kMiwgX19z
Mgo+ICAgICAgICAgYWRkICAgICBcX19kMCwgXF9fczAsIHplcm8KPiAgICAgICAgIGFkZCAgICAg
XF9fZDEsIFxfX3MxLCB6ZXJvCj4gQEAgLTQ0LDggKzUzLDY3IEBACj4gICAgICAgICAuc2VjdGlv
biAuZW50cnksICJheCIsICVwcm9nYml0cwo+ICAgICAgICAgLmFsaWduIDMKPiAgICAgICAgIC5n
bG9ibCBfc3RhcnQKPiArICAgICAgIC5nbG9ibCBfc3RhcnRfcmVhbAo+ICAgICAgICAgLmdsb2Js
IF9zdGFydF93YXJtCj4gIF9zdGFydDoKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBPcGVuU0JJ
IGZpcm13YXJlIGhlYWRlcgo+ICsgICAgICAgICoKPiArICAgICAgICAqIEV2ZXJ5IE9wZW5TQkkg
ZmlybXdhcmUgaW1hZ2Ugc3RhcnRzIHdpdGggdGhpcyBmaXhlZCAxMjgtYnl0ZQo+ICsgICAgICAg
ICogaGVhZGVyLiBUaGUgbGF5b3V0IGlzIGlkZW50aWNhbCBmb3IgUlYzMiBhbmQgUlY2NCAoYW5k
IGNhbiBiZQo+ICsgICAgICAgICogZXh0ZW5kZWQgZm9yIFJWMTI4IGJ5IHVzaW5nIHRoZSByZXNl
cnZlZCBoYWxmIG9mIGVhY2ggb3ZlcnJpZGUKPiArICAgICAgICAqIGZpZWxkKSwgc28gdGhlIHBy
ZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgY2FuIHBhcnNlIHRoZSBoZWFkZXIgd2l0aG91dAo+ICsgICAg
ICAgICoga25vd2luZyB0aGUgWExFTiBvZiB0aGUgZmlybXdhcmUgdXBmcm9udC4KPiArICAgICAg
ICAqCj4gKyAgICAgICAgKiBPZmZzZXQgIFNpemUgIEZpZWxkCj4gKyAgICAgICAgKiAgIDB4MDAg
ICAgIDQgIGp1bXAgdG8gX3N0YXJ0X3JlYWwKPiArICAgICAgICAqICAgMHgwNCAgICAgNCAgbWFn
aWMgKCdPU0JJJykKPiArICAgICAgICAqICAgMHgwOCAgICAgNCAgaGVhZGVyIHZlcnNpb24KPiAr
ICAgICAgICAqICAgMHgwYyAgICAgNCAgZmlybXdhcmUgWExFTgo+ICsgICAgICAgICogICAweDEw
ICAgICA0ICBmaXJtd2FyZSBzaXplIChfZndfZW5kIC0gX2Z3X3N0YXJ0KQo+ICsgICAgICAgICog
ICAweDE0ICAgICA0ICBmbGFncyAoRldfSEVBREVSX0ZMQUdTXyopCj4gKyAgICAgICAgKiAgIDB4
MTggICAgIDggIG92ZXJyaWRlIHZhbHVlIGZvciBhMAo+ICsgICAgICAgICogICAweDIwICAgICA4
ICByZXNlcnZlZCAodXBwZXIgaGFsZiBvZiB0aGUgYTAgdmFsdWUgb24gUlYxMjgpCgpUaGlua2lu
ZyBhYm91dCB0aGlzIG1vcmUsIHdlIGRvbid0IG5lZWQgIm92ZXJyaWRlIHZhbHVlIG9mIGEwIiBp
biB0aGUKaGVhZGVyIGluc3RlYWQgd2hlbmV2ZXIgRldfSEVBREVSX0ZMQUdTX09WRVJSSURFX0Ew
IGlzCnNldCB3ZSBjYW4gdXNlIG1oYXJ0aWQgQ1NSIHZhbHVlIGFzIHRoZSB2YWx1ZSBvZiBhMC4g
VGhpcyB3aWxsIHdvcmsKYmV0dGVyIGZvciBhbGwgQ1BVcyBlbnRlcmluZyBhdCBfc3RhcnQuCgo+
ICsgICAgICAgICogICAweDI4ICAgICA4ICBvdmVycmlkZSB2YWx1ZSBmb3IgYTEKPiArICAgICAg
ICAqICAgMHgzMCAgICAgOCAgcmVzZXJ2ZWQgKHVwcGVyIGhhbGYgb2YgdGhlIGExIHZhbHVlIG9u
IFJWMTI4KQo+ICsgICAgICAgICogICAweDM4ICAgICA4ICBvdmVycmlkZSB2YWx1ZSBmb3IgYTIK
PiArICAgICAgICAqICAgMHg0MCAgICAgOCAgcmVzZXJ2ZWQgKHVwcGVyIGhhbGYgb2YgdGhlIGEy
IHZhbHVlIG9uIFJWMTI4KQo+ICsgICAgICAgICogICAweDQ4ICAgIDU2ICByZXNlcnZlZAo+ICsg
ICAgICAgICovCj4gK19md19oZWFkZXJfanVtcDoKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBN
dXN0IHN0YXkgYSA0LWJ5dGUgaW5zdHJ1Y3Rpb24gc28gdGhhdCB0aGUgZmllbGRzIGJlbG93IGFy
ZSBhbHdheXMKPiArICAgICAgICAqIGF0IGEgZml4ZWQgb2Zmc2V0LiAnbm9ydmMnIGtlZXBzIHRo
ZSBhc3NlbWJsZXIgZnJvbSBwaWNraW5nIGMuaiBhbmQKPiArICAgICAgICAqICdub3JlbGF4JyBr
ZWVwcyB0aGUgbGlua2VyIGZyb20gY29tcHJlc3NpbmcgaXQgbGF0ZXIgb24sIHdoaWNoIGl0Cj4g
KyAgICAgICAgKiB3b3VsZCBvdGhlcndpc2UgaGFwcGlseSBkbyBmb3IgYSBqdW1wIHRoaXMgc2hv
cnQuCj4gKyAgICAgICAgKi8KPiArICAgICAgIC5vcHRpb24gcHVzaAo+ICsgICAgICAgLm9wdGlv
biBub3J2Ywo+ICsgICAgICAgLm9wdGlvbiBub3JlbGF4Cj4gKyAgICAgICBqICAgICAgIF9zdGFy
dF9yZWFsCj4gKyAgICAgICAub3B0aW9uIHBvcAo+ICtfZndfaGVhZGVyX21hZ2ljOgo+ICsgICAg
ICAgLndvcmQgICBGV19IRUFERVJfTUFHSUNfVkFMVUUKPiArX2Z3X2hlYWRlcl92ZXJzaW9uOgo+
ICsgICAgICAgLndvcmQgICBGV19IRUFERVJfVkVSU0lPTgo+ICtfZndfaGVhZGVyX3hsZW46Cj4g
KyAgICAgICAud29yZCAgIF9fcmlzY3ZfeGxlbgo+ICtfZndfaGVhZGVyX3NpemU6Cj4gKyAgICAg
ICAud29yZCAgIChfZndfZW5kIC0gX2Z3X3N0YXJ0KQo+ICtfZndfaGVhZGVyX2ZsYWdzOgo+ICsg
ICAgICAgLndvcmQgICAwCj4gK19md19oZWFkZXJfb3ZlcnJpZGVfYTA6Cj4gKyAgICAgICAuZHdv
cmQgIDAKPiArICAgICAgIC5kd29yZCAgMCAgICAgICAgICAgICAgICAgICAgICAgLyogcmVzZXJ2
ZWQgKi8KPiArX2Z3X2hlYWRlcl9vdmVycmlkZV9hMToKPiArICAgICAgIC5kd29yZCAgMAo+ICsg
ICAgICAgLmR3b3JkICAwICAgICAgICAgICAgICAgICAgICAgICAvKiByZXNlcnZlZCAqLwo+ICtf
ZndfaGVhZGVyX292ZXJyaWRlX2EyOgo+ICsgICAgICAgLmR3b3JkICAwCj4gKyAgICAgICAuZHdv
cmQgIDAgICAgICAgICAgICAgICAgICAgICAgIC8qIHJlc2VydmVkICovCj4gKyAgICAgICAvKiBS
ZXNlcnZlZCwgcGFkcyB0aGUgaGVhZGVyIHVwIHRvIEZXX0hFQURFUl9TSVpFIGJ5dGVzICovCj4g
KyAgICAgICAuZmlsbCAgIChGV19IRUFERVJfU0laRSAtIEZXX0hFQURFUl9SRVNFUlZFRF9PRkZT
RVQpLCAxLCAwCj4gK19zdGFydF9yZWFsOgo+ICAgICAgICAgLyogRmluZCBwcmVmZXJyZWQgYm9v
dCBIQVJUIGlkICovCj4gICAgICAgICBNT1ZfM1IgIHMwLCBhMCwgczEsIGExLCBzMiwgYTIKPiAg
ICAgICAgIGNhbGwgICAgZndfYm9vdF9oYXJ0Cj4gLS0KPiAyLjQzLjcKPgoKUmVnYXJkcywKQW51
cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
