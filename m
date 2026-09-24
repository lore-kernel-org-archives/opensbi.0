Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6C7C98314
	for <opensbi@archiver.kernel.org>; Thu, 24 Sep 2026 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXD3E+I58oy8IgRzE3XGt9T0N7FWvBDbIIoS4JE4b1I=; b=4iou6ttadqDNlI
	OErwt9V0Jw7TJHc1MOhmb2o4MtoEDppIXL2lwLCAlMCwGdEsAgDeB7x3y0mQ1ySIdUtrbXM5YU9OZ
	882z7xPy8fl3IXD7bTARkWRIu1VpmVDWYOUdlW6hMNGe0SfVgIFBHcvXXxQkTVmrhPJewJs3YqV5Z
	gBtM1FSXRwObRVoxFccJpIQ4vs87Wcmpni1mFvej/ynz2Sx6hgDkjyZDsoCFSdv+wWToZ6h/ZrS3m
	g4AoFgrdkZjUTlSJeu3FL/acVrmKWsdwenOI1NwVQQh8piTfAKcUhgxE8F92pW0FtzXdqmRrhCXiu
	UUJQIuX5wIGd7KXUNJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eJ3-0000000AMWi-1zUv;
	Thu, 24 Sep 2026 07:55:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eIg-0000000AMBD-36a3
	for opensbi@bombadil.infradead.org;
	Thu, 24 Sep 2026 07:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UyrPr/rHcyja9MIZ8E/TFdO4+kcHPfCzCZz0poMK1Kw=; b=EStjBNgumkD2xBSYO2iw595ALM
	MgK/B1pSOzxJs/W4ktBBYfY7Ofos7ekBmIBg2ARu3YIAicV927hxw2r3B1cqCDDmQ5dfXOGKpj3T8
	emeovYQ2JjBPkrUGF4E9qDARQno5DTsIKfqVR/QwY5QMOueHXUnLEAOHWB3FFu5om8WQINJi2TVwr
	44oqbUACRUlrj2KFXonmgj1VvEwOC43E2UIlGyVkwRQOrvani2tPJ3lDmFilCrblU3Q2H2rvhmkRT
	XwuV9dDt1E5Dvr1s8eTcsg/9g0oopHLfsU2gjR9SMQaiiMHPSfMNys6d64CPsDQ0ARP1j4Q8JIix6
	SoOj33GA==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9eId-0000000FgNi-1nDq
	for opensbi@lists.infradead.org;
	Thu, 24 Sep 2026 07:55:25 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed6d6eso10822305ad.2
        for <opensbi@lists.infradead.org>; Thu, 24 Sep 2026 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790236521; x=1790841321; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UyrPr/rHcyja9MIZ8E/TFdO4+kcHPfCzCZz0poMK1Kw=;
        b=FQQXSGC43NVsMyIlsPEktwhQJG2ZcEfwdEDVs2PDoWvdvVJWLXwio4PBz2lWVV8zRn
         F/ijeHavO4w9jmWS1s/+2xGHulYsU6j0vfuM4gGXV89KvOIlPcGCh+hcnMOKwAo9P5m3
         WBpG95caa3FVyPB9j21tEebGN1YIi/Em1DKDClkMCVOWOHRQ0faEc2k2wI+qX0BDVv9a
         lKd79emFl0NpxjJgcutbStN4ONjD3fAl5FTEChoPAVtms6dGXwTKk7yN+90r+Ky91FHS
         2jdyDmWjhRgIVFL7FDjtjafOBY7lSy2hly3ao60M6Gbt17I1ex0fHWo3m7frJOzV6Efa
         DLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236521; x=1790841321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UyrPr/rHcyja9MIZ8E/TFdO4+kcHPfCzCZz0poMK1Kw=;
        b=ToQwE59MJJPtTesnslVm0S9nY93UKGY5aiJsxK0blKvoucgVbKlBYJ2NUTOn9Jp6ja
         8uozrb7OBmwxpSGighn4EFOan1QxasP6fJ+aDqqMbPshzE/So1e67Amnn+dlpV8W6D1m
         pFZuP3DJbPIg0jBu1GmW+BY0t2BoJwel2ReqyKrhhGVk+X2a0gN1HXoqd9vhDuLS/N2t
         lSFVHu24f5YbvX1zpZYoJwJrZGh6YWkbIvyiaofCl+/fyh1A7UqjueTwJMWlryOPY+jI
         s1ieeN9pyKSrytxwfjFeT6wiSl7DuaVl3OBUhYZT3R5Dv6cCsy0HNBTNh8U4F9WpRLKN
         zSew==
