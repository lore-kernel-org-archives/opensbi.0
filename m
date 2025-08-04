Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92696CA0EC0
	for <opensbi@archiver.kernel.org>; Mon,  4 Aug 2025 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBMSBphvTAGQYOcgkBMfK0FdNAL+EplwEVdsWQLgTrE=; b=kThADaHWMwkK52
	5xYHcSTlpmxJbqLMSeGvBW6SAq4LTkOW09/d4Zz1UZX5im7kbKokR7nezML2XR72Ab9PJWqPl8k5T
	9OspPEYApLBXOdT+eRo2BFMupjsqUnyGeBqn0GVaq6F+fdiBGkkXANeX7xQOTwuzvZrWvP42Y5ZbT
	xm1LnRlXD6GGRllPCGv4pbeOqV1dRlJEp2sfoE6+G2w6ClwdC9gWp3wI4W3vC5T4XFSeHrQRF3lQy
	1CZS9sVpiOs92/VElBmLvZ0BsrUfPtc/CqhIEdh0+RCH1L0Ld91GwFtgC4CmOjxt8JGjaZth5JUm7
	VNTLBD3IsOGQpR90E4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqsx-00000009zge-2My5;
	Mon, 04 Aug 2025 08:49:35 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqie-00000009yED-2bQB
	for opensbi@lists.infradead.org;
	Mon, 04 Aug 2025 08:38:57 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e3f0287842so35366495ab.3
        for <opensbi@lists.infradead.org>; Mon, 04 Aug 2025 01:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1754296735; x=1754901535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6GXNKhTmGm0N6AlbNOuly+jrolEemnzFlOrBuqYXwg=;
        b=w5uuFQnch3WRPXkAxZjeXrnBmN89HZSpl4LAOnGzCc85K7Jg8HaOvjYywG7AJkmkL5
         LdmgIRiEOENXJFfIlMstHd61YEv+0mo/SaTZkEVt8LWEWdy5K88JqJivDDW7kliYe8s0
         6pUZNsS7wBXHPSOyAnf2jHdyw/4FYpeFLUZOZlSgyG/0q3z+5cFJotH1Z3hSYiQxJ+mo
         whhajMkQTSBy/Iq1ZeE3wwB8lUkeO6IbBQdwPnV5nfN5QIExyoKKxR4hO2ry4CJC+2rk
         Yu6C1YYehjrOWwsmeuN4g8bRPAOUNOlZ99VjtvnJwwyfUXYD7kR5CNqiY/DcAcWttIuk
         izYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754296735; x=1754901535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6GXNKhTmGm0N6AlbNOuly+jrolEemnzFlOrBuqYXwg=;
        b=LoyzFAvAqGzAx1X4OMp9GIs9qcVJ2/HNmp8W3xcf7KSnWiDmHpcqiTO8j64ORwK0SP
         v+lIWrnldjAg3t5b1VZHPsruNXpRY1FFO0l3t3+InK60kTM2TR/wXE+Jgr6U1qpatBFK
         HDNoLBuPt1ZXo2SoJHOhf5slDCrsEN2qtbL+NodDhg/AJpZymK/sW41ctx97RWiFRMx6
         6kRo5pUU6q5h1mkRVvWVpSfgnt6EFtbt2HQo0ZHXW0gf0LYIHeoNot2WPukfl4FPw2Tn
         Mk+p0dcgbihB9/ImDaRhcvK1lt2xFKVNIj7twi8VwMvDf/STQKc6OLaHjfV0T0FsgjW3
         Z0TQ==
X-Gm-Message-State: AOJu0YzOU5sVbGxeVIdRQkSeZO/1Uy1lVA71tQx7ZQeWHr+ol//LfMWf
	dfLryx8Utmn33tZYofcAzoacJBGJ8h97WE32TJRGAzu9lAam7fHhQwLW8PKm9E3Ivq5YyHgnJ44
	ECa0JNyUueo3FJVW5cFPSb896M+MoelqUG0zVqsBkawsK13gGTS+R
X-Gm-Gg: ASbGncsvgFkkzh500rMu496k8iSsC0VctKlBRhufyOCkZ37M9Fbf2FbkBlB4srguvNf
	Tp6VcGQr7wDMkUnpmhkhm5Tc9k50bj1EPHoF+L1je5Ml21Ns3bsuyk+bBI8LzyQNGhS337VOv3Y
	YTMQs7AqqqU6TNkmg8pB+FFfuWz+Cs4+7LODMZtVZGk/attm+a5US9NWlpJWGfTFchO4rut+afR
	SMPa1Y=
