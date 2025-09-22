Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3977CAC5AA
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1E6FOZGD0eoz+kxsp3/fOswGRUUKQOR2uO2eDN5JYc=; b=F1SJMuTI1oSKqb
	my3v9SQ6LSzQGO8WKtPtqoqrqgInUnXsK/cIHJmyL0d+fRciCbpe3PK8L1BJMFD85dJr2BAjLuPeA
	Ww37+1gF2zZTKwXAe/aghC+UCBcVWszB6c220/P+Sjkbf6uROq/x/VuK1szARfTNAAG1e2zJniBqF
	u4BhBgGEwAN2iKGRV6cVNSu0/ISEeta4TzHb9KlGNjJQvFMuaTR9S7FykXTcqOZHiW+wK40vZU2IS
	6GbM5GjS2WZggQDNIKJgLVy2hTp1TiPRU527o3glcpLrqEGlYeE1dc7Tu++DabqI4dWd5ikvVsfoX
	G1x12ljzL7/8BNq+DgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aBR-0000000906H-30Zn;
	Mon, 22 Sep 2025 06:37:57 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aBL-00000009053-37Qk
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 06:37:56 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-425715aeccdso6647605ab.2
        for <opensbi@lists.infradead.org>; Sun, 21 Sep 2025 23:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758523071; x=1759127871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCQRxUuZvY1Ov9VAPb2ykFj27NjaNm29sKQel6tnGsw=;
        b=WW2oVMUrdugJYnlBaBJOfu9W+XJoxH6nrluBfOIYpe5IWHjaoSdf2xpz5FqDCOjgJH
         PePVDbB8QI4HbMYOj041i83N7Z4gAqd2d+oBdtNNQMgxy9720yUWO/KAFK3LkSMAsRNO
         yglVC501w+l+HzTmI1KnSwSTPu6tcKk/oJ64xSQydmlI1Jk65gvSSqL+wfDeKwCaiIjt
         KZFsLNw/KwFNbjXynKmbl1Eud2lUuIe69OZGJtjV+BTXx8bwcBAX39RD4vMDEFTTvhog
         35YRjk3LfwLITxCk7wZERnY/i6NT4NXKbPReLPorJAu2X/2EVL+V1fv0qJQlGbPSHIFt
         aIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758523071; x=1759127871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCQRxUuZvY1Ov9VAPb2ykFj27NjaNm29sKQel6tnGsw=;
        b=ppRN6Rdpq/AMBkhhQLjPO44bkzFVZ03f7+awPpyHdDfp9dSpBVQkgiNpVuTXPPj8o7
         qupFxupysTSKiI4NpxwS9Gay1w1iXodVnRNVbpCWOgtsIuVXQT30kWhxuaAxqLrPv7Ls
         d9j81NQQUtGdGg8XkWO6qxXFkJwU2cT8nDZhbwquDKCeJd3jCea/tbYUufcydp54MQLO
         OmgY2CUis0Y8wB/hgCpztnUcm8YTmjWuR7rcnvZLkEmo2oaGFLmI356srLuVrLCAoDNN
         RM3vAQ2X+DU0xfqLrcdei+G1GvcGcCDDo5FfRYIo5lPgchKNCWwayWAGRhMQlebv8HHw
         SPeg==
X-Gm-Message-State: AOJu0YzEE7dI63yk3MTCE08ErDe4N5DgAsozSN82m4ZBt62Qhd3RqCeW
	BDe202Eof38/zvycGW8s/UjLP8wPCNWgAh2uummKhbNY3CRQUF3whROpLWtcct2o69gt3VIbpfv
	9H/Gf+CrDhs68JjvIUz3z5E61KO8hDl9ycBwe40iTaL2WJ3vV1+Nbplc=
X-Gm-Gg: ASbGncs+wywPUzx0ZifZDyxabFdUZJ1d7WZlj6U9xNq7RgjtnKbqYHawU6G499kG6w7
	AM5IEp+BRUWn4r831uLyN7S1B/EBKHunpw0ZwasiAwfujD1o+tJbJs8QjSY/MoiPQ7v4E5Q0SXR
	oMlhhqhL927e33a+pCKmIjKTT8uJN7nO8/irQ6IBmJoghczCvPI+NI9TJOfxb0zQiw7miYHoPjl
	Vny87ldtHcMLigu1XP5osaZ03Nlr/fa9IFEt7Lx
X-Google-Smtp-Source: AGHT+IHfNRJYv6+iwXB7aMoZGfLOutlXUGjBnq3AOlx0AryLl4CF0AdGCAKn9nuZW/Cw5MNgkx2YeGTFCFOb4KuO4Uc=
X-Received: by 2002:a05:6e02:3e04:b0:424:826:4f03 with SMTP id
 e9e14a558f8ab-42481984042mr190676905ab.17.1758523070750; Sun, 21 Sep 2025
 23:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
 <CAAhSdy2x2w0+92W1+L5FPYVpcTypakMjop7YLCADvZyrWKoe4g@mail.gmail.com>
 <869418C0C5B4E860+aNDhto1P8_DVRowH@LT-Guozexi> <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
 <10FA4FAF4385199D+aNDoKROfVoYsolIw@LT-Guozexi> <CAAhSdy2E+ZCrJUmB_Tm1qBC6gY6JOgwQKOXpVbcHOiZe9zJUHg@mail.gmail.com>
 <84B498E97DCDF5D1+aNDsXkDCXMlENDMt@LT-Guozexi>
