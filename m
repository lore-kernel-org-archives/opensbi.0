Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44414FCC9BC
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 04:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxvlGvK5ot2XVgs4jsOWAlSMje7Dp37KIeNkvQz/O8U=; b=WONWaZqC1YfiV/
	RPUMB6qfdZC4Sc+jkQP9BJuslwDyAuSZHaQXDteVpWfOPGSthUbGaFoZzGOmGmwQ6tdtVeTOsXIDo
	5y0myNwDzcnfC3k7yIQgSk9p0S2rnADjs37HMW1/mms6FLN7CngYt9Iu3MEbqt8VUqXMSirhfMO+C
	DWQj/wG4DL4/P6Nlc4S+WDcYOsKrtuhhKkOwFdd42Ew76Led5DvvrWTmROfSjBE/g0eZelv4adzPF
	4K9TpEm0j3pHQDKAOpUMzYUbuhIUvx7GWWhcYswXHh4LXY2XrrsrwA3/9i86W7F2Zzn383SsQt3fR
	L5t7BI8jD2iK5RPV7Uqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzp5q-00000008iUy-3bR9;
	Tue, 10 Mar 2026 04:53:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzp5p-00000008iUI-00Jf
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 04:53:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ad9516a653so51269735ad.0
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 21:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773118396; x=1773723196; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OUhaQhc5aap+rnEYU5E7MGly8FXeOtBg6GDJhm5Z2ZU=;
        b=JQYoFsUndgfAqLqGPda44hMDsvU+HhprrjcnWAZWioD1EwGnjA6l4dPJwnk19cbK9S
         x9Ii5LnNsUlgqO53Ox6Vc6Wy6kSOYoIM3nqxQVtPP/5RJwExeFe+qjp+Vpmzx6qDoWuZ
         5EhcdVaDZj1HKOxxQbOb6qIQOa3j1lNi8IydfjwEmceqw3Dt8a/APy62wYJLlvaD8f+r
         5E5guOgI7s2Wd5AWbiAZ1rSg+BQVtL70ITB6w2aHjTwOjUmuIAt4RLFtCkowP7/JHY/1
         JaAAMxi8cq4eRbNcN/3msJc+L11Ep++VJ1N2ApCYWNK1EZmR0xPPiIoEMtl7W1ey/bLd
         KhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773118396; x=1773723196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUhaQhc5aap+rnEYU5E7MGly8FXeOtBg6GDJhm5Z2ZU=;
        b=BfCGjPKFEBfPA9NBvmX4cwnokNhr8PqBlbf7AiXf6GZLqfoETDJ0TN8CNZr4ttoB/M
         UaSKWrBn3TeaZEjcOZZlkiZ4rKjr6G/fwdq0mkJ0yWz9PtRGlbaftTPyCKVuI+xOfp5u
         9l4RLYFXkoIfUFZHmzLuQRl7nVc8BQsYRwlyyEeqm0mEilXyVKptB+uwZBbTdEs9Bx7B
         1hePKaQM67HcxjcIZEVj7LCE5Z6NorgqovkTNQwaNzkA4a6ho8IrheB8GS65PUHkEIIZ
         8qs5zX+M+gUSfCsyJe9eMd5arZ/N3OHlQunjLNMV6fG6YJ2VTOSyQJPpP/qHKpv0r0Rv
         rIdA==
X-Forwarded-Encrypted: i=1; AJvYcCVpEDVJc48BpgmmPeVaIQbHC+1NfHp3Z2Q2YIfcmf3n88+qa/CgjO5DVHfvAiOnq5Gluu0keERi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv6Avo9ChtwGqT+tjeH/epKx4OJZZaH39n8XPTWSeOQH1YXOWn
	4jCa8Di8J+3jAKFxrZ6bT5tGWaUTjifhLcGyLid3xJe1+SsVDCXuttLM
