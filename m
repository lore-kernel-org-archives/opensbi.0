Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EEDC4452B
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wB/TiOCzKF+y0Ipl9NpEnoTM8Fr6BRUt40wb5tWVjPU=; b=MGrm9nhtLdazWR
	f5uVC0aPe4IZvQy8A2OxHkFHzlTtk0n1sXZuLY6Xp7lZaME3IIzsW0deKWyry1FYvYehVZ3WXBKJm
	4ocvKMb/TeLXvTtzEr82EGGQKI4k8Ny2dtv6aOSuvVWdkzX8aiU+KW/8eYPpUqzQPX5BlGs+mVJEm
	ahgLdXiIncj05+pAhNywalGV7IRarK+nTIPyCLfu/SBdDvkjxWethV8RPdLE7qDyOlXNbhoni2k+o
	S09JGUQu+qorFnRa4p5GdlOKEVRVxCcVFGHb2FmSfl3t0B7wN2veI6tPZE587d1kCxNN3VsT+bk+s
	9MEOp2UR1PVZBuQz9YGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3ar-00000008UNl-1ME8;
	Tue, 21 Jul 2026 06:04:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3ao-00000008UNM-2Dlt
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 06:04:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954dff6536so22778355e9.0
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 23:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784613876; cv=none;
        d=google.com; s=arc-20260327;
        b=nSHRpKegD9SJBqX9ADERRvGHZ30j+5XAzu4oUObNtF68MNvaciumvuf8uf9Z4tW4ac
         SXDvGv2iPKKHr1YC7fuir9oIQcGGLy63VBx+tu8RQH++ALZdv2/+pWPl6qJfKC+IsYia
         SMSAhdNrFOireKuovQHkpo8peS5KMenYaljUiy3HGreJWmUSHxjvhP3HwfUbQLCoczNx
         zqJXy1APG1PvkivwgCsVkIs4r2s3S06r6biHHE+11jpx92e5fIMDkYkanXptJw24tYuy
         MdzqtuV3tv20Op48ayTDlH14vktRinWdbgreTihCTXvntwsDAUmb53t2OsXI1QWdYZ9f
         e5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vWTO+GITZwa3Vq63JFYeW+X+HaGnAolsbUL7XLjRde0=;
        fh=ZCleIeCuvalAUj9qGOxeU0u7iejbHjoJjmhSG+SBUcU=;
        b=fO0gKNEhB/nN6rH9yhcencRXD9cBdmvim84gkbtPwGE4ADxWcH0fwktjGdvR2TkvKv
         TCxaFul3xNoONXTCmFgxayy3FxQNDFxQurG9x5j2bWh8+P2ffxlJzF9UGy7povzPm03g
         4XtsOd6ad+hLucY55UiwMzIEmHLyqA8k/nFBCL6OmTuMYKTa1gTBcV1yaoknqa8a9mZu
         pkUVgC7aGQM8LQCSMZeMxSxyT2Bmm4yWPe54BDfhaiIY6M+wTmEI6rsTvvvCUOqM2A4N
         dfxrl+hH6vbtdakjVZ9zn+dklawpTIo81jj9c9GyB68YHiSb7SlS367JN7PmBpn1jSNM
         mmUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784613876; x=1785218676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vWTO+GITZwa3Vq63JFYeW+X+HaGnAolsbUL7XLjRde0=;
        b=C4wW5MX4USmuyDySZRpKg6AUxejZP+ZtIJtWpi+6K9xaedXH59q2TyCcidjksnAt1K
         a9OkQ0gShFWhINI2U1RoIchN0eWjV7TRcwNnh7vuiaozxrL+v/o+KuO6yJ7UgHqFwQzi
         XYHR8NuvR48IF+MCQcy11M/LB/qDiKaBLYLla6yeNIykFq5643ScOlQQbtdAU3nV/7M1
         5FRJFuJ4ONbwNX4rqQWzJuQlrYAUzbX4VjBZ8gnVNf/XqKm37fGDtMVs4NrNBRxX5JBS
         Fow/Fz0tO2/6VYFpJoH+K7d19T8Q5pkoLxnjNk2kCPqocy07wWJptTIIbLH9S2L+vknj
         +enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784613876; x=1785218676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWTO+GITZwa3Vq63JFYeW+X+HaGnAolsbUL7XLjRde0=;
        b=a/DQZg0uodgmRY/iQaMAQk2XbcUJxDyd5TTxfmkl2ZwKubTjADYLW4JzdpXPyG7uEO
         hTHmyFk9vEk+6nte3TlsHQ9+CeX3FJHBWbLi2qmQruGGGUaGg5GqhyuPDfT7za6c/wRc
         C1r7FjvJZP6WA/vW0+dKrLmx+doDc/O1QGeT2sijyM8C/KbOn/FQ0REQYhbWcO3bxDqI
         lJCKZhXY69Wqdg1RK1lcNu7hCKd7PHDzK5KxAkQQeHA86Q5tr7eXSd/rSAZPNIeLCdQH
         sn5lYyzwpxl2w4w7rJrmqcinLg6VosGk9PbErF2ac6h2gygcHdbvWXclO7u7HCFuYXjm
         PdYg==
