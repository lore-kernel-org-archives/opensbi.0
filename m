Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C38E9DE5E
	for <opensbi@archiver.kernel.org>; Thu,  9 Apr 2026 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPVM9EvBjNIzCuh/Olf7yDIL74Kt9eNu9WeMTwPPeRQ=; b=C48wJ3tHE2Jv1s
	3rqILoiPVazMAYScSczwNtmvHeJ5kkgF25Ccq/Z+yG0AlcDncwmeVR2MDssMDoTJKds1pqznkzPao
	qZGVN6rlEWsjhng9Yg3ofg36J/8oT51Qeq6LJtXG6mju5gQ9ilGB0qYW4J0yOrV155BHx6upZVMo4
	MK9/x+JXqPqFd5jycvottQilTXnWVQ4+Vw2l7inGWCCB7k2uOhq1f/AxRYtF7yuNVZ2HRnfKCbAmY
	DrpgGNieHh4v6op6cqqVIylG2V1fxtRnnglGI1rFXQj470mR4AdzB5opC78KWK5waiCBEFzruZJ/A
	TJvanoFXNuBZqeMDYnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkAx-00000009sjf-100r;
	Thu, 09 Apr 2026 07:51:43 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkAu-00000009sj9-0ioo
	for opensbi@lists.infradead.org;
	Thu, 09 Apr 2026 07:51:41 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7dbccf6a23dso600444a34.2
        for <opensbi@lists.infradead.org>; Thu, 09 Apr 2026 00:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775721099; cv=none;
        d=google.com; s=arc-20240605;
        b=O+7S4/0AhreBIu/i+csGs75D8VP53utJSIatu3BnZE3vhIiuJ5Jj7PomNIMy16RqcL
         qNgpSofP61WPbrrU/MD1+bzSR25C0trUewqUbU1PIsIwK3IXt7Cu3KJic47zJKhkuQ7X
         AZur75vv/YTSnMJJZsBiIL0f/b4SHvGIo1OBpI+RxxdRYS/lpaRYBcmAFIvjkLBQPfwU
         JIZaLcldazC+1laA6/KkG2GXOoNv+3ObnpiGK69YvO59cynaIZj8eoia06K0qgftsQRi
         D5oQqj/PM1cmJZwTT8IRrV2oJ+Tw89Rme9C2qiRiJsWACpJOuDtfDOam6GeDyDaWF+KW
         whwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7d37/UmIWAWF9COsIEIOms95gMVixHgSXqrEenVQjK0=;
        fh=cmXEMq8ZrulEnk+8ca5l/gFL3IbCu5TAikrGskjbfKI=;
        b=IOdGfCQm2gWxwUIMqtaejEdu7kIVjgWcM4+bZ4xgnZseNa17YjO2XSTBramLPgLuqc
         vVGIHOrSOKVPBkU7tQWjByrCxFAka0ml0yFsO7wY1jV8sM6mf1QJBB4/hIuCKcYQQiwD
         PRuFSjXr3l99Hco2Cs/0l8RVFrqfYJDsPhYeMEqj9Weoj/Xt3RH2COqtBCvD8ym2ic4e
         s3eRWP2AWpYSw7jRpA4miUxgIhLxv1X3h4vXUUep7+iuv/9Wzo57sbHgGim/LOshYeQQ
         uTKQ6O7qwLE+/pQzUyXbXdr5eAsxjgqRoMF/0FIrJtEFFg/bGyRViPy6+UgWR3KIBPHt
         Ldnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775721099; x=1776325899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d37/UmIWAWF9COsIEIOms95gMVixHgSXqrEenVQjK0=;
        b=DaCNzJav0e+eepgC9xQIotaBVGROCdfBmvdmXz8TNs/k3NqsnGJew+JbamQ5q84FmS
         abStf0bSyKev+0kGgr46dBaBZA9LV11VfthM1MiRM6uOINC+YlXRntRLSUmMxGu8F7d7
         i0HFlWn2JvDcbXiAvwVA6Sqs77CqTZ6cNfiJVZMTmzNs6HSTfPKM2T4jc9+IP1KF3cNH
         Kf4W73eKDf+u+2ZFwm8lN+Kc9BlCfdJ7xLVEdqOkjCRYpmAzRyKP78oA79iMiXWqTIfk
         IpY8YLL2tQW/TWvLHpANl+M7u+HRgbaLGG6V/6nk5CoppdZn6k8Iuo0ZwQKkW7N9WJ3V
         TomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721099; x=1776325899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7d37/UmIWAWF9COsIEIOms95gMVixHgSXqrEenVQjK0=;
        b=nyv/I2yr5myFPyH1piKfYc9b7TqS/a1KTm7jmdEdrWSlUXIsgz3pNcgzsqAQtoEy/o
         WJYZiKfzbfhMkrWYzkjTdyQiMSSEsy8T5kEOJSSSUjRQ0uTAZSQPHkVdO7dEbue1Ax5E
         bvTlMK440vx4fOrBemJT97x/64KtgnCPetcfsNi8FoXWAFrESGJjepiHSnhKBVHCCMhT
         CEYPYAwnOcuaJ6007GKxkHhb7qcvStjdooh7VcgjRa9+w/oemI/Vmd5Sp2gUwR9Q4j9G
         4mLiRFchH6AOrFmVl14MVAWTemb2c4HVXBYFGh0votMvASWbmrhrTfIjXGC2ll6UraRp
         X08Q==
