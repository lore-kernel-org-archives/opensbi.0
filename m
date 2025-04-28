Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957FFC369DC
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYAitMUabvaZS/GKj7Ot/kae13XLKLToDjRZpqIeKO4=; b=l9piBfssPnWpsq
	MAb6VJTkR3C76gwtI33Gjn3u0NT0ze/UISyLMa1lgzyqa0fmPKA8cDPKp2HzdNDAcSvbpT7UPkmyW
	MjgcGCjLUv6AiosJKr2jOMEviaql4P+HA4qPbCfRqNR4B0kR7XKJjTlg8CY/luKhD7mXPOKUU+STz
	H+AgmCzfvTqq0RTWM8s09ifb90o0K5H1twD+WNwUhIAzzSqdauEL82skcYHZdo2kvQ8jaOfF7lxcr
	wbbcQnobpoZJhfrDpKlcaNVHEz+4ZUTBYv+BkHojKSrYQU6SJSnyiv05PX9NGSIkKg0vksw/PEIZP
	3p2wwh7N1vp3CuZTeyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Owt-00000006YHe-2Sdi;
	Mon, 28 Apr 2025 13:55:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OpZ-00000006X5M-1tmT
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 13:47:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39d73b97500so311898f8f.3
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 06:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745848052; x=1746452852; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmSZ4WT1MGqxtaE7XxOi7FVolg1UgHgih8i7TQQO+iU=;
        b=d/fAewV6ts0VZ2cXQ/74pOpd5DOzCqzlvqrtElomg4suAnB+L95vSVxUi+EuFPs2mq
         lnlqe+Lr0L3OXbmSgJ2/Fax66h8Axv2RcTbTojUC9uuWuZHOrWqF9xnETgWt6KkRQnnX
         rdIGt4Kw7lawM0e8VuXAJ9H9sK5hZQ8EWyiGYhws1hiOYmRe9aQ1gQkZyCPd+nHf8+jH
         RBPxHqn0EwQsRynITBlnzsWUPp95ixNGvFGS0vb2oIXtY1XfZuoSLY7lLn1kEA27+dN+
         MI+H/9PpxfWTqcNVLjJTpEH+caqfBkY8HyeT/aOCfpr6BYGzl/xn8K9JtTEngaQotC30
         BlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848052; x=1746452852;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmSZ4WT1MGqxtaE7XxOi7FVolg1UgHgih8i7TQQO+iU=;
        b=w5VEV4nU4jgKRe5/vPfFl2uTDYeAy1yMA/Xam4SU0I2AwNRYPM4yFN9JGAl0U8mdVq
         pa51grd9VCqGeUEsTEtL37QG2beVC6R3meBl1Bk55YZqxduMFtoWEnOViTVonmvL+65w
         3UA2o3XCX0h7XZ7eYC4sI31slAx0VILHWB55RQgDlBM8YODDsDbG/SiJfvv5Bc7FoUQZ
         bqSN4mdGaP/EVx9wObH/WXSbuCmdZRsmW4Q+euk3jfMRdKkjPgIPUs4iYmMkdUKZGnHi
         KNUDTjwwJeYBxhU7sg+3N0rPnNpQ8Ae0jC3giGFi9VJev7Qfgibj9fkmXGjMcbsXSRmq
         +uyw==
X-Gm-Message-State: AOJu0YyJkacn08bZUoaINku8MwR+lrTAHRGoDDsCUhKB6+s7LvubFMhN
	WD9PtgL783q2z+TCWuotP9RnSTE6zFyRxXdQ0380WYjNqkSSYn0+q9cPKUik85KPTb/qqYzoLcs
	QZtA=
X-Gm-Gg: ASbGnct+9YMAv0p4CJGLiljTS8r+p8kybb2xpr83QrkA+Rg3Xh+veHv12SUGpuxYD04
	/cDPMdpk1/g23SEcCQ7Ek1pUoofGrNrolQ8tAm1V0WxCOC34MoxcptROHc0GObirkZsIQq9EUyB
	v2YRoepN4EJwtUkYEBnl/mUaDblmNDX38EyOoW35OILf1tv4TK3m15KxWHMDf5vzgy9tTKQ/7vY
	+aQKFK6SuF66q7w3GmKiWlj99YEXCpToCQbj5f0DvwuZEH2N32uEyYpxvVvYDtqvRHzTr4oRMlv
	vM5HG19+Enf4Qq7nHo5UYg+r1hHPpQhwN/+bvhHRM7PlWB0=
