Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3708C83F25
	for <opensbi@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVXEqzz8FqnEFrmfJpsk3CAIholb8y+O7EJLl9MIv9Y=; b=GOo4WBB9uwtp+a
	PQGC6wb+FocH1dwNu+ko+lr9/xVepgzLcTKR84dIHfrY+5T6UNAAaB9zThuC9MZARjYiaAbbsEHdd
	XaWb7Ug1g9/3PIauhYIDD5XyfkZgIJ8Fg45bk5Fb4rBG5D7Lxrg+6NqS12C87+qSDDP/vqDASAMfQ
	975B32SvWiuNLXgUl2teVBhO1VJkmjGhMnzZcK3Ppp1x+Ogzbh4BmIkYpYOGvsKycGP/vM76SILcc
	JZNjWrYNK3Dgc5Q5TFYcFQaigWAnhoQaLCQJbbahNkE9mKsiG1lFMeLWdpbzylaiZDwYeV6LbpBHY
	vchX5VP5FiuykVYInJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udviJ-00000000SUP-0EZ2;
	Mon, 21 Jul 2025 18:58:15 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvNb-00000000QcA-1hYN
	for opensbi@lists.infradead.org;
	Mon, 21 Jul 2025 18:36:52 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso17770295ab.2
        for <opensbi@lists.infradead.org>; Mon, 21 Jul 2025 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1753123010; x=1753727810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxLiyfGZ/hdr3VjYxRCGvXrfJeeNyrXtKnGdn7nGijo=;
        b=H9JNkCGIsX9FvpCjh7QI1bQDWV6/crJ/5ih71tPafhZyfr1+tfsJWccE18rOR1xNsU
         Y9fReLBG2tFwFFd8RCZQDcudcyhswsCH/I00rTbabsX5fjoGEVAGz64+9MPUAzVjzeV4
         BbwJQRLePxChYwYjpR2yJHRgBaHelLYAWu6ieW9yoVqlaYKaM2i+OU6vb6qnJDEpa0Dr
         wuSpV5ixNebF7Zk6C5SncTyhLRc+z29zF3OdPnoeASz17KFpdMZcp2oQxY7uH4ooQjdi
         EE2TYbS1J8GxGJcOaBdk5pcZ3k/Yw4EHAoDIQvg8M12S8UaetwkDOmdUAZICCM9c3J+s
         8WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753123010; x=1753727810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxLiyfGZ/hdr3VjYxRCGvXrfJeeNyrXtKnGdn7nGijo=;
        b=q/BINYwh4SwJVOloQizgHcqRFI6VaVoR/MPretLzeEWSfPMJmZAYP+pGwY8aP3i9Ue
         YqSOkr1mP0eXlPhVOsU9Sk5AhhldzmWWGYq59/PAaz6S2TXHyR7HZ3ZRtV0R2Jj4Z5Gw
         zvzDarIApM65U8VOXjXNer8Or3fdmQjtYInY8d5RfCQbfgm1X0/iC12yAh30WvJNHfef
         lfqhb0YyZxz/dvh4CTYC5+CkX62yQvhoC589Z4EPss1kAK+3j24Y2zBHbrcpPIeFe5EQ
         vb4bwywwmFuu+iJlCNv6out2HrYuWLav+GCVzsrdthdUlf+ZiJALS7K8Y4r1HZfnAPrQ
         rAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX47Y9z5tW2lYamFFqDZQRiao5/nfqJMPwWAKoO1PP0BPIkt3eC2Fodxd67nS9OqV3xF4RK7OAu@lists.infradead.org
X-Gm-Message-State: AOJu0YwYTgrhZgBh7ZC5RUhI43wYROzpDkzfsF8mmx0xUgVNLAwyT4M2
	n4PXPIKNzPW4BqXjGh99rDc8DpZ6QTlh5XbcX6n2YTr7L+uWwHMmb8LG6azNUZUFXYU=
X-Gm-Gg: ASbGncvahPCLl7ITN/pAnCsZyw1+OQP0/CRhpzQkaIs/fJhN1fBIESJzAhHoVeLzvgl
	oxrK8Rm02cQg8jCgOqxsZAxEdi1n7EVC981h9qq9Lxwppe25PMixgYwO9t/dq+9fEI++2qR93yO
	a86UeDsCcfqS9k+tVlDmK4O23Cx3AEo8Ylc+haS+HsNm9uSI7qC0VZJSWbMF4arRTqKgsSQqpdL
	phUGWYZwcwCqtrWcVqxrAzD1KWkivcmmHt8GEBM7YSbxxtT+SYXryqCLdBdHo+3AS1rAiUxv4nA
	FSf3NS2ELPdl9ZQbLVLCVzRYrjU6QGS/Q+RcEdvrRaGoAIAFYBzJqEmuc46wSKSPsTQWl1YqnBI
	077ARuLY/JD2olwp8l7KjkeVLxXUm7zR3KBKQyQ==