X-Gm-Message-State: AOJu0YzfM5+GJbJZPDuYc6Ay9TVoqLT0Tj0FApXrb7FawNkA9gyCMfxf
	h76aChLn1yWY1Tw9oaIxVzV8MXEvOC45GxBsjaAs6dXtClpTSzLR42idynScHWqIG+B8vIvNRr2
	rkJoQdH/MhTaQW/5nckjG7iu8gQHFiJdfIRQvl+F4pA==
X-Gm-Gg: AeBDies86aPzfVFkORVe3zeOZwAJ7Iag40NNi5VI5kURPgP/1HFFJ6BgkA07NAt+x89
	rnGUbKlASi+7VuRy2KY6BOj87Q8iC5m1oWXQELD/+CHT2B6KMmAYXNJb/osht+QZgvhMetVrWlS
	EnBQigm+llMd1loe6UNXZDhbRtSD0fi77QxH9lfBkW4fjhhwwFwSziEQLFgOlm74rgkU6O0nGHl
	DSAHvQm03/ilfG9P/hVOzq0JrlzxcM0/Ntb00PoKRkytTGA7QqTjkhX4oYj3BIBXVQm68rPa8jz
	AC6zshXx/RQXX8KkXUGKoxMG4ZjjChtYiV/bafRPYeZY4fpi1FvHaAJet0YiNcu4FGCuUCAKpmL
	zB1p2B/xhbrkaaoyCFDZEGY373Q==
X-Received: by 2002:a05:6820:81c4:b0:67e:160c:36ba with SMTP id
 006d021491bc7-6822024eb9cmr14429543eaf.48.1775721098977; Thu, 09 Apr 2026
 00:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com> <20260310183155.2186463-3-evvoevod@oss.tenstorrent.com>
