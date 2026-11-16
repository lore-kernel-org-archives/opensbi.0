Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D959606A329
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C2+HIhO/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=b3PpGxMB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6mu0YTiPc86hmrkwE9gN5jBBVjTMR0u58bfyeJge+9E=; b=C2+HIhO/lFKt8AhyZKlJgATTnu
	gO+sgTbNuTiRPx1tmMaOqGgc9+ro1AdyeaRdhiNmVxyUezkwzgDSrAlTWPPWt+l2DmugLtUhfz7KM
	0396xfDZUIpzoO0K5soEUri+hAd3+L70QC1yH8zcB8VslKDK5wXUX758bEToUX9KDK6NL/Fbv09La
	4BGwydyWUDIdvIsFjuTkMwMc3DWMhtCS09FceCr9MD/G/NNmam6NdKeGL3jRoLslN6DOjn9sTVn46
	iTQ5l6HS6o/gMVgnQD8hSLeM+bw8g/Q2Gu5UIIj3zkhIBHqZu5Q1hmXluL1NbsCqmk5LsyPqRUNph
	JfPNKe0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwol-00000002doV-3BP9;
	Mon, 16 Nov 2026 13:32:19 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwoi-00000002dmr-2eiB
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 13:32:17 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso29089751fa.2
        for <opensbi@lists.infradead.org>; Mon, 16 Nov 2026 05:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794835934; cv=none;
        d=google.com; s=arc-20260327;
        b=PKPrBitw9tpRkIyiRqvzg/SJuIc5nsAxKV+MsJQbTv4d+W1UOUEw8D3k6ck4v/5TkG
         4GeKJicy/+N25YOumxKhfvbSHAS6ToMhMHxTbUS54yxjODZugYrwWAYIJXEQWWPCBT+1
         oM9ckmbkAlhl6IDklHhcS8ho6INgjmcFLIUs4gTAeXDqJCXfw3h2NBC99fJ4mUVgWudi
         L2H9/hh/l3khyHHmzzWcnGh2mdB7/tyFEOn15dKYVa6SkN+DfkdIyFbhljjWgYAxfdbz
         gu8IPcXR6HsyvavjTlBYPb/8l5hcyYjFuoHLIQiodJyiYr04Ep6cIxfEctv329Q1b+mB
         ZstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cnjuoUWKuGGVw/WGdPCx6f/XvLnkzHaLov50hQKJEqk=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=ZVspfduLEH/PUM4xD8Rf1rXVPuUgCNhXYnL7PgkeJjDEolrgFfD8RY/0ohW4qfhUUm
         2fRMBMzaB59xA1ZgyP8bKkGxBKp5WUL1E5BcQBG8Fw2N+59djf+4g1XCEbpcrt3MNQtJ
         Hv4s5XqAS99fkx18h4ry+D7LXFdg/wFIV9wVGZa/uo03gocL3hvjKN9iDPgIXTeeyr/i
         TviGgpDYqwTf5RoLxaAmzBhgQ+RGiZ6iaS+Ip10vETUxLJS5lwxFQG7PCu7TIRWtrlX1
         /Va9IX5U2UWdVNYaf9n6oBtK+kOENNXxa7c9zqvt2LI5Sjg//KC6tO23aGvwh16rObeZ
         zybw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794835934; x=1795440734; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnjuoUWKuGGVw/WGdPCx6f/XvLnkzHaLov50hQKJEqk=;
        b=b3PpGxMBEHnnNh9451IQS3EReYtaIErP6UoVXhl9BNzKIlIVhg7ONiXAy3WeeRBARH
         4qFaxXCIM+iKv6smDBaMIVnuhCpBCGfopnJDkD50xys24HF2YXN7AG489FPKjiFG+GfI
         2KB5P+bGXXAF0AEqAgi1bw2ovC4XMHMN7TSSudHRSEMsN25FApOeugl9OyWEOVy/B0mF
         7aeXtQP2OYjdW9wXQCuZUhIuaYql4dY2PKMTIMi3HoeVF7K+8RukynRxvBIdAk+0E1FZ
         XYMqTe4wWj2EK1Pxs3avQ1Pb75ejeQfnWJYkcjZ5fTpdD62/FA3SJF18GLI49Qc6htYG
         gYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835934; x=1795440734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnjuoUWKuGGVw/WGdPCx6f/XvLnkzHaLov50hQKJEqk=;
        b=xRd7B/PZpDAP6J9+22umc/hedFd0cU/CjksiKmESVP3zO7weaw0+mp1DZzd3rKV+Ku
         8V55BftNyO5JoDfQr8wLtjq14cScUHg9QeJiV28VvHzenEwERNMU9rad176i/nXsa6RT
         KRwMtcrkVwTFsxIR+FXE1NtneYBX5NA7kYOOst50ytjGcLqPkwndrtQ56mUytlDu58ug
         CuOI74VLKKFRXCdoabogtrE55hFN+bJDohoMkoeQE4qM3+WPAIN+U8dGInOSHP5VR665
         b6nCz7jBb5v0+ufoAdeLYeKhE8+tOxJQqknVX0if1+tAPytZr+4RXuOF83r3vgFSRy96
         XZYw==
