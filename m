Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03385D5B857
	for <opensbi@archiver.kernel.org>; Mon, 15 Dec 2025 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEiG8Ktx00MvKWQ1w3TMqBW1QsNF6y4WNdbyt7uIk9Q=; b=dWL2mAmnsNq1d8
	V+8R3820Ark5FSPQsTLdvsu5I2pmH/hWmglCAqQVdWg1YPCWpJMmjBkk8Vuvil4PHHbDAI3BvBxwW
	WEmJKkC4nUZu+3FKGlXNeW4QaRjHcyKp0uYACHYyAIAgQ8a3pu46qZ3597o6NWINZKMOZIaGIqZDH
	XSD7EtBBK9nVYmd5yZL2kEVgHDzB8T/ydezUyB2dRJ/tKN2GJnNlwbTbC9adcB7yi8a3e1Gj81PD4
	Smun/k0qVfnhvVGIOnaHoLhVjCOOkfLfFxeMGuFQO1F3JMF9cAVFQQkmSYpK5O6uhoWAr3QAIAa/t
	QR0XKzdmc4R3FIw//IuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVC7p-000000043eC-1Alc;
	Mon, 15 Dec 2025 17:12:45 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVC7n-000000043dm-1P2S
	for opensbi@lists.infradead.org;
	Mon, 15 Dec 2025 17:12:44 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-65b3843853bso2351343eaf.2
        for <opensbi@lists.infradead.org>; Mon, 15 Dec 2025 09:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765818762; x=1766423562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xeXuoGw5XeztjlB2K4b8jJTPJBLZ558R4F0jxExPPs=;
        b=nNIq3I1arKT1eVMig/gQXi6is6acrxXiuZZErt2JCSOjN9l/Q8yF2W1PnStOH7+Eyl
         1I8b7L+OlUTJlXYjmha1Kq5a8V8co+0ZNQi36hWqwyuDRYw4zRJjey7c8PLl5iWgyPf6
         wAf/SDmr2CsBC7+U7PhZwI5xFUtNB2SuWNRmBUAQR15Fg0ybXcQqdFN6ouDVP7JkL6bN
         n++5SyV26AnAGf4OUa3QKhxv4KXY+6rVTx05aCqBfrHjoeci+HZEykfz1KGBIwD4QuUC
         cCA+CK/JaXZBpmWvoTMqeP0J+jD+sH6WbqG7gPQXx4X3E4l9Z3romZXBsAxVqMHXgus8
         O2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765818762; x=1766423562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/xeXuoGw5XeztjlB2K4b8jJTPJBLZ558R4F0jxExPPs=;
        b=Lr0yKThBalqqh71A9rRK9wvaH/tOJGgyQXdjz4mPLUHiMifjmTOrfFdp9e3Jtaq46U
         M96h5kMGOF8GxuizSXdhiUpK47pXpVqKD1H5erTMFdLTgv6KHnzzGcGYmfuB24cPKvSc
         gOG5g4Zb0ZvH7OZs7iknZMyyCdU+vkC7ZU3Ph5wcVIPOz9gyx8nCXksDvzD4Gf9x8HlM
         olFZibk6tEg+7clPh1jU1dZUowayATRy2TSxUAzYRntEZkMPlitQlEAkbq+HtkxnSsmd
         +ITfsQf9lD4hZltxUjvccpE4MpVYxwbmQxefLu36OxQ8hKhxjkbunaY1vCjMX6181RsA
         9WVg==
X-Gm-Message-State: AOJu0YwD+dsue4baRJ/7nl5FxiAiT/NiXA5OUTWWfFRBc52ne09uUm8q
	aVENrvp4A5Ywn2MrWBGNXw7KgQTSJkWmR7yPPTzyYS/iKM21v/+abG82XPdluog+myVTWjoeC29
	hTvqnN50OpNG1muCtnUiT+4obrOXmjfN5QVDHjlHumg==
X-Gm-Gg: AY/fxX4oK6HAmQVr0FiMXmTUbMEIERoY8i2xOOvUMwHncnymW1P6mQtzFxJxEJOdqog
	FJ0Na1Ghtffs7isf+C3sZgzj1OBEAf3VMoYGsbsuFsj1RrFup1Gi2HCWyS0MCPBd6JrPFvrhAlT
	cOBIjvGbzIyCppb6pdZ6sx0llLlnscYCROttkrDDZMEZSxbIyif/a5wdN2WtGn54++fozop7fMA
	fFl7ZW4eJ2biIGGCs7Xqm0RnhLx1nHd6fqVZLlFU6/O0T80zXRVwCsLl8NzyM8VRDujOLss7Dv4
	Iyj3xpsoZbQ2Rqvu2Nep6F9vq2/MNQ==
