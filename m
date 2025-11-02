Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F65CCFA02
	for <opensbi@archiver.kernel.org>; Sun,  2 Nov 2025 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjDAQ9Ie2yV6WD/6EGO+joXMaXAbjojFLhOW/DWW/GI=; b=hvX70MX/CLeNdh
	ulyqjV9aiI6hbJt7sx2Wu5bJnDEAnYUs2bl+T+EZtqlcVajLfN8Szqs8VYiN3eAYLBXTFAzMGPFfT
	LUUy89H6uSAPvQ3fbWi9/fs7H1FRyyvqqTg3IXGHT3cSBx4354o5Au8nkx/XItIFu0Hdk14xAUqHL
	IPgbWynrkfIe0sY6OXhfsi0zfMJNGlxWhhH+EG/2ioPCOp4FHoKaAlMTKKyvXM7abYBSejTnv5eo/
	9K/hq654A5TwoKact3HL5WTET0Y2fPWconw7DKVSgo3bJt16FGA0kN/3A7wsNBDB/kE3J7E+7XHDM
	RAfJpoBlfNO2GV1KTuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFWGi-00000008Vcj-1BLf;
	Sun, 02 Nov 2025 11:29:08 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFWGe-00000008VcI-2sEm
	for opensbi@lists.infradead.org;
	Sun, 02 Nov 2025 11:29:06 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-940d25b807bso141377239f.1
        for <opensbi@lists.infradead.org>; Sun, 02 Nov 2025 03:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762082943; x=1762687743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYq5b2IXQZ/gpQqFAUaigkoH4nmGfZ4iaUFbLla1N2Q=;
        b=AdkiLc0FW54IYuTIwWBDRCT5/Cj+kOv+pdbZ3ADT7ROpupPzuaYEUMdozgWTzvW3ts
         tEsonBliPDofQoEY24aycZBl9z+pwEmbYzTHsC+viljtGbCbDXSysQCwrvV+a7myltpz
         zVKzN1wzYw7tKwlTOPjV4+5kYwyO9xHUVmhveSRxZPA4N5u9MBl0ETm2W94gjBlG9gid
         czrVbZP9XiWKoCt5MaYSF/zC9nJJ1XZghWWppsg+1aCWvQDXjDD98Y15E85qrjRVnEeI
         T3sDH5IW0TiujZS566E7c2bM1GyaH7tJgWdHBdc0I6og4+67gk3/aoWUKZ8V6lBH9zGU
         /7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762082943; x=1762687743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYq5b2IXQZ/gpQqFAUaigkoH4nmGfZ4iaUFbLla1N2Q=;
        b=b0GEMgPj1zqtIqfBifINK/25iMlQirC/HEf2DhLJMhjE5dAHStik0X8hyC3XSlOiLz
         3n8OTkm0mnwXqOm+lbt7h9dG4ocDjNUuB+pxm1E6Lmx4BLd0DKEQ71GR1qKnfDPtK1xt
         Jeu3N8enKPW1HxJe/iuLkjWoiaGfB0T+liYhwkhHN0qrRbLrouO+L034XIa06BJWvQoX
         kGOddzXMPXSverOfRGvXCpsG3fbAPcFkbwytIIuLhL40p8j2UKlqSZtHJ+tQgmskoVFV
         EmIWNf4saJp+jBypCTZk/wqzM4gyswjjWyH1KPEgsMNpO6mFGavn1tJA3yIpQgbkfYDj
         yBJg==
X-Gm-Message-State: AOJu0Yw/6MBIhdOjPWIU6If2ZsM2fpO6XtUu2Fv6mMW5ExZll236739D
	9pruXjLFSlUZdHdvmcB93PWakqsy1GpJd6D3f/G/a+BARAsivgW/k4JUu14QIEZnitQhPqnAlPs
	chik9eNuIh7t4W75H6gxmgr8kUtMSFFIiIRnm5656eQ==
X-Gm-Gg: ASbGncvS86we825UGKL4ZmI9nWsStdCW8oR8AFmrjm27D2+6qLyrTUr3VpvRXhNBU/j
	lzxgrbLdYj2x/82SsaqniVJEAuB1zTPqtcVFwiPGQ3pw4qXfL16gp+pRPmPDvZ0K1EX4WUmkfuk
	UQN6f7XMUIQuPlSTB1b+SQxVoWRDik7ro26Zm4qisLlTKOopsuZKq7u7FT/93f8H8bJuFzRBztX
	ohpGseU+M+a4mFgtmMTdDttmyAABJVg0DY5pa6NqkMtB4OoeUkUW8rFG4Vjh5A//JR6XZBVgtTB
	vFPOWoIWR4H3fFc/
X-Google-Smtp-Source: AGHT+IHCaM3I0OqOxAqheJ5J5duYblY2PcGRRKit2cUuoXVq/tArc8WCnKrOGxOywp5d/93Y0wLLZ4hgFlayfDG/g0g=
X-Received: by 2002:a05:6e02:1c25:b0:430:be92:b60d with SMTP id
 e9e14a558f8ab-4330d1c8e78mr130469635ab.26.1762082943524; Sun, 02 Nov 2025
 03:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20251008084444.3525615-1-peter.lin@sifive.com> <20251008084444.3525615-8-peter.lin@sifive.com>
