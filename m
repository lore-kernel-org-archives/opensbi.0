Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D530606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EBu7rdwX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=rzJ8boqA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aA+x/f56JyGHp6ZQZOnHwNoPqUOoZ00NzUusWlcfqoM=; b=EBu7rdwXu0zxuM1c6KNuFUs4RS
	oi6echXWyvY2PPgZx1mD/nmRvDUpdOmhd8oJ/mpIWS6JLbQmiXOmzr3EI14+6EjmwrZ+NytULXEQb
	mHPB0fFNOCC4znHf+wSM2tcqkcvtC4tvSYbd9qRE1sdH6TMbmu/N9cWDA7y2ePtkGnAB9bAPfiZAK
	FLjOfI+EsraUemC18syYz7q+EiQHtDeRJ3UxlJfrtEZAB5QuT+QKcCc1YXVkfJgTq2QUFbgjeN4Rz
	X4aW/RPrlPSARwv2AuzZ+Y0Htlw2wxVzXSePMFtKsOcxcUtwY1TscM2tfhGvuWS1nozCF88ZlR6BU
	dyDcHzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKu4t-00000000uft-33lz;
	Sun, 25 Oct 2026 08:59:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKu4r-00000000ufG-3R0E
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 08:59:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1174092f8f.2
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 01:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792918780; cv=none;
        d=google.com; s=arc-20260327;
        b=lZQhuYp7HmliNoZQ+4lLhAXgDu1PLvFB8XQlCGWcKufH5LgFfcPSrbeoVv0Ne6//7w
         34+PqKu7HAD84/XE09pDVD924omfittQYST/vjqKjH1yCdmoIxmv0OTNKzZdAXdK7W0j
         55H/EKAsyalGiZ057ANvhiFzFC9hkNq5+ezfI7QKk2sVfqsu5Yscpl3XNPEOk5dopNgA
         oGLJbtr7BsFgZ+Qe1FgSyF7GNM505kcCJY1XY7m6o0KHbrdWQwPgN7IlQATgPa2Cvcvf
         IGc0SqolbtOxXvYETnFqFDS9i4Gw6g7pgi+X3YebQiX0CYRQaTXuW7M3VJbc70VQRVYC
         dFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r4EyvSmcYbYKhlhx/PlmFEID+4WvnWkjCCgjl0E3xyU=;
        fh=dz4BeRsPxp9pc6If0ilCgLww1LiJ+qYpsZvc7V7whUs=;
        b=FH6De5TD901MZVijBFIrBxYBp0rX2YsJo6Bcj5RQBiEXo3kTnH1u5SQS+ATKwDh1ZF
         x4Di86/5rwssXYDk4vqrJALJ/0Jirh18tsEtQ4WevgyHb4a3y2NFLHVEW7Pi5PAC+LUl
         6r5umm7rubnZLyegIQv3c69sHglYfp9X6Y09PLBZmoX3l8M//ohSvQpAnTr7WHILaxgJ
         sl3EHCPhwQgfyM2FK8dER56qLBOZVW9aFepycC2ee4IUqsjoZX487vQKbz7SgovrwAEH
         vX6WAeKI4INZZg1fVnTMDdEkGb/9cp4HTMM0Iy+SKi7I6XPImUPRBy9zA5J4W4zKM+iG
         wsnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792918780; x=1793523580; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r4EyvSmcYbYKhlhx/PlmFEID+4WvnWkjCCgjl0E3xyU=;
        b=rzJ8boqA1L3KnPgNbbg7jEwvQ1aP1HPoAbDVYt196MpF8E/TzrSQTrM29OqT4ECj5d
         XWH8ClfS9cVWgYqtL4Q+yb1UETXd8r49i3/CyMQLZ3Qx1tVyrAN724ka0jXozsE02MU3
         VR+0BXR2t8W7U6E7f8lrAB/eL438YmkaxKvOfBv9MaQ1pYKzqSO0eueBrSfrhm6RsjBT
         ZwXKXOIiwW4WSTOkZtclOwh3HoZGzEJNNa0dQWhZjsjHjAuux4GaMaXid8Eytnvkj2f1
         3+AzF+zImP45yTPT6mGffRRcOz2rYR0iO/sHXkbYaXEedG1Yb1AK/or0rMbrEgGHqExL
         FJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918780; x=1793523580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4EyvSmcYbYKhlhx/PlmFEID+4WvnWkjCCgjl0E3xyU=;
        b=vzn9GIXdlMjpznvKZQYoUY6oCxcT7PhaFN0YFB2DKia8sY+lLLRSz08ys5UbMrKy73
         yhPKOMwEJVrOpltEPPVC41cdeCeuSKgFlAFipna3hCzsx/ePYqDqc7RV2JgJHcuDZB8a
         cFzwDrsOYVD4gudpOY5CvkCVN97kfK05nAvNPQqxSqpPP/cQVqpMVBBqv/mc6fX27etb
         PDLmKAigDxkN5AcSXxszg7mDwA9xwMtDunHfHOMNc4m131uOEpkt5FyEX+CELYHDDuKW
         uvjkMq1UaKatL9fnWzm9IgoNB01pW5sGv8vXAAKvC3BlJYKjEkM904yt4MgJ2TCJBRFi
         fFhg==
X-Forwarded-Encrypted: i=1; AKwUvBxuys1Nk3bJFRpExvBStWl2ypgjKY65kv7esV7WmpCDmRQhPpkURx6XfsK3h/cMlU6O6jH23/ah@lists.infradead.org
X-Gm-Message-State: AFq9FYK8BxxUlAtcjSlTOVdotL1PcZlVpkwCM+FjH9rKrZ3l1YkTdVzm
	ctN5eHz3USNGi7Mt6AwJpQkxfks+lV/M8sVyvQSkkWspJ2NcjS5AHQNnBrI0qTYyEzyduJ8JZMa
	KkiEW8uMPqJt0vkeOEQwd6/mFa/e1Hdj7pkhDTH/ZLg==
