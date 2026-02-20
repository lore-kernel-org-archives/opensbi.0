Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B5BC55AB9
	for <opensbi@archiver.kernel.org>; Fri, 20 Feb 2026 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipHnGl24kTMRaki6rv3eGN4aUIvgdqHovMZNoOyy87I=; b=k5ocFrduVrlEqT
	dJ5UXc4ojDBtbfIt1VUpZddzum8g8O/R8+uaOYyqDRundDMkWWzuLWjztdZ5os55+33s5sefHiaIl
	81BXBGAdSLNWWaULYU6isBV02aJGKqcO81QMSMbnnqbLPV1w4Kygy2lqOMFL6mgvBn4RhTcOHSgJU
	5E5JuxlfWbzX1zWuW/HnLVjg9wJZQJKogKUUw8SiFCvFWUE1A4OQUXDqA0RtZfiHPOzHBd5lvU8Zh
	AZ+YLqgrk+tiRn2HSJiT+RjKj1fvoQsliZGPdJfv9NwpmU+neUmLznMd9AU+IuM56ZaoOAPkEHOie
	k8zT5GBpbjD87iUyfpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPD1-0000000ETD9-3LgD;
	Fri, 20 Feb 2026 12:02:11 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPCy-0000000ETCp-2pAT
	for opensbi@lists.infradead.org;
	Fri, 20 Feb 2026 12:02:10 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6769719821dso750488eaf.2
        for <opensbi@lists.infradead.org>; Fri, 20 Feb 2026 04:02:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771588927; cv=none;
        d=google.com; s=arc-20240605;
        b=EPANTXAB48I0ClQPbRfdiwEBfgIdo2eNs2+UtHUH+U3YQeNIhbfq5oBVr5pH8lI0ih
         eky1ARB1qlgYHqfvtW2j6eLdkJyxO40tvpzinRoO/j66T43LQFCcpwvI3GxEYyiGY+TD
         6eSq11MYmnopNdU+b5MTneCtyKqY7pd3M5SG2r4luMJO1RRS1eyMSbZBO9E/zDIx/rVI
         bwKQMMK7NWQeRbgemGeLvblrbuqoTgfdoHqY9Z2T00eWzrteCCL+8gbR2dKURcGU5QAm
         GaaH1CCsfrtzQG9Cnxix6vO3N1rx5R2F+v7wYOtITQYWI1sK2Fy0J7F6YDCJHNdrVXC6
         U2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3JsQI2zqyZ2+4eWiTfKsmFbPKzOHZbTrXEsXvxNyBs=;
        fh=KEn2XrOuR4c6rfAdQ1mH56bhedkWkZVugEOKX6v+CsI=;
        b=bZHnEtEnphFKIbDbEulXv1+nmbmlYZzAYP2Cv7LOr/87GgiHn+P3iMZ7SF1fZ8iRfB
         pCduXCUvvrVV1Anz9h31VXSJysEr0N6bU62WdZTHyetx+60tEZQ+cZoyBvc/i0HqmHzZ
         Zt2KJTUmU51xgtPLQYsU9ByOmXxIBsfAMWpaWWIqp4flv1o63c2YS5kzPJMrIS4AThy+
         6IHwUekB9VxNcEGZSIAuQCtPIpSIQs+E4ctJPSzuCOSz4ZFMQ00vzZ/LY1FvIYv9nS35
         yXIKr5HoA2sthd3XlGF8bXLucQWhs1baYFsn/6UOxQiEAF99+bXlXE5TxU3eMdM5y6jA
         uJ7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1771588927; x=1772193727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3JsQI2zqyZ2+4eWiTfKsmFbPKzOHZbTrXEsXvxNyBs=;
        b=HWWgsRbiMU4N7w7yulWSakpnZKvIaXSDG3V2G4oNUElCXK88SOVEjZgxTt0FjMw9JA
         1fyKZzy8367Bt3XPKn/hBeqNvB/zjszEoVyZxok7A0aZNh2YeCc7fNKw8njNPYKCLr5w
         9hIsSWmOPW+a5/sEGM0BQupHCsC2NdDjwcu6BZD7wCnEZ1QTkOIYG2qfhbF1leImguWA
         RvuKSUNfKSQn3WGe2O2qPKFAfi9BrEQMSfqSo2yKM+Aexu/KIc0je6OpqqBWkwV0LNZw
         cMVKnC5y1Fps3AWVOUnkvrR6oyjCZnh88XnUmfYbYRwDxgxTjXneZMMqIbJl1TWIlk8z
         uUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771588927; x=1772193727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W3JsQI2zqyZ2+4eWiTfKsmFbPKzOHZbTrXEsXvxNyBs=;
        b=GmGm5m/yCneNhJ32A5+v1C2LPe5D3EVTagkHB88zgXnZwBLBxhEpuGwyYidEce+5gH
         QUno2/vo4jWl7Tog4SWUuTjiIpQixKUDMg6ZVLKo85ikH1/ceFCsAdo2TBex0FPVJRgi
         RjNctGPebCpKaI4abzioObYlRVPsRYhiPmiP/t/GacWyr3FQCNam4y0HKiDYEwVBexSQ
         twWSFE2eM0H46m7MrSJHwXvFkHbeoL7JLuNFqk2PCaTng8lJ5EwIVzMtdf2URiEBPZD9
         91bfRMEjAoh9DpXSHwuYR5ElsygV09CBweo1klc7xV/0006b0a+mqVh72qnUXBmDJ9dK
         ZBxw==
