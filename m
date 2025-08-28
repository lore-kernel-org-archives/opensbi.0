Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BCDCA0FF2
	for <opensbi@archiver.kernel.org>; Thu, 28 Aug 2025 05:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8iym9LQqMZuAJmBVUjKB+1/kzt9n8l0zGHLKxSTp3k=; b=W31FEtsInqm1RI
	+h4P0k0titNXBSNpQcnJJAf6x6gYDx3oI9D42dgZ+X8xNaJWBeJHJ4Ca9dUM0WzcnMm3AiP6Rz8jg
	sg5zWs47WFgYkheUaK739Kl2DXaGiQwyS86TzKmB/M+KAH6zXGMGMQY5s/TjMxnybr41wMzJKWdKp
	79XvlM5xNwWT8Y9JluEOZPG4dDlQXfK4lAnNb8IM+Yhk5ERMHJoPG3ACxapJ6aJdKBu/f44hG834L
	AwADumEkxv0G+d4z9XsJWxinXXJoQabPMC6gmoybaczfQbK8aBCtlYxd3arg1qg/1I4hfRnO+//1q
	IgHKM4V5YEE94qc6BvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urV6Z-00000000JZR-2re6;
	Thu, 28 Aug 2025 05:23:23 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urV6W-00000000JYf-3o41
	for opensbi@lists.infradead.org;
	Thu, 28 Aug 2025 05:23:21 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3f1012f85beso5817185ab.1
        for <opensbi@lists.infradead.org>; Wed, 27 Aug 2025 22:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756358600; x=1756963400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UPePhNQYIGr3iiUVWeldwaYICJinONAiNaUOiOFvWY=;
        b=L6BxImctGcNJv90O1m5GEAsRi/jtcEfahgW7AW86YhF+mTjfTuXU+zng7kLcSdJXVo
         wTokL8rqY/vJbwaacPaOTmbvvLhllreip12W7gqhPsRayoAAHCmAHxtN4e16qU0FcGzh
         nbYgonsMJ21LCZCi7c4yum1EwjVQLbAH/0FIlXYofCWjXakMY/h62SBJ81h3QzHHVCFb
         OMu6s+L+XcyY9pI4ZXVj9FLXQ/JScIz90VfN95gBkiT57jH2rC8vxkAv74aQFa6NYUGs
         V/7mSdYcVLAFiABhOEvvEEJZeeUmqVpzZ2UGBvzA1ty0LvFShvKkYfvvrv/l0iXParvf
         QWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756358600; x=1756963400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UPePhNQYIGr3iiUVWeldwaYICJinONAiNaUOiOFvWY=;
        b=S/BPO0gi1PR6g02iMr7MuMuZU9VFaeac7fM73d1rOCX7rJh9kbDPLOa8p6YTpeuNhK
         shvGshjba/w6aBDcAiVw69ZVwLLNQqwXFHjWnaxSbcXL88e8gwyMyGxvy2Dv4y7sGZf5
         r+0nPnJSTe1NEyj623PVZbY1Jk9r8L+TqoVpwILmhRXRCmjvGL79ixiEekubDzrDp30I
         bsg/v1kaLvgV8/pQXFg+0D8uY/h6HMBYy/BHh5a2AKHkOSPd8aDkH4JyQg+SOMmyV1As
         2hQ7WO9gT2HUhfsPVEZJaGLZgE/6uTtIsOvr0HX7g5Ub+ebgC25BSux4AuSpE5khCd+2
         vt3Q==
X-Gm-Message-State: AOJu0YwhyYN1l15fCJqdAtEKBj5f0gls5sF6PG1q0Wdjo8epE/BS8fvH
	Y5nZ7azOsf9YLaorcAzaJssFKH1HWWgZDGyCL1g0NVDs5IipTf9z9mwZVe7t3GD56dCOb5ewJmQ
	GP134VR4EW9EuETzmoFxQdkzVdG8yRTw/OYhcwyR2Yg==