X-Gm-Message-State: AFuF++mCC4d1T9kSn5NWq1Awjp/TmSP7OYtTpikeHDJea3MZ3HJyPO9F
	4OoIPMcBgUt75H3Cf76N37ZvZ8R3Lpp4tGawkdT/YiT9kftZosFBjs9UFAI76C245IM=
X-Gm-Gg: AYBFou2tvu+/2Od3JM40i7kVcUelrtwsuvifpYq7S7jXtCbd1OEbKlAJSKIi9YjJslE
	HntvAO3CSEk7GXk9bLZJEGZ+ZRZrzRXKwhHo4hQujIcyHsgrsFEUiL5ne8Xyq2dqjQY+txb4Cek
	wQKE7SdKTmAnJZVdbfRtr/i0CY8LQCuKvTfOQego09fOFnYyqQbrQdF83HREOrolDEwv315csQ1
	OSzogoKxCCNJHSy5Kt+oFRnN43y4zDIyFAaEbE6I4P8/Jnj6RBdfKBb5Uf5WcDahiGnqPm0zNQb
	P4YJS3Gj7L11oxbOB2Eo/hi65YO7RrkMgUZa/EZ51NwnETH6H1j46hY96JdaNqRWTlhjXSiX5zG
	a4WSg2vIh5+RBKKAr1zfylCE01HMBQpzU+3h0bPIDnfkx0nwI2CzcDu/VtPs11Wi1QQ6H+xDGbI
	vH8jRw42JJWPr1aAnkM64A+WMnCQf25YJoHBjRUQtHhoFnRDi/eVhD3xEaxbvfj4bx+ABG
X-Received: by 2002:a17:903:19cf:b0:2dd:ad74:6d20 with SMTP id d9443c01a7336-2df7dc387f2mr14687905ad.29.1790236520591;
        Thu, 24 Sep 2026 00:55:20 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6ab2c540sm22200445ad.84.2026.09.24.00.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:55:20 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:55:14 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	krzk@kernel.org
Subject: Re: [PATCH v2 3/9] lib: fdt_domain: parse domain WID properties
Message-ID: <arTXYvIkW86sndQE@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-4-peter.lin@sifive.com>
 <CAAVgOkL68rtTjWf9zoLZjL=L4OyTwgHePWsEYdH1ioUX1Fdk6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOkL68rtTjWf9zoLZjL=L4OyTwgHePWsEYdH1ioUX1Fdk6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_085523_916394_AB1A910F 
X-CRM114-Status: GOOD (  25.21  )
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