X-Google-Smtp-Source: AGHT+IFd9zy/LzJG2gCItIkuk3eURE5lpbGlGsL1QK73xhX6eEjbdrktfW+rncTE2DWmXLTyx8PB0A==
X-Received: by 2002:a05:6e02:4506:10b0:3e2:934e:564a with SMTP id e9e14a558f8ab-3e2934e56aemr129034815ab.10.1753123009908;
        Mon, 21 Jul 2025 11:36:49 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5084c9b5ca8sm2054126173.59.2025.07.21.11.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 11:36:49 -0700 (PDT)
Message-ID: <42fb18cc-d579-490f-b7db-89cb8d228ee8@sifive.com>
Date: Mon, 21 Jul 2025 13:36:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: openpiton: Add PMU initialization
To: =?UTF-8?Q?Manuel_Hern=C3=A1ndez_M=C3=A9ndez?= <maherme.dev@gmail.com>,
 opensbi@lists.infradead.org
References: <20250721160920.8818-1-maherme.dev@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250721160920.8818-1-maherme.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_113651_468954_CDE31466 
X-CRM114-Status: GOOD (  24.51  )
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

SGksCgpPbiAyMDI1LTA3LTIxIDExOjA5IEFNLCBNYW51ZWwgSGVybsOhbmRleiBNw6luZGV6IHdy
b3RlOgo+IFRoZSBPcGVuUGl0b24gZnJhbWV3b3JrIGhhcyBhIGdlbmVyaWMgUE1VIHRoYXQgaXMg
bm90IHVzZWQgYnkgT3BlblNCSS4KPiBEdWUgdG8gT3BlblNCSeKAmXMgYnVpbGQgc3lzdGVtIHdl
IGNhbm5vdCBkaXJlY3RseSByZXVzZSB0aGUgZ2VuZXJpYwo+IHBsYXRmb3JtIGZ1bmN0aW9ucywg
c28gc2ltcGx5IGNvcHkgdGhlbSB0byB0aGUgT3BlblBpdG9uIHBsYXRmb3JtLgoKU2luY2UgeW91
IG11c3QgYmUgdXNpbmcgYSBGRFQgZm9yIHRoZSBuZXcgUE1VIGZ1bmN0aW9ucyB0byB3b3JrLCBp
cyB0aGVyZQphbnl0aGluZyBwcmV2ZW50aW5nIHlvdSBmcm9tIHVzaW5nIHRoYXQgRkRUIHdpdGgg
dGhlIGdlbmVyaWMgcGxhdGZvcm0/IFRoZQpnZW5lcmljIHBsYXRmb3JtIGlzIHdoZXJlIG5ldyBm
ZWF0dXJlcyBhcmUgYWRkZWQ7IHRoZSBvdGhlciBwbGF0Zm9ybXMgZ2V0IG9ubHkKbWluaW1hbCBt
YWludGVuYW5jZSBhbmQgdGVzdGluZy4gU28gaXQgbWlnaHQgYmUgYmV0dGVyIHRvIG1pZ3JhdGUg
T3BlblBpdG9uIHRvCnRoZSBnZW5lcmljIHBsYXRmb3JtIGlmIHBvc3NpYmxlLgoKSWYgZmlybXdh
cmUgc2l6ZSBpcyBhIGNvbmNlcm4sIHdlIGNhbiBjcmVhdGUgYSBzbGltbWVkLWRvd24gZGVmY29u
ZmlnIC0tIGEKZ2VuZXJpYyBwbGF0Zm9ybSBidWlsZCB3aXRoIGEgbGltaXRlZCBzZXQgb2YgZHJp
dmVycyBpcyBvbmx5IGFib3V0IDEzIEtpQiBsYXJnZXIKdGhhbiBhIGZwZ2Evb3BlbnBpdG9uIGJ1
aWxkLgoKPiBTaWduZWQtb2ZmLWJ5OiBNYW51ZWwgSGVybsOhbmRleiBNw6luZGV6IDxtYWhlcm1l
LmRldkBnbWFpbC5jb20+Cj4gLS0tCj4gIHBsYXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3Jt
LmMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDM5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZnBnYS9vcGVucGl0
b24vcGxhdGZvcm0uYyBiL3BsYXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMKPiBpbmRl
eCBkMmNmM2UzMi4uMDgxMzY4NTkgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZnBnYS9vcGVucGl0
b24vcGxhdGZvcm0uYwo+ICsrKyBiL3BsYXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMK
PiBAQCAtMTEsNiArMTEsNyBAQAo+ICAjaW5jbHVkZSA8c2JpL3NiaV9wbGF0Zm9ybS5oPgo+ICAj
aW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRp
bHMvZmR0L2ZkdF9maXh1cC5oPgo+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfcG11Lmg+
Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvaXBpL2FjbGludF9tc3dpLmg+Cj4gICNpbmNsdWRlIDxz
YmlfdXRpbHMvaXJxY2hpcC9wbGljLmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvc2VyaWFsL3Vh
cnQ4MjUwLmg+Cj4gQEAgLTE1Niw2ICsxNTcsNDIgQEAgc3RhdGljIGludCBvcGVucGl0b25fdGlt
ZXJfaW5pdCh2b2lkKQo+ICAJcmV0dXJuIGFjbGludF9tdGltZXJfY29sZF9pbml0KCZtdGltZXIs
IE5VTEwpOwo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBJbml0aWFsaXplIG9wZW5waXRvbiBwbXUgZHVy
aW5nIGNvbGQgYm9vdC4KPiArICovCj4gK2ludCBvcGVucGl0b25fcG11X2luaXQodm9pZCkKPiAr
ewo+ICsJaW50IHJjOwo+ICsKPiArCXJjID0gZmR0X3BtdV9zZXR1cChmZHRfZ2V0X2FkZHJlc3Mo
KSk7CgpZb3Ugd291bGQgYWxzbyBuZWVkIGEgZGVmY29uZmlnIGNoYW5nZSBlbmFibGluZyBDT05G
SUdfRkRUX1BNVSBmb3IgdGhpcyBmdW5jdGlvbgpjYWxsIHRvIGRvIGFueXRoaW5nLgoKUmVnYXJk
cywKU2FtdWVsCgo+ICsJaWYgKHJjICYmIHJjICE9IFNCSV9FTk9FTlQpCj4gKwkJcmV0dXJuIHJj
Owo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICt1aW50NjRfdCBvcGVucGl0b25fcG11X3hs
YXRlX3RvX21ocG1ldmVudCh1aW50MzJfdCBldmVudF9pZHgsIHVpbnQ2NF90IGRhdGEpCj4gK3sK
PiArCXVpbnQ2NF90IGV2dF92YWwgPSAwOwo+ICsKPiArCS8qIGRhdGEgaXMgdmFsaWQgb25seSBm
b3IgcmF3IGV2ZW50cyBhbmQgaXMgZXF1YWwgdG8gZXZlbnQgc2VsZWN0b3IgKi8KPiArCWlmIChl
dmVudF9pZHggPT0gU0JJX1BNVV9FVkVOVF9SQVdfSURYIHx8Cj4gKwkJZXZlbnRfaWR4ID09IFNC
SV9QTVVfRVZFTlRfUkFXX1YyX0lEWCkKPiArCQlldnRfdmFsID0gZGF0YTsKPiArCWVsc2Ugewo+
ICsJCS8qKgo+ICsJCSAqIEdlbmVyaWMgcGxhdGZvcm0gZm9sbG93cyB0aGUgU0JJIHNwZWNpZmlj
YXRpb24gcmVjb21tZW5kYXRpb24KPiArCQkgKiBpLmUuIHplcm8gZXh0ZW5kZWQgZXZlbnRfaWR4
IGlzIHVzZWQgYXMgbWhwbWV2ZW50IHZhbHVlIGZvcgo+ICsJCSAqIGhhcmR3YXJlIGdlbmVyYWwv
Y2FjaGUgZXZlbnRzIGlmIHBsYXRmb3JtIGRvZXMndCBkZWZpbmUgb25lLgo+ICsJCSAqLwo+ICsJ
CWV2dF92YWwgPSBmZHRfcG11X2dldF9zZWxlY3RfdmFsdWUoZXZlbnRfaWR4KTsKPiArCQlpZiAo
IWV2dF92YWwpCj4gKwkJCWV2dF92YWwgPSAodWludDY0X3QpZXZlbnRfaWR4Owo+ICsJfQo+ICsK
PiArCXJldHVybiBldnRfdmFsOwo+ICt9Cj4gKwo+ICAvKgo+ICAgKiBQbGF0Zm9ybSBkZXNjcmlw
dG9yLgo+ICAgKi8KPiBAQCAtMTY1LDYgKzIwMiw4IEBAIGNvbnN0IHN0cnVjdCBzYmlfcGxhdGZv
cm1fb3BlcmF0aW9ucyBwbGF0Zm9ybV9vcHMgPSB7Cj4gIAkuaXJxY2hpcF9pbml0ID0gb3BlbnBp
dG9uX2lycWNoaXBfaW5pdCwKPiAgCS5pcGlfaW5pdCA9IG9wZW5waXRvbl9pcGlfaW5pdCwKPiAg
CS50aW1lcl9pbml0ID0gb3BlbnBpdG9uX3RpbWVyX2luaXQsCj4gKwkucG11X2luaXQgPSBvcGVu
cGl0b25fcG11X2luaXQsCj4gKwkucG11X3hsYXRlX3RvX21ocG1ldmVudCA9IG9wZW5waXRvbl9w
bXVfeGxhdGVfdG9fbWhwbWV2ZW50LAo+ICB9Owo+ICAKPiAgY29uc3Qgc3RydWN0IHNiaV9wbGF0
Zm9ybSBwbGF0Zm9ybSA9IHsKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