X-Gm-Message-State: AOJu0YyXt5Q/kzGK6xB3a+5O3JvmOjbvqzxaCz2F2oFFURe9Jx14H3C/
	Ox50STiUc/pZ39Dd6LnthqR6NGdmiQXRozTJGpZHd2DiV8YuaGW4KEItlkATbJ4sPDeJ7qnksnR
	ZLiup/0/fAWOYxvn7KJEXJh8wrWLHXVwX6B+OUouxvA==
X-Gm-Gg: AZuq6aKvMu9vI7Nx5KSsqdIcfIJ5qrGIfAfEAj+6FtZV/jOHpHscJlOpMn2U0jki+18
	q+Wgf7FRmKu08Aua37/A5Ue7qOrPngOs4p5CCRHbs1QrDRwbNhOOEJP81+j+EzgSrTEhCsxB+Na
	sAi0xK9B1gdgr+2HmrjITPzsRmMpFOLCyQim0VGUzHa6BIctU6GF1BePfGPECgvwbyxepd7gF97
	dqMWbaS0wTMjHAJ2FrPZ4fb1denvMYRn6jQno4bYtd+NuUZxpF8O/Y8FRRCo7exLV26r9od/HBL
	KgTZns628rtMYdNSlwgE4VtsOxFJ3DmLIIQJihofGFcg4eg/mvlYFNVsFuG5h0ztKWhC0Q==
X-Received: by 2002:a05:6820:22a4:b0:663:c5:2f93 with SMTP id
 006d021491bc7-67858fe8683mr10838626eaf.14.1771588927501; Fri, 20 Feb 2026
 04:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20260116165304.180441-1-jamestiotio@gmail.com>
In-Reply-To: <20260116165304.180441-1-jamestiotio@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Feb 2026 17:31:56 +0530
X-Gm-Features: AaiRm52cy2rICWkwhfZKDNn06dkc97AR9D2L96e-JnQCFu9LXZj7mkbZyzYKcCc
Message-ID: <CAAhSdy09-53D6rF4yz_BMToGG=Ax8ywhk30erygsiEwERG-yJA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: Fix multiple FW counter start operations
 with custom PMU device
