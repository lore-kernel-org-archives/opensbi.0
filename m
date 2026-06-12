Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E7FCD98CE
	for <opensbi@archiver.kernel.org>; Fri, 12 Jun 2026 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AZAxkckvrWFfLj4F71wyxKPBZ5mekcEeUq2mtxgbgg=; b=EYI6CZ13AlvbgJ
	V7GF8OnqBDlML+F1ARNVXVSICywQp+cg367cYJlTZUxFhRzwHZRRt7bb00jwFMe3JawvO+nIyz1A6
	ihygMmPPcL4JKlHfxloeWG1MrkHtKoGwZKeWcx7S2ZoxoNBqkR0hRwooyzIT5JqSq5LISBVDWgTRU
	d2Bac9h7/DWSw8Zu88CfDfMB90zIinmiNHl1ZvTelW3FbevdClxHOSkVGO8drpTfKeiU4xqs0cPiU
	fzWxzsiKX2ejqqGdaq6zoTTRdhZp9a9JlqjPQjpq84Jee6BICtS8IyDXLcmpinhm+uz3trNsYwI8G
	wt+030UewMKAkOnTf8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY13h-0000000Arug-2e1V;
	Fri, 12 Jun 2026 12:32:25 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY13f-0000000AruF-1Ywz
	for opensbi@lists.infradead.org;
	Fri, 12 Jun 2026 12:32:24 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e6db226e1fso673118a34.0
        for <opensbi@lists.infradead.org>; Fri, 12 Jun 2026 05:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781267542; cv=none;
        d=google.com; s=arc-20240605;
        b=jNgYtNSct3P36IFXNcHpuVuAOgZZAp8o33hq7NPpBWk+YaHZaJdZuHkgT5SAxyo7/N
         7j4VzNJMgqtYpeZJkm5nTkPxo+hofLQikkocEeNHozRPyX8WmmYMsLKkMa7PNKjFXvpf
         0/1amhKmpm3xXnoNRVsfwvlIQbYt5vmFxlKIsGvlWOKhYeq8vE3h0xQFSjHHp0KShQOl
         /NF+YqawX3Ov8yS4RkhRCRC4DNOzcVeCqVkhODDAf9dwGeAMiNSOMF83Sw5rc03ukRey
         BIDrf8SjqQOXJAfBpSQxb21lR+lG+SMaLE3pDCBuvhjf4pqEHQ7IFYVN70i8U20g+cyR
         Dmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8PZFXK27PHDSnQ62Wr9qWDnEVkjLJNpeCituG56A1S8=;
        fh=WQXVBDxgG5t+yTmfW1GXeacTHZzu4cYUnJAKHD2JhXQ=;
        b=k0smkxDdvkRLFSHPqFyJVCQsXM94absGYfyBXUoOHVHawFOqxv50gpHibDZz+/ahi2
         0d7jbTwyxOTdw6SJj7Z+EjuH5Wk+TYtZdhR2cVq0ZZT/TGzf4Faxe/eBp+BlzVHdK/+q
         YERt5ZzI+nPc5usXYjlY3JPD1WM5qfT6Ho6l/go+mlNFRGugrKtOXY2c7zFPf0dmphlA
         qOkU4CFVC7g5tOqa9/jCTP0L/B40a/DBAZBiVtzDgIXRM65HHgvDxk9g9ej9LIgSYBic
         ji+viR2MabkKGjbfpIl81pYSEQWgIcuEIEDkp3rAVZmcTiLykbneF972Jr8xKILeYEvw
         rBoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781267542; x=1781872342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PZFXK27PHDSnQ62Wr9qWDnEVkjLJNpeCituG56A1S8=;
        b=acnbNaScHJOlIyHFBGWm9XyzjpVvgRNpmd/rbpF+So1htOu19QzwEnJyxG3KJi8V+T
         mPEu/nMzoDFL33FJ6f/Xse5gUVe3k96Vi/Pi16MkzMzSWYHfwb4ZiBi0KmT532Hf3gS1
         EVtUF9HaJUs4F0mZ6smz+jlg+VRLNWEDYtky5uF6A7SqXfJKO5Ao3RqmO2eWODqqMRb/
         Zp9mB2Whd88QvXsBj6cR9H5kfUdFhU/3xfS9JBb9PFcdE+EAMSMF48eFjM2BQW1ivMu+
         gYB3HAn69qlZxuNx3srpYCKn5j6bbT7o0q77AgTgtls2ZsRVYeD3LpjFSsH6kY7iEUeg
         MI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781267542; x=1781872342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8PZFXK27PHDSnQ62Wr9qWDnEVkjLJNpeCituG56A1S8=;
        b=Vkc1DD2DlPyrz91PedMRjLXTvzZDV5UEEJ4z33fH5YqPiHV+UkJ4PjrUkaqUw+7jd2
         XHGYhxV7hXObZVbLzmojQ3yOIjkzAcLctOMFDST4a4uCZq9GiQ4PZ7uUJAcuBrS51YUl
         S2LlvCctvtpCz2JjmfEXfXM7j4WDaZvHsIEv43quFG7lLY9TALUMdLAHr1D7LcZbuQI4
         m/M77LVGUqNVRMGuUyZ1XYh8SHCNiUA+WOenjbk2pZLq+hUAnNaxNtNakm/zKzd+fK+9
         TLjeG939MvQK6zSQQwGfkmR2G49nOJA3dY4VShUcdSExaAyjvqz0uIkFl1FaHizs85BA
         9C0g==