X-Gm-Message-State: AOJu0YylctOc7GQF1uXEHeX8Evtg4TCI0eXt/edIdU/MS+lv9PwXZqAv
	M8bY1CaW0nXZ7bJ3bnTO7lzj/NSMEis/6SgkshzLWgO8ond6mcttzmowXc4Y1lWqn7rgGW8qc7R
	k+7S4nWpXixx/I6hrOX/OOo0vQuZVIJTWg0C58KYqnsgZ2hBZPKS6
X-Gm-Gg: AfdE7cnATUife2zlwIUkCCkmDDLjrT03u3qqiGUykFhMOFEVrTLAtIbgKeqfzQkGZa9
	1o8G1TbydDu8BKRnDXaYmo714o1T9BfjGdM1lc6z9FBvf6U5qKJXu1pzE6Nq7R0C6bj8ktaltyj
	9/xFPGqqPD/RgJYBKVN0YZehbAaqYybbTyl7NB4qzxzUtF1g6VJv3Pkl0WjniZPnf/4R3rMUi6r
	d8eXdinn1ebkvT6JTi2O2lxi9bWb8LF+P/NCAjvgtZAynHCfr7BCriKoQw+kh+VEV617GxUunqY
	DWcERBxc20EumkRdKp29bBj2Ugvskj+ynUlU+ruHkC1GpYNhAE/OXvqLpZgoQ4s3pJLZ8c9GIez
	dH2KTzg==
X-Received: by 2002:a05:600c:4f92:b0:495:f31:7340 with SMTP id
 5b1f17b1804b1-4954a3d06e4mr181434605e9.5.1784613875758; Mon, 20 Jul 2026
 23:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260612115208.118132-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260612115208.118132-1-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jul 2026 11:34:23 +0530
X-Gm-Features: AUfX_mxXzVQ_k3Moy-r0Kbs0eL-h2qN-Im5yzwUoW9fM1hLyG1FyA4XRld88Nq4
Message-ID: <CAAhSdy0XEA8K=okZL3vaR+e6nKEx+3NZ+hYy2HOCSsQmRb2P5Q@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_ipi: Validate hartids against domain, not HSM state
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: opensbi@lists.infradead.org, andrew.jones@oss.qualcomm.com, 
	guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_230438_842687_5AFDD9F8 
X-CRM114-Status: GOOD (  20.89  )
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