To: James Raphael Tiovalen <jamestiotio@gmail.com>
Cc: opensbi@lists.infradead.org, andrew.jones@linux.dev, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_040209_361011_D3B23B04 
X-CRM114-Status: GOOD (  21.04  )
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

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMTA6MjPigK9QTSBKYW1lcyBSYXBoYWVsIFRpb3ZhbGVu
CjxqYW1lc3Rpb3Rpb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5LCB3ZSBpbW1lZGlh
dGVseSByZXR1cm4gdGhlIHJlc3VsdCBvZiBgZndfY291bnRlcl9zdGFydGAgaWYgdGhlCj4gZXZl
bnQgY29kZSBpcyAweEZGRkYuIEhvd2V2ZXIsIHRoaXMgc2tpcHMgc2V0dGluZyB0aGUgYml0IGlu
IHRoZQo+IGBmd19jb3VudGVyc19zdGFydGVkYCBiaXRtYXAgZXZlbiBpZiB0aGUgcGxhdGZvcm0t
c3BlY2lmaWMgY2FsbAo+IHN1Y2NlZWRzLiBSZXN0b3JlIHRoZSBvcmlnaW5hbCBiZWhhdmlvciBv
ZiByZXR1cm5pbmcgZWFybHkgb25seSBvbiBhbgo+IGVycm9yIHNvIHRoYXQgd2Ugc3RpbGwgc2V0
IHRoZSBiaXQgaW4gdGhlIGJpdG1hcC4gVGhpcyBwcmV2ZW50cyBtdWx0aXBsZQo+IHN0YXJ0cyBv
ZiB0aGUgc2FtZSBGVyBjb3VudGVyLiBUaGlzIGFsc28gYWxpZ25zIHRoZSBleHBlY3RhdGlvbnMg
b2YKPiBgcG11X2N0cl9zdGFydF9md2Agd2l0aCBgcG11X2N0cl9zdG9wX2Z3YCBzaW5jZSB3ZSBj
YW5ub3QgYXNzdW1lIHRoYXQKPiB0aGUgcGxhdGZvcm0tc3BlY2lmaWMgZnVuY3Rpb25zIHRvIHN0
YXJ0IGFuZCBzdG9wIEZXIGNvdW50ZXJzIHdpbGwKPiBtb2RpZnkgdGhlIGJpdG1hcCBzdGF0ZS4K
Pgo+IEZpeGVzOiA1N2QzYWEzYjBkYmQgKCJsaWI6IHNiaV9wbXU6IEludHJvZHVjZSBmd19jb3Vu
dGVyX3dyaXRlX3ZhbHVlIEFQSSIpCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgUmFwaGFlbCBUaW92
YWxlbiA8amFtZXN0aW90aW9AZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNj
di9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi9zYmkvc2JpX3BtdS5j
IHwgNiArKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11
LmMKPiBpbmRleCBlMDg0MDA1ZC4uNzUwMzhmOTEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlf
cG11LmMKPiArKysgYi9saWIvc2JpL3NiaV9wbXUuYwo+IEBAIC00NDgsNiArNDQ4LDggQEAgc3Rh
dGljIGludCBwbXVfY3RyX3N0YXJ0X2Z3KHN0cnVjdCBzYmlfcG11X2hhcnRfc3RhdGUgKnBocywK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgZXZlbnRfZGF0YSwgdWludDY0
X3QgaXZhbCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBpdmFsX3VwZGF0ZSkK
PiAgewo+ICsgICAgICAgaW50IHJldDsKPiArCj4gICAgICAgICBpZiAoKGV2ZW50X2NvZGUgPj0g
U0JJX1BNVV9GV19NQVggJiYKPiAgICAgICAgICAgICBldmVudF9jb2RlIDw9IFNCSV9QTVVfRldf
UkVTRVJWRURfTUFYKSB8fAo+ICAgICAgICAgICAgIGV2ZW50X2NvZGUgPiBTQklfUE1VX0ZXX1BM
QVRGT1JNKQo+IEBAIC00NjgsOSArNDcwLDExIEBAIHN0YXRpYyBpbnQgcG11X2N0cl9zdGFydF9m
dyhzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaWR4IC0gbnVtX2h3X2N0cnMsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
dmFsKTsKPgo+IC0gICAgICAgICAgICAgICByZXR1cm4gcG11X2Rldi0+ZndfY291bnRlcl9zdGFy
dChwaHMtPmhhcnRpZCwKPiArICAgICAgICAgICAgICAgcmV0ID0gcG11X2Rldi0+ZndfY291bnRl
cl9zdGFydChwaHMtPmhhcnRpZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2lkeCAtIG51bV9od19jdHJzLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldmVudF9kYXRhKTsKPiArICAgICAgICAgICAg
ICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAg
ICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgaWYgKGl2YWxfdXBkYXRlKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHBocy0+ZndfY291bnRlcnNfZGF0YVtjaWR4IC0gbnVtX2h3X2N0cnNd
ID0gaXZhbDsKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4g
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