In-Reply-To: <84B498E97DCDF5D1+aNDsXkDCXMlENDMt@LT-Guozexi>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Sep 2025 12:07:40 +0530
X-Gm-Features: AS18NWCMB-UtEWDYFCJ_teWw2lthmsMmVBTSh_iGHy-3yjZejxJFOqh5otAQndg
Message-ID: <CAAhSdy1LM5OOhSxPqxx3eRjNqs82eJfzYSOnXTiz0s3hLEn-Wg@mail.gmail.com>
Subject: Re: [PATCH v2] platform: generic: spacemit: add K1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_233751_787724_A5811F9C 
X-CRM114-Status: GOOD (  31.11  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTE6NTfigK9BTSBUcm95IE1pdGNoZWxsCjx0cm95Lm1p
dGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAyMiwgMjAy
NSBhdCAxMTo0OTozOEFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAg
MjIsIDIwMjUgYXQgMTE6MznigK9BTSBUcm95IE1pdGNoZWxsCj4gPiA8dHJveS5taXRjaGVsbEBs
aW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIFNlcCAyMiwgMjAy
NSBhdCAxMTozMTozNUFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwg
U2VwIDIyLCAyMDI1IGF0IDExOjEy4oCvQU0gVHJveSBNaXRjaGVsbAo+ID4gPiA+IDx0cm95Lm1p
dGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24g
TW9uLCBTZXAgMjIsIDIwMjUgYXQgMDg6NTU6MjVBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToK
PiA+ID4gPiA+ID4gT24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgNjo0NuKAr0FNIFRyb3kgTWl0Y2hl
bGwKPiA+ID4gPiA+ID4gPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToK
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEZyb206IFhpYW5iaW4gWmh1IDx4aWFuYmluLnpo
dUBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBFeHRlbmQg
Z2VuZXJpYyBwbGF0Zm9ybSB0byBzdXBwb3J0IFNwYWNlbWlUIEsxLgo+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gT24gSzEsIHRoZSBCUk9NIG9ubHkgYnJpbmdzIHVwIHRoZSBwcmltYXJ5IGNv
cmUgYW5kIGxlYXZlcyB0aGUKPiA+ID4gPiA+ID4gPiBvdGhlciBjb3JlcyBpbiBhIGRpc2FibGVk
IHN0YXRlLiBUaGlzIHByZXZlbnRzIExpbnV4IGZyb20gYm9vdGluZwo+ID4gPiA+ID4gPiA+IFNN
UCBhbmQgb25seSBvbmUgY29yZSBpcyBhdmFpbGFibGUuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBBZGQgY29kZSB0byBicmluZyB1cCBhbGwgOCBjb3JlcyBkdXJpbmcgT3BlblNCSSBpbml0
aWFsaXphdGlvbiBzbwo+ID4gPiA+ID4gPiA+IHRoYXQgdGhlIExpbnV4IGtlcm5lbCBjYW4gZGV0
ZWN0IGFuZCB1c2UgYWxsIGNvcmVzIHByb3Blcmx5Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gQ28tYXV0aG9yZWQtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3Bh
Y2VtaXQuY29tPgo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRy
b3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFhpYW5iaW4gWmh1IDx4aWFuYmluLnpodUBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiA+ID4g
PiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gPiAtIHJl
bW92ZSBfX3NiaV9oc21faGFydF9nZXRfc3RhdGUoKSBpbiBzcGFjZW1pdF9jb2xkX2Jvb3RfYWxs
b3dlZCgpCj4gPiA+ID4gPiA+ID4gLSBwbHVzIFBNVV9BUF9CQVNFIGluIFBNVV9BUF9DT1JFKDB8
NClfKFdBS0VVUHxJRExFKV9PRkZTRVQKPiA+ID4gPiA+ID4gPiAtIExpbmsgdG8gdjE6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MTYtc210LWsxLTgtY29yZXMtdjEtMS01Yjc2ZTA2
ZDEyZGFAbGludXguc3BhY2VtaXQuY29tCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEl0IGlzIGJl
dHRlciB0byBoYXZlIGEgc2VwYXJhdGUgZmR0X2hzbV9zcGFjZW1pdCBkcml2ZXIgdW5kZXIKPiA+
ID4gPiA+ID4gbGliL3V0aWxzL2hzbSBkaXJlY3RvcnkuCj4gPiA+ID4gPiBXZSBhcmUgbm90IGdv
aW5nIHRvIHN1cHBvcnQgdGhpcyBmZWF0dXJlLgo+ID4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIHN1
Z2dlc3Rpb24uCj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kLgo+
ID4gPiA+IFRoaXMgcGF0aCBhbHJlYWR5IHJlZ2lzdGVycyBzYmlfaHNtX2RldmljZSBzbyBhbGwK
PiA+ID4gPiBJIGFtIGFza2luZyBpcyB0byBjcmVhdGUgYSBwcm9wZXIgSFNNIGRyaXZlciB1bmRl
cgo+ID4gPiA+IGxpYi91dGlscy9oc20gZGlyZWN0b3J5Lgo+ID4gPiBQZXJoYXBzIEkgbWlzdW5k
ZXJzdG9vZCBzb21ldGhpbmcuIFdoYXQgSSBtZWFudCBpcyB0aGF0Cj4gPiA+IHdlIGRvIG5vdCBw
bGFuIHRvIHN1cHBvcnQgcnBtaS4KPiA+Cj4gPiBUaGUgbGliL3V0aWxzL2hzbSBpcyBub3Qgb25s
eSBmb3IgUlBNSSBIU00gZHJpdmVyLiBQbGF0Zm9ybXMKPiA+IGNhbiBhZGQgdGhlaXIgSFNNIGRy
aXZlciB1bmRlciB0aGlzIGRpcmVjdG9yeSBhcyB3ZWxsLgo+ID4KPiA+ID4gQWxzbywgSSBub3Rp
Y2VkIG90aGVyIHBsYXRmb3JtcyBhcmUgZGlyZWN0bHkgcmVnaXN0ZXJpbmcgdmlhCj4gPiA+IHNi
aV9oc21fc2V0X2RldmljZSgpIGluIHRoZWlyIHBsYXRmb3JtIGNvZGU6Cj4gPiA+Cj4gPiA+IGBg
YAo+ID4gPiBhbGx3aW5uZXIvc3VuMjBpLWQxLmM6MTkwOiAgICAgIHNiaV9oc21fc2V0X2Rldmlj
ZSgmc3VuMjBpX2QxX3BwdSk7Cj4gPiA+IGFuZGVzL2FlMzUwLmM6MTAxOiAgICAgICAgICAgICAg
c2JpX2hzbV9zZXRfZGV2aWNlKCZhbmRlc19zbXUpOwo+ID4gPiBtaXBzL3A4NzAwLmM6MjE5OiAg
ICAgICAgICAgICAgIHNiaV9oc21fc2V0X2RldmljZSgmbWlwc19oc20pOwo+ID4gPiBgYGAKPiA+
Cj4gPiBGZXcgb2YgdGhlc2UgcGxhdGZvcm1zIHdlcmUgYWRkZWQgYmVmb3JlIGEgZGVkaWNhdGVk
Cj4gPiBsaWIvdXRpbHMvaHNtIGRpcmVjdG9yeSB3YXMgY3JlYXRlZCBmb3IgSFNNIGRyaXZlcnMu
Cj4gPgo+ID4gPgo+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgbWUgd2l0aCBtb3JlIGlu
Zm9ybWF0aW9uPwo+ID4KPiA+IEdyYWR1YWxseSwgd2UgbmVlZCB0byBtb3ZlIEhTTSBkcml2ZXJz
IGZyb20gcGxhdGZvcm0vZ2VuZXJpYyB0bwo+ID4gbGliL3V0aWxzL2hzbSBhcyBpbmRlcGVuZGVu
dCBIU00gZHJpdmVycwo+ID4KPiA+IEkgaGF2ZSBhbHJlYWR5IHN1Z2dlc3RlZCB0aGlzIGZvciBT
aUZpdmUgVE1DMCBhbmQgU01DMCBkcml2ZXJzCj4gPiBhcyB3ZWxsLgo+ID4gKFJlZmVyICJbUEFU
Q0ggdjYgMDAvMTFdIEFkZCBTaUZpdmUgVE1DMCBhbmQgU01DMCBkcml2ZXIiKQo+IFRoYW5rcyBm
b3IgeW91ciBwYXRpZW5jZSBBbnVwIQo+IEl0J3MgY2xlYW4gbm93LiBJJ2xsIHNlcGFyYXRlIHRo
aXMgcGF0Y2guCgpPbmUgbW9yZSBzdWdnZXN0aW9uIGlzIHRoYXQgeW91IGNhbiBzaW1wbHkgcmUt
dXNlCiJzcGFjZW1pdCxrMSIgYXMgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGZvciB5b3VyIEhTTQpk
cml2ZXIuCgpJbiB0aGUgZnV0dXJlLCB5b3UgY2FuIHByb3ZpZGUgSFNNIHN1cHBvcnQgZm9yIG11
bHRpcGxlCnNwYWNlbWl0IFNvQ3MgZnJvbSB0aGUgc2FtZSBIU00gZHJpdmVyIChhc3N1bWluZwp0
aGV5IHdpbGwgYmUgc2ltaWxhciB3aXRoIGluY3JlbWVudGFsIGNoYW5nZXMpIGFuZApNTUlPIGJh
c2UgYWRkcmVzcyBvZiByZWdpc3RlcnMgY2FuIGJlIGluZmVycmVkIGZyb20KY29tcGF0aWJsZSBz
dHJpbmcuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
