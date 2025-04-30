Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55641C369DC
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 05:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2QTJ1C34sy2cD4N63SZh1S/JC+Zwt3/gKk22f9npCI=; b=BTKQMUxZuClAXC
	HWlnlh3KTaed4d4039D+oLUgnzD87EeFxu/wjZoLN2keQXz2X9ECpGeLuDue3Ik01LoB8IQwUoKQY
	8q495OTW8NXsR9SJKgPBm8EfSSZRXRwsdg8ir9MfKCgg/1hNyJlOwphQi3hzy6ycdIWAssLVLooYg
	ejiiePIFBhUdtqtLhkf2FU4RlN9T0uy7k1BcR9EG6EOIDUTBVg6LUeHA7atK3p/YLY38w65sicZYn
	5eZ/O6AUpXNpiS0aonOjkDZ2yr58QYcmHTU7+Dx7u7AEfh23iMz/xQ9QRKDzsgdct5JwvlbJXDrSO
	BGL64pvlrFSrEVNs+jPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA036-0000000BlI5-0Gvo;
	Wed, 30 Apr 2025 05:32:00 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zzE-0000000Bko8-0nP4
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 05:28:01 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d9189e9a06so23726015ab.2
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 22:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745990879; x=1746595679; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4YGb2dwx3DPPg76P+7TDrRWn+FjEnpx6+AxASkKsK8=;
        b=S1DHptsBjdmMBR7RDp5f+2l/4lEnVYrr0pxiBWyhxGE0aT/daQPc4vAHMczuKTprd9
         TI8oHv8ePbMajxtcma7JfeaRkh/M0zeu5p69w+zUFZfVQtvLRj+mrByrqzuiIecnq91e
         hpX+Ji/KWBbFJ3sUSovM7m3Enk/EIS0x0GA5gy+6z4wDSjcqeqxtNlz7DjPm+kyGCfIY
         VlxH7QShh4quPZ6cBljhQXXYevVukWm0Fu9lpPhj9/5IlxCRJvtBpDBekQ8gJucChzq2
         OMoiGUIeK3g9b3mxwD4DY8q6pJLzNBZOfizG/tvWiY84yLGH+GHWO7FiMQF29d+8GAoV
         /wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745990879; x=1746595679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4YGb2dwx3DPPg76P+7TDrRWn+FjEnpx6+AxASkKsK8=;
        b=mOTRHrWIPvC0CNLTxsbp/LkgTGaKxlwwiBLjEkUsu66aYUb/wJVKHQKqjVNyvRZSfj
         XiQ6u/84JPtwiA/+OZlHXal/NAmKOUECdz8tHS+VFf5C3MHdwsPH6NoAJ19Ew8CKYuZy
         Et6sDtomusseVpEskKllJwRb2HIbHH2JNDQUm3i02wFi6YYOdqFV7jiwrTFB7vqYjw+N
         fl+0SmH6beiyRQC+6vm8kjU2B7qwF31oG98n8JhKX3CBHczP5uOB3hufWqWLwp3Xbg9u
         /3GtIQqIadkR72Lmxc3xeQZdg6eaGsaDNUeZKsLh2hYaAeHDOqP4GMTvBjs5/EU/Lf9G
         EOvQ==
X-Gm-Message-State: AOJu0YzO51GElasdL+1t5lsdnf8Az5wiE/VpZQPtGmFe6xYbW6IenuEE
	0mVfFrfIlu8cTPka++00m4h0NmxIrBB5R8xPD5ty7o8gB7xI+7Vfw7FpzaFwJGFDfB8Z/bqR3Fe
	ERkoRESDeEB8veBZYeeNJaxv20oGXJfmIjyYrwMTTrjb+46q2
X-Gm-Gg: ASbGncv04QA3ofYy6vJssW2Xh88+/l8q9EkLkb4WkL0d9boiiP4HelQ/RKEJ4VH785a
	7y3twSNdQ70aZVwtaj6vIbUMJnsF2rMkLc2apJwhaPiyLWlVWsoHtVEZ4GWZH6DXGZyoNlyCsrH
	DcMF0qIhQuiI5P6nluGosMSUo=
X-Google-Smtp-Source: AGHT+IHPRBXrHXdhVEx9PSF+sKTTp5+XSmXQURnzCrMPJkhBgk+g4MMXgVoXdkeYPwNKszUjakyLiCBNKr5UgkiPqR0=
X-Received: by 2002:a05:6e02:188a:b0:3d8:975:b825 with SMTP id
 e9e14a558f8ab-3d967fa1b89mr10170255ab.5.1745990879144; Tue, 29 Apr 2025
 22:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Apr 2025 10:57:47 +0530
X-Gm-Features: ATxdqUHiZD-XzRfaCn8sI8GrHK9w1Ike5i8w76n720VnyFMeKeks8m4DCAW67H0
Message-ID: <CAAhSdy1znjZebByZDBooY=Ghv4cG_WdiqqDx+DF=cy=GjNkDeA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Reset more security-related CSRs
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_222800_228172_1D64561B 
X-CRM114-Status: UNSURE (   7.53  )
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

T24gVHVlLCBBcHIgMjksIDIwMjUgYXQgODowMOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gYWxsIHBhdGNoZXMgYXJl
IG1hcmtlZCBhcyByZXZpZXdlZCBieSBBbnVwIGFmdGVyIGltcGxlbWVudGluZyBoaXMKPiBzdWdn
ZXN0aW9ucy4KPgo+IHYyOiBbMS84XSBSZW1vdmUgcmVkdW5kYW50IG5ld2xpbmUuIFtBbnVwXQo+
ICAgICBbNy84XSBJbXByb3ZlIGNvbW1lbnRzLiBbQW51cF0KPiAgICAgWzgvOF0gUmVtb3ZlIHBv
aW50bGVzcyBTbXN0YXRlZW4gY2hlY2suIFtBbnVwXQo+ICAgICBbMS04LzhdIEFkZCBSZXZpZXdl
ZC1ieSBbQW51cF0KPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI1MDQx
NTEzMTkwOC4yNjk5NzgyLTItcmtyY21hckB2ZW50YW5hbWljcm8uY29tLwo+Cj4gUmFkaW0gS3LE
jW3DocWZICg4KToKPiAgIGxpYjogc2JpOiBhZGQgNjQgYml0IGNzciBtYWNyb3MKPiAgIGxpYjog
c2JpOiB1c2UgNjQgYml0IGNzciBtYWNyb3MKPiAgIGxpYjogc2JpX2hhcnQ6IHJlc2V0IGhzdGF0
dXMKPiAgIGxpYjogc2JpX2hhcnQ6IHJlc2V0IHNzdGF0ZWVuIGFuZCBoc3RhdGVlbgo+ICAgbGli
OiBzYmlfaGFydDogZml4IHNzdGF0ZWVuIGVtdWxhdGlvbgo+ICAgbGliOiBzYmlfaGFydDogcmVz
ZXQgbXN0YXRlZW4wCj4gICBsaWI6IHNiaV9oYXJ0OiBhZGQgU3NzdGF0ZWVuIGV4dGVuc2lvbgo+
ICAgbGliOiBzYmlfaGFydDogcHJvcGVybHkgcmVzZXQgU3NzdGF0ZWVuCgpBcHBsaWVkIHRoaXMg
c2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