X-Google-Smtp-Source: AGHT+IFOLbdUoxwTeRsvcVid28uWnRb5oi6t0MX1pYb+v9HJ+B5WBtt8cSEtyxLPc+DtfIr9HIPsb6elpvOZo68MiLM=
X-Received: by 2002:a05:6820:168d:b0:657:6905:56f5 with SMTP id
 006d021491bc7-65b44fd4b3amr5498590eaf.0.1765818760936; Mon, 15 Dec 2025
 09:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20251114203842.13396-1-b.freisen@gmx.net>
In-Reply-To: <20251114203842.13396-1-b.freisen@gmx.net>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Dec 2025 22:42:30 +0530
X-Gm-Features: AQt7F2qYaQ0Ug4c_hCt-0T1QKTVvvAcWU4AZBMQZAZiipy-xb_RjRSZ6sh0fTvY
Message-ID: <CAAhSdy0rdLGhmB__3d0v0L112YT7Jd2ZS0=duJAgBA1D6R96uw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add trap-based ISA extension emulation
To: Benedikt Freisen <b.freisen@gmx.net>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_091243_623136_4C5A4524 
X-CRM114-Status: GOOD (  13.33  )
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

T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMjowOeKAr0FNIEJlbmVkaWt0IEZyZWlzZW4gPGIuZnJl
aXNlbkBnbXgubmV0PiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIHNlZWtzIHRvIGFkZCB0
cmFwLWJhc2VkIGVtdWxhdGlvbiBmdW5jdGlvbmFsaXR5IGZvciB2YXJpb3VzIElTQSBleHRlbnNp
b25zIHJlbGV2YW50IHRvIFJWQTIyLCBSVkIyMyBhbmQgUlZBMjMuCj4gVGhlIGVtdWxhdGlvbiBm
dW5jdGlvbmFsaXR5IGNvbnRhaW5lZCBoZXJlaW4gaGFzIGJlZW4gZGVtb25zdHJhdGVkIHRvIGUu
Zy4gYWxsb3cgdGhlIFZpc2lvbkZpdmUgMidzIEpINzExMCB0byBydW4gc29mdHdhcmUgdXNpbmcg
dGhlIFJWQTIyVTY0IGFuZCBSVkIyM1U2NCBwcm9maWxlcywgYWxsb3cgdGhlIE9yYW5nZSBQaSBS
VjIncyBLeSBYMSAoYSBTcGFjZW1pVCBLMSBkZXJpdmF0aXZlKSB0byBydW4gVWJ1bnR1IDI1LjEw
IChSVkEyM1U2NCkgaW4gYSBkb2NrZXIgY29udGFpbmVyLCBhbmQgYWxsb3cgdGhlIFRlbnN0b3Jy
ZW50IEJsYWNraG9sZSdzIFNpRml2ZSBYMjgwIChHZW4uIDEpIHRvIGJvb3QgaW50byBVYnVudHUg
MjUuMTAuCj4KPiBUaGlzIGZvbGxvdy11cCB2ZXJzaW9uIGluY29ycG9yYXRlcyB0aGUgZm9sbG93
aW5nIGNoYW5nZXM6Cj4KPiBQYXRjaCAxIGlzIHRoZSB1bm1vZGlmaWVkLCByZXZpZXdlZCBwYXRj
aCB2MSAzLgo+IFBhdGNoZXMgNCBhbmQgNSAocHJldmlvdXNseSBwYXRjaCB2MSAyKSBub3cgaW5j
bHVkZSBpbnN0cnVjdGlvbiBtYXNrIGdlbmVyYWxpemF0aW9ucyBhbmQgY29uZGl0aW9uYWwgY29t
cGlsYXRpb24gc3VnZ2VzdGVkIGJ5IFJhZGltIEtyxI1tw6HFmS4KPiBQYXRjaGVzIDYgYW5kIDcg
KHNwbGl0IGZyb20gcGF0Y2ggdjEgNSkgYWRkIGZpbmUtZ3JhaW5lZCBLY29uZmlnIG9wdGlvbnMg
cGVyIElTQSBleHRlbnNpb24gZm9yIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uLCBhcyBzdWdnZXN0
ZWQgYnkgSW5vY2hpIEFtYW90by4KPiBUaGUgQ01PIGZ1bmN0aW9uYWxpdHkgaW4gcGF0Y2ggNiBu
b3cgdXNlcyB0aGUgbmV3IGNhY2hlIG1hbmFnZW1lbnQgbGlicmFyeSByYXRoZXIgdGhhbiBzZXBh
cmF0ZSBhZC1ob2MgY29kZS4KPiBUaGUgU3VwbSBpbXBsZW1lbnRhdGlvbiBpbiBwYXRjaCA2IHJl
Y2VpdmVkIGJ1ZyBmaXhlcywgYnV0IGNvbnRpbnVlcyB0byBmZWVsIHNvbWV3aGF0IHVudGlkeS4g
RmVlbCBmcmVlIHRvIHN1Z2dlc3QgYmV0dGVyIHBsYWNlcyBmb3IgaXRzIGZ1bmN0aW9uYWxpdHku
Cj4gUGF0Y2ggNyAodGhlIFp2YmIgcGFydCBvZiBwYXRjaCB2MSA1KSBhZGRzIHRoZSBPUEVOU0JJ
X0NDX1NVUFBPUlRfVkVDVE9SIGNoZWNrIHJlcXVlc3RlZCBieSBYaWFuZyBXLCBuZWNlc3NpdGF0
aW5nIHRoZSBNYWtlZmlsZSBidWcgZml4IGluIHBhdGNoIDIgaW4gbXkgY3Jvc3MtY29tcGlsYXRp
b24gZW52aXJvbm1lbnQuCj4KPiBHcmVldGluZ3MsCj4gQmVuZWRpa3QgRnJlaXNlbgo+Cj4gQmVu
ZWRpa3QgRnJlaXNlbiAoNyk6Cj4gICBpbmNsdWRlOiBzYmk6IE1ha2UgInM4IiBhY3R1YWxseSBz
aWduZWQuCj4gICBNYWtlZmlsZTogc2Vuc2libGUgZGVmYXVsdCB2YWx1ZSBmb3IgT1BFTlNCSV9D
Q19YTEVOLgo+ICAgaW5jbHVkZTogc2JpOiBGaXggdGFiIGFsaWdubWVudC4KPiAgIGluY2x1ZGU6
IHNiaTogSWdub3JlIHJzMSBhbmQgcmQgZmllbGRzIGluIEZFTkNFLlRTTy4KPiAgIGxpYjogc2Jp
OiBXb3JrYXJvdW5kIGZvciBGRU5DRSguSSkgZXJyYXRhIG9uIEM5MDYsIEM5MTAuCj4gICBsaWI6
IHNiaTogSVNBIGV4dGVuc2lvbiBlbXVsYXRpb24uCj4gICBsaWI6IHNiaTogSVNBIGV4dGVuc2lv
biBlbXVsYXRpb24gKFp2YmIpLgoKSSBoYXZlIG1lcmdlZCBQQVRDSDEgdG8gUEFUQ0g0IGFuZCBQ
QVRDSDUgaGFzCmEgbWlub3IgY29tbWVudC4KClJlZ2FyZGluZyBQQVRDSDYgYW5kIFBBVENINywg
bXkgd29ycnkgaXMgdGhhdAp0aGlzIElTQSBleHRlbnNpb25zIGVtdWxhdGlvbiB3aWxsIHByZXR0
eSBzb29uIGJlY29tZQpyZWR1bmRhbnQgYXMgbW9yZSBhbmQgbW9yZSBSVkEyMyBIVyBzaG93cyB1
cC4KQWxzbywgZXhpc3Rpbmcgbm9uLVJWQTIzIEhXIGNhbiBhbHdheXMgdXNlClVidW50dS0yNS4w
NCAob3Igb2xkZXIpIGFuZCBvdGhlciBkaXN0cm9zIGFzIHdlbGwuCgpNeSBpbmNsaW5hdGlvbiBp
cyB0byBub3QgcnVzaCBpbnRvIG1lcmdpbmcgUEFUQ0g2CmFuZCBQQVRDSDcuIElmIHJlcXVpcmVk
IHdlIGNhbiBoYXZlIGV4cGVyaW1lbnRhbApicmFuY2ggaW4gcmlzY3Yvb3BlbnNiaSByZXBvIHdp
dGggdGhlc2UgdHdvIHBhdGNoZXMuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
