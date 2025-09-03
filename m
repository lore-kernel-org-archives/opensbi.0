Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C97FCA0FF2
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 07:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Is+CnM9cPogWaDdCyb64G14dDRJl0ngZ8DI9cIXPMm0=; b=dr18QZoaRJffqS
	0TIZL4NVwShQDTCm2/55LqHWk8px7bq8QR64TXooVYHFGGFXDsrtXdL4feLOKRWCn2wGHA3o3Tg1+
	B9OsuZReb2P2dJtCQ9fVUYI+JhIO+Vg26fwGtuyFeqaB8RCdDUNqnDDSTnKjMZJUn84dljl4Jbo2V
	7NDKEjweVHuqFnCtEgfH+dpXuWWsuGcEn6+nf4n9XdSE2qGtAST3s+JIEeF8wGvWweG2rbSClF89r
	2Y/h0JOEZHEWQguXIhxUXC4qlj8xI8p7O97TzLx0sXQSo6qJhi1Kh4gYAy5gG+nlrv7huvmp6G0dU
	BvcWDt6mxkkhoeyXraWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthkF-00000004zzs-3Iyb;
	Wed, 03 Sep 2025 07:17:27 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthh7-00000004yM1-0S19
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 07:14:14 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso3031180e87.1
        for <opensbi@lists.infradead.org>; Wed, 03 Sep 2025 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756883651; x=1757488451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHMD9BANAOiHbxyqrlcfcgZkcvF2ezcOhT9S7Ngn+ag=;
        b=Kt8ecm9s5FAVffxa5wfkWb4Nfw6gM7NV9hWZ9HnkEMMvLQOxfvgT3YOk04CFzzkD16
         NhUYeYrcl4/gubJu11+bdY/9W8jVXlaBHggf7hdWPmbejyb8lVXrRP6wGK30PaoDDjmo
         0J2zwIuLJNIMZ3PpXSAG7f5mqYVszbGWZ+rfsi0YEmwLTq+MYwf3szx6s6ta5UB3hYUo
         v0ArqxTt2sXAIyk/lAoDs8AcH6VPzdmxxLv5vPdESDCYU5WXLrRxeCp2IO4m9RQWXrQm
         pqDgbiUh10sa9wBKzGE7zzcztJzYZWk3PEUSl96ZBSFvTbPYsztChR3jzF9NSGl1NtHQ
         z6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756883651; x=1757488451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHMD9BANAOiHbxyqrlcfcgZkcvF2ezcOhT9S7Ngn+ag=;
        b=FrO0x8y0ijMAIOX+uTU82RUCjZWEdrKTYvm7cszB3dC9rsESQo8TWxVMI6rYNhcF9I
         HPwpsRS0LJloefMQT0cjG68c9XmehGf9ImPcl+affOulQjJ7B2T8fC+KDBdHGdje1rux
         sXia060ywC3BvYrj4euCrO4FGmm8aZRI3FFZNZzDmnzKyky8av/7XMc+NRlKEXXPsSoq
         F2BNMVHW14Yum3/Qak/w1Dd8nVe5McWHorUFU6JFJdR0VVGYUBDLuXORg5L7ZBSUS709
         s96YS48MhW2nVllT47VT7vIOeJPY2qcQLLXTVcUrLDf7sE8755yHo9Lv/RCxTSFWf9YE
         QBfw==
X-Forwarded-Encrypted: i=1; AJvYcCVhsb4Fs1dE+wQt9EiHQ3JHQBt1wdmfylwpyqufcnVcCx2SInnvE7C1r1f26VsoDYv5qqED559C@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqa8IigpKh16oXLoOTRRuQnfGrWW97RHn5VJilzU4OcZRA6amm
	4p5w5bhd/4kgwSRGlCnJCpdEQIYApWwJw8goWmQR0Pn+R2c3O4xlIQVAWBc8WwJK6tGNryS/ABF
	26Q3uhqqaVFbFBIpou1Wex0swnZKekOjZt2BaHIIqJQ==