In-Reply-To: <20260310183155.2186463-3-evvoevod@oss.tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Apr 2026 13:21:27 +0530
X-Gm-Features: AQROBzDbxvnyJhS3Zkip47BbmwTkMWk8fmQzK7HgmkYO7UUP6taf0iaqKLWBMsg
Message-ID: <CAAhSdy34wnZnuk6seThkmKM+YTKP2E159LYuNqkAaThZYiOXtw@mail.gmail.com>
Subject: Re: [PATCH 2/7] lib: sbi: Add Smrnmi extension macros for registers
 and bits
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, evvoevod@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_005140_234059_1616A115 
X-CRM114-Status: GOOD (  15.63  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgMTI6MDPigK9BTSBFdmdlbnkgVm9ldm9kaW4KPGV2dm9l
dm9kQHRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBFdmdlbnkgVm9ldm9kaW4gPGV2
dm9ldm9kQHRlbnN0b3JyZW50LmNvbT4KPgo+IEFkZCBDU1IgZGVmaW5pdGlvbnMgKE1OU0NSQVRD
SCwgTU5TVEFUVVMsIE1ORVBDLCBNTkNBVVNFKSBhbmQgYml0IGRlZmluaXRpb25zCj4gKE1OU1RB
VFVTX05NSUUsIE1OU1RBVFVTX01OUFYsIE1OU1RBVFVTX01OUFApLiBBbHNvIGFkZCBTQklfSEFS
VF9FWFRfU01STk1JIHRvCj4gdGhlIGhhcnQgZXh0ZW5zaW9uIGVudW1lcmF0aW9uLgo+Cj4gU2ln
bmVkLW9mZi1ieTogRXZnZW55IFZvZXZvZGluIDxldnZvZXZvZEB0ZW5zdG9ycmVudC5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdh
cmRzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oIHwgMTAgKysr
KysrKysrKwo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oICAgICAgIHwgIDIgKysKPiAgbGliL3Ni
aS9zYmlfaGFydC5jICAgICAgICAgICB8ICAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCBi
L2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiBpbmRleCAzYzFkNTI1Ni4uMThmN2I0YTcg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+ICsrKyBiL2luY2x1
ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiBAQCAtMjE1LDYgKzIxNSwxMCBAQAo+Cj4gICNlbmRp
Zgo+Cj4gKyNkZWZpbmUgTU5TVEFUVVNfTk1JRSAgICAgICAgICAgICAgICAgIChfVUwoMHg4KSkK
PiArI2RlZmluZSBNTlNUQVRVU19NTlBWICAgICAgICAgICAgICAgICAgKF9VTCgweDgwKSkKPiAr
I2RlZmluZSBNTlNUQVRVU19NTlBQICAgICAgICAgICAgICAgICAgKF9VTCgweDE4MDApKQo+ICsK
PiAgI2RlZmluZSBNSFBNRVZFTlRfU1NDT0ZfTUFTSyAgICAgICAgICAgX1VMTCgweEZGMDAwMDAw
MDAwMDAwMDApCj4KPiAgI2RlZmluZSBFTlZDRkdfU1RDRSAgICAgICAgICAgICAgICAgICAgKF9V
TEwoMSkgPDwgNjMpCj4gQEAgLTgzMCw2ICs4MzQsMTIgQEAKPiAgI2RlZmluZSBDU1JfQ1VTVE9N
MTBfTV9ST19CQVNFICAgICAgICAgMHhGQzAKPiAgI2RlZmluZSBDU1JfQ1VTVE9NMTBfTV9ST19D
T1VOVCAgICAgICAgICAgICAgICAweDA0MAo+Cj4gKy8qIFNtcm5taSBleHRlbnNpb24gcmVnaXN0
ZXJzICovCj4gKyNkZWZpbmUgQ1NSX01OU0NSQVRDSCAgICAgICAgICAgICAgICAgICAgICAgICAg
MHg3NDAKPiArI2RlZmluZSBDU1JfTU5FUEMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4NzQxCj4gKyNkZWZpbmUgQ1NSX01OQ0FVU0UgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAweDc0Mgo+ICsjZGVmaW5lIENTUl9NTlNUQVRVUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDB4NzQ0Cj4gKwo+ICAvKiA9PT09PSBUcmFwL0V4Y2VwdGlvbiBDYXVzZXMg
PT09PT0gKi8KPgo+ICAjZGVmaW5lIENBVVNFX01JU0FMSUdORURfRkVUQ0ggICAgICAgICAweDAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9o
YXJ0LmgKPiBpbmRleCBhNzg4YjM0Yy4uOTM3Y2RmMjkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9z
Ymkvc2JpX2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBAQCAtODcsNiAr
ODcsOCBAQCBlbnVtIHNiaV9oYXJ0X2V4dGVuc2lvbnMgewo+ICAgICAgICAgU0JJX0hBUlRfRVhU
X1hTSUZJVkVfQ0ZMVVNIX0RfTDEsCj4gICAgICAgICAvKiogSGFydCBoYXMgWHNmY2Vhc2UgZXh0
ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfWFNJRklWRV9DRUFTRSwKPiArICAgICAg
IC8qKiBIYXJ0IGhhcyBTbXJubWkgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRf
U01STk1JLAo+Cj4gICAgICAgICAvKiogTWF4aW11bSBpbmRleCBvZiBIYXJ0IGV4dGVuc2lvbiAq
Lwo+ICAgICAgICAgU0JJX0hBUlRfRVhUX01BWCwKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
aGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggOTllMTM5OTAuLjRhZWZiNzU5IDEw
MDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQu
Ywo+IEBAIC0zOTYsNiArMzk2LDcgQEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNi
aV9oYXJ0X2V4dFtdID0gewo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzc3N0YXRlZW4s
IFNCSV9IQVJUX0VYVF9TU1NUQVRFRU4pLAo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQSh4
c2ZjZmx1c2hkbG9uZSwgU0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0ZMVVNIX0RfTDEpLAo+ICAgICAg
ICAgX19TQklfSEFSVF9FWFRfREFUQSh4c2ZjZWFzZSwgU0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0VB
U0UpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbXJubWksIFNCSV9IQVJUX0VYVF9T
TVJOTUkpLAo+ICB9Owo+Cj4gIF9TdGF0aWNfYXNzZXJ0KFNCSV9IQVJUX0VYVF9NQVggPT0gYXJy
YXlfc2l6ZShzYmlfaGFydF9leHQpLAo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