X-Gm-Gg: ATEYQzzRCIEmM0OOaN0x38ul+zLPQf46TqVvrwBmq63OmtJvMFZb95C9WPDcXixszF6
	9jRGVwN2Hci6ETqZTFfpb54t3n6eV3GW7UD2iZXtsVtp60DlTCX3q/onJL53UITyye9sTjPHeoF
	GkpGZTHs2/bpPWE0Y23zdXVxEGem3+6djAgJ6f5Th4hmMsIETcqte7SsJObRpSM/nNoo2Tw6l1o
	Te+d+TiUmX6t9ryJ4hcROXzvmZjO01gqo2gq4EaOIEpLUcjBbySzt0PaddidRCvI2B6TXBeWQJ9
	0J9ioZs859GH2z33alwK7OWRZ5UbvWWKBfRcJcIHMxAMM0Y9zgOBh8+VHwvUTVQG8lmV1s2MbiT
	bou7vohUupj0BaqNpsrwh3mrpPMfcGHty1MqQvK/Mz/ZC3jVhLRlN7Oy9ItbsjBoI+Edzjw0hdr
	Vu33YfwHiZlVkrfI0QGX/vdPIx8TzXnvi+Gu6UYOG66vJmKOasXCBQ7ekLyP/38XiH
X-Received: by 2002:a17:903:2c04:b0:2ae:3fb9:2690 with SMTP id d9443c01a7336-2ae82393b04mr135579605ad.19.1773118396095;
        Mon, 09 Mar 2026 21:53:16 -0700 (PDT)