X-Gm-Gg: ASbGncvcAAtOKxSTjesU0xxQaOqA6rQIip0KpMJYaREdTQUkD0RyfqWGHCtpxEDeB0N
	9Sll8HMLCC3za+o/hEN8o9unIs2D4m+JJ6wLFOEQXbR8XLynZAZdY1Bks8Mvzj0vY0H3p7rGYpt
	YZQLyTH0k8iySl84IB5eQaKr9KvqL4QSU4R/C3B+G2xIQW08Jvhp6BL4q08JtUz8QQ0NS2rEZY7
	xGQhsvu
X-Google-Smtp-Source: AGHT+IG5QrJdIcX9iT38sEghCUfT9JpSu+M80K8/8fZCZ09ZcIsPFflpz+Qp57wKbysDlqHrduRGWPVHlLFLjR4JlLY=
X-Received: by 2002:a05:6512:1594:b0:55f:6831:6ef4 with SMTP id
 2adb3069b0e04-55f7089c47amr4101957e87.12.1756883650900; Wed, 03 Sep 2025
 00:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250902121721.401933-1-apatel@ventanamicro.com>
 <20250902121721.401933-2-apatel@ventanamicro.com> <CAKddAkB2b1obcx2Wc4Ghyk-sc_V+S2L3qVZHB6=Kr1JOibYCeA@mail.gmail.com>
