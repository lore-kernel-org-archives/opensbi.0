Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A01D185EF
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dF2GY/6IIiEo7ajjT7p3S8Un/WZRynZJWz9ObOMSaHI=; b=L4w1nGfa+uzCQS
	FhjenoGtbvXBNprgSFEV41G04E9t7t5ZDCb/hJdOD4RGS3gHjUZYo60nQl8FTWv4G8pClMKfNN8pX
	B9iNZwjLUZtRO3rD8lTU1ZRevypdQomjHViq17DwluxXbrwQlBQ5Xfz5nL40etcJznkU+i4LXqaW1
	ePf3TwEZNYg2QeqRDc135Uwcsc7M0GAC/rSDkdlJzj1dZJ7nwI4KInioJRdhvS5Quk6j+LxVtxU5/
	//h/kfdZ6mbbYf9cdt+LdlUibzMmEFWiCI5a/gBvK097lss7e41bRfR81bCiuBA2kMFzGC1rmiLEE
	xhavevTeYJI1gOGrNrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpcA-0000000H5OV-09tl;
	Thu, 08 Jan 2026 12:59:46 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpc7-0000000H5NB-0VG7
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 12:59:44 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7c701097a75so1805764a34.3
        for <opensbi@lists.infradead.org>; Thu, 08 Jan 2026 04:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767877182; x=1768481982; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvqQ95JbBpu+tDxD7fG0xVB++RRwqpZNzcNGcg89K0Q=;
        b=T4eQouBsp+6DvfSu+VxFEcbZEO0NKE5xrfYY/egZDsbXIoslaRsbd/8B8uKXnWvvSU
         sIHvIQTiSoaAPTSP5LIrVf8ks8rZez5NTzMB6PDnkeAp/MJOk0zNm4XQGIJpUOGWfwl9
         ftRMQSfVTbXi2iMLHRCBBsXwrhaMAxcI0BX3ulBSFZRhDMPY8LU1oTVg98U0Zn2ATIC6
         7G3RDPFbHPDH+1Hy+THEUdFbUyvUyxRqJDRy7uTedJc+R90JpqAQ11MDbiNDdBkwPRF9
         H5JtLdJ6vriZXtSkirAoMKjx2VCTPAv6jDWzR658jwjPQQSgdl2uQjklqDuT+mJTOZU9
         YKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767877182; x=1768481982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvqQ95JbBpu+tDxD7fG0xVB++RRwqpZNzcNGcg89K0Q=;
        b=PQclKSPztoo+rHMa3xzuUXtD/3A5QCUejc0lTsKaNQuaJlF8cvlyMWVkuXFCaCp+b/
         h6AsQnK5fp8NxNvGN06ePBdH+BTgeuMOHXKoo6dZbXBH3JJcUwhMtGzOwM93PiiVm29R
         oGjv7DIdN2AAWSCVrIIbhul+FWFmqmoprxHr2C2IANsW/WXWYtbX22tVGmB886S1Pixf
         21Ydd8LwPMA0exUHsTDI3M8AmBoiRtbfov35SllKgzQVZNum8xtIe0fO7MeFEe+XdcfR
         5GRSKv/V7dQozf3TwQ9UlvYsrgRLcPqaEUVvM9+NVTXAii/Tvv/inbgUmeikyaNF9rWP
         xfmg==
X-Gm-Message-State: AOJu0YyPoKKgxpscaNXAHF3aQ1srYM0Pcbx+sQSqkVXCvII1Cg9YvGNO
	BCvX4YyBUOz1ndTyOgc4568XgKOdukUhdXwZ1dPpu2dvYCo/OSjbzoN/pvGMwgzt+SMjSv0f5lO
	X9Qbv6LEGb9K2GDg+55dnAKZJ63uGETSPLSkaOzTaTg==
X-Gm-Gg: AY/fxX6wMkP59za8mlpBh+kZQMgeqe5i22GfRjBLYpIEEG+KA37ANMCNe86zxhkWv6j
	wAdVQ6pih+cWDNEMlIAQX2KbWpa1CzGzl8skCjeEPSnG5wNzL5W8ckB1P/XbaP0Q1UfEpiUHWy3
	ocBmqKaeEI84b91f3dlpR0z+tz1IlMh26wK0OGTBJIzh0k6hfqP1tWvLkZfaWy45Ta7mPJp7cTl
	02riQKSfFqzo7nV+1KRCymKsACqywTEism2MQXbJwYqQ4eAUxUgOssl7f0c543d/DFA4EHxPX2r
	QXLefvUShWl2Poa+R1B+wOW9s9TLVv7IJl+xOTcvw/p+RykPLfMxrAxz2g==