X-Forwarded-Encrypted: i=1; AFNElJ94dmVFmQLr/HhkHZ5H/byonDACjKXoQFNq7NVKBlI4U/PIRt8U2plLrgh2X+7NPsau68VMY/m1@lists.infradead.org
X-Gm-Message-State: AOJu0YyHK+Pw5+MgHXEvw5j0F+Xz0vGkEmHIZSAHsOwjtW0vnFT7liMK
	TcIO50ioHtTx9Lb2NPot7aQk25ZFKjiAxat171m7mOi+Cz48ssQonSR9qf0bJunB+npn1QWS6j4
	Fk6a4gyYcIIT+U+ZqWRtfoSC4YDW/pA2UpiSsyAqv0A==
X-Gm-Gg: Acq92OE0fvFfMR34EvJnIfLSmERpiBqfDhuBd7dTQ8mEu34l5gbkGRDjlL9hTQPbXCc
	AgAAKK8O2HLDoSvO4vVnwBdp6Opv0a6QIZk+NLFpDuyiK3naN2wr2ExDsRoXZXyJH16y2HpkQ1Y
	9sR993ouGrdwySlFLnKcPY/1/jRjOqsfe9KUXiaHpqbZleQpSsHfBsdZ6rwRJcIDPQevduOYPoJ
	OXX6maHF3B5GCXAUC8ErYlJq9EdeVGCO+K5U3vueZLqajuWOocHFjuJ3mj8tfoxxwWI3BmDJR/K
	PbXI5BKssOuzLPHxk5jehndRlkN1kRH0KTT+NU/yPcrBdjJQ70IMjYxwOZy5vT9UXCxZuFGBQjt
	vt+23BBXANF8nLAopdzYcaNJ5pnE=
X-Received: by 2002:a05:6820:1348:b0:69e:3dde:8695 with SMTP id
 006d021491bc7-69edc7b1aebmr1712632eaf.54.1781267542025; Fri, 12 Jun 2026
 05:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260612062218.172726-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260612062218.172726-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Jun 2026 18:02:07 +0530
X-Gm-Features: AVVi8Cdo7tN0xIYWlg3rnYm3WW5AQt28wQ0DXMqtm_6wSRN8xl8vzqLaovqlQGc
Message-ID: <CAAhSdy3KgR1CbY0+PbCKq2jEyjkakZD2tqb3inL52BgE-hRBjg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Fix LLVM compile error observed in sbi_mpxy.c
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_053223_596864_4BB0151E 
X-CRM114-Status: GOOD (  15.32  )
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