X-Google-Smtp-Source: AGHT+IFYv9AfW/HUjSqN6Xz+dx3bfgCk2zOrGjo8S25SkSR/1rmQXYDMoWEncydWUk0Ltl2c6KWPWy2OuduDWcf02+A=
X-Received: by 2002:a05:6e02:1808:b0:3e2:9e8b:b64 with SMTP id
 e9e14a558f8ab-3e416099873mr149101355ab.0.1754296735613; Mon, 04 Aug 2025
 01:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250708074940.10904-1-nick.hu@sifive.com> <20250708074940.10904-8-nick.hu@sifive.com>
In-Reply-To: <20250708074940.10904-8-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Aug 2025 14:08:43 +0530
X-Gm-Features: Ac12FXwwvYz0KY5S1D5igLnJrV_oVpkEBDmGi9I_XEo1gJLM2YRwrXeWkTTqVH8
Message-ID: <CAAhSdy24APsfMTbeaEpPU+rB-9YeYB99wPYBWZARdCSvaepiXQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] lib: sbi: Add SiFive proprietary xsfcease
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_013856_669530_79D791C3 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: vincent.chen@sifive.com, opensbi@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgOCwgMjAyNSBhdCAxOjIw4oCvUE0gTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IFVzaW5nIElTQSBzdHJpbmcgInhzZmNlYXNlIiB0byBkZXRlY3QgdGhl
IHN1cHBvcnQgb2YgdGhlIGN1c3RvbQo+IGluc3RydWN0aW9uICJDRUFTRSIuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEN5YW4g
WWFuZyA8Y3lhbi55YW5nQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0
LmggfCAyICsrCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgfCAxICsKPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFy
dC5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+IGluZGV4IDU2N2UwMTMwLi5kYjZmNGFkYiAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gKysrIGIvaW5jbHVkZS9zYmkv
c2JpX2hhcnQuaAo+IEBAIC04Myw2ICs4Myw4IEBAIGVudW0gc2JpX2hhcnRfZXh0ZW5zaW9ucyB7
Cj4gICAgICAgICBTQklfSEFSVF9FWFRfU1NTVEFURUVOLAo+ICAgICAgICAgLyoqIEhhcnQgaGFz
IFhzZmNmbHVzaGRsb25lIGV4dGVuc2lvbiAqLwo+ICAgICAgICAgU0JJX0hBUlRfRVhUX1hTRl9D
RkxVU0hfRF9MMSwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBYc2ZjZWFzZSBleHRlbnNpb24gKi8K
PiArICAgICAgIFNCSV9IQVJUX0VYVF9YU0ZfQ0VBU0UsCgpzL1NCSV9IQVJUX0VYVF9YU0ZfQ0VB
U0UvU0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0VBU0UvCgo+Cj4gICAgICAgICAvKiogTWF4aW11bSBp
bmRleCBvZiBIYXJ0IGV4dGVuc2lvbiAqLwo+ICAgICAgICAgU0JJX0hBUlRfRVhUX01BWCwKPiBk
aWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5k
ZXggZTkxZTExMjMuLmM5MDM2MDg0IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+
ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC03MTYsNiArNzE2LDcgQEAgY29uc3Qgc3Ry
dWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+ICAgICAgICAgX19TQklf
SEFSVF9FWFRfREFUQShzc2N0ciwgU0JJX0hBUlRfRVhUX1NTQ1RSKSwKPiAgICAgICAgIF9fU0JJ
X0hBUlRfRVhUX0RBVEEoc3NzdGF0ZWVuLCBTQklfSEFSVF9FWFRfU1NTVEFURUVOKSwKPiAgICAg
ICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoeHNmY2ZsdXNoZGxvbmUsIFNCSV9IQVJUX0VYVF9YU0Zf
Q0ZMVVNIX0RfTDEpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQSh4c2ZjZWFzZSwgU0JJ
X0hBUlRfRVhUX1hTRl9DRUFTRSksCj4gIH07Cj4KPiAgX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRf
RVhUX01BWCA9PSBhcnJheV9zaXplKHNiaV9oYXJ0X2V4dCksCj4gLS0KPiAyLjE3LjEKPgoKUmVn
YXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