X-Gm-Gg: AYBFou1+zI53cr1ykl/LHjOmaH8Uwk5ePs6KRaJaPeoEo+5B41fxK/uzogZCCssbd0N
	W++3lve4NypEDWoKudmrApKZ9+hXRxt8d+0rfMXcOJvBGm9qJj8BQmqofvg69G/t1edoasKdOJb
	HAha1Rys5mp2m42V/LgODKW9uNmoGlzwkOviJCDoXzmQ15ApzQ/MCFDXdD06nc0GyLD0chEjVWO
	/wJY2r/8FaUrk1mhd+4Fy4qjhs94cDm2uazP6UMpMsKIbKKKNxHFjXsu3ZfAf1Rk83cZ8Ltss5j
	9nqQBsdrS+iQ4kBQKcbtaTH1abaEZWRjE8FNIgty4LItpfTWmZHzlJUdn1EIFXueeZsnKE0k8Lh
	9fEpigKyY4oMbY2fklz4jgnXk2+oIJC6R/5LKBTlUINKhWsHTdbAnvS5Qw7YhL8SKh5h2qAxUi4
	ixE4J+ERSNv89Cz0+SE23V7PwBquJgDrryHx3SCkMJwyjXbIbBg2q2B3f2
X-Received: by 2002:adf:f34c:0:b0:48d:f3f8:f910 with SMTP id
 ffacd0b85a97d-48e3eb8dc2dmr4582654f8f.34.1792918779571; Sun, 25 Oct 2026
 01:59:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
 <20260923032359.4041876-12-anup.patel@oss.qualcomm.com> <CAFR3w37k35NmVxV=xxRJYVrd0fk_FrsL+jecwBC+=zb-ow-vVQ@mail.gmail.com>
In-Reply-To: <CAFR3w37k35NmVxV=xxRJYVrd0fk_FrsL+jecwBC+=zb-ow-vVQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 14:29:28 +0530
X-Gm-Features: AclHuK-zFXKV6waLliaHXzJkRxmeAa4MMA9QtIHbFKWf1hOGH9_BuHj6nZVsP-E
Message-ID: <CAAhSdy1guj3OM9ortm=xu-oQAGbhkGYzQJFDA-C8m6cBeV8t0Q@mail.gmail.com>
Subject: Re: [PATCH 11/11] lib: utils/mpxy: Use domain notifier for deferred
 creation of MPXY RPMI
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_015941_875912_F08FF4A8 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgOCwgMjAyNiBhdCA5OjQz4oCvUE0gUmFodWwgUGF0aGFrCjxyYWh1bC5wYXRo
YWtAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiA+ICsKPiA+ICtzdGF0aWMgaW50IF9fbXB4
eV9ycG1pX2RlZmVyX25vdGlmKHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gc2JpX2RvbWFpbl9ub3RpZnlfZXZlbnQgZXZl
bnQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnByaXYpCj4g
PiArewo+ID4gKyAgICAgICBzdHJ1Y3QgX19tcHh5X3JwbWlfZGVmZXJfaW5pdF9wcml2ICppcHJp
diA9IHByaXY7Cj4gPiArICAgICAgIGludCByYzsKPiA+ICsKPiA+ICsgICAgICAgLyogRG8gbm90
aGluZyBpZiBkb21haW4gbmFtZSBkb2VzIG5vdCBtYXRjaCAqLwo+ID4gKyAgICAgICBpZiAoc2Jp
X3N0cmNtcChkb20tPm5hbWUsIGlwcml2LT5kb21fbmFtZSkpCj4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4gPiArCj4gPiArICAgICAgIC8qIFVucmVnaXN0ZXIgbm90aWZpZXIgKi8KPiA+
ICsgICAgICAgcmMgPSBzYmlfZG9tYWluX3VucmVnaXN0ZXJfbm90aWZpZXIoX19tcHh5X3JwbWlf
ZGVmZXJfbm90aWYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFNCSV9ET01BSU5fTk9USUZZX0VWRU5UX1JFR0lTVEVSLCBpcHJpdik7Cj4gPiArICAgICAg
IGlmIChyYykKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiArCj4gPiArICAgICAg
IC8qIENyZWF0ZSBNUFhZIFJQTUkgaW5zdGFuY2UgKi8KPiA+ICsgICAgICAgcmMgPSBfX21weHlf
cnBtaV9pbml0KGlwcml2LT5kYXRhLCBpcHJpdi0+Y2hhbiwgaXByaXYtPm1weHlfY2hhbm5lbF9p
ZCwgZG9tKTsKPiA+ICsgICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBy
YzsKPiA+ICsKPiA+ICsgICAgICAgc2JpX2ZyZWUoaXByaXYpOwo+Cj4gRnJlZWluZyB0aGUgaXBy
aXYgaXMgb25seSByZXF1aXJlZCBmb3Igc3VjY2VzcyBwYXRoLCB3aGF0IGFib3V0IGVycm9yIGNh
c2VzPwoKVGhlIHN5c3RlbSBib290IHdpbGwgZmFpbCBpZiB0aGUgbm90aWZpZXIgZmFpbHMgYnV0
IGluIGFueSBjYXNlIHdlIHNob3VsZApmcmVlIGlwcml2IHNvIEkgd2lsbCB1cGRhdGUgYXQgdGhl
IHRpbWUgb2YgbWVyZ2luZyB0aGlzIHNlcmllcy4KClRoYW5rcyBmb3IgcG9pbnRpbmcuCgpSZWdh
cmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