T24gRnJpLCBKdW4gMTIsIDIwMjYgYXQgMTE6NTLigK9BTSBBbnVwIFBhdGVsIDxhbnVwLnBhdGVs
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVGhlIGZvbGxvd2luZyBMTFZNIGNvbXBpbGUg
ZXJyb3IgaXMgb2JzZXJ2ZWQgaW4gc2JpX21weHkuYzoKPgo+ICBDQyAgICAgICAgbGliL3NiaS9z
YmlfbXB4eS5vCj4gbGliL3NiaS9zYmlfbXB4eS5jOjUzNTozNjogZXJyb3I6IHJlc3VsdCBvZiBj
b21wYXJpc29uIG9mIGNvbnN0YW50IDE4NDQ2NzQ0MDczNzA5NTUxNjE1IHdpdGgKPiAgICAgICBl
eHByZXNzaW9uIG9mIHR5cGUgJ3UzMicgKGFrYSAndW5zaWduZWQgaW50JykgaXMgYWx3YXlzIGZh
bHNlIFstV2Vycm9yLC1XdGF1dG9sb2dpY2FsLWNvbnN0YW50LW91dC1vZi1yYW5nZS1jb21wYXJl
XQo+ICAgNTM1IHwgICAgICAgICAgICAgICAgICAgICAoYXR0cnMtPm1zaV9pbmZvLm1zaV9hZGRy
X2hpID09IElOVkFMSURfQUREUikpCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICB+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4gXiAgfn5+fn5+fn5+fn5+Cj4gbGliL3NiaS9zYmlfbXB4
eS5jOjUzNDozNjogZXJyb3I6IHJlc3VsdCBvZiBjb21wYXJpc29uIG9mIGNvbnN0YW50IDE4NDQ2
NzQ0MDczNzA5NTUxNjE1IHdpdGgKPiAgICAgICBleHByZXNzaW9uIG9mIHR5cGUgJ3UzMicgKGFr
YSAndW5zaWduZWQgaW50JykgaXMgYWx3YXlzIGZhbHNlIFstV2Vycm9yLC1XdGF1dG9sb2dpY2Fs
LWNvbnN0YW50LW91dC1vZi1yYW5nZS1jb21wYXJlXQo+ICAgNTM0IHwgICAgICAgICAgICAgICAg
ICAgICAoYXR0cnMtPm1zaV9pbmZvLm1zaV9hZGRyX2xvID09IElOVkFMSURfQUREUikgJiYKPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fiBe
ICB+fn5+fn5+fn5+fn4KPiAyIGVycm9ycyBnZW5lcmF0ZWQuCj4KPiBUbyBhZGRyZXNzIHRoZSBh
Ym92ZSBpc3N1ZSwgYWRkIHUzMiB0eXBlY2FzdCB0byBJTlZBTElEX0FERFIuCj4KPiBGaXhlczog
ZTkyYzhmZDA4MzZlICgic2JpOiBtcHh5OiBkZWZpbmUgSU5WQUxJRF9BRERSIHVzaW5nIHVuc2ln
bmVkIGxvbmcgd2lkdGgiKQo+IEZpeGVzOiA3OTM5YmYxMzI5ZWIgKCJsaWI6IHNiaTogQWRkIFNC
SSBNZXNzYWdlIFByb3h5IChNUFhZKSBmcmFtZXdvcmsiKQo+IFNpZ25lZC1vZmYtYnk6IEFudXAg
UGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KClRoaXMgaXMgYSBjcnVjaWFsIGZp
eCBoZW5jZSBtZXJnaW5nIGl0IGltbWVkaWF0ZWx5LgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRo
ZSByaXNjdi9vcGVuc2JpciByZXBvLgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgbGliL3NiaS9z
YmlfbXB4eS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfbXB4eS5jIGIvbGliL3Ni
aS9zYmlfbXB4eS5jCj4gaW5kZXggM2UwZTBhZjYuLmZmNWM2YWI2IDEwMDY0NAo+IC0tLSBhL2xp
Yi9zYmkvc2JpX21weHkuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX21weHkuYwo+IEBAIC01MzEsOCAr
NTMxLDggQEAgc3RhdGljIGludCBtcHh5X2NoZWNrX3dyaXRlX3N0ZF9hdHRyKHN0cnVjdCBzYmlf
bXB4eV9jaGFubmVsICpjaGFubmVsLAo+ICAgICAgICAgICAgICAgICBpZiAoYXR0cl92YWwgPiAx
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsK
PiAgICAgICAgICAgICAgICAgaWYgKGF0dHJfdmFsID09IDEgJiYKPiAtICAgICAgICAgICAgICAg
ICAgIChhdHRycy0+bXNpX2luZm8ubXNpX2FkZHJfbG8gPT0gSU5WQUxJRF9BRERSKSAmJgo+IC0g
ICAgICAgICAgICAgICAgICAgKGF0dHJzLT5tc2lfaW5mby5tc2lfYWRkcl9oaSA9PSBJTlZBTElE
X0FERFIpKQo+ICsgICAgICAgICAgICAgICAgICAgKGF0dHJzLT5tc2lfaW5mby5tc2lfYWRkcl9s
byA9PSAodTMyKUlOVkFMSURfQUREUikgJiYKPiArICAgICAgICAgICAgICAgICAgIChhdHRycy0+
bXNpX2luZm8ubXNpX2FkZHJfaGkgPT0gKHUzMilJTlZBTElEX0FERFIpKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldCA9IFNCSV9FUlJfREVOSUVEOwo+ICAgICAgICAgICAgICAgICBicmVh
azsKPiAgICAgICAgIGNhc2UgU0JJX01QWFlfQVRUUl9NU0lfQUREUl9MTzoKPiAtLQo+IDIuNDMu
MAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