In-Reply-To: <CAKddAkB2b1obcx2Wc4Ghyk-sc_V+S2L3qVZHB6=Kr1JOibYCeA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 3 Sep 2025 12:43:58 +0530
X-Gm-Features: Ac12FXx3rbHJhBngOnRgEWH2GqWkNb54d9q69-vEKnpONQDMz_FI2HvNVtY1sJw
Message-ID: <CAK9=C2Woi2Nq65GpgU4dh7eYLNv5-WN84dS4cGTcnDzC=1_Sew@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: sbi: Introduce IPI device rating
To: Nick Hu <nick.hu@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_001413_146951_9A94FA95 
X-CRM114-Status: GOOD (  29.90  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCAxMjozMOKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAzLCAyMDI1IGF0IDEyOjA44oCvQU0gQW51cCBQ
YXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IEEgcGxhdGZvcm0g
Y2FuIGhhdmUgbXVsdGlwbGUgSVBJIGRldmljZXMgKHN1Y2ggYXMgQUNMSU5UIE1TV0ksCj4gPiBB
SUEgSU1TSUMsIGV0YykuIEN1cnJlbnRseSwgT3BlblNCSSByZWx5IG9uIHBsYXRmb3JtIGNhbGxp
bmcKPiA+IHRoZSBzYmlfaXBpX3NldF9kZXZpY2UoKSBmdW5jdGlvbiBpbiBjb3JyZWN0IG9yZGVy
IGFuZCBwcmVmZXIKPiA+IHRoZSBmaXJzdCBhdmFpYWJsZSBJUEkgZGV2aWNlIHdoaWNoIGlzIGZy
YWdpbGUuCj4gPgo+ID4gSW5zdGVhZCBvZiB0aGUgYWJvdmUsIGludHJvZGN1ZSBJUEkgZGV2aWNl
IHJhdGluZyBhbmQgcHJlZmVyCj4gPiB0aGUgaGlnaGVzdCByYXRlZCBJUEkgZGV2aWNlLiBUaGlz
IGZ1cnRoZXIgYWxsb3dzIGV4dGVuZGluZwo+ID4gdGhlIHNiaV9pcGlfcmF3X2NsZWFyKCkgdG8g
Y2xlYXIgYWxsIGF2YWlsYWJsZSBJUEkgZGV2aWNlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUv
c2JpL3NiaV9pcGkuaCAgICAgICAgfCAgNiArKysrKy0KPiA+ICBsaWIvc2JpL3NiaV9pbml0LmMg
ICAgICAgICAgIHwgIDIgKy0KPiA+ICBsaWIvc2JpL3NiaV9pcGkuYyAgICAgICAgICAgIHwgMjgg
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gIGxpYi91dGlscy9pcGkvYWNsaW50X21z
d2kuYyAgfCAgMSArCj4gPiAgbGliL3V0aWxzL2lwaS9hbmRlc19wbGljc3cuYyB8ICAxICsKPiA+
ICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jICAgIHwgIDEgKwo+ID4gIDYgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvc2JpL3NiaV9pcGkuaCBiL2luY2x1ZGUvc2JpL3NiaV9pcGkuaAo+ID4gaW5kZXgg
NjJkNjEzMDQuLjBhOWFlMDNkIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2lwaS5o
Cj4gPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaXBpLmgKPiA+IEBAIC0xNCw2ICsxNCw3IEBACj4g
Pgo+ID4gIC8qIGNsYW5nLWZvcm1hdCBvZmYgKi8KPiA+Cj4gPiArI2RlZmluZSBTQklfSVBJX0RF
VklDRV9NQVggICAgICAgICAgICAgICAgICAgICAoNCkKPiA+ICAjZGVmaW5lIFNCSV9JUElfRVZF
TlRfTUFYICAgICAgICAgICAgICAgICAgICAgICg4ICogX19TSVpFT0ZfTE9OR19fKQo+ID4KPiA+
ICAvKiBjbGFuZy1mb3JtYXQgb24gKi8KPiA+IEBAIC0yMyw2ICsyNCw5IEBAIHN0cnVjdCBzYmlf
aXBpX2RldmljZSB7Cj4gPiAgICAgICAgIC8qKiBOYW1lIG9mIHRoZSBJUEkgZGV2aWNlICovCj4g
PiAgICAgICAgIGNoYXIgbmFtZVszMl07Cj4gPgo+ID4gKyAgICAgICAvKiogUmF0aW5ncyBvZiB0
aGUgSVBJIGRldmljZSAoaGlnaGVyIGlzIGJldHRlcikgKi8KPiA+ICsgICAgICAgdW5zaWduZWQg
bG9uZyByYXRpbmc7Cj4gPiArCj4gPiAgICAgICAgIC8qKiBTZW5kIElQSSB0byBhIHRhcmdldCBI
QVJUIGluZGV4ICovCj4gPiAgICAgICAgIHZvaWQgKCppcGlfc2VuZCkodTMyIGhhcnRfaW5kZXgp
Owo+ID4KPiA+IEBAIC04Nyw3ICs5MSw3IEBAIHZvaWQgc2JpX2lwaV9wcm9jZXNzKHZvaWQpOwo+
ID4KPiA+ICBpbnQgc2JpX2lwaV9yYXdfc2VuZCh1MzIgaGFydGluZGV4KTsKPiA+Cj4gPiAtdm9p
ZCBzYmlfaXBpX3Jhd19jbGVhcih2b2lkKTsKPiA+ICt2b2lkIHNiaV9pcGlfcmF3X2NsZWFyKGJv
b2wgYWxsX2RldmljZXMpOwo+ID4KPiA+ICBjb25zdCBzdHJ1Y3Qgc2JpX2lwaV9kZXZpY2UgKnNi
aV9pcGlfZ2V0X2RldmljZSh2b2lkKTsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
aW5pdC5jIGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gPiBpbmRleCA4NGE2Mzc0OC4uNjYzYjQ4NmIg
MTAwNjQ0Cj4gPiAtLS0gYS9saWIvc2JpL3NiaV9pbml0LmMKPiA+ICsrKyBiL2xpYi9zYmkvc2Jp
X2luaXQuYwo+ID4gQEAgLTUwNyw3ICs1MDcsNyBAQCBzdGF0aWMgdm9pZCBfX25vcmV0dXJuIGlu
aXRfd2FybWJvb3Qoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCB1MzIgaGFydGlkKQo+ID4g
ICAgICAgICBpZiAoaHN0YXRlID09IFNCSV9IU01fU1RBVEVfU1VTUEVOREVEKSB7Cj4gPiAgICAg
ICAgICAgICAgICAgaW5pdF93YXJtX3Jlc3VtZShzY3JhdGNoLCBoYXJ0aWQpOwo+ID4gICAgICAg
ICB9IGVsc2Ugewo+ID4gLSAgICAgICAgICAgICAgIHNiaV9pcGlfcmF3X2NsZWFyKCk7Cj4gPiAr
ICAgICAgICAgICAgICAgc2JpX2lwaV9yYXdfY2xlYXIodHJ1ZSk7Cj4gPiAgICAgICAgICAgICAg
ICAgaW5pdF93YXJtX3N0YXJ0dXAoc2NyYXRjaCwgaGFydGlkKTsKPiA+ICAgICAgICAgfQo+ID4g
IH0KPiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pcGkuYyBiL2xpYi9zYmkvc2JpX2lwaS5j
Cj4gPiBpbmRleCAyZGU0NTliMC4uYjU3ZWM2NTIgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvc2JpL3Ni
aV9pcGkuYwo+ID4gKysrIGIvbGliL3NiaS9zYmlfaXBpLmMKPiA+IEBAIC0zMiw4ICszMiw5IEBA
IF9TdGF0aWNfYXNzZXJ0KAo+ID4gICAgICAgICAidHlwZSBvZiBzYmlfaXBpX2RhdGEuaXBpX3R5
cGUgaGFzIGNoYW5nZWQsIHBsZWFzZSByZWRlZmluZSBTQklfSVBJX0VWRU5UX01BWCIKPiA+ICAg
ICAgICAgKTsKPiA+Cj4gPiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgaXBpX2RhdGFfb2ZmOwo+ID4g
K3N0YXRpYyB1bnNpZ25lZCBsb25nIGlwaV9kYXRhX29mZiwgaXBpX2Rldl9jb3VudDsKPiA+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IHNiaV9pcGlfZGV2aWNlICppcGlfZGV2ID0gTlVMTDsKPiA+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHNiaV9pcGlfZGV2aWNlICppcGlfZGV2X2FycmF5W1NCSV9JUElf
REVWSUNFX01BWF07Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzYmlfaXBpX2V2ZW50X29wcyAq
aXBpX29wc19hcnJheVtTQklfSVBJX0VWRU5UX01BWF07Cj4gPgo+ID4gIHN0YXRpYyBpbnQgc2Jp
X2lwaV9zZW5kKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgdTMyIHJlbW90ZV9oYXJ0aW5k
ZXgsCj4gPiBAQCAtMjQ4LDcgKzI0OSw3IEBAIHZvaWQgc2JpX2lwaV9wcm9jZXNzKHZvaWQpCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfc2NyYXRjaF9vZmZzZXRfcHRyKHNjcmF0Y2gs
IGlwaV9kYXRhX29mZik7Cj4gPgo+ID4gICAgICAgICBzYmlfcG11X2N0cl9pbmNyX2Z3KFNCSV9Q
TVVfRldfSVBJX1JFQ1ZEKTsKPiA+IC0gICAgICAgc2JpX2lwaV9yYXdfY2xlYXIoKTsKPiA+ICsg
ICAgICAgc2JpX2lwaV9yYXdfY2xlYXIoZmFsc2UpOwo+ID4KPiA+ICAgICAgICAgaXBpX3R5cGUg
PSBhdG9taWNfcmF3X3hjaGdfdWxvbmcoJmlwaV9kYXRhLT5pcGlfdHlwZSwgMCk7Cj4gPiAgICAg
ICAgIGlwaV9ldmVudCA9IDA7Cj4gPiBAQCAtMjgzLDEwICsyODQsMTkgQEAgaW50IHNiaV9pcGlf
cmF3X3NlbmQodTMyIGhhcnRpbmRleCkKPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4K
PiA+IC12b2lkIHNiaV9pcGlfcmF3X2NsZWFyKHZvaWQpCj4gPiArdm9pZCBzYmlfaXBpX3Jhd19j
bGVhcihib29sIGFsbF9kZXZpY2VzKQo+ID4gIHsKPiA+IC0gICAgICAgaWYgKGlwaV9kZXYgJiYg
aXBpX2Rldi0+aXBpX2NsZWFyKQo+ID4gLSAgICAgICAgICAgICAgIGlwaV9kZXYtPmlwaV9jbGVh
cigpOwo+ID4gKyAgICAgICBpbnQgaTsKPiA+ICsKPiA+ICsgICAgICAgaWYgKGFsbF9kZXZpY2Vz
KSB7Cj4gPiArICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGlwaV9kZXZfY291bnQ7IGkr
Kykgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGlwaV9kZXZfYXJyYXlbaV0tPmlw
aV9jbGVhcikKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXBpX2Rldl9hcnJh
eVtpXS0+aXBpX2NsZWFyKCk7Cj4gPiArICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICB9IGVs
c2Ugewo+ID4gKyAgICAgICAgICAgICAgIGlmIChpcGlfZGV2ICYmIGlwaV9kZXYtPmlwaV9jbGVh
cikKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlwaV9kZXYtPmlwaV9jbGVhcigpOwo+ID4g
KyAgICAgICB9Cj4gPgo+ID4gICAgICAgICAvKgo+ID4gICAgICAgICAgKiBFbnN1cmUgdGhhdCBt
ZW1vcnkgb3IgTU1JTyB3cml0ZXMgYWZ0ZXIgdGhpcwo+ID4gQEAgLTMwNywxMCArMzE3LDEyIEBA
IGNvbnN0IHN0cnVjdCBzYmlfaXBpX2RldmljZSAqc2JpX2lwaV9nZXRfZGV2aWNlKHZvaWQpCj4g
Pgo+ID4gIHZvaWQgc2JpX2lwaV9zZXRfZGV2aWNlKGNvbnN0IHN0cnVjdCBzYmlfaXBpX2Rldmlj
ZSAqZGV2KQo+ID4gIHsKPiA+IC0gICAgICAgaWYgKCFkZXYgfHwgaXBpX2RldikKPiA+ICsgICAg
ICAgaWYgKCFkZXYgfHwgaXBpX2Rldl9jb3VudCA+PSBTQklfSVBJX0RFVklDRV9NQVgpCj4gPiAg
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgICBpcGlfZGV2X2FycmF5W2lwaV9kZXZf
Y291bnQrK10gPSBkZXY7Cj4gPgo+ID4gLSAgICAgICBpcGlfZGV2ID0gZGV2Owo+ID4gKyAgICAg
ICBpZiAoIWlwaV9kZXYgfHwgaXBpX2Rldi0+cmF0aW5nIDwgZGV2LT5yYXRpbmcpCj4gPiArICAg
ICAgICAgICAgICAgaXBpX2RldiA9IGRldjsKPiA+ICB9Cj4gPgo+ID4gIGludCBzYmlfaXBpX2lu
aXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCBib29sIGNvbGRfYm9vdCkKPiA+IEBAIC0z
NDcsNyArMzU5LDcgQEAgaW50IHNiaV9pcGlfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0
Y2gsIGJvb2wgY29sZF9ib290KQo+ID4gICAgICAgICBpcGlfZGF0YS0+aXBpX3R5cGUgPSAweDAw
Owo+ID4KPiA+ICAgICAgICAgLyogQ2xlYXIgYW55IHBlbmRpbmcgSVBJcyBmb3IgdGhlIGN1cnJl
bnQgaGFydCAqLwo+ID4gLSAgICAgICBzYmlfaXBpX3Jhd19jbGVhcigpOwo+ID4gKyAgICAgICBz
YmlfaXBpX3Jhd19jbGVhcih0cnVlKTsKPiBDYW4gd2UgcHV0IGl0IHRvIHRoZSBjb2xkIGJvb3Qg
cGF0aCBzaW5jZSB0aGUgaW5pdF93YXJtYm9vdCgpIGFscmVhZHkKPiBjbGVhcmVkIHRoZSBJUEk/
CgpJIHRoaW5rIHlvdSBhcmUgcG9pbnRpbmcgYXQgdGhlIHNiaV9pcGlfcmF3X2NsZWFyKCkganVz
dCBiZWZvcmUKaW5pdF93YXJtYm9vdCgpIGluIHNiaV9pbml0LmMuCgpMZXQgbWUgcmVjYWxsIHdo
eSBpdCB3YXMgYWRkZWQgdGhlcmUuIEFueXdheSBpdCdzIGEgc2VwYXJhdGUKY2hhbmdlIHNvIHNo
b3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