T24gRnJpLCBKdW4gMTIsIDIwMjYgYXQgNToyMuKAr1BNIENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gQ29tbWl0IDM3ZWFjYTRhYjMzZCAoImxpYjogc2JpX2lw
aTogUmV0dXJuIGVycm9yIGZvciBpbnZhbGlkIGhhcnRpZHMiKQo+IGFkZGVkIGEgd2VpZ2h0IGNo
ZWNrIGFnYWluc3QgdGhlIEhTTS1pbnRlcnJ1cHRpYmxlIG1hc2ssIHdoaWNoIGV4Y2x1ZGVzCj4g
aGFydHMgaW4gU1RPUFBFRCBzdGF0ZS4gVGhpcyBjYXVzZXMgc2JpX2lwaV9zZW5kX21hbnkoKSB0
byByZXR1cm4KPiBTQklfRUlOVkFMIHdoZW4gdGhlIGtlcm5lbCBzZW5kcyBhIHJlbW90ZSBmZW5j
ZSAoZS5nLiBUTEIgc2hvb3Rkb3duKQo+IHdob3NlIGhtYXNrIGluY2x1ZGVzIGEgaGFydCB0aGF0
IHdhcyBzdG9wcGVkIGJ5IENQVSBob3RwbHVnOgo+Cj4gICBfX3NiaV9yZmVuY2VfdjAyX2NhbGw6
IGhiYXNlID0gWzBdIGhtYXNrID0gWzB4M10gZmFpbGVkIChlcnJvciBbLTIyXSkKPgo+IFZhbGlk
YXRlIHJlcXVlc3RlZCBoYXJ0aWRzIGFnYWluc3QgdGhlIGRvbWFpbidzIGFzc2lnbmVkIGhhcnRt
YXNrCj4gaW5zdGVhZC4gVGhpcyBzdGlsbCByZWplY3RzIHRydWx5IGludmFsaWQgb3IgY3Jvc3Mt
ZG9tYWluIGhhcnRpZHMsIGJ1dAo+IGFsbG93cyBIU00tU1RPUFBFRCBoYXJ0cyB0byBiZSBzaWxl
bnRseSBza2lwcGVkIOKAlCB3aGljaCBpcyBzYWZlIGJlY2F1c2UKPiBhIHN0b3BwZWQgaGFydCB3
aWxsIGRvIGEgZnVsbCBsb2NhbCBUTEIgZmx1c2ggb24gaXRzIG5leHQgSFNNIHN0YXJ0Cj4gYmVm
b3JlIHJlLWVudGVyaW5nIFMtbW9kZS4KPgo+IEZpeGVzOiAzN2VhY2E0YWIzM2QgKCJsaWI6IHNi
aV9pcGk6IFJldHVybiBlcnJvciBmb3IgaW52YWxpZCBoYXJ0aWRzIikKPiBTaWduZWQtb2ZmLWJ5
OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRv
IHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi9zYmkv
c2JpX2lwaS5jIHwgMTEgKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pcGkuYyBi
L2xpYi9zYmkvc2JpX2lwaS5jCj4gaW5kZXggNWIyZDJmNzIuLmIwNGE1ODc3IDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX2lwaS5jCj4gKysrIGIvbGliL3NiaS9zYmlfaXBpLmMKPiBAQCAtMTM2
LDYgKzEzNiw3IEBAIGludCBzYmlfaXBpX3NlbmRfbWFueSh1bG9uZyBobWFzaywgdWxvbmcgaGJh
c2UsIHUzMiBldmVudCwgdm9pZCAqZGF0YSkKPgo+ICAgICAgICAgaWYgKGhiYXNlICE9IC0xVUwp
IHsKPiAgICAgICAgICAgICAgICAgc3RydWN0IHNiaV9oYXJ0bWFzayB0bXBfbWFzayA9IHsgMCB9
Owo+ICsgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX2hhcnRtYXNrIGRvbWFpbl9tYXNrOwo+ICAg
ICAgICAgICAgICAgICBpbnQgY291bnQgPSBzYmlfcG9wY291bnQoaG1hc2spOwo+Cj4gICAgICAg
ICAgICAgICAgIGZvciAoaSA9IGhiYXNlOyBobWFzazsgaSsrLCBobWFzayA+Pj0gMSkgewo+IEBA
IC0xNDMsMTAgKzE0NCwxNiBAQCBpbnQgc2JpX2lwaV9zZW5kX21hbnkodWxvbmcgaG1hc2ssIHVs
b25nIGhiYXNlLCB1MzIgZXZlbnQsIHZvaWQgKmRhdGEpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzYmlfaGFydG1hc2tfc2V0X2hhcnRpZChpLCAmdG1wX21hc2spOwo+ICAgICAg
ICAgICAgICAgICB9Cj4KPiAtICAgICAgICAgICAgICAgc2JpX2hhcnRtYXNrX2FuZCgmdGFyZ2V0
X21hc2ssICZ0YXJnZXRfbWFzaywgJnRtcF9tYXNrKTsKPiArICAgICAgICAgICAgICAgLyogVmFs
aWRhdGUgaGFydGlkcyBhZ2FpbnN0IGRvbWFpbiBhc3NpZ25tZW50LCBub3QgSFNNIHN0YXRlICov
Cj4gKyAgICAgICAgICAgICAgIHJjID0gc2JpX2RvbWFpbl9nZXRfYXNzaWduZWRfaGFydG1hc2so
ZG9tLCAmZG9tYWluX21hc2spOwo+ICsgICAgICAgICAgICAgICBpZiAocmMpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+Cj4gLSAgICAgICAgICAgICAgIGlmIChzYmlfaGFy
dG1hc2tfd2VpZ2h0KCZ0YXJnZXRfbWFzaykgIT0gY291bnQpCj4gKyAgICAgICAgICAgICAgIHNi
aV9oYXJ0bWFza19hbmQoJmRvbWFpbl9tYXNrLCAmZG9tYWluX21hc2ssICZ0bXBfbWFzayk7Cj4g
KyAgICAgICAgICAgICAgIGlmIChzYmlfaGFydG1hc2tfd2VpZ2h0KCZkb21haW5fbWFzaykgIT0g
Y291bnQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKwo+
ICsgICAgICAgICAgICAgICBzYmlfaGFydG1hc2tfYW5kKCZ0YXJnZXRfbWFzaywgJnRhcmdldF9t
YXNrLCAmdG1wX21hc2spOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICAvKiBTZW5kIElQSXMgKi8K
PiAtLQo+IDIuNTAuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