SGkgT3phLAoKT24gVGh1LCBTZXAgMDMsIDIwMjYgYXQgMDI6MTg6NDhQTSAtMDcwMCwgUGF3YW5k
ZWVwIE96YSB3cm90ZToKPiBPbiBNb24sIEF1ZyAxNywgMjAyNiBhdCAyOjA14oCvQU0gWXUtQ2hp
ZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWRkIHdp
ZCBhbmQgd2lkZGVsZWcgZmllbGRzIHRvIHN0cnVjdCBzYmlfZG9tYWluIHRvIHN0b3JlIHRoZQo+
ID4gUklTQy1WIFdvcmxkcyBtbHdpZCBhbmQgbXdpZGVsZWcgQ1NSIHZhbHVlcyBmb3IgZWFjaCBk
b21haW4uCj4gPiBBbHNvLCBwYXJzZSB0aGUgcm9vdCBhbmQgdXNlci1kZWZpbmVkIGRvbWFpbnMn
IFdJRCBkdXJpbmcKPiA+IGZkdF9kb21haW5zX3BvcHVsYXRlKCkuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiA+IC0tLQo+
ID4gQ2hhbmdlcyB2MSAtPiB2MjoKPiA+IC0gQWRkIHJvb3Qgc3Vibm9kZSBmb3Igcm9vdCBkb21h
aW4gY29uZmlndXJhdGlvbiAoT3phIGFuZCBBbnVwKQo+ID4gLSBSZW5hbWUgbmV4dF93aWQvd2lk
bGlzdCB0byB3aWQvd2lkZGVsZWcgKE96YSkKPiA+IC0tLQo+ID4gIGluY2x1ZGUvc2JpL3NiaV9k
b21haW4uaCAgIHwgIDYgKysrKysKPiA+ICBsaWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYyB8IDUw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCA1NiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Ni
aV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+ID4gaW5kZXggMTZlZGQ0Y2Uu
LjQ0YzhiZWZjIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gPiAr
KysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiA+IEBAIC0yMTUsNiArMjE1LDEyIEBAIHN0
cnVjdCBzYmlfZG9tYWluIHsKPiA+ICAgICAgICAgYm9vbCBzeXN0ZW1fcmVzZXRfYWxsb3dlZDsK
PiA+ICAgICAgICAgLyoqIElzIGRvbWFpbiBhbGxvd2VkIHRvIHN1c3BlbmQgdGhlIHN5c3RlbSAq
Lwo+ID4gICAgICAgICBib29sIHN5c3RlbV9zdXNwZW5kX2FsbG93ZWQ7Cj4gPiArICAgICAgIC8q
KiBXb3JsZCBJRCBmb3IgdGhpcyBkb21haW4gKG1sd2lkIHZhbHVlKSAqLwo+ID4gKyAgICAgICB1
MzIgd2lkOwo+ID4gKyAgICAgICAvKiogV2hldGhlciBXb3JsZCBJRCB3YXMgZXhwbGljaXRseSBz
ZXQgKi8KPiA+ICsgICAgICAgYm9vbCBoYXNfd2lkOwo+IE96YTogYWdhaW4gaGVyZSB5b3UgbWF5
IGJlIGFibGUgdG8gZmluZCBvdXQgaWYgd2lkID09IFVJTlRfTUFYIHRoZW4KPiB3aWQgaXMgbm90
IHNldC4gYmVjYXVzZSB3ZSBoYXZlIGZpbml0ZSBudW1iZXIgb2YgTiB3b2xyZHMgc28gbWF4IGlz
IE4KPiAtMSA/Cj4geW91IGNhbiB0aGVuIGRyb3AgYm9vbCBoYXNfd2lkOwoKQWdyZWVkLCB3aWxs
IGRyb3AgaW4gbmV4dCBwYXRjaCB2ZXJzaW9uLgoKVGhhbmtzLApQZXRlciBMaW4KCj4gCj4gPiAr
ICAgICAgIC8qKiBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yIHRoaXMgZG9tYWluICht
d2lkZGVsZWcgdmFsdWUpICovCj4gPiArICAgICAgIHU2NCB3aWRkZWxlZzsKPiA+ICAgICAgICAg
LyoqIElkZW50aWZpZXMgd2hldGhlciB0byBpbmNsdWRlIHRoZSBmaXJtd2FyZSByZWdpb24gKi8K
PiA+ICAgICAgICAgYm9vbCBmd19yZWdpb25faW5pdGVkOwo+ID4gIH07Cj4gPiBkaWZmIC0tZ2l0
IGEvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMgYi9saWIvdXRpbHMvZmR0L2ZkdF9kb21haW4u
Ywo+ID4gaW5kZXggNjE2MjdkYjMuLjY4ZGQ2ZGE0IDEwMDY0NAo+ID4gLS0tIGEvbGliL3V0aWxz
L2ZkdC9mZHRfZG9tYWluLmMKPiA+ICsrKyBiL2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5jCj4g
PiBAQCAtMzA3LDYgKzMwNywyNyBAQCBzdGF0aWMgaW50IF9fZmR0X3BhcnNlX3JlZ2lvbihjb25z
dCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zmc2V0LAo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+
ICB9Cj4gPgo+ID4gK3N0YXRpYyB2b2lkIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3BzKGNvbnN0
IHZvaWQgKmZkdCwgaW50IG9mZnNldCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gPiArewo+ID4gKyAgICAgICBjb25z
dCBmZHQzMl90ICp2YWw7Cj4gPiArICAgICAgIGludCBsZW47Cj4gPiArICAgICAgIHU2NCB2YWw2
NDsKPiA+ICsKPiA+ICsgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJ3aWQi
LCAmbGVuKTsKPiA+ICsgICAgICAgaWYgKHZhbCAmJiBsZW4gPT0gc2l6ZW9mKGZkdDMyX3QpKSB7
Cj4gPiArICAgICAgICAgICAgICAgZG9tLT53aWQgPSBmZHQzMl90b19jcHUodmFsWzBdKTsKPiA+
ICsgICAgICAgICAgICAgICBkb20tPmhhc193aWQgPSB0cnVlOwo+ID4gKyAgICAgICB9Cj4gPiAr
Cj4gPiArICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgb2Zmc2V0LCAid2lkZGVsZWciLCAm
bGVuKTsKPiA+ICsgICAgICAgaWYgKHZhbCAmJiAobGVuID09ICgyICogc2l6ZW9mKGZkdDMyX3Qp
KSkpIHsKPiA+ICsgICAgICAgICAgICAgICB2YWw2NCA9IGZkdDMyX3RvX2NwdSh2YWxbMF0pOwo+
ID4gKyAgICAgICAgICAgICAgIHZhbDY0ID0gKHZhbDY0IDw8IDMyKSB8IGZkdDMyX3RvX2NwdSh2
YWxbMV0pOwo+ID4gKyAgICAgICAgICAgICAgIGRvbS0+d2lkZGVsZWcgPSB2YWw2NDsKPiA+ICsg
ICAgICAgfQo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW50IF9fZmR0X3BhcnNlX2RvbWFpbihj
b25zdCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zmc2V0LCB2b2lkICpvcGFxdWUpCj4gPiAgewo+
ID4gICAgICAgICB1MzIgdmFsMzI7Cj4gPiBAQCAtNDY5LDYgKzQ5MCw5IEBAIHN0YXRpYyBpbnQg
X19mZHRfcGFyc2VfZG9tYWluKGNvbnN0IHZvaWQgKmZkdCwgaW50IGRvbWFpbl9vZmZzZXQsIHZv
aWQgKm9wYXF1ZSkKPiA+ICAgICAgICAgfQo+ID4gICAgICAgICBkb20tPm5leHRfbW9kZSA9IHZh
bDMyOwo+ID4KPiA+ICsgICAgICAgLyogUmVhZCAid2lkIiBhbmQgIndpZGRlbGVnIiBEVCBwcm9w
ZXJ0aWVzICovCj4gPiArICAgICAgIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3BzKGZkdCwgZG9t
YWluX29mZnNldCwgZG9tKTsKPiA+ICsKPiA+ICAgICAgICAgLyogUmVhZCAic3lzdGVtLXJlc2V0
LWFsbG93ZWQiIERUIHByb3BlcnR5ICovCj4gPiAgICAgICAgIGlmIChmZHRfZ2V0X3Byb3BlcnR5
KGZkdCwgZG9tYWluX29mZnNldCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInN5
c3RlbS1yZXNldC1hbGxvd2VkIiwgTlVMTCkpCj4gPiBAQCAtNTM1LDYgKzU1OSwyOSBAQCBmYWls
X2ZyZWVfZG9tYWluOgo+ID4gICAgICAgICByZXR1cm4gZXJyOwo+ID4gIH0KPiA+Cj4gPiArc3Rh
dGljIHZvaWQgZmR0X3BhcnNlX3Jvb3RfZG9tYWluKGNvbnN0IHZvaWQgKmZkdCkKPiA+ICt7Cj4g
PiArICAgICAgIGludCBvZmZzZXQ7Cj4gPiArCj4gPiArICAgICAgIGlmICghZmR0KQo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgICAgb2Zmc2V0ID0gZmR0X3BhdGhf
b2Zmc2V0KGZkdCwgIi9jaG9zZW4iKTsKPiA+ICsgICAgICAgaWYgKG9mZnNldCA8IDApCj4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgICBvZmZzZXQgPSBmZHRfbm9k
ZV9vZmZzZXRfYnlfY29tcGF0aWJsZShmZHQsIG9mZnNldCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm9wZW5zYmksZG9tYWluLGNvbmZpZyIpOwo+
ID4gKyAgICAgICBpZiAob2Zmc2V0IDwgMCkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4g
PiArCj4gPiArICAgICAgIG9mZnNldCA9IGZkdF9zdWJub2RlX29mZnNldChmZHQsIG9mZnNldCwg
InJvb3QiKTsKPiA+ICsgICAgICAgaWYgKG9mZnNldCA8IDApCj4gPiArICAgICAgICAgICAgICAg
cmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgICBmZHRfcGFyc2VfZG9tYWluX3dpZF9wcm9wcyhmZHQs
IG9mZnNldCwgJnJvb3QpOwo+ID4gK30KPiA+ICsKPiA+ICBpbnQgZmR0X2RvbWFpbnNfcG9wdWxh
dGUoY29uc3Qgdm9pZCAqZmR0KQo+ID4gIHsKPiA+ICAgICAgICAgY29uc3QgdTMyICp2YWw7Cj4g
PiBAQCAtNTczLDYgKzYyMCw5IEBAIGludCBmZHRfZG9tYWluc19wb3B1bGF0ZShjb25zdCB2b2lk
ICpmZHQpCj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAr
ICAgICAgIC8qIFBhcnNlIHJvb3QgZG9tYWluIGNvbmZpZyBmcm9tICJyb290IiBzdWJub2RlICov
Cj4gPiArICAgICAgIGZkdF9wYXJzZV9yb290X2RvbWFpbihmZHQpOwo+ID4gKwo+ID4gICAgICAg
ICAvKiBJdGVyYXRlIG92ZXIgZWFjaCBkb21haW4gaW4gRkRUIGFuZCBwb3B1bGF0ZSBkZXRhaWxz
ICovCj4gPiAgICAgICAgIHJldHVybiBmZHRfaXRlcmF0ZV9lYWNoX2RvbWFpbl9ybyhmZHQsICZj
b2xkX2RvbWFpbl9vZmZzZXQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBfX2ZkdF9wYXJzZV9kb21haW4pOwo+ID4gLS0KPiA+IDIuNDMuNwo+ID4KCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