X-Google-Smtp-Source: AGHT+IGSQQ4kz/9fLav2DGv5v9X0JMmrTK/44W6Vav0n0Qf9VDEeLozU4hDKxvV7gD3xZYCPiMPlnuRlzfmGE/jJ4fM=
X-Received: by 2002:a05:6820:30c:b0:659:9a49:8f55 with SMTP id
 006d021491bc7-65f54ef65a8mr2014364eaf.26.1767877181828; Thu, 08 Jan 2026
 04:59:41 -0800 (PST)
MIME-Version: 1.0
References: <DS7PR12MB6008258B7DC96734FD736C3A9485A@DS7PR12MB6008.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6008258B7DC96734FD736C3A9485A@DS7PR12MB6008.namprd12.prod.outlook.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Jan 2026 18:29:30 +0530
X-Gm-Features: AQt7F2q-EuOZWq4lXdT_QwJYK1yv5_gayCM0ElBOKgZRRsQ8VxuWTRh124lzqD8
Message-ID: <CAAhSdy0UpXUcMa09BLNp16A8APY43LmrTxFq3Q-cjo+eTyJVSg@mail.gmail.com>
Subject: Re: Release cadence page for future OpenSBI versions
To: "Belsare, Akshay" <akshay.belsare@amd.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, "Simek, Michal" <michal.simek@amd.com>, 
	"Bollapalli, Maheedhar Sai" <MaheedharSai.Bollapalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_045943_409169_8A7D26BD 
X-CRM114-Status: UNSURE (   8.52  )
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

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA0OjM54oCvUE0gQmVsc2FyZSwgQWtzaGF5IDxha3NoYXku
YmVsc2FyZUBhbWQuY29tPiB3cm90ZToKPgo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBBTUQg
SW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldCj4KPiBIaSBUZWFtLAo+IEknbSBuZXcgdG8gdGhl
IE9wZW5TQkkgY29tbXVuaXR5IGFuZCB3YW50ZWQgdG8gYXNrIHdoZXRoZXIgdGhlcmUgaXMgYSBw
dWJsaXNoZWQgcmVsZWFzZSBjYWRlbmNlIHBhZ2UgdGhhdCBvdXRsaW5lcyB0ZW50YXRpdmUgZnV0
dXJlIHJlbGVhc2UgZGF0ZXMgYW5kIHZlcnNpb25zLXNpbWlsYXIgdG8gT1AtVEVFIChodHRwczov
L29wdGVlLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9nZW5lcmFsL3JlbGVhc2VzLmh0bWwjcmVs
ZWFzZXMpLgo+IElmIHN1Y2ggYSBwYWdlIGV4aXN0cywgY291bGQgeW91IHBsZWFzZSBwb2ludCBt
ZSB0byBpdD8gSWYgbm90LCBJJ2QgYXBwcmVjaWF0ZSBndWlkYW5jZSBvbiB3aGVyZSB0byBmaW5k
IHRoZSBtb3N0IHVwLXRvLWRhdGUgcmVsZWFzZSBwbGFucy4KCkN1cnJlbnRseSwgd2UgZm9sbG93
IGEgaGFsZi15ZWFybHkgKGFrYSA2LW1vbnRocykKT3BlblNCSSByZWxlYXNlIGNhZGVuY2UuIFJl
Y2VudCByZWxlYXNlIHdhcwp2MS44IHdoaWNoIGhhcHBlbmVkIG9uIERlYyAyMDI1IGVuZC4gTmV4
dApyZWxlYXNlIHYxLjkgd2lsbCBiZSBpbiBKdW4gMjAyNiBlbmQuCgpTb21ldGltZXMgd2UgaGF2
ZSBpbmNyZW1lbnRhbCByZWxlYXNlcyBqdXN0CmFmdGVyIHRoZSBhY3R1YWwgcmVsZWFzZSBpZiBz
b21lIGNyaXRpY2FsIGlzc3VlCndhcyBtaXNzZWQgb3V0LgoKVW5mb3J0dW5hdGVseSwgd2UgZG9u
J3QgaGF2ZSB0aGUgYWJvdmUgd3JpdHRlbgpkb3duIHVuZGVyIGRvY3MvLiBGZWVsIGZyZWUgdG8g
c2VuZCBhIHBhdGNoLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