In-Reply-To: <20251008084444.3525615-8-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Nov 2025 16:58:51 +0530
X-Gm-Features: AWmQ_blvdzSsMDcrnyI0yg2DRFMITo0fTeTU-4v6Xi44K8ynkKmJTi-cUxYByMY
Message-ID: <CAAhSdy2Jd996FifxcNqyM=fzDtsh43zfP2zZvaex3hzvWDKjrw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] lib: sbi: sbi_hart: track firmware PMP entries
 when configuring SmePMP
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	wxjstz@126.com, alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_032904_992081_231BF926 
X-CRM114-Status: GOOD (  20.61  )
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

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjE14oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBBZGQgZndfc21lcG1wX2lkcyBiaXRtYXAgdG8g
dHJhY2sgUE1QIGVudHJpZXMgdGhhdCBwcm90ZWN0IGZpcm13YXJlCj4gcmVnaW9ucy4gQWxsb3cg
dXMgdG8gcHJlc2VydmUgdGhlc2UgY3JpdGljYWwgZW50cmllcyBhY3Jvc3MgZG9tYWluCj4gdHJh
bnNpdGlvbnMgYW5kIGNoZWNrIGluY29uc2lzdGVudCBmaXJtd2FyZSBlbnRyeSBhbGxvY2F0aW9u
Lgo+Cj4gQWxzbyBhZGQgc2JpX2hhcnRfcG1wX2lzX2Z3X3JlZ2lvbigpIGhlbHBlciBmdW5jdGlv
biB0byBxdWVyeQoKcy9zYmlfaGFydF9wbXBfaXNfZndfcmVnaW9uL3NiaV9oYXJ0X3NtZXBtcF9p
c19md19yZWdpb24vCgo+IHdoZXRoZXIgYSBnaXZlbiBQTVAgZW50cnkgcHJvdGVjdHMgZmlybXdh
cmUgcmVnaW9ucy4KCnMvUE1QL1NtZVBNUC8KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQ
ZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlf
aGFydC5oIHwgIDEgKwo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgIHwgMzMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9z
YmlfaGFydC5oCj4gaW5kZXggODJiMTlkY2YuLjZkYjRmZWQ3IDEwMDY0NAo+IC0tLSBhL2luY2x1
ZGUvc2JpL3NiaV9oYXJ0LmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gQEAgLTE0
Miw2ICsxNDIsNyBAQCB1bnNpZ25lZCBpbnQgc2JpX2hhcnRfcG1wX2NvdW50KHN0cnVjdCBzYmlf
c2NyYXRjaCAqc2NyYXRjaCk7Cj4gIHVuc2lnbmVkIGludCBzYmlfaGFydF9wbXBfbG9nMmdyYW4o
c3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKTsKPiAgdW5zaWduZWQgaW50IHNiaV9oYXJ0X3Bt
cF9hZGRyYml0cyhzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpOwo+ICB1bnNpZ25lZCBpbnQg
c2JpX2hhcnRfbWhwbV9iaXRzKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCk7Cj4gK2Jvb2wg
c2JpX2hhcnRfc21lcG1wX2lzX2Z3X3JlZ2lvbih1bnNpZ25lZCBpbnQgcG1wX2lkeCk7Cj4gIGlu
dCBzYmlfaGFydF9wbXBfY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCk7Cj4g
IGludCBzYmlfaGFydF9tYXBfc2FkZHIodW5zaWduZWQgbG9uZyBiYXNlLCB1bnNpZ25lZCBsb25n
IHNpemUpOwo+ICBpbnQgc2JpX2hhcnRfdW5tYXBfc2FkZHIodm9pZCk7Cj4gZGlmZiAtLWdpdCBh
L2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IDAzMmY3ZGMx
Li5hYmFiOGI3MyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9saWIv
c2JpL3NiaV9oYXJ0LmMKPiBAQCAtMzAsNiArMzAsOCBAQCBleHRlcm4gdm9pZCBfX3NiaV9leHBl
Y3RlZF90cmFwX2hleHQodm9pZCk7Cj4gIHZvaWQgKCpzYmlfaGFydF9leHBlY3RlZF90cmFwKSh2
b2lkKSA9ICZfX3NiaV9leHBlY3RlZF90cmFwOwo+Cj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIGhh
cnRfZmVhdHVyZXNfb2Zmc2V0Owo+ICtzdGF0aWMgREVDTEFSRV9CSVRNQVAoZndfc21lcG1wX2lk
cywgUE1QX0NPVU5UKTsKPiArc3RhdGljIGJvb2wgZndfc21lcG1wX2lkc19pbml0ZWQ7Cj4KPiAg
c3RhdGljIHZvaWQgbXN0YXR1c19pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAg
ewo+IEBAIC0zMDEsNiArMzAzLDE3IEBAIHVuc2lnbmVkIGludCBzYmlfaGFydF9taHBtX2JpdHMo
c3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgcmV0dXJuIGhmZWF0dXJlcy0+
bWhwbV9iaXRzOwo+ICB9Cj4KPiArYm9vbCBzYmlfaGFydF9zbWVwbXBfaXNfZndfcmVnaW9uKHVu
c2lnbmVkIGludCBwbXBfaWR4KQo+ICt7Cj4gKyAgICAgICBpZiAoIWZ3X3NtZXBtcF9pZHNfaW5p
dGVkKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBFUlI6IGZ3X3NtZXBtcF9p
ZHMgdW5pbml0aWFsaXplZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNf
Xyk7CgpUaGlzIHByaW50ZigpIGNhdXNlcyB1bm5lY2Vzc2FyeSBwcmludHMgb24gSFcgd2l0aCBs
ZWdhY3kgUE1QIHNvCm5lZWRzIHRvIGJlIHJlbW92ZWQuCgo+ICsgICAgICAgICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIGJpdG1hcF90ZXN0KGZ3
X3NtZXBtcF9pZHMsIHBtcF9pZHgpID8gdHJ1ZSA6IGZhbHNlOwo+ICt9Cj4gKwo+ICBzdGF0aWMg
dm9pZCBzYmlfaGFydF9zbWVwbXBfc2V0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdp
b24gKnJlZywKPiBAQCAtMzY3LDEyICszODAsMzIgQEAgc3RhdGljIGludCBzYmlfaGFydF9zbWVw
bXBfY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgICAgfQo+Cj4gKyAgICAgICAgICAg
ICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIFRyYWNrIGZpcm13YXJlIFBNUCBlbnRyaWVzIHRv
IHByZXNlcnZlIHRoZW0gZHVyaW5nCj4gKyAgICAgICAgICAgICAgICAqIGRvbWFpbiBzd2l0Y2hl
cy4gVW5kZXIgU21lUE1QLCBNLW1vZGUgcmVxdWlyZXMKPiArICAgICAgICAgICAgICAgICogZXhw
bGljaXQgUE1QIGVudHJpZXMgdG8gYWNjZXNzIGZpcm13YXJlIGNvZGUvZGF0YS4KPiArICAgICAg
ICAgICAgICAgICogVGhlc2UgZW50cmllcyBtdXN0IHJlbWFpbiBlbmFibGVkIGFjcm9zcyBkb21h
aW4KPiArICAgICAgICAgICAgICAgICogY29udGV4dCBzd2l0Y2hlcyB0byBwcmV2ZW50IE0tbW9k
ZSBhY2Nlc3MgZmF1bHRzLgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAg
aWYgKFNCSV9ET01BSU5fTUVNUkVHSU9OX0lTX0ZJUk1XQVJFKHJlZy0+ZmxhZ3MpKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKGZ3X3NtZXBtcF9pZHNfaW5pdGVkKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBDaGVjayBpbmNvbnNpc3RlbnQgZmlybXdhcmUg
cmVnaW9uICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXNiaV9oYXJ0
X3NtZXBtcF9pc19md19yZWdpb24ocG1wX2lkeCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiaXRtYXBfc2V0
KGZ3X3NtZXBtcF9pZHMsIHBtcF9pZHgsIDEpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0K
PiArICAgICAgICAgICAgICAgfQo+ICsKPiAgICAgICAgICAgICAgICAgcG1wX2ZsYWdzID0gc2Jp
X2RvbWFpbl9nZXRfc21lcG1wX2ZsYWdzKHJlZyk7Cj4KPiAgICAgICAgICAgICAgICAgc2JpX2hh
cnRfc21lcG1wX3NldChzY3JhdGNoLCBkb20sIHJlZywgcG1wX2lkeCsrLCBwbXBfZmxhZ3MsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG1wX2xvZzJncmFuLCBwbXBfYWRk
cl9tYXgpOwo+ICsKClJlZHVuZGFudCBuZXdsaW5lLgoKPiAgICAgICAgIH0KPgo+ICsgICAgICAg
Zndfc21lcG1wX2lkc19pbml0ZWQgPSB0cnVlOwo+ICsKPiAgICAgICAgIC8qIFNldCB0aGUgTU1M
IHRvIGVuZm9yY2UgbmV3IGVuY29kaW5nICovCj4gICAgICAgICBjc3Jfc2V0KENTUl9NU0VDQ0ZH
LCBNU0VDQ0ZHX01NTCk7Cj4KPiAtLQo+IDIuNDguMAo+CgpPdGhlcndpc2UsIGl0IGxvb2tzIGdv
b2QgdG8gbWUuIEkgd2lsbCB0YWtlIGNhcmUgb2YgdGhlIGFib3ZlCmNvbW1lbnRzIGF0IHRoZSB0
aW1lIG9mIG1lcmdpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