X-Google-Smtp-Source: AGHT+IGdZ0ap/zDeDOQdTus36k54yTLqlQyClICAai4JwJfyBlHaunLZ52nPjac5TD1LxR0uEW0/yQ==
X-Received: by 2002:a5d:64a6:0:b0:3a0:86f3:3e46 with SMTP id ffacd0b85a97d-3a086f33e9emr619737f8f.8.1745848051740;
        Mon, 28 Apr 2025 06:47:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:785:f3a7:1fbb:6b76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbedf4sm11080831f8f.45.2025.04.28.06.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:47:31 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Apr 2025 15:47:30 +0200
Message-Id: <D9IBHEG15AYR.122VJJYNT9QGQ@ventanamicro.com>
Subject: Re: [PATCH 7/8] lib: sbi_hart: add Ssstateen extension
Cc: <opensbi@lists.infradead.org>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
 <20250415131908.2699782-9-rkrcmar@ventanamicro.com>
 <CAAhSdy0_3DrkKWTcA57KDmCgEWV+1Be2hkh8LxrnyO_RXSjzog@mail.gmail.com>
In-Reply-To: <CAAhSdy0_3DrkKWTcA57KDmCgEWV+1Be2hkh8LxrnyO_RXSjzog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_064733_491124_A4A3A30E 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

MjAyNS0wNC0yOFQxODowODoxMiswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4gV2UgYWxyZWFkeSBkZXRlY3Qg
U21zdGF0ZWVuLCBidXQgU3NzdGF0ZWVuIGV4aXN0cyBhcyB3ZWxsIGFuZCBpdCBkb2Vzbid0Cj4+
IGhhdmUgdGhlIE0tc3RhdGUgQ1NScy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Cj4+IC0tLQo+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPj4gQEAgLTMxLDcg
KzMxLDcgQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsKPj4gICAgICAgICBTQklfSEFSVF9F
WFRfU01BSUEgPSAwLAo+PiAgICAgICAgIC8qKiBIQVJUIGhhcyBTbWVwbXAgKi8KPj4gICAgICAg
ICBTQklfSEFSVF9FWFRfU01FUE1QLAo+PiAtICAgICAgIC8qKiBIQVJUIGhhcyBTbXN0YXRlZW4g
Q1NSICoqLwo+PiArICAgICAgIC8qKiBIQVJUIGhhcyBtc3RhdGVlbiosIHNzdGF0ZWVuKiwgYW5k
IGhzdGF0ZWVuKiBDU1JzICoqLwo+Cj4gTGV0J3Mgbm90IGRlZmluZSB3aGF0IFNtc3RhdGVlbiBt
ZWFucyBoZXJlLgo+Cj4gU21zdGF0ZWVuIGltcGxpZXMgb25seSBtc3RhdGVlbiBDU1JzIHdoZXJl
YXMKPiBTc3RhdGVlZW4gaW1wbGllcyBbaHxzXXN0YXRlZW4gQ1NScy4KClRoZSBzcGVjIGFjdHVh
bGx5IHNheXMgdGhhdCBTbXN0YXRlZW4gaXMgYWxsIG9mIHRoZSBDU1JzIGFuZCBTc3RhdGVlZW4K
bWlzc2VzIG1zdGF0ZWVuKiwgYnV0IHllYWgsIGl0J3Mgbm90IHRoYXQgaW1wb3J0YW50Li4uCgpD
YW4gSSByZW1vdmUgdGhlIGNvbW1lbnRzIGluc3RlYWQ/CgpTQklfSEFSVF9FWFRfU01TVEFURUVO
IGlzIG9idmlvdXNseSBTbXN0YXRlZW4sIHNvIEkgZG9uJ3Qgc2VlIHRoZSBwb2ludApvZiB0aGUg
Y29tbWVudC4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