X-Gm-Message-State: APuU4Z/egvPP4+FF9NLNsbv7LWbrg1YjaRStRo8hW+DiFlgvhfsw//lD
	avNKmOLJFjnPDekuzk6jpe8OFCmMtpyZpe3vJfboM54KdH+o2Da+5iQ2NlrVnUxzoNhlA/4F2xO
	ucO18RA1mx9chPmIwSYbb6I3dMkESc/V8f693kjpjqA==
X-Gm-Gg: AYBFou3r6G32aou7/VOlqYNMiI3tf1bRjha0SBaN4eay35+z542Ek4fnzS/7rKSOxiX
	t5mO6sEliPbmdVMmlGiD0fn2cT68jSBvR66+yDph58Ve2k2Fk2IXnlfg2NjsNX3bW3sHxY5/pHe
	fnCw7YL5/b2lLLzZw/WtroE24QPZL1plDCwpGIk2tUyptmhuuOKT7uRBx/JVD38Vjv9lCYp9ThC
	FHeL69d4rSIVpkH9C1/nzSUuAgL27OLP41OhhR0ZsqfcUzYfvesJv2hyndcLw/lFD4S8Z6vqXB4
	CELUUU5IG1aE1rCbyxT+ywKaVR+QDKeEIRpBZJ7sNB/hnhhEIok4ig+0bdBa+0ncJbeyafQ0LET
	eBDU0dzDhf5arucBp2uFZUxGj8NFmIYHO2Sj7A2IT3CLzBfCE4JPPU0HTJ0zIbW1S2YNe/rE3nB
	us0k6kT4Ljr3hvmuMuEFPscF5kZt7hPcaHh3JoNpVcDQ99aI36yiunStGw
X-Received: by 2002:a05:651c:31d6:b0:3a3:7682:49a1 with SMTP id
 38308e7fff4ca-3ae2b4f825dmr35058361fa.22.1794835934315; Mon, 16 Nov 2026
 05:32:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-10-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-10-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Nov 2026 19:02:01 +0530