Received: from localhost (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ae83f8a67esm182805715ad.61.2026.03.09.21.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 21:53:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 14:53:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Radim Krcmar <rkrcmar@qti.qualcomm.com>, 
	Nylon Chen <nylon.chen@sifive.com>, "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, 
	Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	opensbi <opensbi-bounces@lists.infradead.org>, Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
Subject: Re: [PATCH 2/3] lib: sbi: Enable Smrnmi extension handler
Message-ID: <6loqqke4i7ldg4e35xxrw5423ns3uq6oscmfg5ksvdlam74atr@ssjirjjgt7y3>
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
 <20260129-smrnmi-v3-v1-2-5d297d3e2027@sifive.com>
 <DG4KXRI812NK.1R8OG8O0MZ5A2@qti.qualcomm.com>
 <ajsifrry25y4ogzupvkl4bplklqppquexfw4erorqsn3nlmtpy@b3qqdlrgd3kd>
 <CAAhSdy0A+uvKypXifa9rr2Y9NXAayg8UWbcKOXErh_r-7xtjZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0A+uvKypXifa9rr2Y9NXAayg8UWbcKOXErh_r-7xtjZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_215317_066975_93328A12 
X-CRM114-Status: GOOD (  34.37  )
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

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgMDk6NDI6MjZBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIE1hciAxMCwgMjAyNiBhdCA3OjU44oCvQU0gTmljaG9sYXMgUGlnZ2luIDxu
cGlnZ2luQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBGZWIgMDIsIDIwMjYgYXQg
MDM6MjY6MzNQTSArMDAwMCwgUmFkaW0gS3JjbWFyIHdyb3RlOgo+ID4gPiAyMDI2LTAxLTI5VDAw
OjEzOjQyLTA4OjAwLCBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Ogo+ID4gPiA+
IEVuYWJsZSB0aGUgU21ybm1pIGV4dGVuc2lvbiBieToKPiA+ID4gPiAxLiBBZGRpbmcgc2JpX3Ju
bWlfdmVjdG9yX2luaXQoKSB0byBhbGxvY2F0ZSBwZXItSEFSVCBSTk1JIGNvbnRleHQgYW5kIGVu
YWJsZSBSTk1JIHZpYSBNTlNUQVRVUy5OTUlFCj4gPiA+ID4gMi4gU2F2aW5nIGFuZCByZXN0b3Jp
bmcgQ1NSX01OU0NSQVRDSCBhbmQgQ1NSX01OU1RBVFVTIGFjcm9zcyBub24tcmV0ZW50aXZlIHN1
c3BlbmQvcmVzdW1lCj4gPiA+ID4gMy4gQ2FsbGluZyBzYmlfcm5taV92ZWN0b3JfaW5pdCgpIGZy
b20gdGhlIGNvbGQgYW5kIHdhcm0gaW5pdCBwYXRocwo+ID4gPiA+Cj4gPiA+ID4gQ28tZGV2ZWxv
cGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gPiA+IFN1Z2dlc3RlZC1ieTogTmlj
ayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+ID4gPiA+IFN1Z2dlc3RlZC1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
Tnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oIGIvaW5jbHVkZS9z
Ymkvc2JpX3BsYXRmb3JtLmgKPiA+ID4gPiBAQCAtMTQ5LDYgKzE0OSwxNSBAQCBzdHJ1Y3Qgc2Jp
X3BsYXRmb3JtX29wZXJhdGlvbnMgewo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBsb2cybGVuKTsKPiA+ID4gPiAgICAgLyoqIHBsYXRmb3JtIHNwZWNpZmljIHBtcCBk
aXNhYmxlIG9uIGN1cnJlbnQgSEFSVCAqLwo+ID4gPiA+ICAgICB2b2lkICgqcG1wX2Rpc2FibGUp
KHVuc2lnbmVkIGludCBuKTsKPiA+ID4gPiArICAgLyoqCj4gPiA+ID4gKyAgICAqIFBsYXRmb3Jt
LXNwZWNpZmljIGhlbHBlciB0byBwcm9ncmFtIHRoZSBSTk1JIHRyYXAgdmVjdG9yLgo+ID4gPiA+
ICsgICAgKgo+ID4gPiA+ICsgICAgKiBUaGUgY29yZSB3aWxsIGNhbGwgdGhpcyBmcm9tIHNiaV9y
bm1pX3ZlY3Rvcl9pbml0KCkgd2l0aCB0aGUKPiA+ID4gPiArICAgICogZmlybXdhcmUgUk5NSSBo
YW5kbGVyIGVudHJ5IGFkZHJlc3MgKHJubWlfaGFuZGxlcikgYW5kIHRoZQo+ID4gPiA+ICsgICAg
KiBjb2xkX2Jvb3QgZmxhZy4gUGxhdGZvcm1zIHRoYXQgc3VwcG9ydCBTbXJubWkgc2hvdWxkIGlt
cGxlbWVudAo+ID4gPiA+ICsgICAgKiB0aGlzOyBvdGhlcnMgY2FuIGxlYXZlIGl0IE5VTEwuCj4g
PiA+ID4gKyAgICAqLwo+ID4gPgo+ID4gPiBJZiB0aGUgaGFydCBzdXBwb3J0cyBTbXJubWksIHRo
ZW4gaXQgYmVnaW5zIHdpdGggbm1zdGF0dXMuTk1JRT0wLCB3aGljaAo+ID4gPiBtZWFucyB0aGF0
IGFueSBleGNlcHRpb24gaXMgZ29pbmcgdG8gZW50ZXIgYSBjcml0aWNhbCBzdGF0ZS4KPiA+ID4g
VGhlIHBsYXRmb3JtIG11c3Qgc29tZWhvdyBzdXBwb3J0IFNtcm5taSB0byBiZSB1c2VmdWwsIGFu
ZCBJIHRoaW5rIGl0Cj4gPiA+IHdvdWxkIGJlIGJldHRlciBub3QgdG8gZG8gaXQgYmVoaW5kIG9w
ZW5zYmkncyBiYWNrLgo+ID4gPgo+ID4gPiBJZiB0aGUgcGxhdGZvcm0gd2FudHMgdG8gaGFuZGxl
IFNtcm5taSBpdHNlbGYsIGl0IGNhbiBoaWRlIFNtcm5taSBmcm9tCj4gPiA+IG9wZW5zYmksIHNv
IEkgdGhpbmsgdGhlIHJlcXVpcmVtZW50IGhlcmUgd291bGQgYmUgYmV0dGVyIGFzIE1VU1QuCj4g
PiA+Cj4gPiA+ID4gKyAgIGludCAoKnNldF9ybm1pX3RyYXBfdmVjdG9yKSh1aW50cHRyX3QgaGFu
ZGxlcl9hZGRyLCBib29sIGNvbGRfYm9vdCk7Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2luaXQuYyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+ID4gPiA+IEBAIC0yNzMsNiArMjczLDEw
IEBAIHN0YXRpYyB2b2lkIF9fbm9yZXR1cm4gaW5pdF9jb2xkYm9vdChzdHJ1Y3Qgc2JpX3NjcmF0
Y2ggKnNjcmF0Y2gsIHUzMiBoYXJ0aWQpCj4gPiA+ID4gICAgIGlmIChyYykKPiA+ID4gPiAgICAg
ICAgICAgICBzYmlfaGFydF9oYW5nKCk7Cj4gPiA+ID4KPiA+ID4gPiArICAgcmMgPSBzYmlfcm5t
aV92ZWN0b3JfaW5pdChzY3JhdGNoLCB0cnVlKTsKPiA+ID4KPiA+ID4gQXJlIHdlIHN1cmUgdGhh
dCBlYXJsaWVyIG9wZW5zYmkgY29kZSB3b24ndCB0cnkgdG8gdHJpZ2dlciBhIHRyYXAgYmVmb3Jl
Cj4gPiA+IHRoaXMgcG9pbnQ/ICBPcGVuU0JJIHdvdWxkIGZhaWwgdG8gYm9vdCBpZiBpdCBkaWQu
Li4KPiA+Cj4gPiBUaGlzIGFwcGVhcnMgdG8gY29tZSByaWdodCBhZnRlciBzYmlfaGFydF9pbml0
KCkgd2hpY2ggZG9lcyBhIGJ1bmNoIG9mCj4gPiBDU1IgZGV0ZWN0aW9uIHVzaW5nIHRyYXBzLCBz
byBJJ20gbm90IHN1cmUgaWYgaXQgY2FuIHdvcmsuCj4gCj4gV2h5IG5vdCA/CgpJIHNob3VsZCBw
dXQgYSBiZXR0ZXIgd2F5LCBJIHRoaW5rIGl0J3Mgd29ya2FibGUgZm9yIHNvbWUgYnV0IG5vdAph
bGwgaW1wbGVtZW50YXRpb25zLiBXaGVuIE5NSUU9MCB0aGUgc3BlYyBzYXlzIG5vcm1hbCBleGNl
cHRpb25zIGdvIHRvCmFuIGltcGxlbWVudGF0aW9uIGRlZmluZWQgdHJhcCBoYW5kbGVyLiBUaGlz
IG1heSBiZSBtdHZlYywgYnV0IG5vdApuZWNlc3NhcmlseS4gSW4gdGhlIGNhc2Ugb2YgQXNjYWxv
biBpdCBpcyBub3QuIEkgZ3Vlc3MgdGhlIFNpRml2ZQppbXBsZW1lbnRhdGlvbiBtdXN0IHVzZSBt
dHZlYyBoZW5jZSBpdCBkb2VzIHdvcmsgdGhlcmUuCgo+ID4gRXZnZW55ICgrY2MpIGhhcyBiZWVu
IGRvaW5nIGEgbG90IG9mIHdvcmsgdG8gZW5hYmxlIFNtcm5taSBvbiBBc2NhbG9uCj4gPiBhbmQg
dW5mb3J0dW5hdGVseSB3ZSBkaWQgbm90IHNlZSB0aGVyZSBpcyB0aGlzIGR1cGxpY2F0ZSB3b3Jr
IGhhcHBlbmluZwo+ID4gdXBzdHJlYW0uIEhpcyBjaGFuZ2VzIGFsc28gaGFzIGEgZmV3IG90aGVy
IHRoaW5ncyBzdWNoIGFzIFJOTUkgZXhjZXB0aW9uCj4gPiB2ZWN0b3Igc2V0dGluZywgcGVybWl0
cyBhIHBsYXRmb3JtIHNwZWNpZmljIGhhbmRsZXIsIGFuZCBoYXMgYW4gQXNjYWxvbgo+ID4gcGxh
dGZvcm0gaW1wbGVtZW50YXRpb24uCj4gCj4gVGhpcyBpcyBleGFjdGx5IHdoeSB1cHN0cmVhbWlu
ZyBzaG91bGQgYmUgcHJpb3JpdGl6ZWQgc28gdGhhdCBwZW9wbGUKPiBjYW4gbGV2ZXJhZ2UgZWFj
aCBvdGhlcnMgd29yay4KClllcyBJIGFncmVlLiBXZSBzaG91bGQgYmUgZG9pbmcgYSBiZXR0ZXIg
d2l0aCB1cHN0cmVhbSBwYXJ0aWNpcGF0aW9uLgoKSSB3aWxsIGxldCBFdmdlbnkgcG9zdCBoaXMg
c2VyaWVzLiBBZ2FpbiwgcGxlYXNlIGRvbid0IHRha2UgaXQgYXMKaWdub3JpbmcgdGhpcyBleGlz
dGluZyB3b3JrIHVwc3RyZWFtLiBBbmQgSSB0aGluayB3ZSB3b3VsZCBiZQpoYXBweSB0byByZWJh
c2Ugb3VyIHN0dWZmIG9uIHRvcCBvZiBpdCwgaWYgdGhhdCBlbmRzIHVwIGJlaW5nIHRoZQpiZXN0
IGFwcHJvYWNoLiBUaGUgbG93IGxldmVsIHRyYXAgaGFuZGxpbmcgYW5kIHBsYXRmb3JtIHZlY3Rv
ciBzZXQKY2FsbCBzdHVmZiBzaG91bGQgYWxsIGJlIHZlcnkgc2ltaWxhci4KClRoYW5rcywKTmlj
awoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