X-Gm-Gg: ASbGncsk/eu5ARmX+ociFK8li2ocixV5Q7hvidEZF6LdO7JMxjN55RJ92I34LNe6Sw3
	csBATgJmZUV99fCNmsckoL0wrfXQ6W+TmUvFAV04G60FMkqasBALYuwrUrIqeZTWvNjo1CwQg67
	utNTqWUu52qalvjIOzfjrnaldHAskZXKjS0nC7h86I+99zBySg3BcK/NLUMW7MxwDBOGYwSOZYQ
	QLEMfd/Ci2EWL9HorgCU2/jkRVQngVkcrbw+2Wi
X-Google-Smtp-Source: AGHT+IEV1PwVSFk2jiCLrhvcWBRbRYPz5xfreCih3NWu0JQGOeTGK8wZPHEhnPymp6DyVvpNLQT/XV0Z9QrF9Ol0A/c=
X-Received: by 2002:a05:6e02:2184:b0:3eb:2708:3b8 with SMTP id
 e9e14a558f8ab-3eb27080780mr278231825ab.19.1756358599643; Wed, 27 Aug 2025
 22:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250811152947.851208-1-jesse@rivosinc.com>
In-Reply-To: <20250811152947.851208-1-jesse@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Aug 2025 10:53:07 +0530
X-Gm-Features: Ac12FXw7a1q8Q7nyUjy7OofsZy1y0-EoeuxBvFa5DegbV7IQDDRMCGW_s8ShnK0
Message-ID: <CAAhSdy0LQM-+SKTB75SFb+sxnEqDzF4Sm1v2z99ELnTBixLTNQ@mail.gmail.com>
Subject: Re: [PATCH v2] dbtr: Fix sbi_dbtr_read_trig to read from CSRs
To: Jesse Taube <jesse@rivosinc.com>
Cc: opensbi@lists.infradead.org, Xiang W <wxjstz@126.com>, 
	Anup Patel <apatel@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_222320_944913_04DE40C7 
X-CRM114-Status: GOOD (  16.61  )
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