X-Gm-Features: Aa3M54rjcJ8Bu5xP0phXCONzqYTBOjWGUEsCkuEBmdNrQBz_mQY5EyKRNUD4TDY
Message-ID: <CAAhSdy3ViCqk4QXTGYrAJa9w8V1W_4EJYE8XfTAjz54nSDLQ2w@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] docs: document WID DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_053216_715018_6B096C8E 
X-CRM114-Status: GOOD (  22.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMzoyMOKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkICJ3aWQiIGFuZCAid2lkZGVsZWciIHBy
b3BlcnRpZXMgdG8gZG9tYWluIGluc3RhbmNlIG5vZGUKPiBkb2N1bWVudGF0aW9uIGFuZCBleGFt
cGxlIERULiBBZGQgYSAiUm9vdCBEb21haW4gTm9kZSIgc2VjdGlvbgo+IGRlc2NyaWJpbmcgdGhl
ICJyb290IiBzdWJub2RlIHVuZGVyIHRoZSBkb21haW4gY29uZmlndXJhdGlvbgo+IG5vZGUgZm9y
IHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGll
biBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKPiAtLS0KPiBDaGFuZ2VzIHY0LT52NToK
PiAtIERvY3VtZW50IHdpZCBhcyBsZXNzIHRoYW4gWExFTiBhbmQgd2lkZGVsZWcgYXMgYXQgbW9z
dCBYTEVOIGJpdHMsCj4gICBpbnN0ZWFkIG9mIGZpeGVkIDMyLzY0LWJpdCAoUmFkaW0pCj4gLSBE
cm9wIFJCLXRhZyBmcm9tIEFudXAKPiAtLS0KPiAgZG9jcy9kb21haW5fc3VwcG9ydC5tZCB8IDM4
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZG9jcy9kb21haW5fc3VwcG9ydC5t
ZCBiL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiBpbmRleCA1MTczNzIxOC4uMTg5ZjNjYTkgMTAw
NjQ0Cj4gLS0tIGEvZG9jcy9kb21haW5fc3VwcG9ydC5tZAo+ICsrKyBiL2RvY3MvZG9tYWluX3N1
cHBvcnQubWQKPiBAQCAtNTYsNiArNTYsOCBAQCBoYXMgZm9sbG93aW5nIGRldGFpbHM6Cj4gICAg
ZG9tYWluLiBUaGlzIGNhbiBiZSBlaXRoZXIgUy1tb2RlIG9yIFUtbW9kZS4KPiAgKiAqKnN5c3Rl
bV9yZXNldF9hbGxvd2VkKiogLSBJcyBkb21haW4gYWxsb3dlZCB0byByZXNldCB0aGUgc3lzdGVt
Pwo+ICAqICoqc3lzdGVtX3N1c3BlbmRfYWxsb3dlZCoqIC0gSXMgZG9tYWluIGFsbG93ZWQgdG8g
c3VzcGVuZCB0aGUgc3lzdGVtPwo+ICsqICoqd2lkKiogLSBXb3JsZCBJRCBmb3IgdGhlIGRvbWFp
bgo+ICsqICoqd2lkZGVsZWcqKiAtIFdvcmxkIElEIGRlbGVnYXRpb24gYml0bWFzayBmb3IgdGhl
IGRvbWFpbgo+Cj4gIFRoZSBtZW1vcnkgcmVnaW9ucyByZXByZXNlbnRlZCBieSAqKnJlZ2lvbnMq
KiBpbiAqKnN0cnVjdCBzYmlfZG9tYWluKiogaGF2ZQo+ICBmb2xsb3dpbmcgYWRkaXRpb25hbCBj
b25zdHJhaW50cyB0byBhbGlnbiB3aXRoIFJJU0MtViBQTVAgcmVxdWlyZW1lbnRzOgo+IEBAIC05
OCw2ICsxMDAsOCBAQCBmb2xsb3dpbmcgbWFubmVyOgo+ICAgIGlzIHRoZSBuZXh0IG1vZGUgZm9y
IHRoZSBST09UIGRvbWFpbgo+ICAqICoqc3lzdGVtX3Jlc2V0X2FsbG93ZWQqKiAtIFRoZSBST09U
IGRvbWFpbiBpcyBhbGxvd2VkIHRvIHJlc2V0IHRoZSBzeXN0ZW0KPiAgKiAqKnN5c3RlbV9zdXNw
ZW5kX2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFpbiBpcyBhbGxvd2VkIHRvIHN1c3BlbmQgdGhl
IHN5c3RlbQo+ICsqICoqd2lkKiogLSBDb25maWd1cmFibGUgV29ybGQgSUQgZm9yIHRoZSBST09U
IGRvbWFpbgo+ICsqICoqd2lkZGVsZWcqKiAtIENvbmZpZ3VyYWJsZSBXb3JsZCBJRCBkZWxlZ2F0
aW9uIGJpdG1hc2sgZm9yIHRoZSBST09UIGRvbWFpbgo+Cj4gIERvbWFpbiBFZmZlY3RzCj4gIC0t
LS0tLS0tLS0tLS0tCj4gQEAgLTEzMSw2ICsxMzUsMjMgQEAgVGhlIERUIHByb3BlcnRpZXMgb2Yg
YSBkb21haW4gY29uZmlndXJhdGlvbiBEVCBub2RlIGFyZSBhcyBmb2xsb3dzOgo+ICAqICoqY29t
cGF0aWJsZSoqIChNYW5kYXRvcnkpIC0gVGhlIGNvbXBhdGlibGUgc3RyaW5nIG9mIHRoZSBkb21h
aW4KPiAgICBjb25maWd1cmF0aW9uLiBUaGlzIERUIHByb3BlcnR5IHNob3VsZCBoYXZlIHZhbHVl
ICoib3BlbnNiaSxkb21haW4sY29uZmlnIioKPgo+ICsjIyMgUm9vdCBEb21haW4gTm9kZQo+ICsK
PiArVGhlIHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uIGlzIGRlc2NyaWJlZCBpbiBhICoq
cm9vdCoqIHN1Ym5vZGUgdW5kZXIKPiArdGhlIGRvbWFpbiBjb25maWd1cmF0aW9uIERUIG5vZGUu
Cj4gKwo+ICtUaGUgRFQgcHJvcGVydGllcyBvZiB0aGUgcm9vdCBkb21haW4gbm9kZSBhcmUgYXMg
Zm9sbG93czoKPiArCj4gKyogKipjb21wYXRpYmxlKiogKE1hbmRhdG9yeSkgLSBUaGUgY29tcGF0
aWJsZSBzdHJpbmcgb2YgdGhlIHJvb3QgZG9tYWluIG5vZGUuCj4gKyAgVGhpcyBEVCBwcm9wZXJ0
eSBzaG91bGQgaGF2ZSB2YWx1ZSAqIm9wZW5zYmksZG9tYWluLGluc3RhbmNlIiouCj4gKyogKip3
aWQqKiAoTWFuZGF0b3J5IGlmIFNtbHdpZCBpcyBwcmVzZW50KSAtIFRoZSBXb3JsZCBJRCAobXVz
dCBiZSBsZXNzIHRoYW4gWExFTikgZm9yCj4gKyAgbG93ZXItcHJpdmlsZWdlIG1vZGVzIChTL1Ut
bW9kZSkgZm9yIHRoZSBST09UIGRvbWFpbi4gSWYgdGhlIGhhcnQKPiArICBzdXBwb3J0cyB0aGUg
U21sd2lkIGV4dGVuc2lvbiwgdGhpcyBwcm9wZXJ0eSBtdXN0IGJlIHByb3ZpZGVkLgo+ICsqICoq
d2lkZGVsZWcqKiAoT3B0aW9uYWwpIC0gVGhlIFdvcmxkIElEIGRlbGVnYXRpb24gYml0bWFzayAo
YXQgbW9zdCBYTEVOIGJpdHMpIGZvcgo+ICsgIHRoZSBST09UIGRvbWFpbi4gSWYgcHJlc2VudCwg
T3BlblNCSSB3cml0ZXMgdGhpcyB2YWx1ZSB0byAqKm13aWRkZWxlZyoqCj4gKyAgd2hlbiBlbnRl
cmluZyB0aGUgUk9PVCBkb21haW4gKHJlcXVpcmVzIFNtd2lkZGVsZWcgZXh0ZW5zaW9uKS4gSWYg
YWJzZW50LAo+ICsgIGNsZWFycyAqKm13aWRkZWxlZyoqIHRvIGRpc2FibGUgUy1tb2RlIFdJRCBk
ZWxlZ2F0aW9uLgo+ICsKPiAgIyMjIERvbWFpbiBNZW1vcnkgUmVnaW9uIE5vZGUKPgo+ICBUaGUg
ZG9tYWluIG1lbW9yeSByZWdpb24gRFQgbm9kZSBkZXNjcmliZXMgZGV0YWlscyBvZiBhIG1lbW9y
eSByZWdpb24gYW5kCj4gQEAgLTIwNSw2ICsyMjYsMTMgQEAgVGhlIERUIHByb3BlcnRpZXMgb2Yg
YSBkb21haW4gaW5zdGFuY2UgRFQgbm9kZSBhcmUgYXMgZm9sbG93czoKPiAgICB3aGV0aGVyIHRo
ZSBkb21haW4gaW5zdGFuY2UgaXMgYWxsb3dlZCB0byBkbyBzeXN0ZW0gcmVzZXQuCj4gICogKipz
eXN0ZW0tc3VzcGVuZC1hbGxvd2VkKiogKE9wdGlvbmFsKSAtIEEgYm9vbGVhbiBmbGFnIHJlcHJl
c2VudGluZwo+ICAgIHdoZXRoZXIgdGhlIGRvbWFpbiBpbnN0YW5jZSBpcyBhbGxvd2VkIHRvIGRv
IHN5c3RlbSBzdXNwZW5kLgo+ICsqICoqd2lkKiogKE1hbmRhdG9yeSBpZiBTbWx3aWQgaXMgcHJl
c2VudCkgLSBUaGUgV29ybGQgSUQgKG11c3QgYmUgbGVzcyB0aGFuIFhMRU4pIGZvcgo+ICsgIGxv
d2VyLXByaXZpbGVnZSBtb2RlcyAoUy9VLW1vZGUpIGZvciB0aGUgZG9tYWluIGluc3RhbmNlLiBJ
ZiB0aGUgaGFydAo+ICsgIHN1cHBvcnRzIHRoZSBTbWx3aWQgZXh0ZW5zaW9uLCB0aGlzIHByb3Bl
cnR5IG11c3QgYmUgcHJvdmlkZWQuCj4gKyogKip3aWRkZWxlZyoqIChPcHRpb25hbCkgLSBUaGUg
V29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNrIChhdCBtb3N0IFhMRU4gYml0cykgZm9yCj4gKyAg
dGhlIGRvbWFpbiBpbnN0YW5jZS4gSWYgcHJlc2VudCwgT3BlblNCSSB3cml0ZXMgdGhpcyB2YWx1
ZSB0byAqKm13aWRkZWxlZyoqCj4gKyAgb24gY29udGV4dCBzd2l0Y2ggaW50byB0aGlzIGRvbWFp
biAocmVxdWlyZXMgU213aWRkZWxlZyBleHRlbnNpb24pLiBJZiBhYnNlbnQsCj4gKyAgY2xlYXJz
ICoqbXdpZGRlbGVnKiogdG8gZGlzYWJsZSBTLW1vZGUgV0lEIGRlbGVnYXRpb24uCj4KPiAgIyMj
IEFzc2lnbmluZyBIQVJUIFRvIERvbWFpbiBJbnN0YW5jZQo+Cj4gQEAgLTI2MCw2ICsyODgsMTIg
QEAgYmUgZG9uZToKPiAgICAgICAgICAgICAgICAgIG9yZGVyID0gPDY0PjsKPiAgICAgICAgICAg
ICAgfTsKPgo+ICsgICAgICAgICAgICByb290IHsKPiArICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAib3BlbnNiaSxkb21haW4saW5zdGFuY2UiOwo+ICsgICAgICAgICAgICAgICAgd2lkID0g
PDM+Owo+ICsgICAgICAgICAgICAgICAgd2lkZGVsZWcgPSA8MHgwIDB4MD47Cj4gKyAgICAgICAg
ICAgIH07Cj4gKwo+ICAgICAgICAgICAgICB0ZG9tYWluOiB0cnVzdGVkLWRvbWFpbiB7Cj4gICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZW5zYmksZG9tYWluLGluc3RhbmNlIjsKPiAg
ICAgICAgICAgICAgICAgIHBvc3NpYmxlLWhhcnRzID0gPCZjcHUwPjsKPiBAQCAtMjY4LDYgKzMw
Miw4IEBAIGJlIGRvbmU6Cj4gICAgICAgICAgICAgICAgICBuZXh0LWFyZzEgPSA8MHgwIDB4MD47
Cj4gICAgICAgICAgICAgICAgICBuZXh0LWFkZHIgPSA8MHgwIDB4ODAxMDAwMDA+Owo+ICAgICAg
ICAgICAgICAgICAgbmV4dC1tb2RlID0gPDB4MD47Cj4gKyAgICAgICAgICAgICAgICB3aWQgPSA8
MT47Cj4gKyAgICAgICAgICAgICAgICB3aWRkZWxlZyA9IDwweDAgMHg2PjsKPiAgICAgICAgICAg
ICAgICAgIHN5c3RlbS1yZXNldC1hbGxvd2VkOwo+ICAgICAgICAgICAgICAgICAgc3lzdGVtLXN1
c3BlbmQtYWxsb3dlZDsKPiAgICAgICAgICAgICAgfTsKPiBAQCAtMjc2LDYgKzMxMiw4IEBAIGJl
IGRvbmU6Cj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZW5zYmksZG9tYWluLGlu
c3RhbmNlIjsKPiAgICAgICAgICAgICAgICAgIHBvc3NpYmxlLWhhcnRzID0gPCZjcHUxICZjcHUy
ICZjcHUzICZjcHU0PjsKPiAgICAgICAgICAgICAgICAgIHJlZ2lvbnMgPSA8JnRtZW0gMHgwPiwg
PCZ0dWFydCAweDA+LCA8JmFsbG1lbSAweDNmPjsKPiArICAgICAgICAgICAgICAgIHdpZCA9IDww
PjsKPiArICAgICAgICAgICAgICAgIHdpZGRlbGVnID0gPDB4MCAweDE+Owo+ICAgICAgICAgICAg
ICB9Owo+ICAgICAgICAgIH07Cj4gICAgICB9Owo+IC0tCj4gMi40My43Cj4KClJlZ2FyZHMsCkFu
dXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