T24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgMzozMuKAr0FNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gc2JpX2RidHJfcmVhZF90cmlnIHJldHVybmVkIHRoZSBzYXZl
ZCBzdGF0ZSBvZiB0ZGF0YXsxLTN9LCB3aGVuIGl0Cj4gc2hvdWxkIGhhdmUgcmV0dXJuZWQgdGhl
IHVwZGF0ZWQgc3RhdGUgcmVhZCBmcm9tIENTUnMuCj4KPiBVcGRhdGUgc2JpX2RidHJfcmVhZF90
cmlnIHRvIHJldHVybiB1cGRhdGVkIHN0YXRlIHJlYWQgZnJvbSBDU1JzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBWMSAtPiBWMjoK
PiAgLSBBZGQgYmFjayBtaXNzaW5nIGNwdV90b19sbGUKPiAtLS0KPiAgbGliL3NiaS9zYmlfZGJ0
ci5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kYnRyLmMgYi9saWIvc2JpL3Ni
aV9kYnRyLmMKPiBpbmRleCBhODMyYzdmMS4uYzZiMDRhYWIgMTAwNjQ0Cj4gLS0tIGEvbGliL3Ni
aS9zYmlfZGJ0ci5jCj4gKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gQEAgLTUyOSw5ICs1Mjks
OSBAQCBpbnQgc2JpX2RidHJfcmVhZF90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gICAgICAg
ICAgICAgICAgIHhtaXQgPSAmZW50cnktPmRhdGE7Cj4gICAgICAgICAgICAgICAgIHRyaWcgPSBJ
TkRFWF9UT19UUklHR0VSKChfaWR4ICsgdHJpZ19pZHhfYmFzZSkpOwo+ICAgICAgICAgICAgICAg
ICB4bWl0LT50c3RhdGUgPSBjcHVfdG9fbGxlKHRyaWctPnN0YXRlKTsKPiAtICAgICAgICAgICAg
ICAgeG1pdC0+dGRhdGExID0gY3B1X3RvX2xsZSh0cmlnLT50ZGF0YTEpOwo+IC0gICAgICAgICAg
ICAgICB4bWl0LT50ZGF0YTIgPSBjcHVfdG9fbGxlKHRyaWctPnRkYXRhMik7Cj4gLSAgICAgICAg
ICAgICAgIHhtaXQtPnRkYXRhMyA9IGNwdV90b19sbGUodHJpZy0+dGRhdGEzKTsKPiArICAgICAg
ICAgICAgICAgeG1pdC0+dGRhdGExID0gY3B1X3RvX2xsZShjc3JfcmVhZChDU1JfVERBVEExKSk7
Cj4gKyAgICAgICAgICAgICAgIHhtaXQtPnRkYXRhMiA9IGNwdV90b19sbGUoY3NyX3JlYWQoQ1NS
X1REQVRBMikpOwo+ICsgICAgICAgICAgICAgICB4bWl0LT50ZGF0YTMgPSBjcHVfdG9fbGxlKGNz
cl9yZWFkKENTUl9UREFUQTEpKTsKClR5cG8gb3ZlciBoZXJlLiBUaGlzIHNob3VsZCBoYXZlIGJl
ZW46CnhtaXQtPnRkYXRhMyA9IGNwdV90b19sbGUoY3NyX3JlYWQoQ1NSX1REQVRBMSkpOwoKQW55
d2F5LCB0aGlzIHBhdGNoIGlzIGJyb2tlbiBiZWNhdXNlIHdlIG5lZWQgdG8gd3JpdGUKQ1NSX1RT
RUxFQ1QgYmVmb3JlIHJlYWRpbmcgQ1NSX1REQVRBeC4KClRoZSBmb2xsb3dpbmcgd291bGQgc3Vm
ZmljZToKCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kYnRyLmMgYi9saWIvc2JpL3NiaV9kYnRy
LmMKaW5kZXggYzMwYzJmZDYuLjY1NmE2MjYxIDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9kYnRy
LmMKKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCkBAIC01NjMsNiArNTYzLDEwIEBAIGludCBzYmlf
ZGJ0cl9yZWFkX3RyaWcodW5zaWduZWQgbG9uZyBzbW9kZSwKICAgICAgICBmb3JfZWFjaF90cmln
X2VudHJ5KHNobWVtX2Jhc2UsIHRyaWdfY291bnQsIHR5cGVvZigqZW50cnkpLCBlbnRyeSkgewog
ICAgICAgICAgICAgICAgeG1pdCA9ICZlbnRyeS0+ZGF0YTsKICAgICAgICAgICAgICAgIHRyaWcg
PSBJTkRFWF9UT19UUklHR0VSKChfaWR4ICsgdHJpZ19pZHhfYmFzZSkpOworICAgICAgICAgICAg
ICAgY3NyX3dyaXRlKENTUl9UU0VMRUNULCB0cmlnLT5pbmRleCk7CisgICAgICAgICAgICAgICB0
cmlnLT50ZGF0YTEgPSBjc3JfcmVhZChDU1JfVERBVEExKTsKKyAgICAgICAgICAgICAgIHRyaWct
PnRkYXRhMiA9IGNzcl9yZWFkKENTUl9UREFUQTIpOworICAgICAgICAgICAgICAgdHJpZy0+dGRh
dGEzID0gY3NyX3JlYWQoQ1NSX1REQVRBMyk7CiAgICAgICAgICAgICAgICB4bWl0LT50c3RhdGUg
PSBjcHVfdG9fbGxlKHRyaWctPnN0YXRlKTsKICAgICAgICAgICAgICAgIHhtaXQtPnRkYXRhMSA9
IGNwdV90b19sbGUodHJpZy0+dGRhdGExKTsKICAgICAgICAgICAgICAgIHhtaXQtPnRkYXRhMiA9
IGNwdV90b19sbGUodHJpZy0+dGRhdGEyKTsKCkkgaGF2ZSB0YWtlbiBjYXJlIG9mIHRoZSBhYm92
ZSBhdCB0aGUgdGltZSBvZiBtZXJnaW5nIHRoaXMgcGF0Y2guCgpBcHBsaWVkIHRoaXMgcGF0Y2gg
dG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
